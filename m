From: Werner Heuser <Werner.Heuser@web.de>
Subject: ANN: new maintainer for Synaptics touchpad driver
Date: Mon, 13 Jan 2003 16:47:50 -0100
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20030113174750.GD24502@mobilix.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "linux-laptop@vger.kernel.org" <linux-laptop@vger.kernel.org>

Hi,

please note, Stefan Gmeiner developer of the Synaptics touchpad driver
has given his work to a new maintainer David Kennedy dkennedy_AT_lab43.=
org
Stefan asked me to make this announcement because he is very busy.

Werner

The touchpad driver has the following functions (some functions require
features from the touchpad that must be present, multifinger taps for e=
xample):

- Movement with adjustable, non-linear acceleration and=20
  speed (Options: MinSpeed, MaxSpeed, AccelFactor)
- Button events through short touching of the touchpad=20
  (Options: MaxTapTime, MaxTapMove)
- Double-Button events through double short touching of the touchpad=20
- Dragging through short touching and holding down the finger on the to=
uchpad
- Middle and right button events on the upper and lower=20
  corner of the touchpad (Option: Edges)
- Scrolling (button four and five events) through moving=20
  the finger on the right side of the touchpad (Options: Edges, VertScr=
ollDelta)
- The up/down button sends button four/five events
- Adjustable finger detection (Option: Finger)
- Ext Mouse repeater support - Alpha! (Option: Repeater)
- Multifinger taps: two finger for middle button and three=20
  finger for right button events
- Online configuration through short-memory (in development) (Option: S=
HMConfig)

The source tar file contains a pre-compiled binary.=B7 I highly recomme=
nd to use
the binary, because the source can't be compiled without the XFree86 so=
urces.
The tar file contains the file <code>INSTALL</code>, which describes ho=
w to
modify your XF86Config-4 file. You may download it at
http://mobilix.org/touchpad_driver.html


--=20
|=3D| Werner Heuser =3D Keplerstr. 11A =3D D-10589 Berlin =3D Germany
|=3D| <wehe_AT_mobilix.org>      T. 0049 - (0)30 - 349 53 86
|=3D| http://MobiliX.org         UniX on Mobile Systems: HOWTOs,Softwar=
e
|=3D| http://Xtops.DE            Laptops+PDAs pre-installed with UniX
|*| This is no time for phony rhetoric -- Lou Reed
-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
