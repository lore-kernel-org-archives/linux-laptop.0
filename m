From: Joel Jaeggli <joelja@darkwing.uoregon.edu>
Subject: Re: dell precision m50 _very_ slow paging/swapping
Date: Sat, 11 Jan 2003 11:15:20 -0800 (PST)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301111109420.14350-100000@twin.uoregon.edu>
References: <3E203A45.B590F101@petcom.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <3E203A45.B590F101@petcom.com>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roe Peterson <roe@petcom.com>
Cc: linux-laptop@vger.kernel.org

hi, 

which of the redhat kernels are you running on it? the m50 shares most 
of it's components with the inspiron 8200/4150 and latitude c640.

joelja

On Sat, 11 Jan 2003, Roe Peterson wrote:

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
> The paging activity eventually gets done, and, once things are running
> in RAM, the machine flies.
> 
> However, I've seen starting mozilla take ~45 seconds, and starting vi
> take 15!!!
> 
> This machine:
> 
>     1.8Ghz Pentium 4 Pro Mobile CPU
>     256MB RAM
>     40 GB hard drive (userland benchmarks look good - 16-18 MB/sec
> transfer rates)
>     nVidia Quadro 4 GoGl video
>     PIIX4 EIDE chipset
>     i810 compatible sound
>     Latest BIOS upgrade from Dell (A07)
> 
> I see the same result with redhat 7.3 and 8.0.
> 
> I've even disabled the PIIX support in the kernel, on the theory that
> something in the IDE
> subsystem was responsible - no change, except (as expected) user mode
> disk IO slowed down
> somewhat.
> 
> I freely admit I'm confused.
> 
> Dell support is:
>     1 - extremely frustrating
>     2 - totally useless
> 
> And I don't even want to talk about Redhat.
> 
> Can anyone point me at a theory, even??
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 

-- 
-------------------------------------------------------------------------- 
Joel Jaeggli	      Academic User Services   joelja@darkwing.uoregon.edu    
--    PGP Key Fingerprint: 1DE9 8FCA 51FB 4195 B42A 9C32 A30D 121E      --
  In Dr. Johnson's famous dictionary patriotism is defined as the last
  resort of the scoundrel.  With all due respect to an enlightened but
  inferior lexicographer I beg to submit that it is the first.
	   	            -- Ambrose Bierce, "The Devil's Dictionary"


