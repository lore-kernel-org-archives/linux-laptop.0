From: "FaRaOhh" <faraohh@ih.com.br>
Subject: Problem kernel 2.6 with Toshiba
Date: Sat, 16 Aug 2003 1:14:00 -0300
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20030816043248.84D77A833A@mercurio.internetional.com.br>
Reply-To: "FaRaOhh" <faraohh@ih.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-laptop@vger.kernel.org

Hi all,

I from the Brazil and I have one problem whith my kernel 2.6.0-test2 fo=
r my
notebook Toshiba Satellite 2435-S255. I have my system files type ext3 =
in
/dev/hda3 I use the compile the usually mode for Debian make menuconfig=
 ;
make-kpkg clean ; make-kpkg --revision=3D? kernel-image
The mistake is:

VFS: Cannot open root device "hda3" or unknown-block(0,0)
Pease append a correct "root=3D" boot option
Kernel panic: VFS: Unable to mount root fs on unknown-block(0,0)

Somebody can help-me? Or get me /usr/src/linux/.config compatible with =
my
model notebook?

Any help thanks!!

--
Debian User:629
=46aRaOhh - Marcello Henrique
Inhumas - Goi=E1s

-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
