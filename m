From: "Virgil" <yyz001@euroseek.com>
Subject: Kernel problems with HP ze4145
Date: Thu, 24 Apr 2003 20:56:39 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <web-3290494@euroseek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; 
To: linux-laptop@vger.kernel.org

Hello,

This particular laptop has an Athlon XP1800 mobile 
processor with an ALI USB 1.1 controller. It uses a 
synaptics PS/2 touchpad. In the following I'll try to best 
describe the problem I have.

Kernel versions covered: 2.4.19 - 2.4.21pre6 patched with 
acpi-patch. Distribution: none (LFS 4.0)

1) I compiled the kernel with usb support built-in (not as 
modules). Upon booting and entering the login prompt, the 
keyboard is blocked (i.e. I can't write anything with it). 
If I press the power button, the computer enters runlevel 
6 (so it is not frozen) and powers off.

2) Recompile the kernel with usb as modules (usbcore and 
usb-ohci) and do a script in /etc/rc.d/init.d/ to load the 
modules at boot time. Symptoms stay as above.

3) Remove the script from /etc/rc.d/rc3.d (e.g.). Boot. 
Login as root. The keyboard works (yee!). Do cat 
/dev/mouse. Keyboard no longer works (all three LEDs light 
up). Reboot.

4) Do step 3 above but don't cat the mouse anymore. 
Instead do modprobe usbcore and modprobe usb-ohci. The 
keyboard is NOT blocked. Do cat /dev/mouse. The mouse 
works (yee). Do mount -t usbdevfs none /proc/bus/usb. The 
USB filesystem is initialised and the USB works 
beautifully (tested with a digital camera and a scanner).

So, does any1 have a similar problem and a real solution 
on this thing? Do I do something wrong? Is this a kernel 
bug?

Virgil
-------------------------------------------------
Search for pictures with Euroseek Image Search
http://euroseek.com/image_search/

Euroseek Translation
http://www.euroseek.com/translator/


