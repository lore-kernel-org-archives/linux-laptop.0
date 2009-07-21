From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: Re: [PATCH 05/06] Fix compilation warning for
	arch/x86/kernel/apm_32.c
Date: Tue, 21 Jul 2009 08:03:55 +0530
Message-ID: <1248143636.9140.4.camel@subratamodak.linux.ibm.com>
References: <20090715022038.4374.74212.sendpatchset@subratamodak.linux.ibm.com>
	 <20090718141322.GI32618@elte.hu>
Reply-To: subrata@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754733AbZGUCeF@vger.kernel.org>
In-Reply-To: <20090718141322.GI32618@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, Ingo Molnar <mingo@redhat.com>, David Howells <dhowells@redhat.com>, Balbir Singh <balbir@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>

On Sat, 2009-07-18 at 16:13 +0200, Ingo Molnar wrote:
> * Subrata Modak <subrata@linux.vnet.ibm.com> wrote:
> 
> > Following fix is inspired by David Howells fix few days back:
> > http://lkml.org/lkml/2009/7/9/109,
> > 
> > Signed-off-by: Subrata Modak<subrata@linux.vnet.ibm.com>,
> > ---
> > 
> > --- a/arch/x86/kernel/apm_32.c	2009-06-15 07:50:51.000000000 +0530
> > +++ b/arch/x86/kernel/apm_32.c	2009-07-15 06:43:59.000000000 +0530
> > @@ -811,7 +811,7 @@ static int apm_do_idle(void)
> >  	u8 ret = 0;
> >  	int idled = 0;
> >  	int polling;
> > -	int err;
> > +	int uninitialized_var(err);
> 
> Please dont use uninitialized_var() as it's dangerous - in something 
> as performance-uncritical as this we should initialize it to 0 and 
> mention it in the changelog that this works around a GCC false 
> positive warning.

Sure. Resending as you suggested.

Regards--
Subrata

> 
> Thanks,
> 
> 	Ingo
