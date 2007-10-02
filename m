From: kg4awg@email.unc.edu
Subject: Re: Netgear FA511 and Red-Hat Linux Enterprise 4 WS
Date: Tue, 02 Oct 2007 19:27:02 -0400
Message-ID: <20071002192702.epsaj05we8w84sco@webmail4.isis.unc.edu>
References: <S1755254AbXI1RUE/20070928172004Z+321@vger.kernel.org>
	<20071002172209.q4fx3hlbusgcog4s@webmail4.isis.unc.edu>
	<1191362507.26449.0.camel@chimay>
	<20071002182108.iha1nvdbcow8cgkc@webmail4.isis.unc.edu>
	<1191365193.6404.0.camel@chimay>
	<20071002185425.tl2d49rqasw4gcsw@webmail4.isis.unc.edu>
	<1191366291.7164.0.camel@chimay>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <1191366291.7164.0.camel@chimay>
Content-Disposition: inline
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Benoit Rouits <brouits@free.fr>
Cc: linux-laptop@vger.kernel.org

Ok, did a little messing around, and this is a little more information=20
I found.
PCMCIA Controler is Texus Instruments PCI1410PC card Cardbus Controller

When the FA511 card is inserted the hardware detection shows an=20
unidentified device and labels it AMDtek:Unknown Device 1085

Quoting Benoit Rouits <brouits@free.fr>:

> Le mardi 02 octobre 2007 =E0 18:54 -0400, kg4awg@email.unc.edu a =E9c=
rit :
>> I had to install the support for the pcmcia from a satelight locatio=
n,
>> but it does recognize it fine.  The card itself is a Netgear FA511
>> 10/100 Ethernet card
> FA511 are completely regognized by Linux, so what is the problem ?
> do this:
>
> dmesg | grep -i netgear
>
>


-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
