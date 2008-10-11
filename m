From: Emanoil Kotsev <deloptes@yahoo.com>
Subject: Re: kernel strange behaviour
Date: Sat, 11 Oct 2008 10:16:29 -0700 (PDT)
Message-ID: <34440.71226.qm@web53209.mail.re2.yahoo.com>
References: <pan.2008.10.11.14.53.32.551940@gmail.com>
Reply-To: deloptes@yahoo.com
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <pan.2008.10.11.14.53.32.551940@gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org, Thorny <thorntreehome@gmail.com>


--- On Sat, 10/11/08, Thorny <thorntreehome@gmail.com> wrote:

> From: Thorny <thorntreehome@gmail.com>
> Subject: Re: kernel strange behaviour
> To: linux-laptop@vger.kernel.org
> Date: Saturday, October 11, 2008, 4:53 PM
> On Fri, 10 Oct 2008 02:42:47 -0700, Emanoil Kotsev wrote:
> 
> > 
> > Hello, I'm new here, please be patient and correct
> me if I'm at the wrong
> > place.
> >
> 
> Hello Emanoil,
> I recognise your name from the Kubuntu users list but I
> don't know if that
> is a common name in your location so you might not be the
> same Emanoil.

Yes it's me the same and one and only :-) Nice to meet you here

> 
> Patience is usually optional. (laugh) However, you can be
> confident that
> if you are in the wrong place someone will come along to
> tell you, they
> might even yell at you for it.
> 
> > I have following problm.
> > I've recently installed a debian prebuild kernel
> 2.6.26.5 on my DELL
> > D520 (Centrino Duo Core 2 with 2GB RAM).
> 
> As above, is this your Kubuntu installation that you are
> talking about? If
> so, my question would be why have you chosen to install a
> Debian
> prebuild kernel? Kubuntu is based on Debian (the unstable
> branch) but that
> does not necessarily mean you can mix and match (mix
> together) packages
> from both. I don't know specifically if there is any
> difference that might
> cause the symptoms you're experiencing but that would
> be one of the things
> I would consider first. If you're using Kubuntu, it
> would probably be more
> productive to try with a prebuilt (and properly configured
> for the OS)
> Kubuntu kernel package. Once again, I have not looked at
> the .configs to
> see if there are differences but a .config for a Debian
> kernel *might* be
> different from a Kubuntu kernel.

I've tried this on debian too - the same result. The prestory is pretty ling one.

I've been using Suse 10.2 for 2 years installed on the built-in drive (this for office use) and I was booting from USB drive a debian system at home.

I've got a new wider screen at work and Suse 10.2 did not manage (in fact the X server that comes with it) to get the notebooks disppplay together with the external one working, so that's why I decided to install kubuntu, cause it seems to be optimesed for desktop (notebook).
On the usb drive I was using a custom 2.6.26 without ata/sata compiled and recording/playing/compiling works fine

I tought it's nice to upgrade a bit but got stuck with this ugly slow down.

Then I installed the debian 2.6.26 on debian and it worked better (also with sata as module) so that's why I installed it on kubuntu too. It works the same there, but still on both installations it slows down a bit also with the debian prebuild

> 
> Naturally, if this is not a Kubuntu install that you are
> posting about,
> ignore my reply but if it is, then that should probably be
> mentioned
> along with the system specs and kernel version which you
> did post.

I didn't mention the system type because behaviour is the same. Kubuntu does not offer 2.6.26 (last time I've looked at was few days ago) and I have few things that I'm missing in 2.6.24, which comes with kubuntu

> 
> I agree with poster Jim Carter, the kernel furnished with
> your distro
> should have the ATA support that you are trying to get.
> Perhaps there is
> some other issue which we have not yet explored. 

Yes I need a good advice to track it down, cause everything looks fine with 2.6.26 (though there is a little slow down), but with 2.6.26.5 it's impossible to work.

I repeat it's absolutely the same config file, so may be it's a compiler issue or alike, what do you think?

I could take the config from the 2.6.26 without sata and compile again and see what happens but I'm wondering if tehre is not a better way to track it down.

thanks in advance



      
