From: Benoit Rouits <brouits@free.fr>
Subject: Re: Netgear FA511 and Red-Hat Linux Enterprise 4 WS
Date: Wed, 03 Oct 2007 01:04:51 +0200
Message-ID: <1191366291.7164.0.camel@chimay>
References: <S1755254AbXI1RUE/20070928172004Z+321@vger.kernel.org>
	 <20071002172209.q4fx3hlbusgcog4s@webmail4.isis.unc.edu>
	 <1191362507.26449.0.camel@chimay>
	 <20071002182108.iha1nvdbcow8cgkc@webmail4.isis.unc.edu>
	 <1191365193.6404.0.camel@chimay>
	 <20071002185425.tl2d49rqasw4gcsw@webmail4.isis.unc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <20071002185425.tl2d49rqasw4gcsw@webmail4.isis.unc.edu>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: kg4awg@email.unc.edu
Cc: linux-laptop@vger.kernel.org

Le mardi 02 octobre 2007 =C3=A0 18:54 -0400, kg4awg@email.unc.edu a =C3=
=A9crit :
> I had to install the support for the pcmcia from a satelight location=
,=20
> but it does recognize it fine.  The card itself is a Netgear FA511=20
> 10/100 Ethernet card
=46A511 are completely regognized by Linux, so what is the problem ?
do this:

dmesg | grep -i netgear

-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
