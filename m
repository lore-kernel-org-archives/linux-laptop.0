From: Stanislav Brabec <utx@penguin.cz>
Subject: MSI-6380: APM sometimes fails to wake up
Date: Wed, 22 May 2002 21:42:59 +0200
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20020522194259.GA511@utx.vol.cz>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

Hallo,

I have MSI-6380 (Microstar K7T 266Pro) mainboard (Athlon & KT266 based).
I am using APM with lower mentioned setup.

With linux-2.4.17 it was working perfectly. Now I am using  2.4.19-pre8
with the same setup. In about 15% probablility the machine fails to be
awakened from user suspend ("apm --suspend"; nor by keyboard interrupt
nor case key). BIOS is set up to track keyboard IRQ.

CONFIG_PM=y
# CONFIG_ACPI is not set
CONFIG_APM=y
# CONFIG_APM_IGNORE_USER_SUSPEND is not set
CONFIG_APM_DO_ENABLE=y
CONFIG_APM_CPU_IDLE=y
CONFIG_APM_DISPLAY_BLANK=y
CONFIG_APM_RTC_IS_GMT=y
# CONFIG_APM_ALLOW_INTS is not set
# CONFIG_APM_REAL_MODE_POWER_OFF is not set

-- 
Stanislav Brabec
http://www.penguin.cz/~utx
