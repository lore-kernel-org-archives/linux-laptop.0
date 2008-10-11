From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: kernel strange behaviour
Date: Fri, 10 Oct 2008 23:03:06 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0810102213090.29500@xena.cft.ca.us>
References: <788629.6861.qm@web53202.mail.re2.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <788629.6861.qm@web53202.mail.re2.yahoo.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emanoil Kotsev <deloptes@yahoo.com>
Cc: linux-laptop@vger.kernel.org

On Fri, 10 Oct 2008, Emanoil Kotsev wrote:

> I've recently installed a debian prebuild kernel 2.6.26.5 on my DELL D520 
> (Centrino Duo Core 2 with 2GB RAM). Before I was using 2.6.26 booting 
> from usb drive, but I was missing the ata support for my internal drive 
> that's why I had to update. After I installed the new kernel I'm not able 
> to watch tv and compile in the same time or record tv and watch in the 
> same time. I'm even not able to just record tv....

That's strange.  I have a Dell Inspiron 6400, which is basically the same 
machine but I think older: CPU is an Intel Core 2 Duo T5600 @ 1.83GHz, and 
it has 1Gb RAM.  As I'm writing this I am watching HDTV (looks like MPEG2 
containing mpgv video and a52 audio) captured by a HDHomeRun tuner 
( http://www.silicondust.com/ ) and played by VLC 
( http://www.videolan.org/vlc/ ) using the XVideo rendering interface.
At the same time I'm compiling a source package.  Here's what the "top" 
command shows me:

top - 22:07:39 up  5:47,  4 users,  load average: 1.57, 0.94, 0.53
Cpu0  : 74.5%us,  6.0%sy,  0.0%ni, 11.3%id,  1.3%wa,  2.6%hi,  4.3%si,  0.0%st
Cpu1  :  1.6%us,  1.0%sy,  0.0%ni, 97.1%id,  0.0%wa,  0.0%hi,  0.2%si,  0.0%st
Mem:   1034772k total,   863240k used,   171532k free,    46620k buffers
Swap:  2104472k total,        0k used,  2104472k free,   443000k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND           
20276 jimc      25   0 66960  37m  21m S   57  3.7   3:33.02 vlc                
25830 root      25   0 16944  13m 4068 R   13  1.4   0:00.40 cc1                
 3094 root      15   0  111m  75m  48m S   10  7.5   4:41.71 X                  
(etc.)

So I'm using most (not all) of one core and the other is almost unused.  

In another trial a few months ago I tried an old 1.0 GHz Pentium III 
"Coppermine" with an analog TV tuner, and it could just barely compress 
(record) the video and play it back at the same time -- not satisfactory 
for a production solution but interesting as a demo.  So applying to your 
case I can't figure why your machine is so overloaded.  

You aren't doing a parallel "make", are you?  With only 2 cores and a 
commitment to TV processing, parallel "make" would only make trouble.

Suggestion: use "top" to find out what is hogging your CPU.  Sometimes you 
will find processes that count in the load average but which aren't really 
using much CPU.  The symptoms suggest thrashing (too much continuously 
moving pages between swap and main RAM) -- look at how much swap is being 
used, zero in my case.  The resident set (column headed RES) is the 
important figure for memory use, when thrashing is suspected.  

I'm surprised that your distro's kernel was unsatisfactory.  In the usual 
case that the disc driver (ata_piix in my case) is not hardwired in the 
kernel, you can use an initrd to preload it, and most distros will take 
care of building the initrd automatically and telling GRUB (the booter) to 
read it.  I assume standard Debian does so, though I've never run Debian on 
an Intel box, only ARM handhelds.  (I use OpenSuSE 10.3.)  It's possible 
but unlikely that you made a bad choice when configuring your custom 
kernel.  For example, if SMP (multiple processors) were turned off, that 
would not help at all.

I hope some of this helps!

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)
