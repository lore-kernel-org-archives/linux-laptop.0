From: damon fasching <damon3937@yahoo.com>
Subject: pls help with laptop X configuration
Date: Thu, 1 Aug 2002 20:11:04 -0700 (PDT)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20020802031104.33227.qmail@web20805.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org
Cc: dpfasching@lbl.gov

Hi,

I've just installed debian on a Presario 721CL. The
installation was fine, but as usual, I am having
trouble configuring X.  The linux How-to pages claim
that this used to be a black art but is now trivial
because "there are no longer separate servers for
different kinds of cards, just modules loaded by a
common server."  That sounds great...but what is the
server?

Here is a bit about my installation.  Starting with
potato compact.  After loading the network driver from
the floppy and configuring the network stuff, I
grabbed the rest of the distribution from unstable
over the network.  (I know, I know, but if having
current versions of some software that I need, e.g.
Python means I am going to have a few hour problem
once every three years, I can live with that.)

I chose advance package selection and then grabbed
only xfree-86common, xdm and fvwm (above and beyond
whatever is preselected).  I also selected some of the
packages that were suggested by xfree-86common.  These
were fonts and a few other things.  In particular I
chose the xserver-s3 package.  I have no idea if this
is correct.  (Where can I find a table of xservers and
chipsets?)  Tech support at compaq claimed my video
chipset is via KN133.  The VIA site said about this
chip "integrated s3 graphics savage4 agp 4x blah blah
blah", hence I picked xserver-s3.

In the package configuration I chose to manage the X
server wrapper and the XFree86 3.x server config file
with debconf.

For the keyboard I chose PC104.  (I now see I should
have probably said PC101.  The compaq site says the
keyboard is 88key, 101 compatible.)  I chose xfree86
keyboard rule set.

For the mouse I chose /dev/psaux. There is a PS/2
mouse jack, which I am not using.  I actually use the
touchpad.  And I chose PS/2 as best describes my
mouse.  (This should all be ok. If I do use a mouse it
will be my simple PS/2 mouse.)

Monitor: chose LCD, 1024x768@75Hz with 24 bits per
pixel.  Again, the compaq site says the max resolution
is 1024x768 and the color depth is 24b. That was the
only resolution I allowed. That's about it.  When
setting X up in the past I've had problems with
selecting the wrong server, the wrong mouse protocol
and the wrong monitor resolution. Each of these
problems caused the server to crash, or at least to
fail.  Can someone please give me a few hints?

Basically, if someone out there is running X under
Debian Linux on a Presario 721 and is willing to send
out your config file and tell me what server you are
using...that would be great!

Thanks,
 Damon



__________________________________________________
Do You Yahoo!?
Yahoo! Health - Feel better, live better
http://health.yahoo.com
