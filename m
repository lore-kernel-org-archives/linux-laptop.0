From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Dell D810 Laptop Suspend/Resume
Date: Tue, 26 Apr 2005 16:46:15 -0700 (PDT)
Message-ID: <Pine.LNX.4.61.0504261558390.13079@xena.cft.ca.us>
References: <F7DC2337C7631D4386A2DF6E8FB22B3002F682BE@hdsmsx401.amr.corp.intel.com>
 <4269B1ED.2070302@davyandbeth.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <4269B1ED.2070302@davyandbeth.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davy Durham <pubaddr2@davyandbeth.com>
Cc: "Brown, Len" <len.brown@intel.com>, linux-laptop@vger.kernel.org

On Fri, 22 Apr 2005, Davy Durham wrote:

> Why do you supose none of these are working quite right for me?
> 
> "echo 3 > /proc/acpi/sleep" and "echo mem > /sys/power/state" both show in the
> /var/log/messages
> 
> Apr 22 21:19:22 localhost kernel: Stopping tasks:
> ==========================================================================
> Apr 22 21:19:22 localhost kernel: stopping tasks failed (1 tasks remaining)
> Apr 22 21:19:22 localhost kernel: Restarting tasks...<6> Strange,
> mDNSResponder not stopped
> Apr 22 21:19:22 localhost kernel: done
> Apr 22 21:19:22 localhost gpm[4262]: *** info [mice.c(1766)]:
> Apr 22 21:19:22 localhost gpm[4262]: imps2: Auto-detected intellimouse PS/2
> Apr 22 21:19:24 localhost hald[4360]: Timed out waiting for hotplug event 732.
> Rebasing to 734

If mDNSResponder could not be stopped, likely the suspend process would 
bail out and put everything back the way it was.  Do you need this service?  
It's the server for Mac OS-X style multicast DNS when you have no real DNS 
server on the net.

> And 4 and disk don't do anything.. How can I enable this method, or any idea
> why they don't do anything?  

When resuming is attempted, before the initrd, the first thing it does is 
to translate the resume device (e.g. resume=/dev/sda2) to a major and minor 
number (e.g. 8:2), but if the device does not yet exist (i.e. the driver is 
not yet loaded), that's impossible.  Assuming that there's no resume image, 
the device number would be saved and then used when you suspend.  That's a 
safety feature ensuring that you'll be able to read the image when you try 
to resume.

Starting in kernel 2.6.11.(about 4?), there's a feature where you can set 
the device number and/or attempt to resume by "echo resume > 
/sys/power/state".  The initrd in SuSE 9.3 does this, _after_ loading the 
driver.  But after you've mounted the root filesystem, even readonly if it 
has a journal, or if you've turned on swap, you had better not do this, 
because either the resume image or the filesystem will be corrupted.

I think 2.6.12 has bug fixes which make the process more reliable, at least 
when I've messed with it.  But I have sad news: in 2.6.11.4 (SuSE 9.3 stock 
kernel), one of the drivers gets stuck during the suspend process.  And 
when I have all the drivers loaded in 2.6.12, one of them has a problem 
resuming, and hangs.  (It resumed OK with minimal drivers loaded.)  I'm 
still trying to track down which one.

> Brown, Len wrote:
> 
> > S3 is suspend to RAM (MS calls it standby, IIR)
> > S4 is suspend to disk (MS calls it hibernate)

Oops, I got the Sn numbers mixed up.  Sorry about that.

About obtaining SuSE 9.3: I feel it's worth it to have my own DVD, and to 
support the "artists", but you could download the boot floppy images and 
use those, assuming you have a floppy drive.  Then you do a network 
install.  Be prepared for a loooong wait, since the mirror sites are always 
busy.  I think on the Inspiron 6000 you're supposed to buy an inexpensive 
USB floppy drive separately.  Alternatively, SuSE generally posts ISO 
images for the CDs a month or so after the official release date, although 
now that they're owned by Novell the policy may be different.

Currently I'm having "only" two problems with 9.3: the suspend issue, and 
the Alps touchpad in my machine isn't recognized.  You have to configure it 
as a generic mouse, protocol ExplorerPS/2.  At least it can click and 
double-click by tapping.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)
