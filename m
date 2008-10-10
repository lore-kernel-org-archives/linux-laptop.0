From: Emanoil Kotsev <deloptes@yahoo.com>
Subject: kernel strange behaviour
Date: Fri, 10 Oct 2008 02:42:47 -0700 (PDT)
Message-ID: <788629.6861.qm@web53202.mail.re2.yahoo.com>
Reply-To: deloptes@yahoo.com
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org


Hello, I'm new here, please be patient and correct me if I'm at the wrong place.

I have following problm.
I've recently installed a debian prebuild kernel 2.6.26.5 on my DELL D520 (Centrino Duo Core 2 with 2GB RAM).
Before I was using 2.6.26 booting from usb drive, but I was missing the ata support for my internal drive that's why I had to update.
After I installed the new kernel I'm not able to watch tv and compile in the same time or record tv and watch in the same time. I'm even not able to just record tv. tv is coming from a usb-stick, but it's irelevant, because if I run a compiler the system slows down (CPU load gets above 5).
The system is getting very slow after just few minutes. I then break the process but it takes about 15min for the system to sattle down again.

I've then downloaded 2.6.26.2 and 2.6.26.5 took the .config from the debian kernel and compiled - the same result. I noticed that the SATA drivers are compiled as modules, so I took the pure 2.6.26 compiled the SATA into the kernel and now it works fine or at least much better.

I'm going to test it with 2.6.26.5.

It would be nice if someone could give definite answer of what is the reason for this behaviour.

thank you in advance and kind regards



I then 


      
