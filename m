From: Sam Clegg <sam@superduper.net>
Subject: Re: Does the ATI Radeon 9000 Mobility work well with Linux 2.4.x?
Date: Wed, 20 Nov 2002 11:36:57 +0000
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20021120113657.GA17718@superduper.net>
References: <002c01c2901e$57883c80$6efdfea9@c0002>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002c01c2901e$57883c80$6efdfea9@c0002>
List-Id: <linux-laptop.vger.kernel.org>
To: linux-laptop@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2002 at 11:52:26PM +0100, Ola Theander wrote:
> I'm planning to buy a Dell Inspiron 8200 laptop with an ATI Radeon 9000
> Mobility 64 MB as the chosen graphics accelerator. I would like to know
> if there are drivers available for this card for Linux, preferably with
> both 2D and OpenGL (3D) support. I'm running SuSE Linux 8.0
> Professional.

According to lspci I have:

ATI Technologies Inc Radeon Mobility M6 LY

Not the same, but no doubt simpilar.  This one works great with 2D and
3D acceleration.  The 3D acceleration only just got stable since I
installed kernel 2.4.19 and XFree 4.2.1 from (Debian/unstable).  Quake
3 is quite playable (at 640x480 anyway).

Framebuffer works great at 1024x768 using the VESA framebuffer.

> Any comments on the suitability of this computer for running Linux are
> also welcome.

The only prolem I am having now is that mplayer won't play large movies
when I have the "dri" module loaded.  Something to do with xvideo and
dri interfering I guess.

sam
--=20
sam clegg
:: sam@superduper.net=20
:: http://superduper.net/=20
:: PGP : D91EE369 :: YIM : samuelbclegg :: freenode : samo
:: ICQ : 14962308 :: AIM : samuelbclegg :: MSN : sambclegg
$superduper: .signature,v 1.9 2002/10/23 11:20:39 sam Exp $

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE923PZLOvxONke42kRAtuyAKC2ooNg6fIUCCgQUqZVMfYB6oxLqgCeLz/w
lZ92AMf9xxr0oFYReMt/1wM=
=rnMX
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
