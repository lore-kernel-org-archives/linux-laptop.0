From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [KJ]  [PATCH] apm: clean up module initalization
Date: Wed, 2 Aug 2006 01:45:45 +0400
Message-ID: <20060801214545.GA6827@martell.zuzino.mipt.ru>
References: <20060801162548.GA11605@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060801162548.GA11605@localhost.localdomain>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Horman <nhorman@tuxdriver.com>
Cc: kernel-janitors@lists.osdl.org, akpm@osdl.org, sfr@canb.auug.org.au, linux-laptop@vger.kernel.org

On Tue, Aug 01, 2006 at 12:25:48PM -0400, Neil Horman wrote:
> Patch to clean up module initalization for apm.c.  I had started by auditing for
> proper return code checks in misc_register, but I found that in the event of an
> initalization failure, a proc file and a kernel thread were left hanging out.
> this patch properly cleans up those loose ends on any initalization failure.

> --- a/arch/i386/kernel/apm.c
> +++ b/arch/i386/kernel/apm.c

> -	misc_register(&apm_device);
> +	if (misc_register(&apm_device)) {
> +		printk(KERN_ERR "apm: Unable to register misc device\n");
> +		ret = -ENOMEM;
> +		goto out_thread;

misc_register() can fail for reasons other than ENOMEM.

