From: davidsen@tmr.com (bill davidsen)
Subject: Re: question about kernel 2.6.1
Date: 11 Feb 2004 13:31:16 GMT
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <c0dar4$3h9$1@gatekeeper.tmr.com>
References: <1075925263.2952.29.camel@darkstar>
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

In article <1075925263.2952.29.camel@darkstar>,
Roman Jordan  <RomanJordan@gmx.de> wrote:
| Hi,
| i have a sony PCG-FX505 laptop (ati graphic and 1,2 GHz mobile athlon).
| I use fedora linux version 1.0. The system runs o.k.
| After the installation of the kernel version 2.6.1 i can't shutdown the
| system. The commands 'halt' and 'poweroff' doesn't switch off the
| device.
| The display is black, but the LEDs are still on.
| 
| Any suggestions where to start solving?

1 - try 2.6.2
2 - try APM instead of ACPI
3 - try the patch posted here recently
4 - google for the "laptop patch"
5 - try the absolute latest ACPI patch (URL recently posted)
6 - stay with 2.4 unless there's something you really need in 2.6
7 - APM has a "use real mode shutdown" option, try that
8 - reboot into 2.4 and then shutdown

With all of the 2.6 features backported to 2.4 in Redhat kernels, the
benefits are fairly small for most people.
-- 
bill davidsen <davidsen@tmr.com>
  CTO, TMR Associates, Inc
Doing interesting things with little computers since 1979.
