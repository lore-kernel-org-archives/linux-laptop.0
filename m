From: Michael Schierl <schierlm-usenet@gmx.de>
Subject: 2.6.0: APM suspend/resume problem on Acer TravelMate 210TEV
Date: Thu, 8 Jan 2004 17:43:28 +0100
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <loa7youjxrbd$.5x754n88lno4.dlg@40tude.net>
Reply-To: schierlm@gmx.de
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="--246CF9EB125A4F99_message_boundary--"
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
To: linux-laptop@vger.kernel.org

----246CF9EB125A4F99_message_boundary--
Content-type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I already had some discussion about that topic on linux-kernel, but it
seems that no one has any idea how to fix this or even how to track this
down (it could also be they all have me in their kill filter, but i don't
hope so... *please* give me a chance. thanks.).

I'll try to summarize the current situation:

My laptop (Acer TravelMate 210TEV, Celeron 700) did suspend properly on
2.6.0-test[123]. Since -test4 (up to the final version and -mm2) it does
not work any more.

When I try to suspend (using apm -s, since I set the kernel to ignore user
suspend), the computer suspends properly now, but it does not resume
afterwards properly. It looks as if it had resumed, i see the command
prompt (or i see the first lines of output of a command i add by "apm -s;
somecommand"), then it hangs.

I tried to track it down to a driver, but did not manage it.

i got that if I enable local APIC it gets worse (does not even suspend) or
when I add the yenta driver, it does not get that far in resuming: it dies
somewhere inside of the device_resume(3) call of arch/i386/kernel/apm.c (i
added "printk"s into that file, but the problems occur as well when i use a
"vanilla" 2.6.0). But as i can live well without apic and yenta, these are
not my problems.

But trying to make the kernel smaller did not help at all. I ended up with
2 really "minimalistic" kernels, the difference is that one has IDE drivers
and ext2 support, the other one has initrd support, minix support and a
keyboard driver instead. (I attached the .config files.)

For the first one, i boot with "boot=/apmtest" where apmtest is a script
that does

#!/bin/bash
mount /proc
apm -s
echo 1
sleep 1
echo 2
sleep 1
echo 3
sulogin

and tap the power switch to make it resume (since there's no keyboard
driver). It hangs after echoing 1. When I add some more echo lines before
the first sleep, they are echoed as well.

For the second one, i use a modified initrd.gz from trinux (modified by
adding the apm binary, libapm and the /dev/apm_bios device node) and use
lilo to load it. (since there is a keyboard driver in, i can simply type
apm -s when it is up).

Needless to say that of course a "bigger" kernel (e. g. with additional
filesystems, keyboard, mouse, sound and/or networking support) does not
work better at all...

And all that configs work very well with a -test3 kernel, but not with
later ones...

Can *anyone* help me? (what could I try that may help you track that down?
can i try any patches, etc.)

Regards,

Michael
----246CF9EB125A4F99_message_boundary--
Content-type: application/ZIP; name="minimal-configs.zip"
Content-Transfer-Encoding: Base64
Content-Disposition: attachment; FileName="minimal-configs.zip"
Content-Description: Attached file: minimal-configs.zip

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
SwUGAAAAAAIAAgCBAAAA5hIAAAAA

----246CF9EB125A4F99_message_boundary----


