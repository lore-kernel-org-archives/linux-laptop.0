From: Pavel Machek <pavel@suse.cz>
Subject: Re: [PATCH] [APM] Is this the correct way to fix suspend bug introduced in 2.6.0-test4?
Date: Wed, 28 Jan 2004 18:46:55 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20040128174655.GE1200@elf.ucw.cz>
References: <13zy7qdcyz1q7$.50e5l3rpbsyx$.dlg@40tude.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <13zy7qdcyz1q7$.50e5l3rpbsyx$.dlg@40tude.net>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: schierlm@gmx.de
Cc: fr@canb.auug.org.au, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org, mochel@digitalimplant.org

Hi!
> 
> the patch below (against 2.6.1-mm5) fixes my APM problems (my laptop, Acer
> TravelMate 210TEV (Celeron 700, 128 MB RAM), hangs after resuming from APM
> since 2.6.0-test4).
> 
> I found the "fix" by trying to "reversely" backport the changes from
> patch-2.6.0-test4.bz2 into 2.6.1-mm5 (the old device_suspend code calls
> sysdev_suspend, the new one does not; so what do I lose if I call
> sysdev_suspend myself?). This trial-and-error-approach finally led into the
> patch below (which works great for me).
> 
> Most likely this is not the cleanest way to do this; but since I don't even
> know what this sysdev_suspend does (except that it does something that
> seems to be vital for making my laptop resume...), i don't know how to make
> it better...
> 
> If you have any suggestions, tell me (or change it yourself and submit it),
> if you think that's okay like that, please submit that to the guy who is
> responsible for 2.6 (is it Linus or Andrew? did not follow lkml
> recently).

Andrew.

I think you should use device_power_down() and device_power_up(),
instead. Check it, but it looks to me like that's better way.
								Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
