From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: APM and 2.5.75 not resuming properly
Date: Sun, 17 Aug 2003 01:03:20 +1000
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20030817010320.0668d246.sfr@canb.auug.org.au>
References: <1059211833.576.13.camel@teapot.felipe-alfaro.com>
	<200308132024.36967.rob@landley.net>
	<3F3B41C7.1000906@mvista.com>
	<200308160510.44627.rob@landley.net>
	<20030816142933.GE23646@mail.jlokier.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20030816142933.GE23646@mail.jlokier.co.uk>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: rob@landley.net, george@mvista.com, linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org

On Sat, 16 Aug 2003 15:29:33 +0100 Jamie Lokier <jamie@shareable.org> wrote:
>
> Rob Landley wrote:
> > (APM suspends, and then never comes back until you yank the #*%(&#
> > battery.  Great.  Trying it with the real mode bios calls next
> > reboot...)
> 
> Similar here.  Using 2.5.75.  APM with no local APIC (kernel is unable
> to enable it anyway).
> 
> It suspends.  On resume, the screen is blank and the keyboard doesn't
> respond (no Caps Lock or SysRq).  Occasionally when it resumes the
> keyboard does respond, but the screen stays blank.  At least it is
> possible to do SysRq-S SysRq-B in this state.  Sometimes, if I'm
> lucky, I can make it reboot by holding down the power key for 5 seconds.

I may have missed somthing, but let me ask anyway: What laptop? Have you
tried switching to a text console before suspending?  Have you tried
	Options "NoPM" "True"
in the ServerFlags section of your XF86Config?

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
