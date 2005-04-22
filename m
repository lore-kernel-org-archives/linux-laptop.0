From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Dell D810 Laptop Suspend/Resume
Date: Fri, 22 Apr 2005 10:08:28 -0700 (PDT)
Message-ID: <Pine.LNX.4.61.0504220842210.16416@simba.math.ucla.edu>
References: <426745B8.1090401@davyandbeth.com> <Pine.LNX.4.61.0504210943460.11184@simba.math.ucla.edu>
 <42686F9C.6090504@davyandbeth.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <42686F9C.6090504@davyandbeth.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davy Durham <pubaddr2@davyandbeth.com>
Cc: linux-laptop@vger.kernel.org

On Thu, 21 Apr 2005, Davy Durham wrote:
> Actually, I'm not sure if it's to ram or disk.. how can I tell?  Best I know,
> klaptop's right-click menu's "Suspend" option.   But I would like to know.  Is
> this running some command line app that I can run manually?

Now there's an interesting question.  On my Inspiron 6000, the power light 
blinks sexily in S4 (suspend to RAM) state, whereas the machine is 
completely powered off in suspend to disc.  Assuming you still have Windows 
on your machine, for them "suspend" means to RAM whereas "hibernate" means 
to disc.  You could see which lights remain on, if any, after you suspend 
Windows.

Klaptop may fork a command-line process or may do the mid-level signalling 
itself.  Candidates are "shutdown -z", or if "powersaved" is running, then 
you get more features if you do "powersave -U" (not -u, which is suspend to 
RAM).  Ultimately both of these will do "echo disk > /sys/power/state" to 
trigger the actual suspension.  (or echo mem, if you want to try it.)
It's "safe" to do the echo command.  Note that the UNIX clock doesn't run 
while the machine is asleep.  If I remember correctly, "powersave -U" but 
not "shutdown -z" saves the UNIX clock in the hardware clock, and reloads 
it after resuming.  

Hmm, no it is not "safe" to suspend on your system.  See below.

> Yes, ata_piix is listed in lsmod with a "Used by" of 3
> 
> What's weird though is that if I pull out the drive it has many many pins on
> it implying that it's IDE and not SATA, but I guess it could be a hardware
> layer.  

My own drive matches your description, but it's definitely doing SATA.  I 
wouldn't be surprised if all the laptop drives have a PATA connector on 
them, and both PATA and SATA capability in the firmware, but the OEM (Dell?  
Fujitsu?) can put in a jumper to use either protocol according to how the 
motherboard is wired up.  On an ICH6 or ICH6M chipset the 82801 can handle 
either protocol according to BIOS configuration, and of course the 
appropriate connectors.

> However, my friend with the same model running WinXP lists the drive
> as IDE.   Like I said, I'm using FC3 now, however the first thing I tried was
> Mandriva 2005 LE.. but it didn't even get past kernel loading in the setup
> process because of some SATA issue.  Maybe a specific kernel version problem
> there.

If the installer wasn't smart enough to load the ata_piix driver, it would 
not be able to even touch the disc.  Maybe you have to tell it what driver 
to load.  SuSE's installer needs to be told about RAID cards, for example.

> Being ignorant here of exactly how the linux's bootstraping and kernel loading
> works I do think initrd is being used.  I see both:
>    initrd /boot/initrd-2.6.12-rc2-mm3.img
> and
>    kernel /boot/vmlinuz-2.6.12-rc2-mm3 ...
> entries in /etc/grub.conf (which is being used)

Yes, that's them.  Grub stage 2 uses BIOS reading (slow) to copy both of 
those into memory.  The kernel initializes a zillion things including all 
the drivers that are hardwired.  Then as the third-to-last step, it 
decompresses the initrd, mounts it, and executes "linuxrc", which does 
whatever it does: in most cases, just loads a few key modules, but for SuSE 
the installer and the rescue system are in two big bloated initrd images.
When linuxrc exits the initrd is freed, the root filesystem is mounted, and
init is exec'd.  Then the boot scripts start running, after which you can 
do useful work.

> When would I see this "resume failed..." message?   

Just before the initrd steps, on a normal (non-resume) boot.  The message 
is kind of lame; of course it's going to fail because there's no resume 
image in the swap area, on a normal boot.  Since the messages fly by very 
fast, look in /var/log/boot.msg or /var/log/boot.omsg, after booting.  
Assuming you were able to boot.

> Well, this is a laptop here.. Um.. cdrom is /dev/hdc and 80gig HDD
> (PATA?/SATA? see above) is /dev/sda

OK, the ATAPI patches are _not_ engaged, otherwise ata_piix would have 
attached the CD as /dev/sr0.  And ata_piix _is_ talking SATA to the primary 
drive.  Without the patch it is not possible to do DMA on your CD drive, 
which precludes using the burner feature (if any).

Nasty consequence: when the kernel tries to read the resume image from your 
primary disc, it has no driver.  So it prints an error code ultimately 
meaning "no such device" and continues with normal booting, specifically 
doing the initrd.  

Pavel Machek, starting in kernel 2.6.11.something, put in a feature where 
(after loading the needed drivers)  you could set the device number of the 
swap partition, then echo resume > /sys/power/state.  In SuSE 9.3 the 
initrd finishes with this magic incantation.  In checking out SuSE 9.3 last 
night I wasn't able to get to that step, but I'm virtually certain that it 
will work well.

> Seeing that the HDD light is stuck on after resuming in 2.6.11, I think it's
> not an ATAPI issue, but the HDD's driver.  On 2.6.12 I don't know what is
> failing becauase it just immediately reboots after trying to resume..

Maybe we should be sure that it's suspending to disc, not to RAM.  The 
symptom is very reminiscent of a suspend2ram screwup.


James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)
