From: "ice`" <icestorm@ngi.it>
Subject: Linux stops my F10 (or others) keys to work at boot
Date: Sat, 14 Apr 2007 14:39:10 +0200
Message-ID: <C12A1DBF6F3D471FA4FD1948D5D6604C@LaptopHP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-laptop@vger.kernel.org

Hi,
don't know if this is the right list to ask and if this problem is related 
to the Kernel i'm using (2.6.18), to my Distribution (Debian etch) or to 
something else...

I will try to explain it at best:

I have an HP NX7400 Laptop with Latest bios.
On boot it's possible to press F10 to enter BIOS settings (or F9 for example 
to choose boot sequence).

I started having problem when I noticed that pressing F10 (or F9) on boot 
wasn't working anymore...the laptop didn't get it and I wasn't able to 
access BIOS...

so I investigate the issue and re-flashed laptop BIOS and discovered that 
then it was working...but after playing in my Debian system it stopped 
working again...

so I re-flashed it again and did some tests and discovered that:

- if I boot into Windows (Vista) and reboot the keys are still working at 
boot and I can press F10 (or F9) to access BIOS settings (or choose boot 
sequence)
- if I boot into Linux (Debian etch 4.0) once, I won't be able to use F10 
(F9) again on next reboot

who can be the culprit? What do you think?
Could it be a kernel issue when reading the laptop BIOS, creating some 
problems in it? A re-flash of the bios (restoring original settings) make it 
work again.
I didn't test it against other distributions like FC6 which I have installed 
in my laptop, with newer kernels, but I will try it later, to understand 
better the issue.

Thanks to anyone that can help. 

