From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] apm: make apm=power-off configurable like
 apm=realmode-power-off
Date: Thu, 8 May 2008 00:46:05 +1000
Message-ID: <20080508004605.cc2e1531.sfr@canb.auug.org.au>
References: <4821B4BD.9010402@wincor-nixdorf.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_May_2008_00_46_05_+1000_gsAzyp7Q1fqJqZqZ"
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <4821B4BD.9010402@wincor-nixdorf.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
To: Niels de Vos <niels.devos@wincor-nixdorf.com>
Cc: linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__8_May_2008_00_46_05_+1000_gsAzyp7Q1fqJqZqZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neils,

On Wed, 07 May 2008 15:55:09 +0200 Niels de Vos <niels.devos@wincor-nixdorf=
.com> wrote:
>
> On some systems (with broken BIOSes?) apm=3Dpower-off should be appended
> as kernel parameter. apm=3Drealmode-power-off is configurable during=20
> compile-time. apm=3Dpower-off should be configurable likewise.
>=20
> On non-SMP systems apm=3Dpower-off is the default. For kernels with SMP
> support it is not.

We had a similar compile time option that we removed in 2.3.26pre1 in
favour of the kernel parameter ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_May_2008_00_46_05_+1000_gsAzyp7Q1fqJqZqZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIIcCyTgG2atn1QN8RAguaAKCUROLw35TbkHt8BzDw8cQxLsDNAQCfawFZ
oUHKtFTtF6HJAFOl7eGcAs0=
=z+9x
-----END PGP SIGNATURE-----

--Signature=_Thu__8_May_2008_00_46_05_+1000_gsAzyp7Q1fqJqZqZ--
