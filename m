From: Werner Heuser <Werner.Heuser@web.de>
Subject: ANN: Infrared-HOWTO 3.5
Date: Mon, 31 Mar 2003 19:14:34 -0100
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20030331201434.GG25060@tuxmobil.org>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-laptop@vger.kernel.org" <linux-laptop@vger.kernel.org>

Hi,

there is a new issue of the InfraRed-HOWTO available in different
formats:

HTML http://tuxmobil.org/howtos.html
SGML http://tuxmobil.org/howtos.html
IPK feed for PDAs http://tuxmobil.org/feed.html

Please note these URLs have moved from mobilix.org to tuxmobil.org because
of severe trademark trouble with Asterix and Obelix. A documentation of the
trademark case is at 
http://tuxmobil.org/mobilix_asterix.html

The Infrared-HOWTO provides an introduction to Linux and infrared
devices and how to use the software provided by the Linux/IrDA
project. This package uses IrDA(TM) compliant standards. IrDA(TM) is
an industrial standard for infrared wireless communication, and most
laptops made after January 1996 are equipped with an IrDA(TM)
compliant infrared transceiver. Infrared ports let you communicate
with printers, modems, fax machines, LANs, and other laptops.

Remote Control (RC) via infrared is the aim of the Linux Infrared Remote
Control - LIRC project, and also described in this HOWTO.

A note to Jean: I have not finished the re-ordering of the HOWTO according
to your recommendation yet. But I'm on the way. Also I have asked to get the
document into CVS at the Linux Documentation Project. But I haven't got an
answer yet.

Werner

Changes:

-  v3.5, 29 March 2003,
-  added new dongles to /etc/modules.conf,
-  added link to IrCOMM2k,
-  added links to LIRC progs (lircemu, tonto),
-  added some more infos about OBEX,
-  removed a misleading reference to setserial,
-  removed obsolete IrLAN stuff (irlan_client, irlan_server modules),
-  added warning about IrLAN currently unmaintainded,
-  corrected wrong issue date of v3.4,
-  changed all URLs from mobilix.org to tuxmobil.org and other URL corrections,
-  converted whole document to XML 4.1.2 
   (all tags are now lowercase, some closing tags added),
-  rearranged the order of some chapters (SIR, FIR, dongles),
-  chapter about cell phone connection rewritten 
   (added link to scmxx, added generic instructions, thanks to Matthias Schmidt),
-  added chapter about connections to PocketPC (thanks to Stanislav Sokolov), 
-  minor changes

-- 
|=| Werner Heuser = Keplerstr. 11A = D-10589 Berlin = Germany
|=| <wehe at tuxmobil.org>     T. 0049 - (0)30 - 349 53 86
|=| http://TuxMobil.org        UniX on Mobile Systems: HOWTOs,Software
|*| This is no time for phony rhetoric -- Lou Reed
