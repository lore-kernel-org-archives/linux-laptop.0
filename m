From: Werner Heuser <Werner.Heuser@web.de>
Subject: ANN: lanoche - laptop or notebook report generator for HTML 0.7
Date: Mon, 24 Mar 2003 13:25:29 -0100
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20030324142529.GC13220@tuxmobil.org>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-laptop@vger.kernel.org" <linux-laptop@vger.kernel.org>

Hi,

issue 0.7 of 

	lanoche - laptop or notebook hardware report in HTML

is available at http://tuxmobil.org/software.html

'lanoche' makes writing reports about Linux on different laptops a little
easier. It generates a hardware report about laptop specific features in
HTML. It is a small shell script, using programs like: `SuperProbe',
`free', `apm' and others to get hardware information.

Currently no hardware libraries are used, but you may find a short survey
of libraries and other hardware detection tools below.

The name LaNoChe is an acronym of "LAptop or NOtebook CHEck".

The program is not much sophisticated yet, but I hope it will
be a start in the right direction. A Debian/GNU Linux package
is also available at the download site an soon on the testing release.

Please note these URLs have moved from mobilix.org to tuxmobil.org because
of severe trademark trouble with Asterix and Obelix. A documentation of the
trademark case is at http://tuxmobil.org/mobilix_asterix.html

Werner

Changes:

o improved programm description
o removed the usage of SuperProbe use xviddetect instead
o use mktemp to generate temporary files
o config file moved to /etc/lanoche/, minor cleanups
o changed download URL from mobilix.org to tuxmobil.org,
  because of trademark troubles
-- 
|=| Werner Heuser = Keplerstr. 11A = D-10589 Berlin = Germany
|=| <wehe at tuxmobil.org>     T. 0049 - (0)30 - 349 53 86
|=| http://TuxMobil.org        UniX on Mobile Systems: HOWTOs,Software
|*| This is no time for phony rhetoric -- Lou Reed
