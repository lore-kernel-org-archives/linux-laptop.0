From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v7 4/8] Loongson: YeeLoong: add battery driver
Date: Fri, 04 Dec 2009 22:56:54 +0800
Message-ID: <1259938614.9554.2.camel@falcon.domain.org>
References: <cover.1259932036.git.wuzhangjin@gmail.com>
	 <059fa216d70771a6341edb2db4cc559e958273e9.1259932036.git.wuzhangjin@gmail.com>
	 <20091204080408.GA1540@ucw.cz>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=XjyTHMJSFyf90Rinkj9NvvBvMf04c9cqRuyH2J8n0XE=;
        b=M7gs3+oSNnFqdrHOEJ114o4ZTMUDSsnPqydUQq+4QCPTmxguKUaysGV+QnJqUEJiLw
         9Lj0EPOMLFX079hmbo+E2HUfsSyfFLTV7Kaf8ybhgVfFjyvw0lYAFMWQeFTWWiljrBsY
         18g5wLxez+qeguIdJmRD5gIWfecgkQAlBM65I=
In-Reply-To: <20091204080408.GA1540@ucw.cz>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-laptop@vger.kernel.org, Hongbing Hu <huhb@lemote.com>

On Fri, 2009-12-04 at 09:04 +0100, Pavel Machek wrote:
> On Fri 2009-12-04 21:34:17, Wu Zhangjin wrote:
> > From: Wu Zhangjin <wuzhangjin@gmail.com>
> > 
> > This patch adds APM emulated Battery Driver, it provides standard
> > interface(/proc/apm) for user-space applications(e.g. kpowersave,
> > gnome-power-manager) to manage the battery.
> 
> It would be nicer if this went to drivers/power, and used its
> interface -- providing not only percentage but also other values.

There is a version basic on the power supply interface, but it is buggy.

Regards,
	Wu Zhangjin


