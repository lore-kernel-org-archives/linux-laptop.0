From: Len Brown <len.brown@intel.com>
Subject: Re: Sony Vaio PCG-FRV27 Memory Stick Reader
Date: 15 Jun 2004 00:41:34 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <1087274493.2920.161.camel@dhcppc4>
References: <bca9c5420406141906416c0698@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <bca9c5420406141906416c0698@mail.gmail.com>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steev Klimaszewski <threeway@gmail.com>
Cc: linux-laptop@vger.kernel.org

Is the memory card reader enumerated by ACPI?

acpidmp | acpixtract DSDT > DSDT
iasl -d DSDT
grep PNP0C0D DSDT.dsl

You could write a driver to attach to this PNPid
and get its current resources.

does the DSDT do anything special for Windows?
make it do the same for you, boot with
acpi_os_name="Microsoft Windows NT"

-Len


