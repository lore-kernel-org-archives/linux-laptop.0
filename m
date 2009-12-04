From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: [PATCH v7 7/8] Loongson: YeeLoong: add suspend support
Date: Fri,  4 Dec 2009 21:37:41 +0800
Message-ID: <1811181c553c2c8e7e841540e57444e54c33d65f.1259932036.git.wuzhangjin@gmail.com>
References: <cover.1259932036.git.wuzhangjin@gmail.com>
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=aF16QHvsve/DyHG97+B8dhtjD7zlc2OteiLXq3gf4W0=;
        b=pvNP3qCNr/ht7/Yxd+TIv30uwgjAZlbt83JxdyKYIc5GEOoRHtuv8GejXMpXcXZfB2
         9o9q4VGPIZhwcX6rHhp6+kwyxWK9nHyRI0vEkt453pkJvbbIi1q0mVNafNzoXTFY6/ha
         VdKxgEcdCqakismcl1ThZmnQdrXPARgVrrLJM=
In-Reply-To: <cover.1259932036.git.wuzhangjin@gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Wu Zhangjin <wuzhangjin@gmail.com>

From: Wu Zhangjin <wuzhangjin@gmail.com>

This patch add support to suspend the yeeloong platform specific
devices(LCD, CRT, USB...).

Acked-by: Rafael J. Wysocki <rjw@sisk.pl>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Wu Zhangjin <wuzhangjin@gmail.com>
---
 drivers/platform/mips/yeeloong_laptop.c |   41 +++++++++++++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/mips/yeeloong_laptop.c b/drivers/platform/mips/yeeloong_laptop.c
index 8378926..d31824b 100644
--- a/drivers/platform/mips/yeeloong_laptop.c
+++ b/drivers/platform/mips/yeeloong_laptop.c
@@ -536,6 +536,45 @@ static void yeeloong_vo_exit(void)
 	}
 }
 
+#ifdef CONFIG_LOONGSON_SUSPEND
+static void usb_ports_set(int status)
+{
+	status = !!status;
+
+	ec_write(REG_USB0_FLAG, status);
+	ec_write(REG_USB1_FLAG, status);
+	ec_write(REG_USB2_FLAG, status);
+}
+
+static int yeeloong_suspend(struct platform_device *dev, pm_message_t state)
+
+{
+	/* Turn off LCD */
+	yeeloong_lcd_vo_set(BIT_DISPLAY_LCD_OFF);
+	/* Turn off CRT */
+	yeeloong_crt_vo_set(BIT_CRT_DETECT_UNPLUG);
+	/* Poweroff three usb ports */
+	usb_ports_set(BIT_USB_FLAG_OFF);
+
+	return 0;
+}
+
+static int yeeloong_resume(struct platform_device *pdev)
+{
+	/* Resume the status of lcd & crt */
+	yeeloong_lcd_vo_set(BIT_DISPLAY_LCD_ON);
+	yeeloong_crt_vo_set(BIT_CRT_DETECT_PLUG);
+
+	/* Poweron three usb ports */
+	usb_ports_set(BIT_USB_FLAG_ON);
+
+	return 0;
+}
+#else	/* !CONFIG_LOONGSON_SUSPEND */
+#define yeeloong_suspend NULL
+#define yeeloong_resume NULL
+#endif
+
 static struct platform_device_id platform_device_ids[] = {
 	{
 		.name = "yeeloong_laptop",
@@ -551,6 +590,8 @@ static struct platform_driver platform_driver = {
 		   .owner = THIS_MODULE,
 		   },
 	.id_table = platform_device_ids,
+	.suspend = yeeloong_suspend,
+	.resume = yeeloong_resume,
 };
 
 static int __init yeeloong_init(void)
-- 
1.6.2.1

