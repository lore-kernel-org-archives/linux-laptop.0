From: Riccardo Vestrini <riccardov@sssup.it>
Subject: is it really better speedstep-ich vs. p4-clockmod cpufreq driver?
Date: Thu, 22 Jul 2004 11:28:30 +0200
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <40FF88BE.2090507@sssup.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-laptop@vger.kernel.org

it seems that speedstep-ich and acpi cpufreq driver have only two usable 
clock frequencies, while p4-clockmod has eight
my cpu is: Intel Mobile Intel(R) Pentium(R) 4   CPU 3.06GHz stepping 09



last 2.6 kernel I tried (2.6.7) has introduced a warning while loading 
p4-clockmod module:

p4-clockmod: P4/Xeon(TM) CPU On-Demand Clock Modulation available
p4-clockmod: Warning: Pentium 4-M detected. The speedstep-ich or acpi 
cpufreq modules offer voltage scaling in addition of frequency scaling. 
You should use either one instead of p4-clockmod, if possible.

so I immediatly switched to speedstep-ich discovering that:
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
3066590 1599960

while with p4-clockmod I have:
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
383323 766647 1149971 1533295 1916618 2299942 2683266 3066590

using acpi driver gives a message:
cpufreq: CPU0 - ACPI performance management activated.
cpufreq:  P0: 3059 MHz, 24000 mW, 100 uS
cpufreq: *P1: 1596 MHz, 12000 mW, 100 uS
but:
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
3059000 1596000


so, what driver is supposed to be better? and why speedstep-ich driver 
has only two frequencies?


-- 

                                Riccardo Vestrini
                               <riccardov@sssup.it>

"Computers are good at following instructions,
  but not at reading your mind." - D. E. Knuth, The TeXbook

