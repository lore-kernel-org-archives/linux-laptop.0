From: Andrew Morton <akpm@digeo.com>
Subject: Re: dell precision m50 _very_ slow paging/swapping
Date: Sat, 11 Jan 2003 10:12:55 -0800
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <200301111012.55150.akpm@digeo.com>
References: <3E203A45.B590F101@petcom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <3E203A45.B590F101@petcom.com>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roe Peterson <roe@petcom.com>, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat January 11 2003 07:37, Roe Peterson wrote:
>
> Although Dell doesn't consider the precision M50 a laptop (it's a
> "portable workstation"), this list
> looks like a good place to start :-)
>
> I'm having a big problem with a brand-new M50.  The symptoms persist
> whether I try Redhat 7.3
> or 8.0.
>
> Generally, everything is fine, right up to the time the machine starts
> paging out to disk.  Then, the
> system essentially grinds to a halt.
>

You'd need to determine whether the CPU is busy or idle when this is
happening.

If it's busy, profile the kernel:

- boot with "profile=1" on the kernel command line

-
	readprofile -r
	<do something>
	readprofile -v -m /boot/System.map | sort -n +2 | tail -40

It it's not busy, then:

while true
do
	ps axl | grep ' D '
	sleep 1
done &
<do something>



