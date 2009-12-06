From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v8 5/8] Loongson: YeeLoong: add hardware monitoring
	driver
Date: Sun, 6 Dec 2009 09:47:17 +0100
Message-ID: <20091206084717.GD2766@ucw.cz>
References: <cover.1260082252.git.wuzhangjin@gmail.com> <d8789fa7e97d8a170c4e2516d7ef2d2fbbe42cc6.1260082252.git.wuzhangjin@gmail.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d8789fa7e97d8a170c4e2516d7ef2d2fbbe42cc6.1260082252.git.wuzhangjin@gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wu Zhangjin <wuzhangjin@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Hi!

> +static int get_battery_current(void)
> +{
> +	s16 value;
> +
> +	value = (ec_read(REG_BAT_CURRENT_HIGH) << 8) |
> +		(ec_read(REG_BAT_CURRENT_LOW));
> +
> +	if (value < 0)
> +		value = ~value + 1;
> +
> +	return value;
> +}

What is going on here? I thought the value is already in two's
complement... Is the above equivalent of

	      if (value < 0)
	      	 value = -value; 

? If so, why? If not, can you add a comment?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
