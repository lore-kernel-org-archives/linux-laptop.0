From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: [PATCH] -mm: i386 apm.c optimization
Date: Fri, 05 May 2006 09:55:13 -0400
Message-ID: <445B5941.3020606@tmr.com>
References: <20060416220552.GA22998@rhlx01.fht-esslingen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <20060416220552.GA22998@rhlx01.fht-esslingen.de>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Mohr <andi@rhlx01.fht-esslingen.de>
Cc: Andrew Morton <akpm@osdl.org>, sfr@canb.auug.org.au, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org

Andreas Mohr wrote:

>Hello all,
>
>- avoid expensive modulo (integer division) which happened
>  since APM_MAX_EVENTS is 20 (non-power-of-2)
>- kill compiler warnings by initializing two variables
>- add __read_mostly to some important static variables that are read often
>  (by idle loop etc.)
>- constify several structures
>
>Patch tested on 2.6.16-ck5, rediffed against 2.6.17-rc1-mm2. 
>@@ -1104,7 +1105,8 @@
> 
> static apm_event_t get_queued_event(struct apm_user *as)
> {
>-	as->event_tail = (as->event_tail + 1) % APM_MAX_EVENTS;
>+	if (++as->event_tail >= APM_MAX_EVENTS)
>+		as->event_tail = 0;
> 	return as->events[as->event_tail];
> }
> 
>  
>
Either event_tail can never be > APM_MAX_EVENTS (I believe that's true) 
and you should use ==, or you should do a proper mod function:
  ++as->event_tail;
  while (as->event_tail >= APM_MAX_EVENTS) as->event_tail -= APM_MAX_EVENTS;

In the unlikely even that the event_tail is already too large you want a 
proper mod, not to set it to zero.

-- 
bill davidsen <davidsen@tmr.com>
  CTO TMR Associates, Inc
  Doing interesting things with small computers since 1979

