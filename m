From: Steev Klimaszewski <threeway@gmail.com>
Subject: Re: Sony Vaio PCG-FRV27 Memory Stick Reader
Date: Tue, 15 Jun 2004 07:04:25 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <bca9c54204061504045d5c3636@mail.gmail.com>
References: <bca9c5420406141906416c0698@mail.gmail.com> <1087274493.2920.161.camel@dhcppc4>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <1087274493.2920.161.camel@dhcppc4>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Len Brown <len.brown@intel.com>
Cc: linux-laptop@vger.kernel.org

On 15 Jun 2004 00:41:34 -0400, Len Brown <len.brown@intel.com> wrote:
> 
> Is the memory card reader enumerated by ACPI?
> 
> acpidmp | acpixtract DSDT > DSDT
> iasl -d DSDT
> grep PNP0C0D DSDT.dsl
> 
> You could write a driver to attach to this PNPid
> and get its current resources.
> 
> does the DSDT do anything special for Windows?
> make it do the same for you, boot with
> acpi_os_name="Microsoft Windows NT"
> 
> -Len
> 
> 
Thanks for the quick reply Len.  What exactly is the PNP0C0D?  I got
the DSDT.dsl file, though - in the latest acpica-unix-20040527
package, some of the directory names are uppercase, and it took me a
minute to figure out why it couldn't find things (first example was
that it couldn't find ../namespace/nssomething.c.....) .  How do I
know if the DSDT does anything special for Windows?  I am almost
certain that writing a driver for the memory stick reader is above my
abilities (currently) but I have been considering it.
