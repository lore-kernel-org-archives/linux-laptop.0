From: =?UTF-8?B?Tm9ybWFuIFJpZcOf?= <norman@smash-net.org>
Subject: Re: gigabit ethernet on Thinkpad X300?
Date: Fri, 19 Sep 2008 10:00:25 +0200
Message-ID: <48D35C19.7070206@smash-net.org>
References: <20080919021535.1FE01E80FD@jindo.eecs.harvard.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <20080919021535.1FE01E80FD@jindo.eecs.harvard.edu>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Norman Ramsey <nr@cs.tufts.edu>
Cc: linux-laptop@vger.kernel.org

Norman Ramsey schrieb:
> I've just booted kernel 2.6.26 (Debian lenny) on my new Thinkpad X300=
=2E
> Things seem working OK so far except I can't get gigabit ethernet.
> Output from ethtool says:
>
> Settings for eth0:
>         Supported ports: [ TP ]
>         Supported link modes:   10baseT/Half 10baseT/Full=20
>                                 100baseT/Half 100baseT/Full=20
>                                 1000baseT/Full=20
>         Supports auto-negotiation: Yes
>         Advertised link modes:  10baseT/Half 10baseT/Full=20
>                                 100baseT/Half 100baseT/Full=20
>                                 1000baseT/Full=20
>         Advertised auto-negotiation: Yes
>         Speed: 100Mb/s
>         Duplex: Full
>         Port: Twisted Pair
>         PHYAD: 1
>         Transceiver: internal
>         Auto-negotiation: on
>         Supports Wake-on: pumbag
>         Wake-on: g
>         Current message level: 0x00000001 (1)
>         Link detected: yes
>
>
> As you can see both the hardware and the link support full duplex
> 1000baseT, but I'm getting only 100Mb/s (confirmed by lights on switc=
h).
>
> I tried
>
>   sudo ifconfig eth0 media 1000baseT
>
> but that media type isn't even recognized.
>
> I also tried
>
>   sudo ethtool -s eth0 speed 1000
>
> but this seems to have broken the ethernet port entirely
> (although a reboot brings it back).
>
> Does anybody have any ideas?
>
>
> Norman
>
> P.S. After all this messaing around, it now negotiates down to 10Mb/s=
=2E
> Booting 2.6.24 seems to get back to 100Mb/s.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-lapto=
p" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20
I had a simmilar problem once. Turned out my Linksys Gigabit Switches=20
didn=C2=B4t quite like to work with Intel and Realtek NICs. Only Marvel=
 could=20
get GiBit speed. All else negotiated at 100 and 10.
I tried D-Link Switches an had GiBit on all NICs again.

Regards
Norman (also)
--
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
