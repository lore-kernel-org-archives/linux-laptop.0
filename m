From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: [PATCH v8 1/8] MIPS: add subdirectory for platform extension drivers
Date: Sun,  6 Dec 2009 15:01:41 +0800
Message-ID: <d6bb11d33fe01abd6de945117ce647af73841f00.1260082252.git.wuzhangjin@gmail.com>
References: <cover.1260082252.git.wuzhangjin@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references:in-reply-to:references;
        bh=PNF4dJpdw1GFSGioxoxLVbk5cfqDx1ILIbM+Fq9ACSo=;
        b=m86M+R6sWMjjF9XrOabsLAck2gWy4XJv08VEJI1eWTkQlAbtOJR21sh27mAglQGBgd
         HpKbYezkoG+MISzJdQyEg1tDUVV5hgHrx8sGperEJrSeafLfMz/9Cs2mE81pJDNIGyD9
         bMnVDH9x5Vy43x2wq4bEyyQNGfSJi+gv/qCTg=
In-Reply-To: <cover.1260082252.git.wuzhangjin@gmail.com>
In-Reply-To: <cover.1260082252.git.wuzhangjin@gmail.com>
References: <cover.1260082252.git.wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-laptop.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org
Cc: Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>

From: Wu Zhangjin <wuzhangjin@gmail.com>

It is really hard to split the platform specific subdrivers into
different subsystems, which will generate lots of duplicated source
code, break the whole support into several pieces and also will make the
users be difficult to choose the suitable subdrivers in different
places.

So, I did like the forks have done under drivers/platform/x86, created
the drivers/platform/mips/ for putting the future MIPS netbook/laptop/pc
extension drivers in.

Signed-off-by: Wu Zhangjin <wuzhangjin@gmail.com>
---
 drivers/platform/Kconfig      |    4 ++++
 drivers/platform/mips/Kconfig |   18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 drivers/platform/mips/Kconfig

diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 9652c3f..2319c0b 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -3,3 +3,7 @@
 if X86
 source "drivers/platform/x86/Kconfig"
 endif
+
+if MIPS
+source "drivers/platform/mips/Kconfig"
+endif
diff --git a/drivers/platform/mips/Kconfig b/drivers/platform/mips/Kconfig
new file mode 100644
index 0000000..2f77693
--- /dev/null
+++ b/drivers/platform/mips/Kconfig
@@ -0,0 +1,18 @@
+#
+# MIPS Platform Specific Drivers
+#
+
+menuconfig MIPS_PLATFORM_DEVICES
+	bool "MIPS Platform Specific Device Drivers"
+	default y
+	help
+	  Say Y here to get to see options for device drivers of various
+	  MIPS platforms, including vendor-specific netbook/laptop/pc extension
+	  drivers.  This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled.
+
+if MIPS_PLATFORM_DEVICES
+
+
+endif # MIPS_PLATFORM_DEVICES
-- 
1.6.2.1


