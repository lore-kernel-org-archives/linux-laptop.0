From: Thorny <thorntreehome@gmail.com>
Subject: Re: kernel strange behaviour
Date: Sat, 11 Oct 2008 07:53:34 -0700
Message-ID: <pan.2008.10.11.14.53.32.551940@gmail.com>
References: <788629.6861.qm@web53202.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org

On Fri, 10 Oct 2008 02:42:47 -0700, Emanoil Kotsev wrote:

> 
> Hello, I'm new here, please be patient and correct me if I'm at the wrong
> place.
>

Hello Emanoil,
I recognise your name from the Kubuntu users list but I don't know if that
is a common name in your location so you might not be the same Emanoil.

Patience is usually optional. (laugh) However, you can be confident that
if you are in the wrong place someone will come along to tell you, they
might even yell at you for it.

> I have following problm.
> I've recently installed a debian prebuild kernel 2.6.26.5 on my DELL
> D520 (Centrino Duo Core 2 with 2GB RAM).

As above, is this your Kubuntu installation that you are talking about? If
so, my question would be why have you chosen to install a Debian
prebuild kernel? Kubuntu is based on Debian (the unstable branch) but that
does not necessarily mean you can mix and match (mix together) packages
from both. I don't know specifically if there is any difference that might
cause the symptoms you're experiencing but that would be one of the things
I would consider first. If you're using Kubuntu, it would probably be more
productive to try with a prebuilt (and properly configured for the OS)
Kubuntu kernel package. Once again, I have not looked at the .configs to
see if there are differences but a .config for a Debian kernel *might* be
different from a Kubuntu kernel.

Naturally, if this is not a Kubuntu install that you are posting about,
ignore my reply but if it is, then that should probably be mentioned
along with the system specs and kernel version which you did post.

I agree with poster Jim Carter, the kernel furnished with your distro
should have the ATA support that you are trying to get. Perhaps there is
some other issue which we have not yet explored. 

