From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: [PATCH v9 0/8] Loongson: YeeLoong: add platform drivers
Date: Tue,  8 Dec 2009 22:15:48 +0800
Message-ID: <cover.1260254344.git.wuzhangjin@gmail.com>
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=zmVR5OBUBjCw+ZU02rSMDSCNYnP2Fhip3Bbz1EdFlwM=;
        b=xWeDIuv446GQIKWGk5rtB7/iBd013JFDS4R++tMmloDTVJmDrNm2/T3RV2KWkjR5Mf
         a/ePZWGtrx2Qp2VpCecIxh/7yWPjuEctLFDHKIFK/JL9/v9HTD87kuVcFA7Kx6lGU9B/
         5NEgTUzrS4Z4/V+i2qvVJ0UrEFMvFrpWCpCGQ=
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: akpm@linux-foundation.org, Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>

From: Wu Zhangjin <wuzhangjin@gmail.com>

Hi, Ralf and Andrew Morton

Could you please queue this patchset for 2.6.33?

Of course, any new feedbacks are welcome, thanks!

Best Regards,
        Wu Zhangjin

------------------

This patchset adds platform specific drivers for YeeLoong netbook. including
the backlight, battery, hwmon, video output, suspend and hotkey(input)
subdrivers. These drivers provide standard interfaces to the user-space
applications to manage the related devices.

Changes from v8:

  o Cleanup of the get_battery_current()

  We need to return the signed value directly for the current flowing
  into and from the battery are totally different, and since the other
  platforms use value>0 indicates the discharge, so, we return -value
  here. (Thanks to Pavel Machek for giving this feedback!)

Wu Zhangjin (8):
  MIPS: add subdirectory for platform extension drivers
  Loongson: YeeLoong: add platform driver
  Loongson: YeeLoong: add backlight driver
  Loongson: YeeLoong: add battery driver
  Loongson: YeeLoong: add hardware monitoring driver
  Loongson: YeeLoong: add video output driver
  Loongson: YeeLoong: add suspend support
  Loongson: YeeLoong: add input/hotkey driver

 arch/mips/include/asm/mach-loongson/ec_kb3310b.h |  191 ++++
 arch/mips/include/asm/mach-loongson/loongson.h   |    6 +
 arch/mips/loongson/common/cmdline.c              |    8 +
 arch/mips/loongson/lemote-2f/Makefile            |    2 +-
 arch/mips/loongson/lemote-2f/ec_kb3310b.c        |   12 +-
 arch/mips/loongson/lemote-2f/ec_kb3310b.h        |  188 ----
 arch/mips/loongson/lemote-2f/platform.c          |   40 +
 arch/mips/loongson/lemote-2f/pm.c                |    4 +-
 arch/mips/loongson/lemote-2f/reset.c             |    2 +-
 drivers/platform/Kconfig                         |    4 +
 drivers/platform/Makefile                        |    1 +
 drivers/platform/mips/Kconfig                    |   33 +
 drivers/platform/mips/Makefile                   |    5 +
 drivers/platform/mips/yeeloong_laptop.c          | 1035 ++++++++++++++++++++++
 14 files changed, 1331 insertions(+), 200 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-loongson/ec_kb3310b.h
 delete mode 100644 arch/mips/loongson/lemote-2f/ec_kb3310b.h
 create mode 100644 arch/mips/loongson/lemote-2f/platform.c
 create mode 100644 drivers/platform/mips/Kconfig
 create mode 100644 drivers/platform/mips/Makefile
 create mode 100644 drivers/platform/mips/yeeloong_laptop.c

