From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 05/06] Fix compilation warning for
	arch/x86/kernel/apm_32.c
Date: Sat, 18 Jul 2009 16:13:22 +0200
Message-ID: <20090718141322.GI32618@elte.hu>
References: <20090715022038.4374.74212.sendpatchset@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090715022038.4374.74212.sendpatchset@subratamodak.linux.ibm.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subrata Modak <subrata@linux.vnet.ibm.com>
Cc: linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, Ingo Molnar <mingo@redhat.com>, David Howells <dhowells@redhat.com>, Balbir Singh <balbir@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>


* Subrata Modak <subrata@linux.vnet.ibm.com> wrote:

> Following fix is inspired by David Howells fix few days back:
> http://lkml.org/lkml/2009/7/9/109,
> 
> Signed-off-by: Subrata Modak<subrata@linux.vnet.ibm.com>,
> ---
> 
> --- a/arch/x86/kernel/apm_32.c	2009-06-15 07:50:51.000000000 +0530
> +++ b/arch/x86/kernel/apm_32.c	2009-07-15 06:43:59.000000000 +0530
> @@ -811,7 +811,7 @@ static int apm_do_idle(void)
>  	u8 ret = 0;
>  	int idled = 0;
>  	int polling;
> -	int err;
> +	int uninitialized_var(err);

Please dont use uninitialized_var() as it's dangerous - in something 
as performance-uncritical as this we should initialize it to 0 and 
mention it in the changelog that this works around a GCC false 
positive warning.

Thanks,

	Ingo
