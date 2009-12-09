From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v9 5/8] Loongson: YeeLoong: add hardware monitoring
 driver
Date: Wed, 09 Dec 2009 18:59:52 +0800
Message-ID: <1260356392.3926.2.camel@falcon.domain.org>
References: <cover.1260281599.git.wuzhangjin@gmail.com>
	 <5e9acb4cd757075f617daa45cbd6f5fad94678ac.1260281599.git.wuzhangjin@gmail.com>
	 <20091208150229.GA1375@ucw.cz>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=857nE80KHgfbd2GB1vwxiyEimJlR66TOYfgwOmGsb8Q=;
        b=DwUxOeRzf06Ovhl2DMEPYSHHWsxrdpc5sTPHE7GDwDz3lWTc6wtzay0P6LQfF1NZkH
         AfNVut74JXG3ti6BaXkNFWkjgRx4AGKGBo+alT0S4RxPQ0Y/4x8o3V/rx9PcqgAVUdO3
         xRgrcepxGhBQXaYMtt/QseYSM8SzGKJ1RlXJ4=
In-Reply-To: <20091208150229.GA1375@ucw.cz>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, 2009-12-08 at 16:02 +0100, Pavel Machek wrote:
> Hi!
> 
> > This patch adds hardware monitoring driver, it provides standard
> > interface(/sys/class/hwmon/) for lm-sensors/sensors-applet to monitor
> > the temperatures of CPU and battery, the PWM of fan, the current,
> > voltage of battery.
> 
> It is probably ok for now, but in future current/voltage of battery
> should be exported as power_supply class (drivers/power)...

Currently, the version based on the power_supply class have some
problems when using with gnome-power-manager(the whole system will hang
there), but works well with kpowersave, after fixing the bug, we will
use it instead of this APM Emulated one.

Thanks & Regards!
	Wu Zhangjin

