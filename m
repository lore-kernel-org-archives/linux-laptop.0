From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] apm: Remove CONFIG_APM_REAL_MODE_POWER_OFF in favor of
	kernel parameter
Date: Thu, 20 Nov 2008 09:50:43 +0100
Message-ID: <20081120085043.GK21785@elte.hu>
References: <4924201B.8010301@wincor-nixdorf.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4924201B.8010301@wincor-nixdorf.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niels de Vos <niels.devos@wincor-nixdorf.com>
Cc: sfr@canb.auug.org.au, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>


* Niels de Vos <niels.devos@wincor-nixdorf.com> wrote:

> Remove CONFIG_APM_REAL_MODE_POWER_OFF like CONFIG_APM_POWER_OFF 
> which has been done for linux-2.2.14pre8 
> (http://lkml.org/lkml/1999/11/23/3).
> 
> Re-introducing CONFIG_APM_POWER_OFF got nack-ed. Stephen didn't bother
> to remove CONFIG_APM_REAL_MODE_POWER_OFF, let's get rid of it now.
> 	Reference: http://lkml.org/lkml/2008/5/7/97
> 
> Signed-off-by: Niels de Vos <niels.devos@wincor-nixdorf.com>
> 
> ---
>  arch/x86/Kconfig         |    7 -------
>  arch/x86/kernel/apm_32.c |    4 ----
>  2 files changed, 0 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 93224b5..d0b9ef7 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1629,13 +1629,6 @@ config APM_ALLOW_INTS
>  	  many of the newer IBM Thinkpads.  If you experience hangs when you
>  	  suspend, try setting this to Y.  Otherwise, say N.
>  
> -config APM_REAL_MODE_POWER_OFF
> -	bool "Use real mode APM BIOS call to power off"
> -	help
> -	  Use real mode APM BIOS calls to switch off the computer. This is
> -	  a work-around for a number of buggy BIOSes. Switch this option on if
> -	  your computer crashes instead of powering off properly.
> -

> -#ifdef CONFIG_APM_REAL_MODE_POWER_OFF
> -static int realmode_power_off = 1;
> -#else
>  static int realmode_power_off;
> -#endif

this might be an option for obsolete hardware, but still it has the 
potential to help people - and they could depend on it. The proper way 
to phase out the Kconfig feature would be to insert an obsoletion 
warning that triggers in some form when 
CONFIG_APM_REAL_MODE_POWER_OFF=y is enabled, and then remove the 
config option in 1-2 years. (and keep the boot option of course)

even better we should have a transparent kernel-parameters framework 
that would be a one-stop-shop for _both_ .config and boot-time flags. 
Something like:

  define_bootparam("realmode_power_off");

plus a way to define the help text - all in a single file and in a 
single place.

Which would automatically be turned into a kconfig option, a boot 
option and (optionally) a sysctl as well, during the kernel build.

We do have the CONFIG_CMDLINE facility in the latest kernels to inject 
arbitrary boot parameters during the kernel build, but that does not 
have any semantic dimensions and its opacity makes it fragile: there's 
no facility that warns if an option is typoed, if an option goes away 
or gets changed, there's no help text like we have when there's a 
Kconfig entry, etc.

	Ingo
