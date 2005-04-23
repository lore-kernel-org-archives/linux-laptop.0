From: Davy Durham <pubaddr2@davyandbeth.com>
Subject: Re: Dell D810 Laptop Suspend/Resume
Date: Fri, 22 Apr 2005 21:17:21 -0500
Message-ID: <4269B031.60804@davyandbeth.com>
References: <426745B8.1090401@davyandbeth.com> <Pine.LNX.4.61.0504210943460.11184@simba.math.ucla.edu> <42686F9C.6090504@davyandbeth.com> <Pine.LNX.4.61.0504220842210.16416@simba.math.ucla.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0504220842210.16416@simba.math.ucla.edu>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jim Carter <jimc@math.ucla.edu>
Cc: linux-laptop@vger.kernel.org

Jim Carter wrote:

>On Thu, 21 Apr 2005, Davy Durham wrote:
>  
>
>>Actually, I'm not sure if it's to ram or disk.. how can I tell?  Best I know,
>>klaptop's right-click menu's "Suspend" option.   But I would like to know.  Is
>>this running some command line app that I can run manually?
>>    
>>
>
>Now there's an interesting question.  On my Inspiron 6000, the power light 
>blinks sexily in S4 (suspend to RAM) state, whereas the machine is 
>completely powered off in suspend to disc.  Assuming you still have Windows 
>on your machine, for them "suspend" means to RAM whereas "hibernate" means 
>to disc.  You could see which lights remain on, if any, after you suspend 
>Windows.
>
>  
>
My power light is fading in and out on the suspended state.. so I guess 
it's to ram.  Plus, the suspend process is a matter of 5 or 6 seconds 
and not much disk activity.

>Klaptop may fork a command-line process or may do the mid-level signalling 
>itself.  Candidates are "shutdown -z", or if "powersaved" is running, then 
>you get more features if you do "powersave -U" (not -u, which is suspend to 
>RAM).  Ultimately both of these will do "echo disk > /sys/power/state" to 
>trigger the actual suspension.  (or echo mem, if you want to try it.)
>It's "safe" to do the echo command.  Note that the UNIX clock doesn't run 
>while the machine is asleep.  If I remember correctly, "powersave -U" but 
>not "shutdown -z" saves the UNIX clock in the hardware clock, and reloads 
>it after resuming.  
>
>  
>
Well, the echo didn't work for me so I gave up in that area.  powersaved 
is not running, and shutdown -z gives usage (as if -z isn't a valid flag)

>>Being ignorant here of exactly how the linux's bootstraping and kernel loading
>>works I do think initrd is being used.  I see both:
>>   initrd /boot/initrd-2.6.12-rc2-mm3.img
>>and
>>   kernel /boot/vmlinuz-2.6.12-rc2-mm3 ...
>>entries in /etc/grub.conf (which is being used)
>>    
>>
>
>Yes, that's them.  Grub stage 2 uses BIOS reading (slow) to copy both of 
>those into memory.  The kernel initializes a zillion things including all 
>the drivers that are hardwired.  Then as the third-to-last step, it 
>decompresses the initrd, mounts it, and executes "linuxrc", which does 
>whatever it does: in most cases, just loads a few key modules, but for SuSE 
>the installer and the rescue system are in two big bloated initrd images.
>When linuxrc exits the initrd is freed, the root filesystem is mounted, and
>init is exec'd.  Then the boot scripts start running, after which you can 
>do useful work.
>
>  
>
nice to know.. thanks.. and I'd switch to lilo, but can't figure out how 
to do that easily in FC3 (I'm brand new to redhat.. used mdk for years tho)

>>When would I see this "resume failed..." message?   
>>    
>>
>
>Just before the initrd steps, on a normal (non-resume) boot.  The message 
>is kind of lame; of course it's going to fail because there's no resume 
>image in the swap area, on a normal boot.  Since the messages fly by very 
>fast, look in /var/log/boot.msg or /var/log/boot.omsg, after booting.  
>Assuming you were able to boot.
>
>  
>
I do not see this in log or at startup. oh well

>>Well, this is a laptop here.. Um.. cdrom is /dev/hdc and 80gig HDD
>>(PATA?/SATA? see above) is /dev/sda
>>    
>>
>
>OK, the ATAPI patches are _not_ engaged, otherwise ata_piix would have 
>attached the CD as /dev/sr0.  And ata_piix _is_ talking SATA to the primary 
>drive.  Without the patch it is not possible to do DMA on your CD drive, 
>which precludes using the burner feature (if any).
>
>  
>
That's okay, I'm not trying to fry that fish right now.

>Nasty consequence: when the kernel tries to read the resume image from your 
>primary disc, it has no driver.  So it prints an error code ultimately 
>meaning "no such device" and continues with normal booting, specifically 
>doing the initrd.  
>
>  
>
Apparently not doing suspend-to-disk right now I guess this is moot.. 
but I'm going to try hibernate instead to see if there's any difference.

>Pavel Machek, starting in kernel 2.6.11.something, put in a feature where 
>(after loading the needed drivers)  you could set the device number of the 
>swap partition, then echo resume > /sys/power/state.  In SuSE 9.3 the 
>initrd finishes with this magic incantation.  In checking out SuSE 9.3 last 
>night I wasn't able to get to that step, but I'm virtually certain that it 
>will work well.
>
>  
>
I wish I could figure out where to get SuSE 9.3 without forking out 
$100.. I might be willing to if I knew 9.3 would work for me.  I guess I 
could try the live disc, but dunno if the boxed set would work even if 
the live disc did.  FTP installs are fine for me with 4Mx2M internet 
connection.

>>Seeing that the HDD light is stuck on after resuming in 2.6.11, I think it's
>>not an ATAPI issue, but the HDD's driver.  On 2.6.12 I don't know what is
>>failing becauase it just immediately reboots after trying to resume..
>>    
>>
>
>Maybe we should be sure that it's suspending to disc, not to RAM.  The 
>symptom is very reminiscent of a suspend2ram screwup.
>
>  
>
It's not.. so I'm about to try that.

Also, I'm getting a few other replies talking about a guy working on the 
SATA driver's support for that as we speak.. I plan to get in touch with 
him too.

Thanks,
  Davy
