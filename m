From: Thorny <thorntreehome@gmail.com>
Subject: Re: kernel strange behaviour
Date: Sun, 12 Oct 2008 03:48:39 -0700
Message-ID: <pan.2008.10.12.10.48.37.671726@gmail.com>
References: <pan.2008.10.11.14.53.32.551940@gmail.com> <34440.71226.qm@web53209.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org


[edit]

[EK]>> > I have following problm.
>> > I've recently installed a debian prebuild kernel
>> 2.6.26.5 on my DELL
>> > D520 (Centrino Duo Core 2 with 2GB RAM).
>> 
[Thorny]>> As above, is this your Kubuntu installation that you are
talking about?
>> If
>> so, my question would be why have you chosen to install a Debian
>> prebuild kernel? Kubuntu is based on Debian (the unstable branch) but
>> that
>> does not necessarily mean you can mix and match (mix together) packages
>> from both. I don't know specifically if there is any difference that
>> might
>> cause the symptoms you're experiencing but that would be one of the
>> things
>> I would consider first. If you're using Kubuntu, it would probably be
>> more
>> productive to try with a prebuilt (and properly configured for the OS)
>> Kubuntu kernel package. Once again, I have not looked at the .configs
>> to see if there are differences but a .config for a Debian kernel
>> *might* be
>> different from a Kubuntu kernel.
> 
[EK]> I've tried this on debian too - the same result. The prestory is
pretty
> ling one.
> 
> I've been using Suse 10.2 for 2 years installed on the built-in drive
> (this for office use) and I was booting from USB drive a debian system
> at home.
> 
> I've got a new wider screen at work and Suse 10.2 did not manage (in
> fact the X server that comes with it) to get the notebooks disppplay
> together with the external one working, so that's why I decided to
> install kubuntu, cause it seems to be optimesed for desktop (notebook).
> On the usb drive I was using a custom 2.6.26 without ata/sata compiled
> and recording/playing/compiling works fine
> 
> I tought it's nice to upgrade a bit but got stuck with this ugly slow
> down.
> 
> Then I installed the debian 2.6.26 on debian and it worked better (also
> with sata as module) so that's why I installed it on kubuntu too. It
> works the same there, but still on both installations it slows down a
> bit also with the debian prebuild
> 

Hummmmm! I know from the other list that English is not your first
language and I am having a bit of trouble understanding, so have patience
with me. When I read the above, it seems that you are saying that for some
reason you had a custom kernel and thought it would be a good idea to
upgrade it. I don't understand why you had a custom kernel in the first
place. I also, sometimes, hang around over in the Kubuntu forum and I just
checked, there are a couple of people over there who are running Kubuntu
8.04 on the Dell D520 with the kernel that ships with 8.04 so, once again,
I don't see why you need a custom kernel. Perhaps there is some other
issue involved here. 

[edit]

[EK]> I didn't mention the system type because behaviour is the same.
Kubuntu
> does not offer 2.6.26 (last time I've looked at was few days ago) and I
> have few things that I'm missing in 2.6.24, which comes with kubuntu
> 

What are those "few things" you are "missing", since other people with the
same D520 are using the stock kernel, I can't think what would be
missing? What happened when you tried to install with the stock kernel?

[edit]

[EK]> Yes I need a good advice to track it down, cause everything looks
fine
> with 2.6.26 (though there is a little slow down), but with 2.6.26.5 it's
> impossible to work.
> 

I am not a kernel expert so someone else may have to figure that out. I
don't upgrade kernels just because I can find a newer one somewhere. In
fact, it has been years since I compiled a kernel, I don't have any new
hardware that requires it and, it seems to me with today's modern
processors, any speed improvements by custom compiling seem like they
would be minimal as compared to the days when processors ran at 133MHz
with 16MB RAM. Perhaps I'm lazy but I like to use the nice stable
prebuilt kernel debs.

