From: Bob Toxen <bob@cavu.com>
Subject: Re: Make it fast
Date: Sun, 9 Jun 2002 02:37:35 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <200206090637.g596bZH07923@cavu.com>
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: felix.seeger@gmx.de, linux-laptop@vger.kernel.org

> Hi

> Are there any standard things that I can do to tune my linux on the laptop ?
> I have a vaio qr10.
> Everything runs nice only the battery management (I will see in 2.5 ;)) and 
> the speed. It has only 64 MB RAM and kde needs more.
> What can I do from the kernel side to make linux faster ?

Consider a less costly desktop.  My 25 BogoMips 486 24 MB laptop runs
just fine with fvwm (Slackware).  You also might turn off whatever icons,
dancing girls, and other things that you don't need.  Doing a "top" or
"ps -axlww | more" will show what is using CPU and memory.

Also, some programs, most notably X and Netscrape leak memory over time.
Thus, you will want to shut down Netscrape every day or two and probably
shut down X weekly to free up the leaked memory.

> I use always the current 2.4 kernel
> Ext2
> Xfree 4.1

> thanks
> have fun
> Felix

Best regards,

Bob Toxen, President
Fly-By-Day Consulting, Inc.           "Experts in Linux & Network Security"
Author,
"Real World Linux Security: Intrusion Detection, Prevention, and Recovery"
700 pages
Prentice Hall
November 2000
bob@verysecurelinux.com
http://www.verysecurelinux.com       [Linux/Unix & Network Security Consulting]
http://www.realworldlinuxsecurity.com [My 5* book: "Real World Linux Security"]
http://www.verysecurelinux.com/sunset.html                    [Sunset Computer]
Quality Linux, UNIX and network security and software consulting since 1990.

GPG Public key available at http://www.cavu.com/pubkey.txt (book@cavu.com)
  and at http://pgp5.ai.mit.edu/pks-commands.html#extract
  and on the CD-ROM that comes sealed and attached to Real World Linux Security
pub  1024D/E3A1C540 2000-06-21 Bob Toxen <book@cavu.com>
     Key fingerprint = 30BA AA0A 31DD B68B 47C9  601E 96D3 533D E3A1 C540
sub  2048g/03FFCCB9 2000-06-21
