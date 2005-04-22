From: "Brown, Len" <len.brown@intel.com>
Subject: RE: Dell D810 Laptop Suspend/Resume
Date: Fri, 22 Apr 2005 13:57:11 -0400
Message-ID: <F7DC2337C7631D4386A2DF6E8FB22B3002F682BE@hdsmsx401.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jim Carter <jimc@math.ucla.edu>, Davy Durham <pubaddr2@davyandbeth.com>
Cc: linux-laptop@vger.kernel.org

S3 is suspend to RAM (MS calls it standby, IIR)
S4 is suspend to disk (MS calls it hibernate)

you can enter either state directly via
# echo 3 > /proc/acpi/sleep
# echo 4 > /proc/acpi/sleep

or equivalently

# echo mem > /sys/power/state
# echo disk > /sys/power state

cheers,
-Len
