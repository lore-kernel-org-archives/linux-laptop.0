From: Thomas Hood <jdthood@aglu.demon.nl>
Subject: [FIX] apm.c: ignore_normal_resume is set to 1 a bit too late
Date: Sat, 28 May 2005 00:45:32 +0200
Message-ID: <1117233933.13528.295.camel@thanatos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org
Cc: sfr@canb.auug.org.au

This message contains a fix for a bug in the apm driver.

A bug report was submitted to the Debian BTS saying that on the
submitter's system the apmd proxy script was being run twice on resume.

Having seen exactly the same problem some years ago and knowing that the
solution then was to ensure that the ignore_normal_resume flag got set
before there was any chance of an APM RESUME event being processed, I
checked the current apm.c and I found that ignore_normal_resume was once
again being set too late.  I asked the submitter to move the line where
the flag was set and he reported that this change solved the problem.  I
append the message in question.  The line numbers I mention there are
for Linux 2.6.11.

Please make the indicated change to the apm driver.

-------- Forwarded Message --------
jdthood@aglu.demon.nl wrote to the submitter of Debian bug #310865:
> In arch/i386/kernel/apm.c there is at approximately line 1229:
> 
>         ignore_normal_resume = 1;
> 
> Move this up so that it occurs right after line 1222:
> 
>         err = set_system_power_state(APM_STATE_SUSPEND);
> 
> Let us know if that helps.


It does. Very nice.
I don't understand what I did and how it works. Will you try to
push that into kernel sources or is this no permanent fix?
-- 
Thomas Hood <jdthood@aglu.demon.nl>

