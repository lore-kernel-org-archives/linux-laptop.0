From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: IBM G40 networking?
Date: Mon, 16 Feb 2004 06:57:16 -0500
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <4030B01C.9080000@tmr.com>
References: <c0e8rm$61v$1@gatekeeper.tmr.com> <402BD60F.7000501@student.dei.uc.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <402BD60F.7000501@student.dei.uc.pt>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Jos=E9_Eduardo_Martins?= <jemart@student.dei.uc.pt>
Cc: linux-laptop@vger.kernel.org

Jos=E9 Eduardo Martins wrote:
> Greetings!
>=20
> He has a 10/100/1000 chip. Not three chips of 10/100/1000 each.
>=20
> If he has linux aready installed, just 'cat /proc/pci' to see the=20
> chipset. Then, check if there is a driver.

I would presume that with wireless and GbaseT he has two controllers, h=
e=20
wants the wireless off. He had already done lspci and found only one=20
controller, someone in the office suggested that the wireless might be =
a=20
built-in PCMCIA card or something, set with card management. Might be,=20
but the moment passed, thanks anyway. Windows can see two controllers,=20
unfortunately.
>=20
> bill davidsen wrote:
>=20
>> I just got a call from a friend who has to get a laptop identified a=
s an
>> "IBM G40" unit. I haven't quickly found any info on that, can someon=
e
>> give me a pointer to info on the network setup? He says it has a
>> 10/100/1000 and wireless capability, but can only find one NIC. Sinc=
e
>> he's a timezone away I can't just play with it, hopefully someone ha=
s a
>> bit of info on this.
>=20
>=20


--=20
bill davidsen <davidsen@tmr.com>
   CTO TMR Associates, Inc
   Doing interesting things with small computers since 1979
-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
