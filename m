From: Andrew McGregor <andrew@indranet.co.nz>
Subject: Re: dell precision m50 _very_ slow paging/swapping
Date: Mon, 13 Jan 2003 00:09:15 +1300
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <19480000.1042369755@localhost.localdomain>
References: <3E203A45.B590F101@petcom.com>
 <200301111012.55150.akpm@digeo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <200301111012.55150.akpm@digeo.com>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@digeo.com>, Roe Peterson <roe@petcom.com>, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org

Have you tried hdparm to see if the disk is in a stupid mode and needs 
something (DMA most likely) switched on to perform?  Dell BIOSes often get 
this wrong.  idebus=66 on the kernel command line is appropriate too.

Andrew

--On Saturday, January 11, 2003 10:12:55 -0800 Andrew Morton 
<akpm@digeo.com> wrote:

> On Sat January 11 2003 07:37, Roe Peterson wrote:
>>
>> Although Dell doesn't consider the precision M50 a laptop (it's a
>> "portable workstation"), this list
>> looks like a good place to start :-)
>>
>> I'm having a big problem with a brand-new M50.  The symptoms persist
>> whether I try Redhat 7.3
>> or 8.0.
>>
>> Generally, everything is fine, right up to the time the machine starts
>> paging out to disk.  Then, the
>> system essentially grinds to a halt.
>>
>
> You'd need to determine whether the CPU is busy or idle when this is
> happening.
>
> If it's busy, profile the kernel:
>
> - boot with "profile=1" on the kernel command line
>
> -
> 	readprofile -r
> 	<do something>
> 	readprofile -v -m /boot/System.map | sort -n +2 | tail -40
>
> It it's not busy, then:
>
> while true
> do
> 	ps axl | grep ' D '
> 	sleep 1
> done &
> <do something>
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
>


