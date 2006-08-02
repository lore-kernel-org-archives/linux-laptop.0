From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [KJ] [PATCH] apm: clean up module initalization
Date: Wed, 2 Aug 2006 13:54:42 +1000
Message-ID: <20060802135442.76e95fa9.sfr@canb.auug.org.au>
References: <20060801162548.GA11605@localhost.localdomain>
	<20060802110404.70edf996.sfr@canb.auug.org.au>
	<20060802022152.GA9097@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Aug_2006_13_54_42_+1000_h5aefeONG.g_mYar"
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <20060802022152.GA9097@localhost.localdomain>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
To: Neil Horman <nhorman@tuxdriver.com>
Cc: kernel-janitors@lists.osdl.org, linux-laptop@vger.kernel.org, akpm@osdl.org

--Signature=_Wed__2_Aug_2006_13_54_42_+1000_h5aefeONG.g_mYar
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Aug 2006 22:21:52 -0400 Neil Horman <nhorman@tuxdriver.com> wrote:
>
> Copy all that.  New patch attached, with corrected cleanups for dangling =
proc
> entry on kernel_thread failure, and logged warning on failure to register
> misc_device.
>=20
> Regards
> Neil
>=20
> Signed-off-by: Neil Horman <nhorman@tuxdriver.com>

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Aug_2006_13_54_42_+1000_h5aefeONG.g_mYar
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFE0CICFdBgD/zoJvwRAjvyAJoCAt1cURdLI2+pMMWiNLFf+M2wGwCeMzNw
xuaifrPq+xiuJ3URGmpOfrY=
=h8yS
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Aug_2006_13_54_42_+1000_h5aefeONG.g_mYar--
