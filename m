From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Laptop hot under linux
Date: Mon, 13 Sep 2004 17:34:12 -0700 (PDT)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0409131713390.4724@xena.cft.ca.us>
References: <000a01c499c8$d91a39a0$0201a8c0@migueliyo>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <000a01c499c8$d91a39a0$0201a8c0@migueliyo>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Miguel A. Garrido." <migueliyo@ya.com>
Cc: linux-laptop@vger.kernel.org

On Mon, 13 Sep 2004, Miguel A. Garrido. wrote:

> Hi, I have a problem with my laptop under linux. When it runs in Windows XP,
> the fan increase speed in case the cpu warm but with any distro (currently
> I'm using debian) the fan operates at the same speed and therefore it isn't
> capable to cool the processor and the laptop finishes turning off
> (fortunately ;) )
> It is not a common laptop trademark, but it has a Wistron motherboard with a
> PIV 2.4 proccessor. 

The symptom you describe is very strange.  I have a Dell Inspiron 4100 with 
SuSE Linux v9.1 (kernel 2.6.5), and I've never had a problem with cooling.  
In fact, my previous Inspiron 3800 (kernel 2.2.17) also could run its fan 
at high speed.  

The Inspiron has two fan speeds.  Even though in Los Angeles we're in the 
middle of a heat wave (max temperature 39 C) the machine maintains a max 
CPU temperature of 49 C by periodically running the fan at low speed.
If I took it outside in the sun, I imagine it would need the high speed,
but so far the only time it's put the fan on high speed was when I 
deliberately blocked the air duct to see if high speed worked. 

The Inspiron does not like ACPI.  The fan still works, but the temperature 
and fan readouts are useless.  So I still use APM.  If you start apmd and
prevent acpid from starting, you might find that the machine behaves 
better.  Then again, there might be no improvement.  If your distro does 
something like loading the ACPI modules at boot time and you can't make it 
stop doing it, try adding acpi=off to your boot parameters (kernel command 
line), but normally that isn't necessary; the first power management scheme 
to be started prevents the other one from initializing.  

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)
