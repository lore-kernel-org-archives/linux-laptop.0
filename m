From: Samuel Thibault <samuel.thibault@fnac.net>
Subject: [Linux apm] Armada laptops: apm: set display: Interface not engaged
Date: Fri, 26 Jul 2002 23:57:13 +0200 (CEST)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <44250.5645602525$1027720915@news.gmane.org>
Reply-To: Samuel Thibault <samuel.thibault@fnac.net>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-ID: <Pine.LNX.4.10.10207262318582.1590@bureau.famille.thibault.fr>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org


Hello,

I just bought an Armada E500 and activated apm, but when the screen
should go blank (after a while), "apm: set display: Interface not engaged"
is displayed instead, while BIOS reports that apm is engaged :
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16)
which is the same as /proc/apm reports. The same occurs under X, and apm
events aren't handled properly.

Searching with Google showed that M300 on kernel 2.4.17, and M700 on 2.4.6
had similar troubles.

Therefore, I tried to engage apm at boot time, even if bios reports it
has already done it, and then the "Interface not engaged" never appeared
any more, the screen got blank when it should and apm events ran well...

Someone reported it also worked on the M300 and M700 of his office.

Samuel Thibault

diff -urN linux-2.4.18/Documentation/Configure.help linux-2.4.18-cor/Documentation/Configure.help
--- linux-2.4.18/Documentation/Configure.help	Fri Jun  7 16:15:50 2002
+++ linux-2.4.18-cor/Documentation/Configure.help	Fri Jun  7 16:38:05 2002
@@ -17368,6 +17368,16 @@
   T400CDT. This is off by default since most machines do fine without
   this feature.
 
+Engage APM at boot time anyway
+CONFIG_APM_ENGAGE_ANYWAY
+  Engage APM at boot time, even if BIOS claims it has already done it.
+  Your BIOS may not report correctly whether APM was already engaged
+  at boot time, so that engaging it anyway may be needed, such as on
+  Compaq Armada E500, M300 and M700 laptops which print
+  "apm: set display: Interface not engaged" instead of blanking the
+  screen, for instance. Saying Y should correct this.
+  If unsure, say N.
+
 Make CPU Idle calls when idle
 CONFIG_APM_CPU_IDLE
   Enable calls to APM CPU Idle/CPU Busy inside the kernel's idle loop.
diff -urN linux-2.4.18/arch/i386/config.in linux-2.4.18-cor/arch/i386/config.in
--- linux-2.4.18/arch/i386/config.in	Fri Jun  7 16:16:47 2002
+++ linux-2.4.18-cor/arch/i386/config.in	Fri Jun  7 16:16:58 2002
@@ -281,6 +281,7 @@
 if [ "$CONFIG_APM" != "n" ]; then
    bool '    Ignore USER SUSPEND' CONFIG_APM_IGNORE_USER_SUSPEND
    bool '    Enable PM at boot time' CONFIG_APM_DO_ENABLE
+   bool '    Engage PM at boot time anyway' CONFIG_APM_ENGAGE_ANYWAY
    bool '    Make CPU Idle calls when idle' CONFIG_APM_CPU_IDLE
    bool '    Enable console blanking using APM' CONFIG_APM_DISPLAY_BLANK
    bool '    RTC stores time in GMT' CONFIG_APM_RTC_IS_GMT
diff -urN linux-2.4.18/arch/i386/kernel/apm.c linux-2.4.18-cor/arch/i386/kernel/apm.c
--- linux-2.4.18/arch/i386/kernel/apm.c	Fri Jun  7 16:16:23 2002
+++ linux-2.4.18-cor/arch/i386/kernel/apm.c	Fri Jun  7 16:16:31 2002
@@ -1711,6 +1711,13 @@
 			return -1;
 		}
 	}
+#ifdef CONFIG_APM_ENGAGE_ANYWAY
+	else {
+		error = apm_engage_power_management(APM_DEVICE_ALL, 1);
+		if (error)
+			apm_error("engage power management anyway", error);
+	}
+#endif
 
 	if (debug && (smp_num_cpus == 1)) {
 		error = apm_get_power_status(&bx, &cx, &dx);




diff -urN linux-2.5.28/arch/i386/Config.help linux-2.5.28-cor/arch/i386/Config.help
--- linux-2.5.28/arch/i386/Config.help	Fri Jul 26 23:40:45 2002
+++ linux-2.5.28-cor/arch/i386/Config.help	Fri Jul 26 23:35:36 2002
@@ -760,6 +760,15 @@
   T400CDT. This is off by default since most machines do fine without
   this feature.
 
+CONFIG_APM_ENGAGE_ANYWAY
+  Engage APM at boot time, even if BIOS claims it has already done it.
+  Your BIOS may not report correctly whether APM was already engaged
+  at boot time, so that engaging it anyway may be needed, such as on
+  Compaq Armada E500, M300 and M700 laptops which print
+  "apm: set display: Interface not engaged" instead of blanking the
+  screen, for instance. Saying Y should correct this.
+  If unsure, say N.
+
 CONFIG_APM_CPU_IDLE
   Enable calls to APM CPU Idle/CPU Busy inside the kernel's idle loop.
   On some machines, this can activate improved power savings, such as
diff -urN linux-2.5.28/arch/i386/config.in linux-2.5.28-cor/arch/i386/config.in
--- linux-2.5.28/arch/i386/config.in	Fri Jul 26 23:40:45 2002
+++ linux-2.5.28-cor/arch/i386/config.in	Fri Jul 26 23:36:40 2002
@@ -215,6 +215,7 @@
 if [ "$CONFIG_APM" != "n" ]; then
    bool '    Ignore USER SUSPEND' CONFIG_APM_IGNORE_USER_SUSPEND
    bool '    Enable PM at boot time' CONFIG_APM_DO_ENABLE
+   bool '    Engage PM at boot time anyway' CONFIG_APM_ENGAGE_ANYWAY
    bool '    Make CPU Idle calls when idle' CONFIG_APM_CPU_IDLE
    bool '    Enable console blanking using APM' CONFIG_APM_DISPLAY_BLANK
    bool '    RTC stores time in GMT' CONFIG_APM_RTC_IS_GMT
diff -urN linux-2.5.28/arch/i386/kernel/apm.c linux-2.5.28-cor/arch/i386/kernel/apm.c
--- linux-2.5.28/arch/i386/kernel/apm.c	Fri Jul 26 23:41:16 2002
+++ linux-2.5.28-cor/arch/i386/kernel/apm.c	Fri Jul 26 23:43:34 2002
@@ -1719,6 +1719,13 @@
 			return -1;
 		}
 	}
+#ifdef CONFIG_APM_ENGAGE_ANYWAY
+	else {
+		error = apm_engage_power_management(APM_DEVICE_ALL, 1);
+		if (error)
+			apm_error("engage power management anyway", error);
+	}
+#endif
 
 	if (debug && (num_online_cpus() == 1)) {
 		error = apm_get_power_status(&bx, &cx, &dx);

