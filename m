From: Vadim <lkml@vadim.ws>
Subject: APM suspend on 2.6.0-test9 causes Toshiba 470CDT laptop to hang after resume
Date: Sun, 26 Oct 2003 23:14:44 +0100
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <200310262314.58446.lkml@vadim.ws>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_idEn/OdIqOFhXdH";
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
To: sfr@canb.auug.org.au, weissg@vienna.at
Cc: linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb-users@lists.sourceforge.net


--Boundary-02=_idEn/OdIqOFhXdH
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

When I suspend and later resume on this laptop it looks like=20
everything that involves the disk breaks.  For example, when I=20
tried this after resume:

dmesg > dmesg.log
sync

it hung on sync. The kernel seems to continue working, for=20
example I can scroll up, but anything I try to run hangs. USB=20
seems to break as well, if I connect a card reader after resume=20
there's no kernel messages, and its LED doesn't light. Here are=20
some messages I copied:

(apm --suspend)
hdc: start_power_step(step: 0)
hdc: completing PM request, suspend
hda: start_power_step(step: 0)
hda: start_power_step(step: 1)
hda: complete_power_step(step: 1, stat: 50, err: 0)
hda: completing PM request, suspend
ohci_hdc 000:00:0b.0: suspend D4 --> D3
ohci_hdc 000:00:0b.0: suspend to 3
ohci_hdc 000:00:0b.0: suspended

(resume, apm --suspend not returning, Ctrl+C works to abort it)
ohci_hdc 000:00:0b.0: resume from state D4
ohci_hdc 000:00:0b.0: OHCI 1.0, with legacy support registers
ohci_hdc 000:00:0b.0: control 0x000 HCFS=3Dreset CBSR=3D0
ohci_hdc 000:00:0b.0: cmdstatus 0x00000 SOC=3D0
ohci_hdc 000:00:0b.0: intrstatus 0x00000000
ohci_hdc 000:00:0b.0: intrenable 0x00000000
ohci_hdc 000:00:0b.0: USB restart
usb usb1: USB disconnect, address 1
usb 1-1: usb_disable_device nuking all URBs
ohci_hcd 0000:00:0b.0: shutdown urb c1297f00 pipe 40408180=20
ep1in-intr
usb usb1: unregistering interface 1-0:1.0
usb usb1: hcd_unlink_urb c1297f00 fail -22

Thanks in advance

=2D-=20
Use the PGP path finder to find a trust path to my key:
http://the.earth.li/~noodles/pathfind.html

--Boundary-02=_idEn/OdIqOFhXdH
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/nEdivCkUtBccqkoRApZdAKCgQI9I/fmjBtcjwH02qh54qgriCQCdEpFL
tnSQAOpGdk1DXPKkmjf+Au0=
=5Lmp
-----END PGP SIGNATURE-----

--Boundary-02=_idEn/OdIqOFhXdH--

