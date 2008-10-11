From: Emanoil Kotsev <deloptes@yahoo.com>
Subject: Re: kernel strange behaviour
Date: Sat, 11 Oct 2008 03:06:45 -0700 (PDT)
Message-ID: <616547.15762.qm@web53205.mail.re2.yahoo.com>
Reply-To: deloptes@yahoo.com
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Carter <jimc@math.ucla.edu>
Cc: linux-laptop@vger.kernel.org

Hello Jim,

thank you for your reply here my comments and findings


--- On Sat, 10/11/08, Jim Carter <jimc@math.ucla.edu> wrote:

> 
> > I've recently installed a debian prebuild kernel
> 2.6.26.5 on my DELL D520 
> > (Centrino Duo Core 2 with 2GB RAM). Before I was using
> 2.6.26 booting 
> > from usb drive, but I was missing the ata support for
> my internal drive 
> > that's why I had to update. After I installed the
> new kernel I'm not able 
> > to watch tv and compile in the same time or record tv
> and watch in the 
> > same time. I'm even not able to just record tv....
> 
> That's strange.  I have a Dell Inspiron 6400, which is
> basically the same 
> machine but I think older: CPU is an Intel Core 2 Duo T5600
> @ 1.83GHz, and 

My one is T7200 / Core 2 Due / 2GB RAM

> it has 1Gb RAM.  As I'm writing this I am watching HDTV
> (looks like MPEG2 
> containing mpgv video and a52 audio) captured by a
> HDHomeRun tuner 
> ( http://www.silicondust.com/ ) and played by VLC 
> ( http://www.videolan.org/vlc/ ) using the XVideo rendering
> interface.
> At the same time I'm compiling a source package. 

In fact with the 2.6.26 version everything works fine. Did you use the kernel DVB drivers and what kind of card do you have? My one is Hauppauge HVR-900 with em28xx(_dvb)

I'm using mplayer and mencoder to do the job. The odd thing is that after I upgraded to 2.6.26.5 ( I patched the 2.6.26 kernel ) it stopped working.
Another thing I'm observing now is that if I compile SATA into the kernel it works more smoothly.
Does your machine has SATA - may be it has something to do with DMA or IRQ or I don't know what - I'm not so good in hardware

> Here's what the "top" 
> command shows me:
> 
> top - 22:07:39 up  5:47,  4 users,  load average: 1.57,
> 0.94, 0.53
> Cpu0  : 74.5%us,  6.0%sy,  0.0%ni, 11.3%id,  1.3%wa, 
> 2.6%hi,  4.3%si,  0.0%st
> Cpu1  :  1.6%us,  1.0%sy,  0.0%ni, 97.1%id,  0.0%wa, 
> 0.0%hi,  0.2%si,  0.0%st
> Mem:   1034772k total,   863240k used,   171532k free,   
> 46620k buffers
> Swap:  2104472k total,        0k used,  2104472k free,  
> 443000k cached
> 
>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+
>  COMMAND           
> 20276 jimc      25   0 66960  37m  21m S   57  3.7  
> 3:33.02 vlc                
> 25830 root      25   0 16944  13m 4068 R   13  1.4  
> 0:00.40 cc1                
>  3094 root      15   0  111m  75m  48m S   10  7.5  
> 4:41.71 X                  
> (etc.)

I have had a look at top (I have about 9-10 year linux experience, so I know how to basically track things down) but couldn't figure out why it's slowing down.

> 
> So I'm using most (not all) of one core and the other
> is almost unused.  
> 
> In another trial a few months ago I tried an old 1.0 GHz
> Pentium III 
> "Coppermine" with an analog TV tuner, and it
> could just barely compress 
> (record) the video and play it back at the same time -- not
> satisfactory 
> for a production solution but interesting as a demo.  So
> applying to your 
> case I can't figure why your machine is so overloaded. 

I had a feeling that the machine switched to Pentium I :-)

> 
> 
> You aren't doing a parallel "make", are you? 

What is parallel make? I tried to compile the kernel. I even tried to compile the kernel without watching tv and in about 10minutes everything was so slow that I couldn't scroll the console.

> With only 2 cores and a 
> commitment to TV processing, parallel "make"
> would only make trouble.
> 
> Suggestion: use "top" to find out what is hogging
> your CPU.  Sometimes you 
> will find processes that count in the load average but
> which aren't really 
> using much CPU.  The symptoms suggest thrashing (too much
> continuously 
> moving pages between swap and main RAM) -- look at how much
> swap is being 
> used, zero in my case.  The resident set (column headed
> RES) is the 
> important figure for memory use, when thrashing is
> suspected.  

thanks I don't understand most of this but I too have a suspission that there is some memory stuff going on as the CPU meter shows 1000Hz most the time and top does not indicate that some program is using that much CPU except gcc which would use as much from the band wide as possible.

In my case swap is also 0 used and I even have  about 1GB RAM free

> 
> I'm surprised that your distro's kernel was
> unsatisfactory.  In the usual 
> case that the disc driver (ata_piix in my case) is not
> hardwired in the 
> kernel, you can use an initrd to preload it, and most
> distros will take 
> care of building the initrd automatically and telling GRUB
> (the booter) to 
> read it.  I assume standard Debian does so, though I've
> never run Debian on 
> an Intel box, only ARM handhelds.  (I use OpenSuSE 10.3.) 
> It's possible 
> but unlikely that you made a bad choice when configuring
> your custom 
> kernel.  For example, if SMP (multiple processors) were
> turned off, that 
> would not help at all.

Well, I recompiled the kernel after I figured out that I have the problem in fact I played about a week with it to findi out that if I compile ata_piix into the kernel things get better. But not much better with 2.6.26.5. I am using initrd my root and data partitions are encrypted. Debian kernel also uses initrd. In fact the debian kernel performs better than the one compiled by me and what is really odd I took the .config from the debian one, didn't change anything and build the same version 2.6.26.5
When I start xmms (mp3 player) it plays few seconds than stops then plays further ...
Crazy thing.

here are the results of top without compiling - just recording and playing

top - 11:29:50 up 16 min,  1 user,  load average: 2.40, 1.96, 1.28
Tasks: 166 total,   1 running, 165 sleeping,   0 stopped,   0 zombie
Cpu(s): 66.4%us, 13.8%sy,  0.0%ni, 19.6%id,  0.2%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   2066920k total,   714280k used,  1352640k free,    17576k buffers
Swap:  1469908k total,        0k used,  1469908k free,   346852k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
 5737 emanoil   20   0 66732  15m 5872 S   84  0.8   5:11.91 mencoder
 6019 emanoil   20   0 61256  26m  15m S   10  1.3   0:03.56 gmplayer
 4154 root      20   0  312m  47m 5816 S    5  2.3   0:34.02 Xorg
 5251 emanoil   20   0 33688  15m  11m S    2  0.8   0:07.16 konsole
 5213 emanoil   20   0 22100 7148 5328 S    1  0.3   0:03.00 artsd
 1345 root      15  -5     0    0    0 S    1  0.0   0:01.28 kcryptd
 5183 emanoil   20   0 31676  11m 9200 S    1  0.6   0:00.94 kwin
 5812 emanoil   20   0  2436 1152  852 R    1  0.1   0:00.68 top
    1 root      20   0  1808  832  608 S    0  0.0   0:01.18 init
------------------

This is with compiling the kernel after about 5minutes

top - 11:40:15 up 26 min,  1 user,  load average: 5.45, 4.21, 2.73
Tasks: 175 total,   3 running, 172 sleeping,   0 stopped,   0 zombie
Cpu(s): 91.1%us,  7.9%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.9%hi,  0.1%si,  0.0%st
Mem:   2066920k total,   904816k used,  1162104k free,    42548k buffers
Swap:  1469908k total,        0k used,  1469908k free,   480544k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
 5737 emanoil   20   0 66628  15m 5872 S   82  0.8  13:18.44 mencoder
 6019 emanoil   20   0 64072  29m  15m R   46  1.5   1:45.38 gmplayer
15287 emanoil   20   0 14200 8800 2172 R   29  0.4   0:01.68 cc1
 4154 root      20   0  312m  47m 5816 S   17  2.4   1:16.74 Xorg
 5265 emanoil   20   0 69252  36m  11m S    5  1.8   0:13.61 skype
 5251 emanoil   20   0 36820  18m  11m S    4  0.9   0:18.92 konsole
15270 emanoil   20   0  2440 1160  852 R    3  0.1   0:00.92 top
 1345 root      15  -5     0    0    0 S    2  0.0   0:04.96 kcryptd
 4501 haldaemo  20   0  6364 4348 3564 S    2  0.2   0:01.12 hald
 5483 emanoil   20   0 34344  14m  11m S    2  0.7   0:03.50 konsole
   49 root      15  -5     0    0    0 S    1  0.0   0:00.16 kblockd/0
  142 root      15  -5     0    0    0 S    1  0.0   0:00.86 ata/0
 2581 root      18  -2  1740  472  396 S    1  0.0   0:01.06 ifplugd
 4008 syslog    20   0  1936  644  512 S    1  0.0   0:00.32 syslogd
 4061 root      20   0  1872  536  444 S    1  0.0   0:01.38 dd
 4487 root      20   0  2020  768  668 S    1  0.0   0:00.06 dhcdbd
 4649 root      20   0  3420 1144  988 S    1  0.1   0:00.56 hald-addon-stor
 5213 emanoil   20   0 21992 7040 5220 S    1  0.3   0:03.62 artsd
 5217 emanoil   20   0 24528  10m 9056 S    1  0.5   0:01.08 kcpuload
 5245 emanoil   20   0 47172  12m  10m S    1  0.6   0:00.81 skim
 5287 emanoil   20   0 36476  10m 7336 S    1  0.5   0:00.16 knotify
15289 root      20   0  1772  500  424 S    1  0.0   0:00.02 hal-system-kill
 5463 emanoil   20   0  144m  43m  22m S    0  2.2   0:11.37 firefox-bin
    1 root      20   0  1808  832  608 S    0  0.0   0:01.18 init

-------------------

This is with 2.6.26 (not 2.6.26.5) compiling recording and watching

top - 12:03:21 up 15 min,  1 user,  load average: 4.29, 3.41, 1.82
Tasks: 173 total,   3 running, 170 sleeping,   0 stopped,   0 zombie
Cpu(s): 94.7%us,  4.7%sy,  0.0%ni,  0.7%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   2066748k total,   785604k used,  1281144k free,    27836k buffers
Swap:  1469908k total,        0k used,  1469908k free,   377500k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
 6962 emanoil   20   0 68264  16m 5880 S   93  0.8   8:33.07 mencoder
 6992 emanoil   20   0 61592  26m  15m S   14  1.3   1:43.88 gmplayer
 5461 root      20   0  317m  52m 5708 S    6  2.6   0:51.16 Xorg
13594 emanoil   20   0 12996 6928 2156 R    3  0.3   0:00.10 cc1
 6624 emanoil   20   0 35968  16m  11m S    2  0.8   0:16.95 konsole
 2221 root      15  -5     0    0    0 S    1  0.0   0:03.49 kcryptd
 6489 emanoil   20   0 67252  34m  11m S    1  1.7   0:12.17 skype
 5802 haldaemo  20   0  6504 4392 3568 S    0  0.2   0:01.05 hald
 6953 emanoil   20   0 34296  14m  11m S    0  0.7   0:02.50 konsole
12693 emanoil   20   0  2440 1156  852 R    0  0.1   0:00.76 top
13334 emanoil   20   0  3584 1332  788 S    0  0.1   0:00.07 make
    1 root      20   0  2844 1688  544 S    0  0.1   0:01.09 init


I will try the programs suggested by you - somehow I don't like the vlc player

Can you suggest something  (some kernel option) to debug?

regards


      
