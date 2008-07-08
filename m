From: Tino Keitel <tino.keitel+linux-laptop@tikei.de>
Subject: Enforce power saving policies
Date: Tue, 8 Jul 2008 20:15:45 +0200
Message-ID: <20080708181545.GA3250@dose.home.local>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

Hi folks,

I'm currently searching for all the knobs in kernel and userland to
save as much power as possible on a Thinkpad X61s. Some of them are
hare to find, some of them must be re-set during runtime, which makes
it hard to create power saving setup.

Currently, 2 settings cause some headache:

1. USB autosuspend

This seems to be split into 2 settings: power/autosuspend and
power/level. Some devices seem to be initialized with power/level set
to "on". On my Thinkpad, this even leads to a really hot fingerprint
reader. I found no way to automatically set power/level to "auto" for
all new devices, I always have to set it manually for some devices.

2. Intel wireless power saving

The Intel power saving needs to be turned on after the module is
loaded, but sometimes I get a write error at the echo 5 >
.../power_level and the kernel reports an error. Furthermore, scanning
does not work anymore after setting the power_level to 5, and setting
it back to 6 only gives an error. I have to reload the module to get it
working again. To make it short, it's a bit frustrating.

That's why I would like to enforce power saving by default for these
settings, but found to way to do it.

And while thinking about this, all the other knobs like SATA link power
management, PCIE active state power management (in 2.6.26), the cpufreq
governors, the power saving settings in the ALSA drivers, laptop mode,
Ethernet link speed (on some Intel chips) and maybe more, seem to
follow the same pattern: adjust the ballance between
performance/latency and power consumption.

So how about a global kernel policy where the user can say "I want
maximum power saving per default", or "I want maximum performance", and
all the currently existing settings make use of that policy to adjust
their defaults? It would reduce the mess in the userspace that tries to
apply such a policy, and help the user who tries to get the maximum out
of the battery of his shiny new laptop.

Of cause, it should be possible to exclude certain settings from that
policy and leave it in a failsafe default setting, for broken hardware.

I think it would be a good start to collect all the currently
implemented settings that influence the power consumption in a central
place, like somewhere in Documentation/laptops, with some further
details what hardware is affected, what performance/latency penalties
can happen and possible problems that may occur.

Is this a totally new idea, or is there already some work/planning in
progress?

Regards,
Tino
