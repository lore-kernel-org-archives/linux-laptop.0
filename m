From: Felix Seeger <felix.seeger@gmx.de>
Subject: Re: Make it fast
Date: Sun, 9 Jun 2002 08:55:23 +0200
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <200206090855.23480.felix.seeger@gmx.de>
References: <200206090637.g596bZH07923@cavu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <200206090637.g596bZH07923@cavu.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

The problem is: I want a modern desktop.

At the moment I'm compiling kde 3 drom cvs head to be sure that I have the 
newest version with lesser mem leaks.
I tried to remove all eye-candy things but it is slow.
Also I don't use netscape.


Now my desktop is tuned but I have to tune Linux.
I already remove daemons (e.g. webmin).
I can't tune more. There is only the Linux kernel which is a normal build so I 
thought there may be some things that I can set in the kernel config to make 
it a bit faster.

Maybe I should try 2.5 ?
This laptop has no critical mission.

have fun
Felix

Am Sonntag, 9. Juni 2002 08:37 schrieb Bob Toxen:
> > Hi
> >
> > Are there any standard things that I can do to tune my linux on the
> > laptop ? I have a vaio qr10.
> > Everything runs nice only the battery management (I will see in 2.5 ;))
> > and the speed. It has only 64 MB RAM and kde needs more.
> > What can I do from the kernel side to make linux faster ?
>
> Consider a less costly desktop.  My 25 BogoMips 486 24 MB laptop runs
> just fine with fvwm (Slackware).  You also might turn off whatever icons,
> dancing girls, and other things that you don't need.  Doing a "top" or
> "ps -axlww | more" will show what is using CPU and memory.
>
> Also, some programs, most notably X and Netscrape leak memory over time.
> Thus, you will want to shut down Netscrape every day or two and probably
> shut down X weekly to free up the leaked memory.
>
> > I use always the current 2.4 kernel
> > Ext2
> > Xfree 4.1
> >
> > thanks
> > have fun
> > Felix
>
> Best regards,
>
> Bob Toxen, President
> Fly-By-Day Consulting, Inc.           "Experts in Linux & Network Security"
> Author,
> "Real World Linux Security: Intrusion Detection, Prevention, and Recovery"
> 700 pages
> Prentice Hall
> November 2000
> bob@verysecurelinux.com
> http://www.verysecurelinux.com       [Linux/Unix & Network Security
> Consulting] http://www.realworldlinuxsecurity.com [My 5* book: "Real World
> Linux Security"] http://www.verysecurelinux.com/sunset.html                
>    [Sunset Computer] Quality Linux, UNIX and network security and software
> consulting since 1990.
>
> GPG Public key available at http://www.cavu.com/pubkey.txt (book@cavu.com)
>   and at http://pgp5.ai.mit.edu/pks-commands.html#extract
>   and on the CD-ROM that comes sealed and attached to Real World Linux
> Security pub  1024D/E3A1C540 2000-06-21 Bob Toxen <book@cavu.com>
>      Key fingerprint = 30BA AA0A 31DD B68B 47C9  601E 96D3 533D E3A1 C540
> sub  2048g/03FFCCB9 2000-06-21
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9AvvbS0DOrvdnsewRAgWxAJ4rHdHK7gTbj+TUhJvkyI/eBiHO2wCeLw76
iQRtDA+JYPMeg6w1feePQBg=
=LxH3
-----END PGP SIGNATURE-----

