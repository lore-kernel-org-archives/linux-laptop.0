From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v8 8/8] Loongson: YeeLoong: add input/hotkey driver
Date: Mon, 07 Dec 2009 15:26:47 +0800
Message-ID: <1260170807.9092.9.camel@falcon.domain.org>
References: <cover.1260082252.git.wuzhangjin@gmail.com>
	 <b164d5bb79963a57621d024c22e5664de0ff8662.1260082252.git.wuzhangjin@gmail.com>
	 <20091207064857.GG21451@core.coreip.homeip.net>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=gY10Y5P5PtTxoMnu3fNKCuILSNmTRPAyXe2y8bCMHAQ=;
        b=d1nG2gCN2s9rbTYKbV5TewhwPRSRc2stjE2l7gLM1bB+Jgt7aXajwYpPl164lNbgOE
         fpXo0fgJK6pVK6Qfd44Kp3pv+jBonfWRM9u+O3Gx7VNpMKLo90j/A28aoIwJWR3HPEBC
         3fMY5ccsYHhf+YMRBLYwuX8YRRCkeM1WSnVqE=
In-Reply-To: <20091207064857.GG21451@core.coreip.homeip.net>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>

On Sun, 2009-12-06 at 22:48 -0800, Dmitry Torokhov wrote:
> Hi Wu,
> 
> On Sun, Dec 06, 2009 at 03:01:48PM +0800, Wu Zhangjin wrote:
> > +
> > +#define EC_VER_LEN 64
> > +
> > +static int black_screen_handler(int status)
> > +{
> > +	char *p, ec_ver[EC_VER_LEN];
> > +
> > +	p = strstr(loongson_cmdline, "EC_VER=");
> > +	if (!p)
> > +		memset(ec_ver, 0, EC_VER_LEN);
> > +	else {
> > +		strncpy(ec_ver, p, EC_VER_LEN);
> > +		p = strstr(ec_ver, " ");
> > +		if (p)
> > +			*p = '\0';
> > +	}
> > +
> 
> Hmm, why do you copy and parse command lineinstead of using module
> param and also doing it just once?
> 

The kernel command line (EC_VER=blabla) is passed by bootloader(PMON)
automatically, so, I think it's better to use it.

Using an extra module param is good, but may make the users confused and
will also add extra jobs to the distribution developers ;) in the
future, the information of the EC and the other information of the
devices will be passed to kernel from BIOS via something like
FDT(Flattened Device Tree, used on PowerPC machines) as Ralf introduced,
so, the above method is a temp solution.

Thanks & Regards,
	Wu Zhangjin

> > +	/* Seems EC(>=PQ1D26) does this job for us, we can not do it again,
> > +	 * otherwise, the brightness will not resume to the normal level! */
> > +	if (strncasecmp(ec_ver, "EC_VER=PQ1D26", 64) < 0)
> > +		yeeloong_lcd_vo_set(status);
> > +
> > +	return status;
> > +}
> 
> Thanks.
> 


