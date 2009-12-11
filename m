From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v9 8/8] Loongson: YeeLoong: add input/hotkey driver
Date: Fri, 11 Dec 2009 10:47:40 +0800
Message-ID: <1260499660.3193.17.camel@falcon.domain.org>
References: <cover.1260254344.git.wuzhangjin@gmail.com>
	 <39d232e3f8359e9c11bad7536f0162444401ec94.1260281599.git.wuzhangjin@gmail.com>
	 <7676d8397e593dbec0d40e24429b7ccbcecfa588.1260281599.git.wuzhangjin@gmail.com>
	 <4d821efaecc3dee0b9124119507a694e81572437.1260281599.git.wuzhangjin@gmail.com>
	 <5c426a5091bee3e4483fc0b93f26359e2840428b.1260281599.git.wuzhangjin@gmail.com>
	 <5e9acb4cd757075f617daa45cbd6f5fad94678ac.1260281599.git.wuzhangjin@gmail.com>
	 <234c5ecd475b05e3eb17ead3ae107cfe3426e0e0.1260281599.git.wuzhangjin@gmail.com>
	 <6af33d6c42ba4de9eea27316c64f81b96e01c948.1260281599.git.wuzhangjin@gmail.com>
	 <e6d590fa37e6003dd482918fdef02c1fc127d6c8.1260281599.git.wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=H2uyOGrqpzUr6ebcCsXeqiL9KDWEWBSAb6ANRuBQwgA=;
        b=wmKXsuL1OWEn5R2plz3J7D/xYj2knuJpSEMrMYLBXcjEua6scU71aOMacMUnUTSqmS
         SCXkWJvtO8uukj20sCvwu7DP2ilWiOgwwq31DuK8uzApasm5D6dJNs3exfkpoBD1yNZJ
         /Yeggwz33/LwNK41iPMs46i+fzZTHaI7XaAQw=
In-Reply-To: <e6d590fa37e6003dd482918fdef02c1fc127d6c8.1260281599.git.wuzhangjin@gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>

On Tue, 2009-12-08 at 22:15 +0800, Wu Zhangjin wrote:
> From: Wu Zhangjin <wuzhangjin@gmail.com>
> 
> This patch adds Hotkey Driver, which will do related actions for The
> hotkey event(/sys/class/input) and report the corresponding input keys
> to the user-space applications.
> 
> [NOTE:
> 
> This patch is based on the sparse keymap library in:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input next
> 
> of Dmitry Torokhov. that sparse keymap support is also queued for
> 2.6.33. Before the above branch is pulled by linus, this patch is not
> appliable.]
> 
[...]
> +
> +/* yeeloong_wifi_handler may be implemented in the wifi driver */
> +sci_handler yeeloong_wifi_handler;
> +EXPORT_SYMBOL(yeeloong_wifi_handler);
> +

Because we have reported the KEY_WLAN to user-space and If we provide
the standard rfkill interfaces too, there is no need to handle the Fn+F5
event in kernel space, will remove the above three lines the following
related source code.

> +static void do_event_action(int event)
> +{
> +	sci_handler handler;
> +	int reg, status;
> +	struct key_entry *ke;
> +
> +	reg = 0;
> +	handler = NULL;
> +
> +	switch (event) {
[...]
> +	case EVENT_WLAN:
> +		/* We use 2 to indicate it as a switch */
> +		status = 2;
> +		handler = yeeloong_wifi_handler;
> +		break;

Will remove it and send the this patch as v10 later.

Best Regards,
	Wu Zhangjin

