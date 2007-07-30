From: Toralf =?utf-8?q?F=C3=B6rster?= <toralf.foerster@gmx.de>
Subject: Re: build #310 failed for 2.6.23-rc1-g05ff097 in linux/arch/i386/kernel/apm.c
Date: Mon, 30 Jul 2007 11:55:10 +0200
Message-ID: <200707301155.12836.toralf.foerster@gmx.de>
References: <200707301058.02103.toralf.foerster@gmx.de> <20070730194029.10a05731.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4637974.vUdzzrzqxz";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <20070730194029.10a05731.sfr@canb.auug.org.au>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-laptop@vger.kernel.org

--nextPart4637974.vUdzzrzqxz
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

the patch works, now the build completed succesfully. The diff withion the =
=2Econfig files is :

tfoerste@n22 ~/devel/linux-2.6 $ diff .config .config.old
4c4
< # Mon Jul 30 11:47:31 2007
=2D--
> # Mon Jul 30 10:21:20 2007
230a231,237
> CONFIG_APM=3Dy
> # CONFIG_APM_IGNORE_USER_SUSPEND is not set
> CONFIG_APM_DO_ENABLE=3Dy
> # CONFIG_APM_CPU_IDLE is not set
> CONFIG_APM_DISPLAY_BLANK=3Dy
> CONFIG_APM_ALLOW_INTS=3Dy
> CONFIG_APM_REAL_MODE_POWER_OFF=3Dy



Am Montag, 30. Juli 2007 11:40 schrieb Stephen Rothwell:
> On Mon, 30 Jul 2007 10:57:59 +0200 Toralf F=C3=B6rster <toralf.foerster@g=
mx.de> wrote:
> >
> > Hello,
> >=20
> > the build with the attached .config failed, make ends with:
> > ...
> >   LD      arch/i386/kernel/cpu/built-in.o
> >   CC      arch/i386/kernel/reboot.o
> >   CC      arch/i386/kernel/cpuid.o
> >   CC      arch/i386/kernel/microcode.o
> >   CC      arch/i386/kernel/apm.o
> > arch/i386/kernel/apm.c: In function 'suspend':
> > arch/i386/kernel/apm.c:1211: error: implicit declaration of function 's=
ave_processor_state'
> > arch/i386/kernel/apm.c:1214: error: implicit declaration of function 'r=
estore_processor_state'
>=20
> hmm CONFIG_PM_SLEEP was not set.  Can you try the patch below, please?
>=20
> > arch/i386/kernel/apm.c: In function 'apm_init':
> > arch/i386/kernel/apm.c:2240: warning: format '%lx' expects type 'long u=
nsigned int', but argument 3 has type 'u32'
>=20
> Someone else has posted a trivial patch for that.
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Subject: [PATCH] APM support depend on PM_SLEEP
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/i386/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/i386/Kconfig b/arch/i386/Kconfig
> index abb582b..7eefa7d 100644
> --- a/arch/i386/Kconfig
> +++ b/arch/i386/Kconfig
> @@ -938,7 +938,7 @@ source "drivers/acpi/Kconfig"
> =20
>  menuconfig APM
>  	tristate "APM (Advanced Power Management) BIOS support"
> -	depends on PM && !X86_VISWS
> +	depends on PM && !X86_VISWS && PM_SLEEP
>  	---help---
>  	  APM is a BIOS specification for saving power using several different
>  	  techniques. This is mostly useful for battery powered laptops with

=2D-=20
MfG/Sincerely

Toralf F=C3=B6rster

--nextPart4637974.vUdzzrzqxz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBGrbV+hyrlCH22naMRAmV/AJ0TKVLcay3uU2q1dpSdCgznZLgsEACgphnL
QvZWmVYyQYcEge2rgz6dkQM=
=7QpZ
-----END PGP SIGNATURE-----

--nextPart4637974.vUdzzrzqxz--
