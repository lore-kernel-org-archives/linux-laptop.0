From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Dell D810 Laptop Suspend/Resume
Date: Thu, 21 Apr 2005 10:33:35 -0700 (PDT)
Message-ID: <Pine.LNX.4.61.0504210943460.11184@simba.math.ucla.edu>
References: <426745B8.1090401@davyandbeth.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <426745B8.1090401@davyandbeth.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davy Durham <pubaddr2@davyandbeth.com>
Cc: linux-laptop@vger.kernel.org

On Thu, 21 Apr 2005, Davy Durham wrote:
>   I've been trying for the last few days to get my D810 to suspend and resume
> in linux.
> 
> At 2.6.11 it would seem to suspend ok, but when doing the resume it would come
> back and have I/O errors.. causing the computer to freeze for a few seconds,
> then run for a second, then freeze again, etc.. the HDD light would stay on
> solid, and at the tty1 I saw something like "ata1: command 0xc8 timeout... I/O
> error..."  

It sounds like one of your drivers has a bad interaction with suspend2disc.
By the way, we are talking about suspend to disc, not suspend to RAM, 
right?  I've given up on trying to make suspend2RAM work, since kernel 
2.4.20, although Linux does the same steps for both and it ought to work
(or fail) equally.  

You mention complaints about ata1, implying that you have a SATA primary 
disc.  Given that it's a Dell system, I'm pretty sure you have an Intel 
chipset of one level or another, so you're using the module ata_piix and 
its scsi friends, which are loaded in an initrd, unless you've hardwired 
them into your kernel.  Now we get into branches:

A.  If you use an initrd, then you should see a message "resume failed..." 
before the initrd runs.  In SuSE 9.3, which is just out and which uses 
kernel 2.6.11.4-rc(something), possibly with advance SuSE hacks, their 
initrd loads the drivers (ata_piix etc) needed to read the suspend image, 
then does the magic incantation (which I'm not going to recite from memory 
and mess someone up if I make a mistake), and resume then works.  To debug 
this, purge the initrd of all drivers except ata_piix and its dependencies, 
and your ext3 or Reiser module if used (if not already done).  Boot with 
the -b switch so no init scripts are run and no drivers are loaded by them.  
Mount -t sysfs sysfs /sys; then echo disk > /sys/power/state (to suspend).  
See if you can resume in this configuration with the absolute minimum of 
drivers.  If so, load your usual drivers manually, one by one, until you 
find the culprit.  It's OK to load drivers off a readonly filesystem.

B.  If drivers are hardwired in your kernel, adapt the above instructions 
but don't hardwire any drivers except ata_piix and friends, and the 
filesystem driver if needed.

Given the symptoms, most likely it will still fail.  Did you make the patch 
that lets you do DMA on your PATA ATAPI device (CD drive)?  Those are 
"experimental", i.e. not officially released by Jeff Garzik.  On kernel 
2.6.12-rc1 I had no problems suspending with PATA ATAPI engaged, but with 
my chipset, ata_piix died horribly at initialization on 2.6.8 (didn't even 
get to trying suspend).  To see what your distro gave you, look at 
/usr/src/linux/include/linux/libata.h; search for ATA_ENABLE_ATAPI and 
ATA_ENABLE_PATA and see if they're defined.  In SuSE 9.3 (kernel 
2.6.11.4-rc(something)) these are turned on.  See here:
    http://www.math.ucla.edu/~jimc/insp6000/ata_piix-2.6.12-rc1.txt
for a patch to the code that recognizes "combined mode" on the ICH-6M 
chipset for my laptop; probably irrelevant for a desktop system.

Alternatively, do you have a proprietary graphics driver: nVidia or fglrx 
(for ATI Radeon)?  Fglrx-8.12.10 on kernel 2.6.8 gave symptoms very 
similar to yours when I tried to resume, and if I remember right, the 
nVidia driver is not much better.  

On a successful resume on kernel 2.6.8, with my particular gaggle of 
drivers, I have a 30 second timeout during reinitialization and I wasn't 
able to track it down to a specific driver.  In testing SuSE 9.3 I haven't 
gotten far enough to see whether the timeout is still there.  It's annoying 
but harmless (I hope).

I hope some of this helps!

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)
