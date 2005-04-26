From: "Brown, Len" <len.brown@intel.com>
Subject: RE: Dell D810 Laptop Suspend/Resume
Date: Tue, 26 Apr 2005 17:02:37 -0400
Message-ID: <F7DC2337C7631D4386A2DF6E8FB22B3002F682DE@hdsmsx401.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Davidsen <davidsen@tmr.com>
Cc: Jim Carter <jimc@math.ucla.edu>, Davy Durham <pubaddr2@davyandbeth.com>, linux-laptop@vger.kernel.org

 
>And what is S5? I have a 2.6.7 system which tells me:
>    oddball:davidsen> cat /proc/acpi/sleep
>    S0 S1 S4 S5

S5 is "soft off".
ie. # init 0
takes the system down and turns off the power.

Same for the power button in ACPI mode -- it causes
an event that is caught by a user daemon, such as acpid
which does an "init 0".

cheers,
-Len
