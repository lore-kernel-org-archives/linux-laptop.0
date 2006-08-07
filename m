From: "Serge E. Hallyn" <serue@us.ibm.com>
Subject: [PATCH 3/3] kthread: update arch/mips/kernel/apm.c
Date: Mon, 7 Aug 2006 11:58:11 -0500
Message-ID: <20060807165810.GC11208@sergelap.austin.ibm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932225AbWHGQ6e@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkml <linux-kernel@vger.kernel.org>, sfr@canb.auug.org.au, linux-laptop@vger.kernel.org, ralf@linux-mips.org

Update arch/mips/kernel/apm.c to use kthread instead of
kernel_thread, whose export is deprecated.

Signed-off-by: Serge E. Hallyn <serue@us.ibm.com>
---
 arch/mips/kernel/apm.c |   32 +++++++++++++-------------------
 1 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/mips/kernel/apm.c b/arch/mips/kernel/apm.c
index 528e731..89215b9 100644
--- a/arch/mips/kernel/apm.c
+++ b/arch/mips/kernel/apm.c
@@ -25,6 +25,7 @@ #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/init.h>
 #include <linux/completion.h>
+#include <linux/kthread.h>
 
 #include <asm/apm.h> /* apm_power_info */
 #include <asm/system.h>
@@ -80,7 +81,7 @@ #define SUSPEND_DONE	4		/* suspend compl
  */
 static int suspends_pending;
 static int apm_disabled;
-static int mips_apm_active;
+static struct task_struct *kapmd_tsk;
 
 static DECLARE_WAIT_QUEUE_HEAD(apm_waitqueue);
 static DECLARE_WAIT_QUEUE_HEAD(apm_suspend_waitqueue);
@@ -97,7 +98,6 @@ static LIST_HEAD(apm_user_list);
  * to be suspending the system.
  */
 static DECLARE_WAIT_QUEUE_HEAD(kapmd_wait);
-static DECLARE_COMPLETION(kapmd_exit);
 static DEFINE_SPINLOCK(kapmd_queue_lock);
 static struct apm_queue kapmd_queue;
 
@@ -468,16 +468,13 @@ #endif
 
 static int kapmd(void *arg)
 {
-	daemonize("kapmd");
-	current->flags |= PF_NOFREEZE;
-
 	do {
 		apm_event_t event;
 
 		wait_event_interruptible(kapmd_wait,
-				!queue_empty(&kapmd_queue) || !mips_apm_active);
+				!queue_empty(&kapmd_queue) || kthread_should_stop())
 
-		if (!mips_apm_active)
+		if (kthread_should_stop())
 			break;
 
 		spin_lock_irq(&kapmd_queue_lock);
@@ -508,7 +505,7 @@ static int kapmd(void *arg)
 		}
 	} while (1);
 
-	complete_and_exit(&kapmd_exit, 0);
+	return 0;
 }
 
 static int __init apm_init(void)
@@ -520,13 +517,14 @@ static int __init apm_init(void)
 		return -ENODEV;
 	}
 
-	mips_apm_active = 1;
-
-	ret = kernel_thread(kapmd, NULL, CLONE_KERNEL);
-	if (ret < 0) {
-		mips_apm_active = 0;
+	kapmd_tsk = kthread_create(kapmd, NULL, "kapmd");
+	if (IS_ERR(kapmd_tsk)) {
+		ret = PTR_ERR(kapmd_tsk);
+		kapmd_tsk = NULL;
 		return ret;
 	}
+	kapmd_tsk->flags |= PF_NOFREEZE;
+	wake_up_process(kapmd_tsk);
 
 #ifdef CONFIG_PROC_FS
 	create_proc_info_entry("apm", 0, NULL, apm_get_info);
@@ -536,9 +534,7 @@ #endif
 	if (ret != 0) {
 		remove_proc_entry("apm", NULL);
 
-		mips_apm_active = 0;
-		wake_up(&kapmd_wait);
-		wait_for_completion(&kapmd_exit);
+		kthread_stop(kapmd_tsk);
 	}
 
 	return ret;
@@ -549,9 +545,7 @@ static void __exit apm_exit(void)
 	misc_deregister(&apm_device);
 	remove_proc_entry("apm", NULL);
 
-	mips_apm_active = 0;
-	wake_up(&kapmd_wait);
-	wait_for_completion(&kapmd_exit);
+	kthread_stop(kapmd_tsk);
 }
 
 module_init(apm_init);
-- 
1.4.1.1
