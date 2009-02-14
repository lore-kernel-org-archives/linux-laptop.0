From: Alexandre Rostovtsev <tetromino@gmail.com>
Subject: [2/3] lenovo-sl-laptop : documentation
Date: Sat, 14 Feb 2009 05:19:02 -0500
Message-ID: <20090214051902.3927f5e1@leftboat.lan>
References: <20090214051214.359d4fd4@leftboat.lan>
	<20090214051624.0cbc8999@leftboat.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:in-reply-to:references:x-mailer:mime-version
         :content-type:content-transfer-encoding;
        bh=bq+FUNPWr0ShMseBZZMtF3vfc2yVmA9+Zc93wFEfZ7g=;
        b=RmUH5CrgMCPwHsHv6JzzHDiEerCm+513fE/sJKnV1s7eJCKql8mnVonwEx7p9q5vFK
         rA740evf2QYft6GDw/wFQ6GmA4infbMtBhDlA5dtDayO0OvslaHyNjSIl3gEgKDft/Lg
         T2CP/psueRW13gXT3Az3dXg7VnETGz1tuXvTs=
In-Reply-To: <20090214051624.0cbc8999@leftboat.lan>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-laptop@vger.kernel.org

This patch contains the documentation for the lenovo-sl-laptop driver.

Signed-off-by: Alexandre Rostovtsev <tetromino@gmail.com>

diff --git a/Documentation/laptops/lenovo-sl-laptop.txt b/Documentation/laptops/lenovo-sl-laptop.txt
new file mode 100644
index 0000000..d7bd728
--- /dev/null
+++ b/Documentation/laptops/lenovo-sl-laptop.txt
@@ -0,0 +1,130 @@
+Lenovo ThinkPad SL Series Laptop Extras driver
+http://github.com/tetromino/lenovo-sl-laptop
+Version 0.02
+13 February 2009
+
+Copyright (C) 2008-2009 Alexandre Rostovtsev <tetromino@gmail.com>
+
+lenovo-sl-laptop is a driver for controlling various parts of the Lenovo
+ThinkPad SL series (SL300/400/500) laptops. The SL series is not supported
+by the standard thinkpad_acpi driver.
+
+Reporting bugs
+--------------
+
+You can report bugs to me by email, or use the Linux ThinkPad mailing list:
+http://mailman.linux-thinkpad.org/mailman/listinfo/linux-thinkpad
+You will need to subscribe to the mailing list to post.
+
+Disclaimer
+---------
+
+This driver was written with no help from Lenovo engineers, and is based on
+my experiments with my SL300. It's possible that it could break your hardware
+- of course, that is quite unlikely, but still, be aware of the possibility.
+
+Supported hardware
+------------------
+
+I have reports of the driver working on a number of SL300, 400, and 500
+laptops with Intel video. I do not know how well it works with Nvidia
+video cards.
+
+There are rumors that with some modification, the driver can be used on
+some IdeaPads. I know that it certainly does *not* work, and probably will
+never work, on the IdeaPad S10e.
+
+If the driver does not work on your ThinkPad SL, please send me a copy of
+your DSDT. In other words,
+cat /proc/acpi/dsdt > dsdt
+and send me the resulting dsdt file.
+
+Keymap
+-----
+
+Lenovo Care :			KEY_VENDOR (360)
+Volume up :			KEY_VOLUMEUP (115)
+Volume down :			KEY_VOLUMEDOWN (114)
+Volume mute : 			KEY_MUTE (113)
+Fn F2 (screensaver):		KEY_COFFEE (152)
+Fn F2 (battery):		KEY_BATTERY (236)
+Fn F4 (sleep):			no input event; dispatches an ACPI event
+Fn F5 (radio):			KEY_WLAN (238)
+Fn F7 (switch screen):		no input event; dispatches an ACPI event
+Fn F8 (Ultranav):		KEY_PROG1 (148)
+Fn F9 (eject):			KEY_EJECTCD (161)
+Fn F12 (hibernate):		KEY_SUSPEND (205)
+Fn Space (zoom):		KEY_ZOOM (372)
+Fn Home (brightness up):	by default, only dispatches an ACPI event;
+				will dispatch an input event if control_backlight
+				parameter is on.
+Fn End (brightness down):	see above.
+
+
+Sysfs interface
+---------------
+
+You may find the following sysfs files useful. NOTE: depending on your
+hardware and module parameters, some of these will not be available.
+
+/sys/class/leds/lensl::lenovocare/
+ The Lenovo Care LED. brightness can be 0 (off) or 255 (on). To make the LED
+ blink, make sure you have LED timer trigger support and
+ echo "timer" > /sys/class/leds/lensl::lenovocare/triggers
+ Afterwards, you will be able to adjust the blink frequency using delay_off
+ and delay_on (in milliseconds).
+
+/sys/devices/platform/lenovo-sl-laptop/rfkill/rfkill*/
+ The bluetooth rfkill. state is the switch state (0 for bluetooth off,
+ 1 for bluetooth on).
+ Note that in case future versions of the driver add other rfkill switches,
+ userspace programs should check that the rfkill name is lensl_bluetooth_sw
+
+/sys/class/backlight/thinkpad_screen/
+ The backlight brightness interface. Only available if the control_backlight
+ parameter is on. This interface will very likely disappear in a future
+ driver version, after the ACPI video driver properly supports the SL series.
+ I am using the same backlight device name as the thinkpad_acpi driver in
+ order to ensure support on existing versions of the xorg intel video driver.
+
+Module parameters
+-----------------
+
+debug:
+ Controls the verbosity of messages printed to the kernel log. Values
+ range from 0 (print nothing) to 7 (print everything).
+ Default is 6.
+
+bluetooth_auto_enable:
+ If this parameter is set to 1 and your laptop supports bluetooth, then
+ bluetooth will be activated immediately when you load this driver. If
+ the parameter is set to 0, bluetooth will not be automatically activated,
+ and you will need to enable it manually:
+ cat 1 > /sys/devices/platform/lenovo-sl-laptop/rfkill/rfkill*/state
+ Default is 1.
+
+control_backlight:
+ If this parameter is set to 1, this driver will intercept brightness keys
+ (Fn+Home and Fn+End) and control the backlight brightness. This feature is
+ useful because the default ACPI video driver currently has poor support
+ for the Lenovo SL series. If you enable this feature, you should add 
+ acpi_backlight=vendor
+ to the kernel boot parameters. Otherwise, lenovo-sl-laptop and the ACPI
+ video driver will both try to change screen brightness simultaneously,
+ causing interesting effects.
+ It's likely that this option will disappear in the next driver version 
+ (I will remove it once the SL series are well supported by the ACPI video
+ driver).
+ Default is 0.
+
+debug_ec:
+ For debugging purposes, enables access to the ACPI embedded controller via
+ /proc/acpi/lenovo-sl-laptop/ec0
+ Reading from this file will dump the contents of all EC registers. Doing
+ so could theoretically crash your computer. Writing to this file will
+ write data to the EC registers.
+ **WARNING** : WRITING THE WRONG VALUES TO THE EMBEDDED CONTROLLER
+ CAN *DESTROY* YOUR VALUABLE HARDWARE! Do not even think of doing it unless
+ you are quite certain about your actions.
+ Default is, of course, 0.
+
