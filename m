From: jimc@math.ucla.edu (Jim Carter)
Subject: [PATCH] apm.c, 2.4.20, set_cpus_allowed for CPU 0 on SMP
Date: Mon,  8 Dec 2003 22:27:02 -0800 (PST)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20031209062702.0989F27E25@xena.cft.ca.us>
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sfr@canb.auug.org.au, linux-laptop@vger.kernel.org

Using hyperthreading, and wanting to power off the CPU, when loading the
apm.o module I intermittently got the BUG() in function apm() of
./arch/i386/kernel/apm.c where it tries to migrate to CPU 0 and fails.

Shouldn't it call set_cpus_allowed() (in ./kernel/sched.c) instead of
just setting current->cpus_allowed and calling schedule()?  I didn't see
where schedule() notices that the task is on the wrong CPU, though I
could have missed it.

The attached patch makes this call, and it's unconditional, so that if
the thread starts out on CPU 0 but some ghost later tries to put it on
another CPU, it will stay on CPU 0.

Ten successive boot and "halt -p" pairs were successful in initializing
the module (of course for power-off only, due to SMP) and turning off
the power.  Before the patch I would have expected several failures --
seems like less than half, but enough to really mess up remote 
administration.  

Comments in the code say that some APM BIOSes need to be called by CPU 0
only.  There is no evidence that my BIOS does or does not require this.

Administrative details: The patch is relative to 2.4.20 from SuSE Linux
8.2, which is what the testing was done on.  The relevant code is
identical in pristine 2.4.23 sources.  Hardware is a Dell Dimension 4600
with a Pentium-4 processor (2.4 GHz, hyperthreading).  Kernel is
configured with SMP.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)


--- linux-2.4.20.SuSE/arch/i386/kernel/apm.c.orig	2003-03-17 07:51:20.000000000 -0800
+++ linux-2.4.20.SuSE/arch/i386/kernel/apm.c	2003-12-08 17:13:39.000000000 -0800
@@ -1716,13 +1716,12 @@
 	 * on SMP systems in case of "apm=power-off" mode. Seen on ASUS A7M266D.
 	 * Some bioses don't like being called from CPU != 0.
 	 * Method suggested by Ingo Molnar.
+	 * Done unconditionally in case a ghost from the Dark Side makes the
+	 * kernel thread migrate to another CPU later.
 	 */
-	if (cpu_number_map(smp_processor_id()) != 0) {
-		current->cpus_allowed = 1;
-		schedule();
-		if (unlikely(cpu_number_map(smp_processor_id()) != 0))
-			BUG();
-	}
+	set_cpus_allowed(current, 1);	/*Bitmask allows only CPU 0*/
+	if (unlikely(cpu_number_map(smp_processor_id()) != 0))
+		BUG();
 #endif
 	
 	if (apm_info.connection_version == 0) {
