From: Jamie Lokier <jamie@shareable.org>
Subject: APM and 2.5.75 not resuming properly
Date: Sat, 16 Aug 2003 15:29:33 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20030816142933.GE23646@mail.jlokier.co.uk>
References: <1059211833.576.13.camel@teapot.felipe-alfaro.com> <200308132024.36967.rob@landley.net> <3F3B41C7.1000906@mvista.com> <200308160510.44627.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200308160510.44627.rob@landley.net>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: George Anzinger <george@mvista.com>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-laptop@vger.kernel.org

Rob Landley wrote:
> (APM suspends, and then never comes back until you yank the #*%(&#
> battery.  Great.  Trying it with the real mode bios calls next
> reboot...)

Similar here.  Using 2.5.75.  APM with no local APIC (kernel is unable
to enable it anyway).

It suspends.  On resume, the screen is blank and the keyboard doesn't
respond (no Caps Lock or SysRq).  Occasionally when it resumes the
keyboard does respond, but the screen stays blank.  At least it is
possible to do SysRq-S SysRq-B in this state.  Sometimes, if I'm
lucky, I can make it reboot by holding down the power key for 5 seconds.

2.4 APM works great.  ACPI doesn't do anything useful except give me
more control over the screen brightness.

--- Jamie
