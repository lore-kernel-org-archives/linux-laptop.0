From: John Ruttenberg <rutt@chezrutt.com>
Subject: Re: Dell Inspiron i8100 with 2 batteries
Date: Fri, 17 May 2002 11:25:47 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <15589.8443.496770.786194@localhost.localdomain>
References: <15589.5673.460356.221529@localhost.localdomain>
	<Pine.LNX.4.21.0205171113550.1002-100000@puppy.afrinc.com>
Reply-To: rutt@chezrutt.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0205171113550.1002-100000@puppy.afrinc.com>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dave@afrinc.com
Cc: linux-laptop@vger.kernel.org


I tried using ACPI, but it has shortcomings compared to APM.  In particular,
with APM, you can use the function-setup, function-battery buttons to get into
the bios screens even while the kernel is running.  I don't actually
understand how this magic works, but it works with APM and not ACPI.

David G Hamblen:
> 
> I've got the same laptop with one battery, but I'm using ACPI. None of the
> current user-space utilities parse this stuff particularly well (the
> filenames in /proc/acpi have changed), but the data all look reasonable.
> 
> #cat /proc/acpi/battery/BAT1/*
> alarm:                   3000 mWh
> present:                 yes
> design capacity:         57420 mWh
> last full capacity:      57420 mWh
> battery technology:      rechargeable
> design voltage:          14800 mV
> design capacity warning: 3000 mWh
> design capacity low:     1000 mWh
> capacity granularity 1:  200 mWh
> capacity granularity 2:  200 mWh
> model number:            LIP8084DLP
> serial number:           40086
> battery type:            LION
> OEM info:                Sony Corp.
> present:                 yes
> capacity state:          ok
> charging state:          charging
> present rate:            unknown
> remaining capacity:      56670 mWh
> present voltage:         16746 mV
> 
> Dave
> 
> On Fri, 17 May 2002, John Ruttenberg wrote:
> 
> > I thought I'd try to figure out that there were two batteries and divide by 2
> > or something like that.  Perhaps the bios of this notebook is just broken,
> > though.
> > 
> > Alan Cox:
> > > > of the batteries is less than 50% (according to the bios), then /proc/apm
> > > > shows the battery power level X 2.  If the combined charge of the batteries is
> > > > greater than 50%, then /proc/apm shows:
> > > > 
> > > >     1.16 1.2 0x03 0x01 0xff 0x10 -1% -1 ?
> > > > 
> > > > I think this is because the bogus calculation it would make would result in a
> > > > percentage > 100.
> > > > 
> > > > I took a quick look at arch/i386/kernel/apm.c but it wasn't obvious what to
> > > > do.
> > > 
> > > The data basically comes from the BIOS as is
> > 
> > 
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/
> > 
