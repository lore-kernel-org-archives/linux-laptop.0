From: TAKADA Yoshihito <takada@mbf.nifty.com>
Subject: [x86-32] apm broken
Date: Thu, 26 Nov 2009 21:24:15 +0900 (JST)
Message-ID: <20091126.212415.193868885.takada@mbf.nifty.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org

Hi.
I updated kernel for old x86 box.
APM of kernel 2.6.29 broken on my x86-32 box.
I attempt to suspend by APM at several kernels.

---2.6.27
I worried about apmd said "Suspending now" though proxy rejected
suspend, the 2.6.27 seems works correctly.

apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
apmd[1828]: apmd 3.2.1 interfacing with apm driver 1.16ac and APM BIOS 1.2
apmd[1828]: Proxy exited with status 1
apmd[1828]: Suspend rejected by proxy
apmd[1828]: Suspending now
PM: Device 1-1 failed to suspend: error -22
PM: Device floppy.0 failed to suspend late: error -22
hda: no DMA mode selected
PM: Device usb1 failed to resume: error -22
PM: Device 1-1 failed to resume: error -22
apmd[1828]: Proxy exited with status 1
apmd[1828]: Suspend rejected by proxy
apmd[1828]: Suspending now
PM: Device 1-1 failed to suspend: error -22
PM: Device floppy.0 failed to suspend late: error -22
hda: no DMA mode selected
PM: Device usb1 failed to resume: error -22
PM: Device 1-1 failed to resume: error -22


---2.6.28
The 2.6.28 seems works correctly too.

apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
apmd[1726]: apmd 3.2.1 interfacing with apm driver 1.16ac and APM BIOS 1.2
apmd[1726]: Proxy exited with status 1
apmd[1726]: Suspend rejected by proxy
apmd[1726]: Suspending now
PM: Device 1-1 failed to suspend: error -22
PM: Device floppy.0 failed to suspend late: error -22
hda: no DMA mode selected
PM: Device usb1 failed to resume: error -22
PM: Device 1-1 failed to resume: error -22
apmd[1726]: Proxy exited with status 1
apmd[1726]: Suspend rejected by proxy
apmd[1726]: Suspending now
PM: Device 1-1 failed to suspend: error -22
PM: Device floppy.0 failed to suspend late: error -22
hda: no DMA mode selected
PM: Device usb1 failed to resume: error -22
PM: Device 1-1 failed to resume: error -22

---2.6.29
The kernel said WARN_ON when APM BIOS require suspend.

apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
apmd[1738]: apmd 3.2.1 interfacing with apm driver 1.16ac and APM BIOS 1.2
apmd[1738]: Proxy exited with status 1
apmd[1738]: Suspend rejected by proxy
apmd[1738]: Suspending now
PM: Device 1-1 failed to suspend: error -22
PM: Device floppy.0 failed to suspend late: error -22
------------[ cut here ]------------
WARNING: at kernel/time/timekeeping.c:98 getnstimeofday+0x20/0xc7()
Modules linked in: apm joydev psmouse serio_raw evdev ohci_hcd floppy 8139too usbcore mii cs5520
Pid: 1738, comm: apmd Not tainted 2.6.29-fiva #1
Call Trace:
 [<c01130ec>] warn_slowpath+0x80/0xb5
 [<c01262e9>] getnstimeofday+0x20/0xc7
 [<c01233ae>] ktime_get_ts+0x1d/0x3f
 [<c01233df>] ktime_get+0xf/0x2b
 [<c0124450>] sched_clock_tick+0x3e/0x71
 [<c0110ef6>] scheduler_tick+0x14/0x81
 [<c0119927>] update_process_times+0x36/0x3f
 [<c0128212>] tick_handle_periodic+0xc/0x56
 [<c0104339>] timer_interrupt+0x11/0x18
 [<c013bc49>] handle_IRQ_event+0x1a/0x3f
 [<c013c91d>] handle_level_irq+0x50/0x85
 [<c010405d>] do_IRQ+0x4d/0x64
 [<c65b46db>] do_ioctl+0x0/0x146 [apm]
 [<c01030e7>] common_interrupt+0x27/0x30
 [<c65b46db>] do_ioctl+0x0/0x146 [apm]
---[ end trace 1e821420e29432aa ]---
PM: Device usb1 failed to resume: error -22
PM: Device 1-1 failed to resume: error -22
apmd[1738]: Proxy exited with status 1
apmd[1738]: Suspend rejected by proxy
apmd[1738]: Suspending now
PM: Device 1-1 failed to suspend: error -22
PM: Device floppy.0 failed to suspend late: error -22
------------[ cut here ]------------
WARNING: at kernel/time/timekeeping.c:98 getnstimeofday+0x20/0xc7()
Modules linked in: apm joydev psmouse serio_raw evdev ohci_hcd floppy 8139too usbcore mii cs5520
Pid: 1738, comm: apmd Tainted: G        W  2.6.29-fiva #1
Call Trace:
 [<c01130ec>] warn_slowpath+0x80/0xb5
 [<c01262e9>] getnstimeofday+0x20/0xc7
 [<c01233ae>] ktime_get_ts+0x1d/0x3f
 [<c01233df>] ktime_get+0xf/0x2b
 [<c0124450>] sched_clock_tick+0x3e/0x71
 [<c0110ef6>] scheduler_tick+0x14/0x81
 [<c0119927>] update_process_times+0x36/0x3f
 [<c0128212>] tick_handle_periodic+0xc/0x56
 [<c0104339>] timer_interrupt+0x11/0x18
 [<c013bc49>] handle_IRQ_event+0x1a/0x3f
 [<c013c91d>] handle_level_irq+0x50/0x85
 [<c010405d>] do_IRQ+0x4d/0x64
 [<c65b46db>] do_ioctl+0x0/0x146 [apm]
 [<c01030e7>] common_interrupt+0x27/0x30
 [<c65b46db>] do_ioctl+0x0/0x146 [apm]
---[ end trace 1e821420e29432ab ]---
PM: Device usb1 failed to resume: error -22
PM: Device 1-1 failed to resume: error -22

---2.6.30:
The kernel said WARN_ON when APM BIOS require suspend.

apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
PM: Device 1-1 failed to suspend: error -22
PM: Device floppy.0 failed to suspend late: error -22
------------[ cut here ]------------
WARNING: at kernel/time/timekeeping.c:98 getnstimeofday+0x21/0xc8()
Modules linked in: apm ohci_hcd floppy 8139too usbcore mii cs5520
Pid: 1388, comm: Xorg Tainted: G      D    2.6.30-fiva #2
Call Trace:
 [<c012986d>] ? getnstimeofday+0x21/0xc8
 [<c012986d>] ? getnstimeofday+0x21/0xc8
 [<c0115fcf>] ? warn_slowpath_common+0x5e/0x8a
 [<c0116005>] ? warn_slowpath_null+0xa/0xc
 [<c012986d>] ? getnstimeofday+0x21/0xc8
 [<c01265ed>] ? ktime_get_ts+0x1d/0x3f
 [<c012661e>] ? ktime_get+0xf/0x2b
 [<c012777b>] ? sched_clock_tick+0x4f/0x133
 [<c0113cfc>] ? scheduler_tick+0x14/0x81
 [<c011ca5b>] ? update_process_times+0x36/0x3f
 [<c012be87>] ? tick_handle_periodic+0xc/0x61
 [<c01041b1>] ? timer_interrupt+0x21/0x28
 [<c01403f3>] ? handle_IRQ_event+0x49/0xf6
 [<c01413bc>] ? handle_level_irq+0x50/0x85
 [<c0103ed7>] ? handle_irq+0x17/0x1c
 [<c0103c30>] ? do_IRQ+0x2b/0x63
 [<c0102d49>] ? common_interrupt+0x29/0x30
---[ end trace 3f288e5fb2e867d5 ]---
PM: Device usb1 failed to resume: error -22
PM: Device 1-1 failed to resume: error -22

---2.6.31.6
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
PM: Device 1-1 failed to suspend: error -22
PM: Device floppy.0 failed to suspend late: error -22
------------[ cut here ]------------
WARNING: at kernel/time/timekeeping.c:102 getnstimeofday+0x21/0xc8()
Modules linked in: apm snd_pcsp irtty_sir snd_pcm sir_dev joydev snd_timer snd irda soundcore snd_page_alloc crc_ccitt psmouse serio_raw evdev ohci_hcd floppy usbcore 8139too nls_base mii cs5520
Pid: 1885, comm: apmd Not tainted 2.6.31.6-fiva #1
Call Trace:
 [<c1029cb8>] ? getnstimeofday+0x21/0xc8
 [<c1029cb8>] ? getnstimeofday+0x21/0xc8
 [<c10167d7>] ? warn_slowpath_common+0x5e/0x8a
 [<c101680d>] ? warn_slowpath_null+0xa/0xc
 [<c1029cb8>] ? getnstimeofday+0x21/0xc8
 [<c10267df>] ? ktime_get_ts+0x1d/0x3f
 [<c1026810>] ? ktime_get+0xf/0x2b
 [<c10278bb>] ? sched_clock_tick+0x4f/0x133
 [<c101495a>] ? scheduler_tick+0x14/0xc0
 [<c101d1f9>] ? update_process_times+0x36/0x3f
 [<c102c303>] ? tick_handle_periodic+0xc/0x61
 [<c1004271>] ? timer_interrupt+0x21/0x28
 [<c1040c18>] ? handle_IRQ_event+0x1a/0x96
 [<c1041b74>] ? handle_level_irq+0x50/0x85
 [<c1003f93>] ? handle_irq+0x17/0x1c
 [<c1003c72>] ? do_IRQ+0x2b/0x76
 [<c1002d49>] ? common_interrupt+0x29/0x30
---[ end trace ba233a454b6b6589 ]---
PM: Device usb1 failed to resume: error -22
PM: Device 1-1 failed to resume: error -22
