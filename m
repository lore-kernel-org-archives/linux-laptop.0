From: Josh Brooks <user@mail.econolodgetulsa.com>
Subject: patching X for zoomed video support
Date: Mon, 24 Mar 2003 10:33:43 -0800 (PST)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20030324101652.C93691-100000@mail.econolodgetulsa.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org


Hello,

I have two questions regarding patching the neomagic driver in XFree86 to
support zoomed video on-screen in X.  First, some background:

Hardware: Toshiba Libretto 100ct
Kernel:	2.4.20 with pcmcia in-kernel, using pcmcia-cs 3.1.26
XFree86: 4.1.0
Slackware 8.0 (very default install)

I have a patch that will allow using my margi "dvd to go" zoomed video
cardbus card and display the video on-screen.  The README for this patch
tells me:

3. How to apply this patch

  cd xc/program/Xserver/hw/xfree86/drivers/neomagic
  patch -p1 -s < neomagic.diff
  make
  make install

When I do this, I get no errors from patch - so the patch seems to work -
it should, since the patch was written for XFree96-4.1.0, and I am using
it on the 4.1.0 source tree - so all is well, I suppose.

However, there is no Makefile, only an Imakefile - so the next step is to
run xmkmf, which succeeds and outputs:

imake -DUseInstalled -I/usr/X11R6/lib/X11/config

so now I have a Makefile - and I continue following the instructions and
run `make`.  But make bombs out with:

neo_driver.c:40: xf86.h: No such file or directory
neo_driver.c:41: xf86_OSproc.h: No such file or directory
neo_driver.c:42: xf86_ansic.h: No such file or directory
neo_driver.c:45: compiler.h: No such file or directory
neo_driver.c:47: xf86Resources.h: No such file or directory
neo_driver.c:50: xf86PciInfo.h: No such file or directory
neo_driver.c:53: xf86Pci.h: No such file or directory

... and so on ... presumably bombing for every .h specified in
neo_driver.c and every file included from it.

----------

So here are the two questions:

1. Why is the make failing ?  I don't think it is a problem with X or the
patch or anything, I think it is a general "I have very little experience
compiling things" error and I think I am just missing a path or
something...

2. Is this scheme a sound one ?  Note that I am not reinstalling or even
recompiling X, I am just patching the neomagic driver and then running
`make ; make install` (I checked, the Makefile does have an install rule)
... do I then just start X and I will be using a patched neomagic driver ?

Any additional comments appreciated.

Thanks!

