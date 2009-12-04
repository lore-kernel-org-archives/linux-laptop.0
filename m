From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v7 5/8] Loongson: YeeLoong: add hardware monitoring
 driver
Date: Sat, 05 Dec 2009 00:29:45 +0800
Message-ID: <1259944185.9554.8.camel@falcon.domain.org>
References: <cover.1259932036.git.wuzhangjin@gmail.com>
	 <102732263f647e47216c1f2cb121c30226cc995e.1259932036.git.wuzhangjin@gmail.com>
	 <20091204080813.GB1540@ucw.cz>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932199AbZLDQaL@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=u2gLDyxrC9BjabwZXR9sf061r5jwuKspjFs+3ivl4bc=;
        b=mHmDFi37Qc8w9Ts860jywncImBgmXN3dv2zhsG3RelHfGMb/k45f+bMnABAS82aQRW
         GcxITNjqv7LFjjDsoFmPuHiTxDqziUb2kOir76MnGX0jZ1udFdE7MrxrVNDpUt9/M9t+
         abB9kCYDcu0gvOQDSc1NRhVH8pHOY5znAKAxE=
In-Reply-To: <20091204080813.GB1540@ucw.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org

On Fri, 2009-12-04 at 09:08 +0100, Pavel Machek wrote:
> Hi!
> 
> > +static int get_cpu_temp(void)
> > +{
> > +	int value;
> > +
> > +	value = ec_read(REG_TEMPERATURE_VALUE);
> > +
> > +	if (value & (1 << 7))
> > +		value = (value & 0x7f) - 128;
> > +	else
> > +		value = value & 0xff;
> 
> wtf?
> 
> Maybe value should be 's8'?
> 
> > +static int get_battery_current(void)
> > +{
> > +	int value;
> > +
> > +	value = (ec_read(REG_BAT_CURRENT_HIGH) << 8) |
> > +		(ec_read(REG_BAT_CURRENT_LOW));
> > +
> > +	if (value & 0x8000)
> > +		value = 0xffff - value;
> 
> Another version of  pair-complement conversion; this one is broken --
> off by 1.
> 
> > +static int parse_arg(const char *buf, unsigned long count, int *val)
> > +{
> > +	if (!count)
> > +		return 0;
> > +	if (sscanf(buf, "%i", val) != 1)
> > +		return -EINVAL;
> > +	return count;
> > +}
> 
> We have strict_strtoul for a reason...
> 

Done, thanks!

Regards,
	Wu Zhangjin
