From: Rob Landley <rob@landley.net>
Subject: Re: APM and 2.5.75 not resuming properly
Date: Sat, 16 Aug 2003 16:43:45 -0400
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <200308161643.45753.rob@landley.net>
References: <1059211833.576.13.camel@teapot.felipe-alfaro.com> <200308160510.44627.rob@landley.net> <20030816142933.GE23646@mail.jlokier.co.uk>
Reply-To: rob@landley.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20030816142933.GE23646@mail.jlokier.co.uk>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: George Anzinger <george@mvista.com>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-laptop@vger.kernel.org

On Saturday 16 August 2003 10:29, Jamie Lokier wrote:
> Rob Landley wrote:
> > (APM suspends, and then never comes back until you yank the #*%(&#
> > battery.  Great.  Trying it with the real mode bios calls next
> > reboot...)
>
> Similar here.  Using 2.5.75.  APM with no local APIC (kernel is unable
> to enable it anyway).

I'm still trying to get 2.4.21 to work on the new hardware before tackling 
2.5.  I think I've written off APM as a lost cause for the moment, though.  I 
need to catch up on some real work for a bit, but I'll probably see if 2.5 is 
also horked on monday.

My problem is that although the drive spins down, the cpu fan goes off, and 
the monitor goes black, the little "I am sleeping" moon shaped light never 
lights up.  (And the "I am running off of battery" light never goes off.)

Once it's in this state, there's no way to get the sucker to wake up.  I've 
pressed every key, and fn-every key, and the power button (repeatedly), and 
the special function keys, and the "thinkpad" key (whatever that's for...)

If I hold the power button for ten seconds, the thing will fully power down, 
so that if I press it again it'll reboot from a cold start.  I suppose this 
is an improvement over popping the battery to get it out of "brick" mode...

> It suspends.  On resume, the screen is blank and the keyboard doesn't
> respond (no Caps Lock or SysRq).

If I could get it to resume at all, life would be good.

> 2.4 APM works great.

Not for me.  Still fiddling...

Rob
