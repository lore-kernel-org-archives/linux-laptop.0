From: Steev Klimaszewski <threeway@gmail.com>
Subject: Sony Vaio PCG-FRV27 Memory Stick Reader
Date: Mon, 14 Jun 2004 22:06:27 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <bca9c5420406141906416c0698@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org

Hello everyone, I am currently, still struggling (after 3 months or
so) to get the memory stick reader working on my Sony VAIO PCG-FRV27
under Linux.  I have tried all possible combinations of SCSI/USB to no
avail with regards to getting the machine to recognize that the memory
stick reader is there.  I am not alone (although it seems there is
only 1 other person besides myself who is trying to get it working) 
in getting it to work, and the other guy and I have been putting our
heads together along with quite a few people in #gentoo-laptop (we
both happen to run Gentoo) to figure out what is up, and can't seem to
come up with anything.

The European version (i believe) is called the fr285m, and apparently
this other person has the same problem as us (from the TCP/IP Info
Forums) - I will quote his latest post...

"Same here. I'll have another look into it when I get time but I'm
busy with other things right now and soooooo sick of people telling me
to modprobe usb-storage, etc., that I'm about ready to smash
something. Hope someone has some luck with this soon."

Windows says, it is using I/O range 03F8-03FF, and IRQ 4.  It also says,
Location: on Extended IO Bus.

In linux, these correspond to a serial port, which, I have read, not
to take/expect Linux to use the same I/O and IRQs as Windows, however,
everything else seems to be using the same as its Windows counterparts
wrt I/O and IRQs.

Osiekhan (nickname of the other fellow who uses Gentoo) has tried
adding stuff to the unusual dev file in the kernel, but so far, we
have come up empty.

http://tcpipinfo.org/frvinfo.php is a link to the information about
the laptop itself, and it appears that most people either don't care,
and go buy a USB memory card reader, or don't have any memory sticks
to use to test the memory card reader.  Personally, I don't see why I
should have to go shell out 30-100 dollars for a memory card reader
when I have one built in to the laptop, so I would prefer getting it
to run.

Any ideas are greatly appreciated.
