From: Alexandre Rostovtsev <tetromino@gmail.com>
Subject: [3/3] lenovo-sl-laptop : kconfig etc.
Date: Sat, 14 Feb 2009 05:22:55 -0500
Message-ID: <20090214052255.3a82718d@leftboat.lan>
References: <20090214051214.359d4fd4@leftboat.lan>
	<20090214051624.0cbc8999@leftboat.lan>
	<20090214051902.3927f5e1@leftboat.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:in-reply-to:references:x-mailer:mime-version
         :content-type:content-transfer-encoding;
        bh=uHUVQB58dK8PTFpHjePqpzK25uSNsWlBwXmvCxsC4pk=;
        b=Lx/8DqiNJTUOW4WeBNCyBPfm0wWhcNyS6EpoNCrQd9VQDIzD5UPD03ctNg8tCSDwKw
         3DQBvVa3hsZetJIbx5NjHggaRWfQMhn0qkaekFBskL1VpG/iHAdnQ61dr57DT28xSzRH
         ANTsPOB1qYpCZS8N7r6qTFAy9ELxUuu0659BE=
In-Reply-To: <20090214051902.3927f5e1@leftboat.lan>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-laptop@vger.kernel.org

Makefiles and kconfigs for the lenovo-sl-laptop driver.

Signed-off-by: Alexandre Rostovtsev <tetromino@gmail.com>

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index ce6badd..a34f9c8 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -95,5 +95,7 @@ source "drivers/staging/epl/Kconfig"
 
 source "drivers/staging/android/Kconfig"
 
+source "drivers/staging/lenovo-sl-laptop/Kconfig"
+
 endif # !STAGING_EXCLUDE_BUILD
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 9ddcc2b..14ce47f 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -30,3 +30,4 @@ obj-$(CONFIG_INPUT_MIMIO)	+= mimio/
 obj-$(CONFIG_TRANZPORT)		+= frontier/
 obj-$(CONFIG_EPL)		+= epl/
 obj-$(CONFIG_ANDROID)		+= android/
+obj-$(CONFIG_LENOVO_SL_LAPTOP)  += lenovo-sl-laptop/
diff --git a/drivers/staging/lenovo-sl-laptop/Kconfig b/drivers/staging/lenovo-sl-laptop/Kconfig
new file mode 100644
index 0000000..88bdeb6
--- /dev/null
+++ b/drivers/staging/lenovo-sl-laptop/Kconfig
@@ -0,0 +1,16 @@
+config LENOVO_SL_LAPTOP
+	tristate "Lenovo SL Series Laptop Extras"
+	depends on X86
+	depends on ACPI
+	depends on INPUT
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on RFKILL
+	depends on NEW_LEDS
+	---help---
+	  This is a driver for the Lenovo ThinkPad SL series laptops
+	  (SL300/400/500), which are not supported by the thinkpad_acpi
+	  driver. The driver adds support for hotkeys, bluetooth control,
+	  the Lenovo Care LED, and (as an experimental feature) for screen
+	  backlight brightness control. For more information, see
+	  <file:Documentation/laptops/lenovo-sl-laptop.txt>
+
diff --git a/drivers/staging/lenovo-sl-laptop/Makefile b/drivers/staging/lenovo-sl-laptop/Makefile
new file mode 100644
index 0000000..f91b5ab
--- /dev/null
+++ b/drivers/staging/lenovo-sl-laptop/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_LENOVO_SL_LAPTOP)	:= lenovo-sl-laptop.o
