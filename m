From: Michael Schierl <schierlm@gmx.de>
Subject: Re: [PATCH] [APM] Is this the correct way to fix suspend bug introduced 
 in 2.6.0-test4?
Date: Thu, 29 Jan 2004 20:10:13 +0100
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <40195A95.C675952C@gmx.de>
References: <13zy7qdcyz1q7$.50e5l3rpbsyx$.dlg@40tude.net> <20040128174655.GE1200@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------BE7EB52A260B9EC72C2D134E"
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
To: Pavel Machek <pavel@suse.cz>
Cc: Stephen Rothwell <fr@canb.auug.org.au>, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org, mochel@digitalimplant.org

Dies ist eine mehrteilige Nachricht im MIME-Format.
--------------BE7EB52A260B9EC72C2D134E
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Pavel Machek schrieb:
> 
> Hi!
> >
> > the patch below (against 2.6.1-mm5) fixes my APM problems (my laptop, Acer
> > TravelMate 210TEV (Celeron 700, 128 MB RAM), hangs after resuming from APM
> > since 2.6.0-test4).
> >
> > If you have any suggestions, tell me 

> I think you should use device_power_down() and device_power_up(),
> instead. Check it, but it looks to me like that's better way.

Works for me as well (Patch attached).

> > if you think that's okay like that, please submit that to the guy who is
> > responsible for 2.6 (is it Linus or Andrew? did not follow lkml
> > recently).
> 
> Andrew.

Thanks. BTW: I did not get any response from Stephen Rothwell (the guy
who is listed as maintainer for APM in the MAINTAINERS file). How long
should I wait for a response? Or should I simply submit the patch to
Andrew?

Michael
--------------BE7EB52A260B9EC72C2D134E
Content-Type: text/plain; charset=us-ascii;
 name="apm-bug-introduced-in-test4-v2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="apm-bug-introduced-in-test4-v2.patch"

--- linux-2.6.2-rc2-mm1/arch/i386/kernel/apm.c.old	Thu Jan 29 16:22:03 2004
+++ linux-2.6.2-rc2-mm1/arch/i386/kernel/apm.c	Thu Jan 29 16:22:07 2004
@@ -1201,6 +1201,7 @@ static int suspend(int vetoable)
 	}
 
 	device_suspend(3);
+	device_power_down(3);
 
 	/* serialize with the timer interrupt */
 	write_seqlock_irq(&xtime_lock);
@@ -1234,6 +1235,7 @@ static int suspend(int vetoable)
 	if (err != APM_SUCCESS)
 		apm_error("suspend", err);
 	err = (err == APM_SUCCESS) ? 0 : -EIO;
+	device_power_up();
 	device_resume();
 	pm_send_all(PM_RESUME, (void *)0);
 	queue_event(APM_NORMAL_RESUME, NULL);
@@ -1252,6 +1254,7 @@ static void standby(void)
 {
 	int	err;
 
+	device_power_down(3);
 	/* serialize with the timer interrupt */
 	write_seqlock_irq(&xtime_lock);
 	/* If needed, notify drivers here */
@@ -1261,6 +1264,7 @@ static void standby(void)
 	err = set_system_power_state(APM_STATE_STANDBY);
 	if ((err != APM_SUCCESS) && (err != APM_NO_ERROR))
 		apm_error("standby", err);
+	device_power_up();
 }
 
 static apm_event_t get_event(void)

--------------BE7EB52A260B9EC72C2D134E--


