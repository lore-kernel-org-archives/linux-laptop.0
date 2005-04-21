From: Davy Durham <pubaddr2@davyandbeth.com>
Subject: Dell D810 Laptop Suspend/Resume
Date: Thu, 21 Apr 2005 01:18:32 -0500
Message-ID: <426745B8.1090401@davyandbeth.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-laptop@vger.kernel.org

Hi,
   I've been trying for the last few days to get my D810 to suspend and 
resume in linux.

I'm doing it from klaptop in kde using Fedora Core 3, but I've now 
compiled my own linux-2.6.12-rc2-mm3 kernel since I've seen some ACPI 
changes going in.

At 2.6.11 it would seem to suspend ok, but when doing the resume it 
would come back and have I/O errors.. causing the computer to freeze for 
a few seconds, then run for a second, then freeze again, etc.. the HDD 
light would stay on solid, and at the tty1 I saw something like "ata1: 
command 0xc8 timeout... I/O error..."  So apparently something isn't 
getting starting back up.  Thinking it might be the HDD not spinning, I 
powered off, but DID hear it spin down.

Running what I compiled,  2.6.12-rc2-mm3, the suspend happens a little 
faster but the resume comes to a blank screen, then immediately reboots 
without any messages that I can see.

I'm very interested in getting this to work and will do whatever someone 
needs to gather information.

I may need to ask basic kernel info questions when asked to do something 
as I haven't done much trouble shooting at this low a level before but 
I'm game.  From googling around this is a problem for many and I would 
like to help resolve it.

Any ideas?

Thanks,
   Davy
