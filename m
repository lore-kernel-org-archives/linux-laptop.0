From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v8 3/8] Loongson: YeeLoong: add backlight driver
Date: Tue, 08 Dec 2009 15:52:44 +0800
Message-ID: <1260258764.3315.82.camel@falcon.domain.org>
References: <cover.1260082252.git.wuzhangjin@gmail.com>
	 <d6bb11d33fe01abd6de945117ce647af73841f00.1260082252.git.wuzhangjin@gmail.com>
	 <5a8742a71e96ba40bee34fb37478cc8339e76530.1260082252.git.wuzhangjin@gmail.com>
	 <3c77f3891e73e189cceef7155dc9cb6503084a4b.1260082252.git.wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=4Xhz3xF/WU4xG71WNh8ATKGonFefN/OgssnrD1YvgBU=;
        b=Q2xNomNxrj+GFJOFzcfUormKMFvWYPuc2zrMRLOqBiXL7EtelKTlDRvhShTisLefhy
         Ano1Ii0QFBoeDUsHNSJWV046oGFS0BqmUQVU99LFENoQ+sN3YX3yt4J+jLBZyLwGdymI
         IbLiNdGKLySgjPYQ3wH/xiQlytU7XJlsSTwM4=
In-Reply-To: <3c77f3891e73e189cceef7155dc9cb6503084a4b.1260082252.git.wuzhangjin@gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>

On Sun, 2009-12-06 at 15:01 +0800, Wu Zhangjin wrote:
> From: Wu Zhangjin <wuzhangjin@gmail.com>
> 
> This patch adds YeeLoong Backlight Driver, it provides standard
> interface(/sys/class/backlight/) for user-space applications(e.g.
> kpowersave, gnome-power-manager) to control the brightness of the
> backlight.
[...]
> +static int yeeloong_set_brightness(struct backlight_device *bd)
> +{
> +	unsigned int level, current_level;
> +	static unsigned int old_level;
> +
> +	level = (bd->props.fb_blank == FB_BLANK_UNBLANK &&
> +		 bd->props.power == FB_BLANK_UNBLANK) ?
> +	    bd->props.brightness : 0;
> +
> +	if (level > MAX_BRIGHTNESS)
> +		level = MAX_BRIGHTNESS;
> +	else if (level < 0)
> +		level = 0;
> +
> +	/* Avoid to modify the brightness when EC is tuning it */
> +	if (old_level != level) {
> +		current_level = ec_read(REG_DISPLAY_BRIGHTNESS);
> +		if (old_level == current_level)
> +			ec_write(REG_DISPLAY_BRIGHTNESS, level);
> +	}
> +	old_level = level;

Will move the above line into the end of "if { ... }".

Regards,
	Wu Zhangjin

