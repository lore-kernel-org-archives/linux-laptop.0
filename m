From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: is it really better speedstep-ich vs. p4-clockmod cpufreq driver?
Date: Thu, 22 Jul 2004 09:20:56 -0700 (PDT)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0407220902350.9845@simba.math.ucla.edu>
References: <40FF88BE.2090507@sssup.it>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <40FF88BE.2090507@sssup.it>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Riccardo Vestrini <riccardov@sssup.it>
Cc: linux-laptop@vger.kernel.org

On Thu, 22 Jul 2004, Riccardo Vestrini wrote:

> it seems that speedstep-ich and acpi cpufreq driver have only two usable clock
> frequencies, while p4-clockmod has eight
> my cpu is: Intel Mobile Intel(R) Pentium(R) 4   CPU 3.06GHz stepping 09

> p4-clockmod: P4/Xeon(TM) CPU On-Demand Clock Modulation available
> p4-clockmod: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq
> modules offer voltage scaling in addition of frequency scaling. You should use
> either one instead of p4-clockmod, if possible.
> 
> so, what driver is supposed to be better? and why speedstep-ich driver has
> only two frequencies?

The CPU on my laptop is a Pentium III-M (Coppermine) and so only 
speedstep-ich is useful for me.  However, I can shed some light on this 
issue.  My CPU frequencies are 733 MHz and 1000 MHz, but at the lower speed 
the CPU also runs at 3.3 volts, vs. 5 volts at high speed.  This means that 
the power consumption is about half at low speed (it's approximately speed 
times voltage), which is important for me when operating in the field on 
battery power.  Also, when running high speed I need to put a pillow on my 
lap and the machine on the pillow, because the bottom gets so hot.  (Yes, I 
make very sure that the pillow doesn't block the air ducts, and the fan 
does a good job of keeping the insides cool.  The CPU and graphics chip 
have a big heat-pipe running into the air duct.)

Definitely the voltage modulation is important to have.

Also as for strategies, if you have dynamic speed modulation, generally if
the CPU is busy less than 73% of the time, then my machine should be run at
the lowest speed, whereas if tasks are waiting to run then it should be put
in the highest speed.  In a typical workload it's very rare for the needed
throughput to be steadily between 73% and 100% so the intermediate speeds
could be useful; this is true even if the available speed range is greater.  
Actually, hardly anyone uses the full capacity of their CPU, and I don't
even bother to run the dynamic modulation daemon, just leaving it at low
speed all the time.  I switch manually if I have a big simulation to do.

Hope this helps.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)
