From: Andreas Mohr <andi@rhlx01.fht-esslingen.de>
Subject: [PATCH -mm] i386: apm.c fixups/cleanup
Date: Mon, 26 Jun 2006 21:49:22 +0200
Message-ID: <20060626194922.GA7922@rhlx01.fht-esslingen.de>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: sfr@canb.auug.org.au, linux-laptop@vger.kernel.org

Hi all,

- fix buggy "apm_do_idle failed" message limiting (jiffies instead of counts)
- improve main idle loop by rearranging checks to fit more naturally
- add __read_mostly to use_apm_idle
- fix typos, strings and comments

Patch against 2.6.17-mm2, tested on 2.6.17-rc6-mm1.

Please yell if you don't want to see that __read_mostly in here...
(I'm not really sure what to make of the current __read_mostly discussion,
though)

Thanks!

Signed-off-by: Andreas Mohr <andi@lisas.de>


diff -urN linux-2.6.17-mm2.orig/arch/i386/kernel/apm.c linux-2.6.17-mm2.my/arch/i386/kernel/apm.c
--- linux-2.6.17-mm2.orig/arch/i386/kernel/apm.c	2006-06-26 11:18:50.000000000 +0200
+++ linux-2.6.17-mm2.my/arch/i386/kernel/apm.c	2006-06-26 11:22:24.000000000 +0200
@@ -66,7 +66,7 @@
  *    1.5: Fix segment register reloading (in case of bad segments saved
  *         across BIOS call).
  *         Stephen Rothwell
- *    1.6: Cope with complier/assembler differences.
+ *    1.6: Cope with compiler/assembler differences.
  *         Only try to turn off the first display device.
  *         Fix OOPS at power off with no APM BIOS by Jan Echternach
  *                   <echter@informatik.uni-rostock.de>
@@ -528,7 +528,7 @@
  * These are the actual BIOS calls.  Depending on APM_ZERO_SEGS and
  * apm_info.allow_ints, we are being really paranoid here!  Not only
  * are interrupts disabled, but all the segment registers (except SS)
- * are saved and zeroed this means that if the BIOS tries to reference
+ * are saved and zeroed, this means that if the BIOS tries to reference
  * any data without explicitly loading the segment registers, the kernel
  * will fault immediately rather than have some unforeseen circumstances
  * for the rest of the kernel.  And it will be very obvious!  :-) Doing
@@ -789,7 +789,6 @@
 		{
 			printk(KERN_DEBUG "apm_do_idle failed (%d)\n",
 					(eax >> 8) & 0xff);
-			t = jiffies;
 		}
 		return -1;
 	}
@@ -834,7 +833,7 @@
 
 static void apm_cpu_idle(void)
 {
-	static int use_apm_idle; /* = 0 */
+	static int use_apm_idle __read_mostly; /* = 0 */
 	static unsigned int last_jiffies; /* = 0 */
 	static unsigned int last_stime; /* = 0 */
 
@@ -869,13 +868,11 @@
 			t = jiffies;
 			switch (apm_do_idle()) {
 			case 0: apm_idle_done = 1;
-				if (t != jiffies) {
-					if (bucket) {
+				if (likely(bucket)) {
+					if (t != jiffies)
 						bucket = IDLE_LEAKY_MAX;
-						continue;
-					}
-				} else if (bucket) {
-					bucket--;
+					else
+						bucket--;
 					continue;
 				}
 				break;
@@ -1955,7 +1952,7 @@
 		apm_info.disabled = 1;
 		printk(KERN_INFO "%s machine detected. Disabling APM.\n", d->ident);
 		printk(KERN_INFO "This bug is fixed in bios P15 which is available for \n");
-		printk(KERN_INFO "download from support.intel.com \n");
+		printk(KERN_INFO "download from support.intel.com\n");
 	}
 	return 0;
 }
@@ -2015,7 +2012,7 @@
 		{	DMI_MATCH(DMI_SYS_VENDOR, "Dell"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude C600"), },
 	},
-	{	/* Allow interrupts during suspend on Dell Latitude laptops*/
+	{	/* Allow interrupts during suspend on Dell Latitude laptops */
 		set_apm_ints, "Dell Latitude",
 		{	DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude C510"), }
@@ -2027,7 +2024,7 @@
 			DMI_MATCH(DMI_BIOS_VENDOR,"Phoenix Technologies LTD"),
 			DMI_MATCH(DMI_BIOS_VERSION,"A11"), },
 	},
-	{	/* Allow interrupts during suspend on Dell Inspiron laptops*/
+	{	/* Allow interrupts during suspend on Dell Inspiron laptops */
 		set_apm_ints, "Dell Inspiron", {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 4000"), },
@@ -2051,7 +2048,7 @@
 			DMI_MATCH(DMI_BIOS_VENDOR,"Intel Corp."),
 			DMI_MATCH(DMI_BIOS_VERSION,"A11"), },
 	},
-	{	/* Allow interrupts during suspend on Compaq Laptops*/
+	{	/* Allow interrupts during suspend on Compaq Laptops */
 		set_apm_ints, "Compaq 12XL125",
 		{	DMI_MATCH(DMI_SYS_VENDOR, "Compaq"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Compaq PC"),
@@ -2418,7 +2415,7 @@
 	"System idle percentage above which to make APM BIOS idle calls");
 module_param(idle_period, int, 0444);
 MODULE_PARM_DESC(idle_period,
-	"Period (in sec/100) over which to caculate the idle percentage");
+	"Period (in sec/100) over which to calculate the idle percentage");
 module_param(smp, bool, 0444);
 MODULE_PARM_DESC(smp,
 	"Set this to enable APM use on an SMP platform. Use with caution on older systems");
