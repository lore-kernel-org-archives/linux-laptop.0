From: Davy Durham <pubaddr2@davyandbeth.com>
Subject: Re: Dell D810 Laptop Suspend/Resume
Date: Thu, 21 Apr 2005 22:29:32 -0500
Message-ID: <42686F9C.6090504@davyandbeth.com>
References: <426745B8.1090401@davyandbeth.com> <Pine.LNX.4.61.0504210943460.11184@simba.math.ucla.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0504210943460.11184@simba.math.ucla.edu>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jim Carter <jimc@math.ucla.edu>
Cc: linux-laptop@vger.kernel.org

Jim Carter wrote:

>On Thu, 21 Apr 2005, Davy Durham wrote:
>  
>
>>  I've been trying for the last few days to get my D810 to suspend and resume
>>in linux.
>>
>>At 2.6.11 it would seem to suspend ok, but when doing the resume it would come
>>back and have I/O errors.. causing the computer to freeze for a few seconds,
>>then run for a second, then freeze again, etc.. the HDD light would stay on
>>solid, and at the tty1 I saw something like "ata1: command 0xc8 timeout... I/O
>>error..."  
>>    
>>
>
>It sounds like one of your drivers has a bad interaction with suspend2disc.
>By the way, we are talking about suspend to disc, not suspend to RAM, 
>right?  I've given up on trying to make suspend2RAM work, since kernel 
>2.4.20, although Linux does the same steps for both and it ought to work
>(or fail) equally.  
>  
>
Actually, I'm not sure if it's to ram or disk.. how can I tell?  Best I 
know, klaptop's right-click menu's "Suspend" option.   But I would like 
to know.  Is this running some command line app that I can run manually?

>You mention complaints about ata1, implying that you have a SATA primary 
>disc.  Given that it's a Dell system, I'm pretty sure you have an Intel 
>chipset of one level or another, so you're using the module ata_piix and 
>its scsi friends, which are loaded in an initrd, unless you've hardwired 
>them into your kernel.  Now we get into branches:
>
>  
>
Yes, ata_piix is listed in lsmod with a "Used by" of 3

What's weird though is that if I pull out the drive it has many many 
pins on it implying that it's IDE and not SATA, but I guess it could be 
a hardware layer.  However, my friend with the same model running WinXP 
lists the drive as IDE.   Like I said, I'm using FC3 now, however the 
first thing I tried was Mandriva 2005 LE.. but it didn't even get past 
kernel loading in the setup process because of some SATA issue.  Maybe a 
specific kernel version problem there.

>A.  If you use an initrd, then you should see a message "resume failed..." 
>before the initrd runs.  In SuSE 9.3, which is just out and which uses 
>kernel 2.6.11.4-rc(something), possibly with advance SuSE hacks, their 
>initrd loads the drivers (ata_piix etc) needed to read the suspend image, 
>then does the magic incantation (which I'm not going to recite from memory 
>and mess someone up if I make a mistake), and resume then works.  To debug 
>this, purge the initrd of all drivers except ata_piix and its dependencies, 
>and your ext3 or Reiser module if used (if not already done).  Boot with 
>the -b switch so no init scripts are run and no drivers are loaded by them.  
>Mount -t sysfs sysfs /sys; then echo disk > /sys/power/state (to suspend).  
>See if you can resume in this configuration with the absolute minimum of 
>drivers.  If so, load your usual drivers manually, one by one, until you 
>find the culprit.  It's OK to load drivers off a readonly filesystem.
>
>  
>
Being ignorant here of exactly how the linux's bootstraping and kernel 
loading works I do think initrd is being used.  I see both:
    initrd /boot/initrd-2.6.12-rc2-mm3.img
and
    kernel /boot/vmlinuz-2.6.12-rc2-mm3 ...
entries in /etc/grub.conf (which is being used)

When would I see this "resume failed..." message?   Right after hitting 
the power button after a suspend, or when it boots up the next time 
after a failed resume?  I didn't notice one at the former (all happens 
too fast.. all I can see is a blip of a blinking cursor in text mode) 
and don't see one anywhere near the beginning process of the latter.

>B.  If drivers are hardwired in your kernel, adapt the above instructions 
>but don't hardwire any drivers except ata_piix and friends, and the 
>filesystem driver if needed.
>
>Given the symptoms, most likely it will still fail.  Did you make the patch 
>that lets you do DMA on your PATA ATAPI device (CD drive)?  Those are 
>"experimental", i.e. not officially released by Jeff Garzik.  On kernel 
>2.6.12-rc1 I had no problems suspending with PATA ATAPI engaged, but with 
>my chipset, ata_piix died horribly at initialization on 2.6.8 (didn't even 
>get to trying suspend).  To see what your distro gave you, look at 
>/usr/src/linux/include/linux/libata.h; search for ATA_ENABLE_ATAPI and 
>ATA_ENABLE_PATA and see if they're defined.  In SuSE 9.3 (kernel 
>2.6.11.4-rc(something)) these are turned on.  See here:
>    http://www.math.ucla.edu/~jimc/insp6000/ata_piix-2.6.12-rc1.txt
>for a patch to the code that recognizes "combined mode" on the ICH-6M 
>chipset for my laptop; probably irrelevant for a desktop system.
>
>  
>
Well, this is a laptop here.. Um.. cdrom is /dev/hdc and 80gig HDD 
(PATA?/SATA? see above) is /dev/sda

I'm building my own kernel from source, although I'm taking the settings 
from the config that came with FC3

Seeing that the HDD light is stuck on after resuming in 2.6.11, I think 
it's not an ATAPI issue, but the HDD's driver.  On 2.6.12 I don't know 
what is failing becauase it just immediately reboots after trying to 
resume..

>Alternatively, do you have a proprietary graphics driver: nVidia or fglrx 
>(for ATI Radeon)?  Fglrx-8.12.10 on kernel 2.6.8 gave symptoms very 
>similar to yours when I tried to resume, and if I remember right, the 
>nVidia driver is not much better.  
>
>  
>
Nope, only what it built in. for ATI Radeon

Please advise...

Thanks,
   Davy
