From: Werner Heuser <Werner.Heuser@web.de>
Subject: ANN: Synaptics touchpad driver 0.11.3
Date: Wed, 28 Aug 2002 07:25:37 -0100
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20020828082537.GD5954@mobilix.org>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-laptop@vger.kernel.org" <linux-laptop@vger.kernel.org>

Hi,

a new issue of the XFree86 4.x driver for the 
Synaptics touchpad is available at 
http://mobilix.org/software.html
The driver is programmed by Stefan Gmeiner.

Werner

Changes:
Works with the two-dimensional scroll wheel.

Features

- Movement with adjustable, non-linear acceleration 
  and speed (Options: MinSpeed, MaxSpeed, AccelFactor)
- Button events through short touching of the 
  touchpad (Options: MaxTapTime, MaxTapMove)
- Double-Button events through double short 
  touching of the touchpad 
- Dragging through short touching and holding down the 
  finger on the touchpad
- Middle and right button events on the upper and lower 
  corner of the touchpad (Option: Edges)
- Scrolling (button four and five events) through moving 
  the finger on the right side of the touchpad 
  (Options: Edges, VertScrollDelta)
- The up/down button sends button four/five events
- Adjustable finger detection (Option: Finger)
- Ext Mouse repeater support - Alpha! (Option: Repeater)
- Multifinger taps: two finger for middle button and three 
  finger for right button events
- Online configuration through short-memory (in development) 
  (Option: SHMConfig)

It works with this machines and probably other 
laptops (please let me know your results).

- Acer TravelMate 210TEV
- Acer TravelMate 630
- Acer TravelMate 739TL
- COMPAQ EVO N160
- COMPAQ Presario 1213EA
- DELL Inspiron 2500
- DELL Inspiron 8000
- DELL Latitude C800
- Gateway Solo 9300
- Gericom M6T
- Gericom Webboy
- HP Omnibook XE3 500
- Medion MD9580-F - Aldi (Nord)
- Samsung GT8800DXV
-- 
|=| Werner Heuser = Keplerstr. 11A = D-10589 Berlin = Germany
|=| <wehe_AT_mobilix.org>      T. 0049 - (0)30 - 349 53 86
|=| http://MobiliX.org         UniX on Mobile Systems: HOWTOs,Software
|=| http://Xtops.DE            Laptops+PDAs pre-installed with UniX
|*| This is no time for phony rhetoric -- Lou Reed
