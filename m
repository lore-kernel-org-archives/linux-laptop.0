From: Thomas Bettler <bettlert@student.ethz.ch>
Subject: module uhci-hcd and pm
Date: Fri, 10 Dec 2004 19:18:14 +0100
Message-ID: <200412101918.24191.bettlert@student.ethz.ch>
References: <200412091447.11996.bettlert@student.ethz.ch>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1216614.ZKd03Oksu9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <200412091447.11996.bettlert@student.ethz.ch>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org

--nextPart1216614.ZKd03Oksu9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello you all

The uhci-hcd module causes the cpu to work at highest frequecy
(according to x86info -mhz). If I unload it, cpu frequency dropps from full
(1.8GHz) to ~2/3 (1.1GHz). In both cases top shows 97% or even 99% idle.
modprobing it again speeds the cpu up again.

So module uhci-hcd prehibits the cpu clock from saving power on notebooks. =
(At=20
least theese with P4-M cpus)

What code forces the cpu to run at high speed? Can I tweak the module to=20
permit slower cpu speed?

Thomas Bettler

--nextPart1216614.ZKd03Oksu9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBuehvePDD0plw9EYRAiNLAJ9oUnPfEkAfDRwkjZuUj3UPZq+JKQCgxyJk
Jbv6WGlItHQpxSz9fs9+IT8=
=0I7S
-----END PGP SIGNATURE-----

--nextPart1216614.ZKd03Oksu9--
