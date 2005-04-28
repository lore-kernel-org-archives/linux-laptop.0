From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Laptop APM & ACPI
Date: Thu, 28 Apr 2005 10:51:42 -0700 (PDT)
Message-ID: <Pine.LNX.4.61.0504281043190.4715@simba.math.ucla.edu>
References: <4270D455.7020208@shoden.co.za>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <4270D455.7020208@shoden.co.za>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bennie Kahler-Venter <bennie.venter@shoden.co.za>
Cc: linux-laptop@vger.kernel.org

On Thu, 28 Apr 2005, Bennie Kahler-Venter wrote:

> I currently have a problem with an AOpen 1845 Laptop.  When ACPI & APM is
> turned on, the mouse plugged into the PS/2 port will misbehave occasionally
> when the machine gets a bit busy.  Turning APM and ACPI off at boot time
> solved the problem but now the power management is gone.  

This probably won't actually solve the problem, but try it with just 
apm=off (using ACPI), or just acpi=off (using APM).  You might get lucky.  
If you have neither off, the first to be initialized is the winner, and if 
your kernel is modular, that depends on the order of loading drivers.

In kernel 2.4.x and previous, APM support was more mature than ACPI; 
however, ACPI is mature in the 2.6.x kernels, and vendors put work into the 
ACPI BIOS and not into APM.  Some, e.g. Dell, have even dropped APM 
entirely.

Might there be a BIOS update for your laptop?  


James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)
