From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v8 5/8] Loongson: YeeLoong: add hardware monitoring
 driver
Date: Mon, 07 Dec 2009 19:01:03 +0800
Message-ID: <1260183663.9092.51.camel@falcon.domain.org>
References: <cover.1260082252.git.wuzhangjin@gmail.com>
	 <d8789fa7e97d8a170c4e2516d7ef2d2fbbe42cc6.1260082252.git.wuzhangjin@gmail.com>
	 <20091206084717.GD2766@ucw.cz> <1260147298.3126.2.camel@falcon.domain.org>
	 <20091207080446.GB23088@elf.ucw.cz>
	 <1260178870.9092.34.camel@falcon.domain.org>
	 <20091207094909.GD23088@elf.ucw.cz>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=jtnOkXIMgedGirpDhioY0DU/ZUSkz9YUkSjMrlGwo40=;
        b=wWHfUGz+WiVZepbH+uMIo9yYC0H7hkwGuN0yqRKNgMlT2WDQaTQlTDYdTdePiRSsdN
         D7w9Qp7kvmSuTD/E2pipcQ/LCeHMZ5rh94MC19IunrNmMZmZCv1yipze1xOz2lvwWBIE
         Emac1OrClpnH6aDQ4sxuY7oQ0V3Fm5o6jejcg=
In-Reply-To: <20091207094909.GD23088@elf.ucw.cz>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Mon, 2009-12-07 at 10:49 +0100, Pavel Machek wrote:
> On Mon 2009-12-07 17:41:10, Wu Zhangjin wrote:
> > On Mon, 2009-12-07 at 09:04 +0100, Pavel Machek wrote:
> > > > > What is going on here? I thought the value is already in two's
> > > > > complement... Is the above equivalent of
> > > > > 
> > > > > 	      if (value < 0)
> > > > > 	      	 value = -value; 
> > > > > 
> > > > > ? If so, why? If not, can you add a comment?
> > > > 
> > > > Right, then, will use this instead:
> > > > 
> > > > static int get_battery_current(void)
> > > > { 
> > > > 	s16 value;
> > > > 
> > > > 	value = (ec_read(REG_BAT_CURRENT_HIGH) << 8) |
> > > > 		(ec_read(REG_BAT_CURRENT_LOW));
> > > > 
> > > > 	return abs(value);
> > > > }
> > > 
> > > That's certainly better. But... why not return signed value? Current
> > > flowing from the battery is certainly very different from current
> > > flowing into it...
> > 
> > You are totally right ;)
> > 
> > Just test it, when flowing from the battery, the value is negative, and
> > when flowing into the battery, the value is positive, so, no abs()
> > needed. thanks!
> 
> Make it return -value, then. I believe other code uses >0 values for
> discharge.
> 	

Done, but any document/standard about it?

Regards,
	Wu Zhangjin

