From: "Robert Zwerus" <arzie@dds.nl>
Subject: Re: Framebuffer problema.
Date: Sat, 6 Sep 2003 21:01:36 +0200 (CEST)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <2626.213.46.87.240.1062874896.squirrel@arzie-2.adsl.utwente.nl>
References: <1062858298.4630.123.camel@toshibao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <1062858298.4630.123.camel@toshibao>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: FaRaOhh <faraohh@ih.com.br>
Cc: linux-laptop <linux-laptop@vger.kernel.org>

FaRaOhh said:
> CONFIG_FB_VGA16=y
> CONFIG_FB_VESA=y
> CONFIG_VIDEO_SELECT=y
> # CONFIG_FB_HGA is not set
> CONFIG_FB_RIVA=y

> Does anybody know how to solve the problem?

I think you should just enable one of the abovementioned options. Probably
the VESA-framebuffer, if you're using the binary nVidia X-driver.
-- 
A Dieu,
	Robert Zwerus - e-mail: arzie@dds.nl
	ICQ UIN: 3943443 - MSN: robert_zwerus@hotmail.com

