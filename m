From: Simeon Penev <simeon_penev@web.de>
Subject: Re: 2.6.17-1.2174_FC5: : Disabling IRQ #7 / nobody cared / usb_hcd_irq
Date: Wed, 06 Sep 2006 15:56:52 +0200
Message-ID: <44FED3A4.2010204@web.de>
References: <790873504@web.de> <44FD8932.60906@tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <44FD8932.60906@tmr.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Davidsen <davidsen@tmr.com>
Cc: linux-laptop@vger.kernel.org

Hi Bill,

thank you for the fast reply!

Bill Davidsen wrote:
> Although IRQ7 is traditionally LP, it seems to get identified for almost
> any unexpected interrupt. I knew why once, but I haven't seen this for
> some time. The real problem is that the kernel disables the IRQ, making
> the system unusable. You can try any of several things:
> - try the last 2.6.16 kernel
> - remove the IRQ disable code, or add a counter. It happens only once on
> many machines,
>   as something comes ready.

I'll try that, but actually i wanted to help fix the problem if it's a
bug with the kernel.

> - switch to IRQ poll

Already tried, but kernel panics.

> - disable any CPU speed stuff you have running (just for information)

Yes, i'm using cpufreq, but it's a feature i'm not willing to give away
because the laptop is more silent. The fan works less.

> - try the question on a Fedora list, or report as a bug

Ok, i'll do that.

> - look for newer BIOS formware

Already have the latest.

> 
> Yes, that's a shotgun approach, I'm still running 2.6.16.2111 on FC4
> because later kernels don't init the video or wireless correctly.
> 

Thank you once again.

Best regards,
simeon
