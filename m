From: Neil Horman <nhorman@tuxdriver.com>
Subject: [KJ] [PATCH] apm: clean up module initalization
Date: Tue, 1 Aug 2006 12:25:48 -0400
Message-ID: <20060801162548.GA11605@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-laptop@vger.kernel.org, akpm@osdl.org, sfr@canb.auug.org.au, nhorman@tuxdriver.com

Patch to clean up module initalization for apm.c.  I had started by auditing for
proper return code checks in misc_register, but I found that in the event of an
initalization failure, a proc file and a kernel thread were left hanging out.
this patch properly cleans up those loose ends on any initalization failure.

Regards
Neil

Signed-off-by: Neil Horman <nhorman@tuxdriver.com>


 apm.c |   23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)


diff --git a/arch/i386/kernel/apm.c b/arch/i386/kernel/apm.c
index 8591f2f..75d8bde 100644
--- a/arch/i386/kernel/apm.c
+++ b/arch/i386/kernel/apm.c
@@ -2339,16 +2339,22 @@ #endif
 	ret = kernel_thread(apm, NULL, CLONE_KERNEL | SIGCHLD);
 	if (ret < 0) {
 		printk(KERN_ERR "apm: disabled - Unable to start kernel thread.\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out_proc;
 	}
 
 	if (num_online_cpus() > 1 && !smp ) {
 		printk(KERN_NOTICE
 		   "apm: disabled - APM is not SMP safe (power off active).\n");
-		return 0;
+		ret = -EOPNOTSUPP;
+		goto out_thread;
 	}
 
-	misc_register(&apm_device);
+	if (misc_register(&apm_device)) {
+		printk(KERN_ERR "apm: Unable to register misc device\n");
+		ret = -ENOMEM;
+		goto out_thread;
+	}
 
 	if (HZ != 100)
 		idle_period = (idle_period * HZ) / 100;
@@ -2357,8 +2363,17 @@ #endif
 		pm_idle  = apm_cpu_idle;
 		set_pm_idle = 1;
 	}
+	
+	return  0;
 
-	return 0;
+out_thread:
+	exit_kapmd = 1;
+	while (kapmd_running)
+		schedule();
+out_proc:
+	remove_proc_entry("apm", NULL);
+
+	return ret;
 }
 
 static void __exit apm_exit(void)
