From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] apm: make apm=power-off configurable like
 apm=realmode-power-off
Date: Thu, 8 May 2008 01:27:56 +1000
Message-ID: <20080508012756.9b9bbe5c.sfr@canb.auug.org.au>
References: <4821B4BD.9010402@wincor-nixdorf.com>
	<20080508004605.cc2e1531.sfr@canb.auug.org.au>
	<4821C581.8050409@wincor-nixdorf.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_May_2008_01_27_56_+1000_Z9QMJ2Gp03o5vITa"
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <4821C581.8050409@wincor-nixdorf.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
To: Niels de Vos <niels.devos@wincor-nixdorf.com>
Cc: linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__8_May_2008_01_27_56_+1000_Z9QMJ2Gp03o5vITa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 07 May 2008 17:06:41 +0200 Niels de Vos <niels.devos@wincor-nixdorf=
.com> wrote:
>
> Stephen Rothwell wrote:
> > Hi Neils,
> >=20
> > On Wed, 07 May 2008 15:55:09 +0200 Niels de Vos <niels.devos@wincor-nix=
dorf.com> wrote:
> >> On some systems (with broken BIOSes?) apm=3Dpower-off should be append=
ed
> >> as kernel parameter. apm=3Drealmode-power-off is configurable during=20
> >> compile-time. apm=3Dpower-off should be configurable likewise.
> >>
> >> On non-SMP systems apm=3Dpower-off is the default. For kernels with SMP
> >> support it is not.
> >=20
> > We had a similar compile time option that we removed in 2.3.26pre1 in
> > favour of the kernel parameter ...
>=20
> Okay, but why not have both options like apm=3Drealmode-power-off?

It was a long time ago ... and APM must be almost dead my now, surely? :-)

Maybe I just never got around to removing the compile time config of real
mode power off.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_May_2008_01_27_56_+1000_Z9QMJ2Gp03o5vITa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIIcqCTgG2atn1QN8RAoeeAJ944FBOjKE1kuNWWZol0R/unUeOYwCdH7FF
6roU8hRkU9fte2hvZBPzzZs=
=d2CL
-----END PGP SIGNATURE-----

--Signature=_Thu__8_May_2008_01_27_56_+1000_Z9QMJ2Gp03o5vITa--
