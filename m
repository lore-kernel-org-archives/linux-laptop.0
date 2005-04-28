From: Bennie Kahler-Venter <bennie.venter@shoden.co.za>
Subject: Laptop APM & ACPI
Date: Thu, 28 Apr 2005 14:17:25 +0200
Message-ID: <4270D455.7020208@shoden.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-laptop@vger.kernel.org

I currently have a problem with an AOpen 1845 Laptop.  When ACPI & APM 
is turned on, the mouse plugged into the PS/2 port will misbehave 
occasionally when the machine gets a bit busy.  Turning APM and ACPI off 
at boot time solved the problem but now the power management is gone.  
Whenever the mouse misbehaves I see the following messages showing up in 
/var/log/messages:

kernel: psmouse.c: Mouse at isa0060/serio2/input0 lost synchronization, 
throwing 2 bytes away.

I'm currently running kernel 2.6.11.7.  I saw that there was in the 
latest 2.6.11 kernels a lot of cleanups with the serio subsystem as well 
as quite a few updates w.r.t. timings with the mouse/touchpad.  The 
notebook does not have an option to turn off the touchpad so the 
Synaptics Touchpad/PS2 port mux is constantly on.  Have been through 
most combinations now and none seem to fix it.

With APM/ACPI off things are fine...  I'm not sure from looking the 
kernel source since about 2.6.0 where to start hunting for this problem.

Tnx & Bi
Bennie Kahler-Venter

