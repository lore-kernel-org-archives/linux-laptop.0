From: Davy Durham <pubaddr2@davyandbeth.com>
Subject: Re: Dell D810 Laptop Suspend/Resume
Date: Fri, 22 Apr 2005 21:24:45 -0500
Message-ID: <4269B1ED.2070302@davyandbeth.com>
References: <F7DC2337C7631D4386A2DF6E8FB22B3002F682BE@hdsmsx401.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <F7DC2337C7631D4386A2DF6E8FB22B3002F682BE@hdsmsx401.amr.corp.intel.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Brown, Len" <len.brown@intel.com>
Cc: Jim Carter <jimc@math.ucla.edu>, linux-laptop@vger.kernel.org

Why do you supose none of these are working quite right for me?

"echo 3 > /proc/acpi/sleep" and "echo mem > /sys/power/state" both show 
in the /var/log/messages

Apr 22 21:19:22 localhost kernel: Stopping tasks: 
==========================================================================
Apr 22 21:19:22 localhost kernel: stopping tasks failed (1 tasks remaining)
Apr 22 21:19:22 localhost kernel: Restarting tasks...<6> Strange, 
mDNSResponder not stopped
Apr 22 21:19:22 localhost kernel: done
Apr 22 21:19:22 localhost gpm[4262]: *** info [mice.c(1766)]:
Apr 22 21:19:22 localhost gpm[4262]: imps2: Auto-detected intellimouse PS/2
Apr 22 21:19:24 localhost hald[4360]: Timed out waiting for hotplug 
event 732. Rebasing to 734


And 4 and disk don't do anything.. How can I enable this method, or any 
idea why they don't do anything?  Catting either file shows

$cat /sys/power/state
standby mem disk

$cat /proc/acpi/sleep
S0 S3 S4 S4bios S5


Thanks
  Davy

Brown, Len wrote:

>S3 is suspend to RAM (MS calls it standby, IIR)
>S4 is suspend to disk (MS calls it hibernate)
>
>you can enter either state directly via
># echo 3 > /proc/acpi/sleep
># echo 4 > /proc/acpi/sleep
>
>or equivalently
>
># echo mem > /sys/power/state
># echo disk > /sys/power state
>
>cheers,
>-Len
>  
>

