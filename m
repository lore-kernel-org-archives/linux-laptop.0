From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: samsung-laptop: Samsung 530U3C major ACPI issues
Date: Wed, 24 Oct 2012 07:27:05 -0700
Message-ID: <20121024142705.GA17043@kroah.com>
References: <5087F449.6040906@profitbricks.com>
 <5087F70E.3010406@profitbricks.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5087F70E.3010406@profitbricks.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Cc: linux-laptop@vger.kernel.org, Adrian Maertins <adrian.maertins@profitbricks.com>

On Wed, Oct 24, 2012 at 04:11:26PM +0200, Sebastian Riemer wrote:
> Hi Greg,
> 
> as you're the maintainer of the samsung-laptop driver I think that you
> can help with getting support for the Samsung 530U3C laptop into it.

Wait, no, I am not the maintainer of that driver anymore, please see the
MAINTAINERS file for the correct maintainer.

Or, you can use the scripts/get_maintainer.pl tool to determine this:

$ ./scripts/get_maintainer.pl --file drivers/platform/x86/samsung-laptop.c 
Corentin Chary <corentincj@iksaif.net> (maintainer:SAMSUNG LAPTOP DR...)
Matthew Garrett <mjg@redhat.com> (maintainer:X86 PLATFORM DRIVERS)
platform-driver-x86@vger.kernel.org (open list:SAMSUNG LAPTOP DR...)
linux-kernel@vger.kernel.org (open list)

I suggest you resend this message to Corentin, and cc: the other people
and lists listed above.

Hope this helps,

greg k-h
