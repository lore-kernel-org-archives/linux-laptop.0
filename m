From: Choprboy <choprboy@dakotacom.net>
Subject: Re: kernel panic for cardbus adapter - please help
Date: Sat, 5 Apr 2003 15:46:59 -0700
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <200304051546.59098.choprboy@dakotacom.net>
References: <3E8F171D.29F09E50@tataelxsi.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <3E8F171D.29F09E50@tataelxsi.co.in>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org

On Saturday 05 April 2003 10:49 am, Prasanta Sadhukhan wrote:
> Hi,
> We are using Madge 16/4 MK 2 CardBus Adapter in Redhat linux 8.0 on
> Comapaq laptop i586.
> We are using pcmcia-cs 3.2.4 source tree which we have compiled and
> installed.
> The problem we are facing is when we are plugging out the adapter from
> the socket, it's giving the following dump and the processor hangs.
[snip]


Well, it's hard to tell exactly from the information you gave (as we'd need 
the driver code and a function listing from your compiled kernel to track 
down specifics) but from your description it sounds like the Madge 16/4 
PCMCIA driver is not responding correctly to unload requests. More 
specifically, when a forced removal occurs (you pull the card) the driver is 
still trying to talk to the card, so it walks all over places it shouldn't 
be. It's a driver problem specific to that card, not a general kernel 
problem.

How good of a kernel hacker are you? The best solution is to dig into the 
driver, figure out what's wrong, and submit a patch to fix it... But since 
not all of us are proficient kernel hackers (myself included), a simple work 
around would be to make sure you "soft eject" the card first. That is, tell 
the PCMCIA core to remove the card before you actually pull the card out.

The PCMCIA card control program is called "cardctl" (it's in /sbin, so as a 
normal user you'll have to add it to your path). Just do a:
  "cardctl eject"

Or, if your have more than one card in at a time, do a "cardctl status" to 
figure out which slot the Madge is in and do a "cardctl eject <slot#>". This 
will soft remove the card and unload the driver before you pull the card.

Adrian
