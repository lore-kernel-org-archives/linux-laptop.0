From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: RH 9 and Toshiba Satellite 2545XCDT
Date: Wed, 04 Jun 2003 13:25:34 -0700
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20030604125622.018cb200@fluent2.pyramid.net>
References: <20030604094030.A10210@helium.inexs.com>
 <20030604131623.GA24291@fede2.tumsan.fi>
 <20030604131623.GA24291@fede2.tumsan.fi>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <5.1.0.14.0.20030604191233.00ba2ad0@217.116.160.18>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

I have received a few letters from time to time about how I got Red Hat 7.3 
up and running on my Toshiba Satellite 2545XCDT laptop computer.  This is 
an older box with a 233-MHz AMD chip, and available quite inexpensively on 
eBay from time to time.

This week, I decided to dump RH 7.3 in favor of loading RH 9.  The work I 
do on my laptop in Linux is not very serious right now, and I thought that 
given the current situation the laptop would be a good playpen to get used 
to RH 9's little foibles.

After a tedious install, though, the laptop would freeze up when a PCMCIA 
card (Xircom modem/ethernet combo card) was inserted.  I also didn't have 
any sound.

So here is a very small HOWTO which may apply to other Toshiba laptops.

1)  Get into the BIOS setup program.  With the laptop turned off, hold down 
the ESC key and press the power button.  Follow the prompts (input password 
if you have one set up, then press F1 when it tells you to).  Collect as 
much information about your current motherboard configuration as you can 
from the two setup pages.  I went ahead and disabled the internal modem, as 
the Xircom mode works far better anyway.  Press END, and let the thing come up.

2)  Install RH 9 (or whatever).

3)  Run sndconfig.  Select the proper chip ("OPL3-SA2/3/x sound chip") and 
configure the options as prompted on-screen.  The default mixer settings 
make it difficult to hear the sample audio file, so turn up the gain to 
ensure you have it.

4)  Edit /etc/pcmcia/config.opts.  My file contains the following at the 
beginning of the file:

include port 0x300-0x32F
exclude port 0x380-0x3FF
include port 0xA00-0xAFF

include memory 0x000E0000-0x000EFFFF
include memory 0x60000000-0x60FFFFFF
include memory 0xA0000000-0xA0FFFFFF

exclude irq 0
exclude irq 1
exclude irq 4
exclude irq 5
exclude irq 7
exclude irq 8
exclude irq 11
exclude irq 12
exclude irq 14
exclude irq 15

You may need to fiddle with these statements to make your Satellite work 
with your specific cards.  Here, /proc/ioports is your friend -- define 
"include" statements only for ranges that "cat /proc/ioports" shows as 
open.  This works for my set of PCMCIA cards -- you may need to make 
adjustments to fit your particular cards.

All is not rosy with my RH 9 installation.  I'm trying to find out why 
there is a routing table entry for 169.254.0.0/16 on eth0.  (I suspect a 
script blew up, but I have to trace it.)  There is also an issue with slow 
IDE, and a need to compile a kernel specifically for the processor, as the 
i386 generic kernel seems to be considerably slower than the 7.3 kernel I 
ran before.

This discussion will also apply to other distributions, but I thought I'd 
give you the blow-by-blow about how I got it all to work without freezing.

Stephen Satchell

