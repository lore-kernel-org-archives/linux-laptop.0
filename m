From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v8 8/8] Loongson: YeeLoong: add input/hotkey driver
Date: Tue, 08 Dec 2009 15:34:18 +0800
Message-ID: <1260257658.3315.74.camel@falcon.domain.org>
References: <cover.1260082252.git.wuzhangjin@gmail.com>
         <b164d5bb79963a57621d024c22e5664de0ff8662.1260082252.git.wuzhangjin@gmail.com>
         <20091207064857.GG21451@core.coreip.homeip.net>
         <1260255131.3315.25.camel@falcon.domain.org>
         <20091208072347.GH11147@core.coreip.homeip.net>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=ZeryFTn0xkSrOBJezzPmXau2gbPboPYJS9ddbaxqXfs=;
        b=pvSibhdrl/0JVUSO9iK+dEEaK9pfdy1X5n/0dGhROiNOcIKYte4zCCizoi2+WTjt9a
         sPjUpvAz08kQ4TSZmRw53vW+M09prJ8rmvE5m0VeD3ktqWbDHXA6hn4zzHY/DPSJXuTT
         KeKGqRTi4NjiMBNrlOvtNNNeIQkaYdY1zbBMs=
In-Reply-To: <20091208072347.GH11147@core.coreip.homeip.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>

On Mon, 2009-12-07 at 23:23 -0800, Dmitry Torokhov wrote:
> On Tue, Dec 08, 2009 at 02:52:11PM +0800, Wu Zhangjin wrote:
> > Hi, Dmitry Torokhov
> > 
> > I plan to send another revision of this patchset, Can I get your
> > Acked-by: for this patch?
> > 
> 
> Yes, as far as the input code goes:
> 
> 	Acked-by: Dmitry Torokhov <dtor@mail.ru>

Added, thanks!

To Ralf:

This patch is based on the sparse keymap library in:

git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input next

from Dmitry Torokhov. that sparse keymap support is also queued for
2.6.33.

Before that support going into mainline, this patch can not be compiled,
so, Ralf, this patch is not appliable before Dmitry's next branch is
pulled by linus.

Thanks!
	Wu Zhangjin


