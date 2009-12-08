From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v8 5/8] Loongson: YeeLoong: add hardware monitoring
 driver
Date: Tue, 08 Dec 2009 15:26:50 +0800
Message-ID: <1260257210.3315.63.camel@falcon.domain.org>
References: <cover.1260082252.git.wuzhangjin@gmail.com>
	 <d8789fa7e97d8a170c4e2516d7ef2d2fbbe42cc6.1260082252.git.wuzhangjin@gmail.com>
	 <20091206084717.GD2766@ucw.cz> <1260147298.3126.2.camel@falcon.domain.org>
	 <20091207080446.GB23088@elf.ucw.cz>
	 <1260178870.9092.34.camel@falcon.domain.org>
	 <20091207094909.GD23088@elf.ucw.cz>
	 <1260183663.9092.51.camel@falcon.domain.org>
	 <20091208070915.GC12264@elf.ucw.cz>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=SJmYjLX9hl67WFHmt0albR4iYsJIgOqjwYigMd5b57o=;
        b=ohJnKsM4PdDqA4MBEZbtxxRhZeb0Z8Lmx0nVnhPPp1kH7o4droy7MlosFxyC0tEY4h
         x0e3WVO5KANUUvBVTC2Fo8LoWvDhm6aH4PeZkPTF2lco1A5fvxx937TNEW5DehsXkPQ1
         U8RfZX17T2aP/TrsEpvILDgG4m9JH1khuN+ok=
In-Reply-To: <20091208070915.GC12264@elf.ucw.cz>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, 2009-12-08 at 08:09 +0100, Pavel Machek wrote:
> > > > > That's certainly better. But... why not return signed value? Current
> > > > > flowing from the battery is certainly very different from current
> > > > > flowing into it...
> > > > 
> > > > You are totally right ;)
> > > > 
> > > > Just test it, when flowing from the battery, the value is negative, and
> > > > when flowing into the battery, the value is positive, so, no abs()
> > > > needed. thanks!
> > > 
> > > Make it return -value, then. I believe other code uses >0 values for
> > > discharge.
> > 
> > Done, but any document/standard about it?
> 
> Not sure, feel free to patch the documentation, too :-).

Okay, I will send a documentation(as a separate patch) like them:

$ ls Documentation/ABI/testing/sysfs-platform-*
Documentation/ABI/testing/sysfs-platform-asus-laptop
Documentation/ABI/testing/sysfs-platform-eeepc-laptop 

Thanks & Regards,
	Wu Zhangjin

