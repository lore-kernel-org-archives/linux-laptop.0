From: Sebastian Henschel <linux@kodeaffe.de>
Subject: Re: question about kernel 2.6.1
Date: Thu, 5 Feb 2004 10:32:44 +0100
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20040205093244.GA2028@fuchi>
References: <1075925263.2952.29.camel@darkstar>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1075925263.2952.29.camel@darkstar>
List-Id: <linux-laptop.vger.kernel.org>
To: Linux_Laptop <linux-laptop@vger.kernel.org>


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

moin roman..

* Roman Jordan <RomanJordan@gmx.de> [2004-02-05 10:01 +0100]:
> Hi,
> i have a sony PCG-FX505 laptop (ati graphic and 1,2 GHz mobile athlon).
> I use fedora linux version 1.0. The system runs o.k.
> After the installation of the kernel version 2.6.1 i can't shutdown the
> system. The commands 'halt' and 'poweroff' doesn't switch off the
> device.
> The display is black, but the LEDs are still on.
>=20
> Any suggestions where to start solving?

yes, check the latest acpi patch:
http://ftp.kernel.org/pub/linux/kernel/people/lenb/acpi/patches/release/2.6=
=2E1/acpi-20040116-2.6.1.diff.bz2

or better take 2.6.2 which already includes the (currently) latest
patch.

hth,
 sebastian
--=20
::: .O.
::: ..O
::: OOO
::: lynx -source http://www.kodeaffe.de/shensche.pub | gpg --import

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAIg28reHfL3pi+bQRAiKbAKCPTiZVJ+6oq16JR1E6I2SeIKY7YQCeK2sL
dcRfAEo+mcnKf+H34wtq/xM=
=B0/u
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
