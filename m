From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] [44/2many] MAINTAINERS - APM DRIVER
Date: Mon, 13 Aug 2007 11:47:30 +0100
Message-ID: <20070813114730.107f1402@the-village.bc.nu>
References: <46bff8b6.XgYxpWqOSD9Itfw6%joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <46bff8b6.XgYxpWqOSD9Itfw6%joe@perches.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: joe@perches.com
Cc: torvalds@linux-foundation.org, sfr@canb.auug.org.au, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

On Sun, 12 Aug 2007 23:22:46 -0700
joe@perches.com wrote:

> Add file pattern to MAINTAINER entry
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 016f342..da9bc6d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -428,6 +428,9 @@ M:	sfr@canb.auug.org.au
>  L:	linux-laptop@vger.kernel.org
>  W:	http://www.canb.auug.org.au/~sfr/
>  S:	Supported
> +F:	arch/i386/boot/apm.c
> +F:	arch/i386/kernel/apm.c
> +F:	include/linux/apm_bios.h

NAK - boot/apm.c seems to be maintained by H Peter Anvin

