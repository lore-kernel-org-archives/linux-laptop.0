From: "E. Robert Bogusta" <rob23@tmr.com>
Subject: Re: fsck and shutdown
Date: Fri, 21 Jun 2002 10:03:50 -0400 (EDT)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <Pine.LNX.3.96.1020621100000.11267H-100000@gatekeeper.tmr.com>
References: <Pine.LNX.4.21.0206091419030.9105-100000@dnabank.bot.tcd.ie>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0206091419030.9105-100000@dnabank.bot.tcd.ie>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Salamin <salaminn@tcd.ie>
Cc: linux-laptop@vger.kernel.org

On Sun, 9 Jun 2002, Nicolas Salamin wrote:

> I've got SuSE linux 7.3 installed on a Dell Inspiron 2500. I recently got
> a problem when shutting down (or restarting) the computer. At boot up, the
> message "/dev/hda4 (root partition) not cleanly unmouted" appears and
> fsck is run to check the filesystems. But that's when "shutdown -h (or
> -r) now" is used to shutdown the computer, and even when the "/dev/hda4 
> unmounted" appears in the message log during the shutdown.
> I tried to check /etc/fstab or /etc/inittab but nothing seems wrong. Any
> ideas??

One cause of this is that some other filesystem doesn't get unmounted
cleanly. I've seen this when a compact flash hangs. It's not a laptop
problem only, if that's what's causing it. Making root ext3 will lessen
the pain.

		-- rob bogus

