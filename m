From: "Charles Lepple" <clepple@ghz.cc>
Subject: "apm: suspend: Unable to enter requested state" in 2.5.x/2.6.0test1
Date: Wed, 23 Jul 2003 14:36:05 -0400 (EDT)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <37564.216.12.38.216.1058985365.squirrel@www.ghz.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sfr@canb.auug.org.au
Cc: linux-laptop@vger.kernel.org

[Sorry for the cross-post; I mistakenly posted to lkml earlier this week,
but now I have some updated information.]

Summary of tested versions:

Version          APM Works?
2.4.18-24.8.0    yes
2.4.20-18.9      yes
2.4.21           yes
2.5.26           yes
2.5.30           yes
2.5.31           yes
2.5.32           no
2.5.35           no
2.5.40           no
2.5.45           no
2.5.63           no
2.5.66           no
2.6.0test1       no

Removing AC power (suggested by Thomas Hood) did not make suspend work on
the later versions.

Also, when a PCMCIA card is active, and suspend is attempted (under a
working version), the computer would respond with a high-low tone
sequence.

With the later versions, the only indication is a blinking suspend light
(blinks for 30-60 seconds; sometimes the console blanks during this
period) and the subsequent "Unable to enter requested state" message on
the console.

I found some possibly relevant changes in arch/i386/kernel/apm.c:

http://linus.bkbits.net:8080/linux-2.5/diffs/arch/i386/kernel/apm.c@1.36?nav=index.html|src/|src/arch|src/arch/i386|src/arch/i386/kernel|hist/arch/i386/kernel/apm.c

but I am not very familiar with the APM calling conventions, or what the
end effect of these changes is.

Thanks in advance.

---------------------------- Original Message ----------------------------
Subject: "apm: suspend: Unable to enter requested state" in
2.5.x/2.6.0test1 From:    "Charles Lepple" <clepple@ghz.cc>
Date:    Mon, July 21, 2003 11:14 am
To:      linux-kernel@vger.kernel.org
--------------------------------------------------------------------------

I have a ThinkPad 770, and under 2.4.x (including .21 and several RedHat
.18-x kernels, FWIW), it would suspend and even hibernate nicely (if all
PCMCIA cards were removed).

In 2.5.x (where x > 66, and maybe earlier) and 2.6.0test1, the machine
doesn't suspend. If I either press the suspend hotkey (Fn-F4), close the
lid, or invoke "apm --suspend", the suspend LED starts to blink, and I get
these messages:

Jul 19 10:46:32 lemur apmd[587]: System Suspend
Jul 19 10:46:52 lemur kernel: uhci-hcd 00:01.2: suspend to state 3 Jul 19
10:46:52 lemur kernel: apm: suspend: Unable to enter requested state

followed by a few beeps, and then the LEDs indicate a non-suspended state.
After a couple of seconds, the screen returns to normal.

Here are the powr mgmt configuration options I used for 2.6.0test1:

  # Power management options (ACPI, APM)
  #
  CONFIG_PM=y
  # CONFIG_SOFTWARE_SUSPEND is not set

  #
  # ACPI Support
  #
  # CONFIG_ACPI is not set
  CONFIG_APM=m
  # CONFIG_APM_IGNORE_USER_SUSPEND is not set
  CONFIG_APM_DO_ENABLE=y
  CONFIG_APM_CPU_IDLE=y
  # CONFIG_APM_DISPLAY_BLANK is not set
  # CONFIG_APM_RTC_IS_GMT is not set
  # CONFIG_APM_ALLOW_INTS is not set
  # CONFIG_APM_REAL_MODE_POWER_OFF is not set

CONFIG_APM_ALLOW_INTS doesn't seem to matter, as the APM code detects that
it is an IBM machine, and enables interrupts during APM calls
unconditionally:

  lemur:~$ dmesg|grep -iw apm
  IBM machine detected. Enabling interrupts during APM calls.
  apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16)

I have diddled with a few of the other options with no noticeable effect.
Also, I have tried reducing the number of loaded drivers (booting
single-user, not loading any modules but those needed for disk and console
I/O).

As time permits, I will try and test this on other kernel versions.
However, I feel like I am poking around in the dark. Any ideas as to what
may be preventing suspend from working? I'm not too familiar with the
details of APM, but my impression was that APM is BIOS-driven. So there
should not be any random device drivers preventing suspend (as could
happen with ACPI), right?

ACPI doesn't even work with this hardware in Win98 or Win2k, (plain 770s;
later 770s supposedly support it) and the latest kernels won't even
attempt to work with it. Otherwise, I'd be bugging the linux-acpi people.

Any advice would be appreciated. I am more than willing to pepper the
kernel APM code with printks if necessary to debug this, but I am going to
need a bit of guidance to do that effectively.

-- 
Charles Lepple <clepple@ghz.cc>
http://www.ghz.cc/charles/
