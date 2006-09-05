From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: 2.6.17-1.2174_FC5: : Disabling IRQ #7 / nobody cared / usb_hcd_irq
Date: Tue, 05 Sep 2006 10:26:58 -0400
Message-ID: <44FD8932.60906@tmr.com>
References: <790873504@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <790873504@web.de>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Simeon Penev <simeon_penev@web.de>
Cc: linux-laptop@vger.kernel.org

I can't help someone Simeon Penev wrote:

>Hi,
>
>i'm running FC5 on an Asus A6T-AP005H laptop. My kernel is 2.6.17-1.2174_FC5.
>Somewhere at about 10 minutes after i start the system, the USB subsystem dies with the message:
>
Although IRQ7 is traditionally LP, it seems to get identified for almost 
any unexpected interrupt. I knew why once, but I haven't seen this for 
some time. The real problem is that the kernel disables the IRQ, making 
the system unusable. You can try any of several things:
- try the last 2.6.16 kernel
- remove the IRQ disable code, or add a counter. It happens only once on 
many machines,
   as something comes ready.
- switch to IRQ poll
- disable any CPU speed stuff you have running (just for information)
- try the question on a Fedora list, or report as a bug
- look for newer BIOS formware

Yes, that's a shotgun approach, I'm still running 2.6.16.2111 on FC4 
because later kernels don't init the video or wireless correctly.

-- 
bill davidsen <davidsen@tmr.com>
  CTO TMR Associates, Inc
  Doing interesting things with small computers since 1979

