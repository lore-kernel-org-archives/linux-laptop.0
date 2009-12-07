From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v8 8/8] Loongson: YeeLoong: add input/hotkey driver
Date: Sun, 6 Dec 2009 22:48:57 -0800
Message-ID: <20091207064857.GG21451@core.coreip.homeip.net>
References: <cover.1260082252.git.wuzhangjin@gmail.com> <b164d5bb79963a57621d024c22e5664de0ff8662.1260082252.git.wuzhangjin@gmail.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=mUdwY+WJZb2/T4IMyl19WROuF0jPy3BxUd8/NmH02fU=;
        b=lnvG4U4maSPP2PcBOF6XHwymgAzX/8Xw//F5nxnIMs6n+EL2BCg7rpVVqyRH0PoDir
         GvnwC1lcMVe3QlaHe75k4A4gTnUkxC6GvaUVXEobg3v6NDG8FXW03qhlvi/CcLT2mfm8
         wulf/gqwz8WswlaoB4gLVN5TuPBmPwGUiCp8Q=
Content-Disposition: inline
In-Reply-To: <b164d5bb79963a57621d024c22e5664de0ff8662.1260082252.git.wuzhangjin@gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wu Zhangjin <wuzhangjin@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>

Hi Wu,

On Sun, Dec 06, 2009 at 03:01:48PM +0800, Wu Zhangjin wrote:
> +
> +#define EC_VER_LEN 64
> +
> +static int black_screen_handler(int status)
> +{
> +	char *p, ec_ver[EC_VER_LEN];
> +
> +	p = strstr(loongson_cmdline, "EC_VER=");
> +	if (!p)
> +		memset(ec_ver, 0, EC_VER_LEN);
> +	else {
> +		strncpy(ec_ver, p, EC_VER_LEN);
> +		p = strstr(ec_ver, " ");
> +		if (p)
> +			*p = '\0';
> +	}
> +

Hmm, why do you copy and parse command lineinstead of using module
param and also doing it just once?

> +	/* Seems EC(>=PQ1D26) does this job for us, we can not do it again,
> +	 * otherwise, the brightness will not resume to the normal level! */
> +	if (strncasecmp(ec_ver, "EC_VER=PQ1D26", 64) < 0)
> +		yeeloong_lcd_vo_set(status);
> +
> +	return status;
> +}

Thanks.

-- 
Dmitry
