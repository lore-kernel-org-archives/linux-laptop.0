From: "E. Robert Bogusta" <rob23@tmr.com>
Subject: Re: Make it fast
Date: Fri, 21 Jun 2002 09:53:32 -0400 (EDT)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <Pine.LNX.3.96.1020621094117.11267E-100000@gatekeeper.tmr.com>
References: <200206090855.23480.felix.seeger@gmx.de>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <200206090855.23480.felix.seeger@gmx.de>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Seeger <felix.seeger@gmx.de>
Cc: linux-laptop@vger.kernel.org

On Sun, 9 Jun 2002, Felix Seeger wrote:

> The problem is: I want a modern desktop.
> 
> At the moment I'm compiling kde 3 drom cvs head to be sure that I have the 
> newest version with lesser mem leaks.
> I tried to remove all eye-candy things but it is slow.

I don't doubt that! You really seem to be out of memory, does `free' show
a lot of swap used? I have 128 in one laptop and it's still marginal,
while a 486-25 with 12MB is usable with a 2.0 kernel and fvwm95 (no, I'm
not a Windows user, I like it better than plain fvwm).

> Now my desktop is tuned but I have to tune Linux.
> I already remove daemons (e.g. webmin).
> I can't tune more. There is only the Linux kernel which is a normal build so I 
> thought there may be some things that I can set in the kernel config to make 
> it a bit faster.
> 
> Maybe I should try 2.5 ?

Try 2.4.19-pre10-ac2 + preempt, or the new 2.4.19-pre10aa4. Turn off
everything you don't absolutely need and then make everything you don't
need all the time a module. That means serial, parallel, ppp, sound if you
have it, all network and netfilter, nfs, samba, modularize it all. If you
do much with playing CDs, grab the "CD audio via DMA" patch floating
around and drop that in, it will save you some CPU.

> This laptop has no critical mission.

I somehow suspected that.

		-- rob bogus

