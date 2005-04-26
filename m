From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: Dell D810 Laptop Suspend/Resume
Date: Tue, 26 Apr 2005 16:44:05 -0400
Message-ID: <426EA815.7080909@tmr.com>
References: <F7DC2337C7631D4386A2DF6E8FB22B3002F682BE@hdsmsx401.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <F7DC2337C7631D4386A2DF6E8FB22B3002F682BE@hdsmsx401.amr.corp.intel.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Brown, Len" <len.brown@intel.com>
Cc: Jim Carter <jimc@math.ucla.edu>, Davy Durham <pubaddr2@davyandbeth.com>, linux-laptop@vger.kernel.org

Brown, Len wrote:
> S3 is suspend to RAM (MS calls it standby, IIR)
> S4 is suspend to disk (MS calls it hibernate)

And what is S5? I have a 2.6.7 system which tells me:
    oddball:davidsen> cat /proc/acpi/sleep
    S0 S1 S4 S5
It's an old machine, not a laptop, does S5 suspecd to stone tablets, or 
what?

> 
> you can enter either state directly via
> # echo 3 > /proc/acpi/sleep
> # echo 4 > /proc/acpi/sleep
> 
> or equivalently
> 
> # echo mem > /sys/power/state
> # echo disk > /sys/power state

Have sleep, don't have state.

-- 
    -bill davidsen (davidsen@tmr.com)
"The secret to procrastination is to put things off until the
  last possible moment - but no longer"  -me

