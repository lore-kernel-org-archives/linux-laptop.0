From: Roel Kluin <12o3l@tiscali.nl>
Subject: hp6xx: Test APM_DISABLED bit or definition in hp6x0_apm_interrupt()?
Date: Fri, 28 Mar 2008 00:35:13 +0100
Message-ID: <47EC2F31.9020107@tiscali.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sfr@canb.auug.org.au
Cc: linux-laptop@vger.kernel.org

from arch/sh/boards/hp6xx/hp6xx_apm.c:78

static irqreturn_t hp6x0_apm_interrupt(int irq, void *dev)
{
	if (!APM_DISABLED)
		apm_queue_event(APM_USER_SUSPEND);

	return IRQ_HANDLED;
}

shouldn't that be something like

if (!(apm_info.bios.flags & APM_DISABLED))

considering that APM_DISABLED is defined in include/linux/apm_bios.h:153: 
#define APM_DISABLED            0x01

