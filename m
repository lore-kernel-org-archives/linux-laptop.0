From: Nishanth Aravamudan <nacc@us.ibm.com>
Subject: apm_mainloop() waitqueue usage
Date: Thu, 16 Dec 2004 12:06:19 -0800
Message-ID: <20041216200619.GD2565@us.ibm.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sfr@canb.auug.org.au
Cc: linux-laptop@vger.kernel.org

Hello,

I am working on a Kernel Janitors TODO entry dealing with the use of
schedule_timeout(). In the process, I came across
arch/i386/kernel/apm.c::apm_mainloop(), which uses waitqueues &
schedule_timeout() to check for events at a regular interval, depending on
waitqueue events occurring.

A few considerations:

Ideally, I would like to convert as many waitqueue users as possible to the
wait_event* family of macros. For reference, here is the code in 2.6.10-rc3:


static void apm_mainloop(void)
{
	DECLARE_WAITQUEUE(wait, current);

	add_wait_queue(&apm_waitqueue, &wait);
	set_current_state(TASK_INTERRUPTIBLE);
	for (;;) {
		schedule_timeout(APM_CHECK_TIMEOUT);
		if (exit_kapmd)
			break;
		/*
		 * Ok, check all events, check for idle (and mark us sleeping
		 * so as not to count towards the load average)..
		 */
		set_current_state(TASK_INTERRUPTIBLE);
		apm_event_handler();
	}
	remove_wait_queue(&apm_waitqueue, &wait);
}

I have already easily changed the pre-loop initialization to:

	DECLARE_WAITQUEUE(wait, current);

	prepare_to_wait(&apm_waitqueue, &wait, TASK_UNINTERRUPTIBLE);

First, I changed the state to TASK_UNINTERRUPTIBLE. The code as it is does not
deal with signals in any way (that I see); I believe that is incorrect for
TASK_INTERRUPTIBLE sleeps, as the code must deal with both potential waitqueue
events & signals as being the cause for early wakeups. Please correct me if I
misunderstood.

Second, if the call to apm_event_handler() were not there, the change to
wait_event_timeout() would be very straightforward, as the code would be
identical... However, the call is there. So, I have a few questions:

Do you think it would be possible to perhaps change the structuring of the
function? I don't think it is, but it can't hurt to ask.

Second, if I added another macro to the wait_event family which allows the
invocation of a function at an interval (effectively exactly what you do in
apm_mainloop), would you be willing to convert to this macro? -- presuming of
course, the community agreed to merge the new macro to mainline.

Third, if neither of these options appeals to you, I may just push a patch
which does the prepare_to_wait() change.

Thanks,
Nish
