From: =?ISO-8859-15?Q?Jos=E9_Eduardo_Martins?= <jemart@student.dei.uc.pt>
Subject: Re: IBM G40 networking?
Date: Mon, 16 Feb 2004 14:24:45 +0000
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <4030D2AD.9030809@student.dei.uc.pt>
References: <c0e8rm$61v$1@gatekeeper.tmr.com> <402BD60F.7000501@student.dei.uc.pt> <4030B01C.9080000@tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <4030B01C.9080000@tmr.com>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bill Davidsen <davidsen@tmr.com>
Cc: linux-laptop@vger.kernel.org

I was too snappy with my answer not giving my self enough time to=20
understand the problem correctly. For that, please accept my appologies=
=2E

I understand now that he can't find the wireless controller. Yes, he=20
might need pcmcia enabled. But the network interface only appears after=
=20
the driver is running. Until that, not even the list in /proc/pci lists=
=20
a Network Controller. Only a Unknown Device. This is until the kernel=20
has previous information about the vendor and device ID.

It's possible that its something embbeded with Centrino technology. If=20
that is correct, please se page http://ndiswrapper.sourceforge.net/ for=
=20
more details. I can't explain in more detail, because I never needed to=
=20
make that work. I know it works because I know people that made it work=
=2E
Not being embbeded with Centrino, I can't realy help much. This being, =
I=20
suggest that it copies the name of the device under Windows and search=20
about compatibility with Orinoco, acx100_pci ou other driver.

How now it helps.

Bill Davidsen wrote:
> Jos=E9 Eduardo Martins wrote:
>=20
>> Greetings!
>>
>> He has a 10/100/1000 chip. Not three chips of 10/100/1000 each.
>>
>> If he has linux aready installed, just 'cat /proc/pci' to see the=20
>> chipset. Then, check if there is a driver.
>=20
>=20
> I would presume that with wireless and GbaseT he has two controllers,=
 he=20
> wants the wireless off. He had already done lspci and found only one=20
> controller, someone in the office suggested that the wireless might b=
e a=20
> built-in PCMCIA card or something, set with card management. Might be=
,=20
> but the moment passed, thanks anyway. Windows can see two controllers=
,=20
> unfortunately.
>=20
>>
>> bill davidsen wrote:
>>
>>> I just got a call from a friend who has to get a laptop identified =
as an
>>> "IBM G40" unit. I haven't quickly found any info on that, can someo=
ne
>>> give me a pointer to info on the network setup? He says it has a
>>> 10/100/1000 and wireless capability, but can only find one NIC. Sin=
ce
>>> he's a timezone away I can't just play with it, hopefully someone h=
as a
>>> bit of info on this.
>>
>>
>>
>=20
>=20

--=20
"5 horas." - Jos=E9 Martins
http://7mares.terravista.pt/zemartins
telnet://spunge.org:6969

-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
