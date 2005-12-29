From: Frederik Eaton <frederik@a5.repetae.net>
Subject: fan control (thinkpad t42)
Date: Thu, 29 Dec 2005 00:36:32 +0000
Message-ID: <20051229003632.GA7888@a5.repetae.net>
Reply-To: frederik@ofb.net
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

Hello,

I have just purchased an IBM ThinkPad T42.

Most of the noise it makes comes from the CPU fan. This is very quiet
when the computer first turns on, or when it comes out of sleep, but
usually after a few minutes it goes into a different mode. In the new
mode the fan is loud, and worse, it "revs" every few seconds - so
rather than making a constant noise, there is something of a rhythm to
it which I find annoying.

I'm wondering if there is a way to control the fan to keep it from
doing this. I have the processor running at the slowest speed, so it
shouldn't be producing too much heat.

There is nothing in "/proc/acpi/fan/", I'm not sure what to make of
that.

# uname -a
Linux fly 2.6.12-9-686 #1 Mon Oct 10 13:25:32 BST 2005 i686 GNU/Linux
# cat /proc/cmdline 
root=/dev/hda1 ro apm=on acpi=on nolapic quiet splash

Thanks,

Frederik
