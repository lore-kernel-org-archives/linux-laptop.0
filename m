From: =?ISO-8859-15?Q?Jos=E9_Eduardo_Martins?= <jemart@student.dei.uc.pt>
Subject: Re: IBM G40 networking?
Date: Thu, 12 Feb 2004 19:37:51 +0000
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <402BD60F.7000501@student.dei.uc.pt>
References: <c0e8rm$61v$1@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <c0e8rm$61v$1@gatekeeper.tmr.com>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: bill davidsen <davidsen@tmr.com>
Cc: linux-laptop@vger.kernel.org

Greetings!

He has a 10/100/1000 chip. Not three chips of 10/100/1000 each.

If he has linux aready installed, just 'cat /proc/pci' to see the=20
chipset. Then, check if there is a driver.

bill davidsen wrote:
> I just got a call from a friend who has to get a laptop identified as=
 an
> "IBM G40" unit. I haven't quickly found any info on that, can someone
> give me a pointer to info on the network setup? He says it has a
> 10/100/1000 and wireless capability, but can only find one NIC. Since
> he's a timezone away I can't just play with it, hopefully someone has=
 a
> bit of info on this.

--=20
"5 horas." - Jos=E9 Martins
http://7mares.terravista.pt/zemartins
telnet://spunge.org:6969

-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
