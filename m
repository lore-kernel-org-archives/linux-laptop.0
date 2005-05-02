From: Nishanth Aravamudan <nacc@us.ibm.com>
Subject: [PATCH] i386/apm: use wait_event_interruptible_timeout()
Date: Sun, 1 May 2005 23:18:24 -0700
Message-ID: <20050502061824.GC10173@us.ibm.com>
References: <20050502061446.GB10173@us.ibm.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050502061446.GB10173@us.ibm.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sfr@canb.auug.org.au
Cc: linux-laptop@vger.kernel.org, Kernel-Janitors <kernel-janitors@lists.osdl.org>

Use wait_event_interruptible_timeout() instead of custom wait-queue.


Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.12-rc3/arch/i386/kernel/apm.c	2005-04-29 11:03:03.000000000 -0700
+++ 2.6.12-rc3-dev/arch/i386/kernel/apm.c	2005-05-01 19:02:48.000000000 -0700
@@ -224,6 +224,7 @@
 #include <linux/smp_lock.h>
 #include <linux/dmi.h>
 #include <linux/suspend.h>
+#include <linux/wait.h>
 
 #include <asm/system.h>
 #include <asm/uaccess.h>
@@ -1418,22 +1419,15 @@ static void apm_event_handler(void)
 
 static void apm_mainloop(void)
 {
-	DECLARE_WAITQUEUE(wait, current);
-
-	add_wait_queue(&apm_waitqueue, &wait);
-	set_current_state(TASK_INTERRUPTIBLE);
-	for (;;) {
-		schedule_timeout(APM_CHECK_TIMEOUT);
-		if (exit_kapmd)
-			break;
+	do {
+		wait_event_interruptible_timeout(apm_waitqueue,
+				exit_kapmd, APM_CHECK_TIMEOUT);
 		/*
 		 * Ok, check all events, check for idle (and mark us sleeping
 		 * so as not to count towards the load average)..
 		 */
-		set_current_state(TASK_INTERRUPTIBLE);
 		apm_event_handler();
-	}
-	remove_wait_queue(&apm_waitqueue, &wait);
+	} while (!exit_kapmd);
 }
 
 static int check_apm_user(struct apm_user *as, const char *func)
