From: Andrew McGregor <andrew@indranet.co.nz>
Subject: Re: Dell precision M50 and _very_ slow process startup
Date: Tue, 14 Jan 2003 08:03:01 +1300
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <86350000.1042484581@localhost.localdomain>
References: <200301131627.h0DGRX101413@rapfast.petcom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <200301131627.h0DGRX101413@rapfast.petcom.com>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Roe Peterson <roe@petcom.com>, linux-laptop@vger.kernel.org

Yes, that is what it does (CDs and hotplug storage only, actually).

It's part of GNOME, you might see it mentioned in 8.0 in the splash screen 
as you log in.  It's been known to cause many kinds of trouble :-)

You can disable this from the GUI in 8.0, but renaming the binary is just 
as effective.  The only feature you lose will be automount on CD insertion.

Andrew

--On Monday, January 13, 2003 10:27:32 -0600 Roe Peterson <roe@petcom.com> 
wrote:

>
> After _quite_ a bit more investigation, and some good pointers from
> the net (thanks, all!), this has turned out _not_ to be a problem
> with swapping/paging at all.
>
> For some reason, the magicdev process slows the system to a crawl!
>
> I'm guessing that this process watches for cd insertion, changes
> to home directory, et. al.
>
> There seems to be no man page or info for magicdev itself.
>
> Does anyone know more about this beast?
>
> I've solved the problem temporarily by simply renameing
> /usr/bin/magicdev...
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
>


