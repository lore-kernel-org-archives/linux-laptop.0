From: "Brown, Len" <len.brown@intel.com>
Subject: Toshiba Tecra vs ACPI
Date: Thu, 21 Aug 2003 20:30:23 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <BF1FE1855350A0479097B3A0D2A80EE009FCAD@hdsmsx402.hd.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org, acpi-devel@lists.sourceforge.net

Does anybody have a Toshiba Tecra that boots an ACPI-enabled kernel?
If yes, can you send me the output from dmidecode so that I can identify
the BIOS date?
http://www.nongnu.org/dmidecode/  (I'd also be intersted in the output
of acpidmp)

I've found that the Tecra 8100 has AML bugs that we can't handle
(missing return statements when they are required).  And we will not be
able to handle them any time soon (w/o a DSDT over-ride).

So I'm thinking about black-listing the 8100 by default; and the 8000
and 8200 may be right behind it.  Unfortunately, the DMI info for the
8100 has an empty product name under system information, where one would
expect to see "Tecra 8100".  So I'm thinking about disabling ACPI by
default on all systems with DMI BIOS vendor "TOSHIBA", BIOS Release Date
<= 10/07/2002 -- the date of the latest BIOS for the 8100; and Base
Board product name "Portable PC".

Thanks,
-Len
