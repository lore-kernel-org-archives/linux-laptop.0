From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v8 5/8] Loongson: YeeLoong: add hardware monitoring
 driver
Date: Tue, 08 Dec 2009 15:18:01 +0800
Message-ID: <1260256681.3315.54.camel@falcon.domain.org>
References: <cover.1260082252.git.wuzhangjin@gmail.com>
	 <d8789fa7e97d8a170c4e2516d7ef2d2fbbe42cc6.1260082252.git.wuzhangjin@gmail.com>
	 <20091206084717.GD2766@ucw.cz> <1260147298.3126.2.camel@falcon.domain.org>
	 <20091207080446.GB23088@elf.ucw.cz>
	 <1260178870.9092.34.camel@falcon.domain.org>
	 <20091207094909.GD23088@elf.ucw.cz>
	 <1260255056.3315.23.camel@falcon.domain.org>
	 <20091208070643.GB12264@elf.ucw.cz>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=xo93w+wTVQGNGLw9rJoV2rEM1jHwT7Txodgu503bGRU=;
        b=kMYdpYclPsbT4OCB+xpM5m3ymhE8C/kPLkJK06bqzWS++MtK6VtXKJul0+I3Bl5PWE
         Ky5qY0YxEBJwJ0Q+rm4kV0lIXL0FQxIryDXVo0Vzph0jovDBxqapOsmjjPuO7KCxwgDM
         eJZVLglnoWFRkUI6Slxctyh9aED/+uEF0N7Dg=
In-Reply-To: <20091208070643.GB12264@elf.ucw.cz>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, 2009-12-08 at 08:06 +0100, Pavel Machek wrote:
> On Tue 2009-12-08 14:50:56, Wu Zhangjin wrote:
> > Hi, Pavel Machek
> > 
> > After fixing the get_battery_current(), can I get your Acked-by: for the
> > next revision of this patch?
> 
> Yes... you can add my ack for 4-6/8.

Thanks, will add your ack and resend the patchset later ;)

Regards,
	Wu Zhangjin

