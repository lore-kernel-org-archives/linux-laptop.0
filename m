From: Roman Jordan <RomanJordan@gmx.de>
Subject: Re: question about kernel 2.6.1
Date: 11 Feb 2004 21:35:39 +0100
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <1076531738.2947.2.camel@darkstar>
References: <1075925263.2952.29.camel@darkstar>
	 <c0dar4$3h9$1@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <c0dar4$3h9$1@gatekeeper.tmr.com>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bill davidsen <davidsen@tmr.com>
Cc: Linux_Laptop <linux-laptop@vger.kernel.org>

Thanks a lot for your help.
I have installed the kernel 2.6.2, use PM (instead of ACPI) and i use
the real mode bios jump for shutdown. And now the things are working. At
the moment not in all cases, but i hope it will be better.

Greetings,
Roman Jordan

Am Mit, 2004-02-11 um 14.31 schrieb bill davidsen:
> In article <1075925263.2952.29.camel@darkstar>,
> Roman Jordan  <RomanJordan@gmx.de> wrote:
> | Hi,
> | i have a sony PCG-FX505 laptop (ati graphic and 1,2 GHz mobile athlon).
> | I use fedora linux version 1.0. The system runs o.k.
> | After the installation of the kernel version 2.6.1 i can't shutdown the
> | system. The commands 'halt' and 'poweroff' doesn't switch off the
> | device.
> | The display is black, but the LEDs are still on.
> | 
> | Any suggestions where to start solving?
> 
> 1 - try 2.6.2
> 2 - try APM instead of ACPI
> 3 - try the patch posted here recently
> 4 - google for the "laptop patch"
> 5 - try the absolute latest ACPI patch (URL recently posted)
> 6 - stay with 2.4 unless there's something you really need in 2.6
> 7 - APM has a "use real mode shutdown" option, try that
> 8 - reboot into 2.4 and then shutdown
> 
> With all of the 2.6 features backported to 2.4 in Redhat kernels, the
> benefits are fairly small for most people.

