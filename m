From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v8 5/8] Loongson: YeeLoong: add hardware monitoring
 driver
Date: Mon, 07 Dec 2009 08:54:58 +0800
Message-ID: <1260147298.3126.2.camel@falcon.domain.org>
References: <cover.1260082252.git.wuzhangjin@gmail.com>
	 <d8789fa7e97d8a170c4e2516d7ef2d2fbbe42cc6.1260082252.git.wuzhangjin@gmail.com>
	 <20091206084717.GD2766@ucw.cz>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=bvUsoT+1Us6JY8GoEkBBRF4TMCISNFxR5cqkWDFWmO0=;
        b=Joo6PhUNwNj8jV5ASjnqLKiO/CBiojLnUJqDLCPjx9Omb1IL+o48RTgNuYoT56ihip
         HMa93nFQ/MdKJYb+OS51x5cUrv8o7D67ZSc+FSs5H9b3sw+H+SNJ+EWHIQVTs3McxlH6
         9/KX7y/iqf4jVYDCZNGgwEzozxpZfn7xEo4p8=
In-Reply-To: <20091206084717.GD2766@ucw.cz>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Sun, 2009-12-06 at 09:47 +0100, Pavel Machek wrote: 
> Hi!
> 
> > +static int get_battery_current(void)
> > +{
> > +	s16 value;
> > +
> > +	value = (ec_read(REG_BAT_CURRENT_HIGH) << 8) |
> > +		(ec_read(REG_BAT_CURRENT_LOW));
> > +
> > +	if (value < 0)
> > +		value = ~value + 1;
> > +
> > +	return value;
> > +}
> 
> What is going on here? I thought the value is already in two's
> complement... Is the above equivalent of
> 
> 	      if (value < 0)
> 	      	 value = -value; 
> 
> ? If so, why? If not, can you add a comment?

Right, then, will use this instead:

static int get_battery_current(void)
{ 
	s16 value;

	value = (ec_read(REG_BAT_CURRENT_HIGH) << 8) |
		(ec_read(REG_BAT_CURRENT_LOW));

	return abs(value);
}

Thanks & Best Regards,
	Wu Zhangjin


