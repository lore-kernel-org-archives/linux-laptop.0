From: "Virgil" <yyz001@euroseek.com>
Subject: Re: Kernel problems with HP ze4145
Date: Sun, 27 Apr 2003 13:28:02 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <web-3337523@euroseek.com>
References: <20030425111159.GB660@erdbeere.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <20030425111159.GB660@erdbeere.net>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; 
To: linux-laptop@vger.kernel.org
Cc: Patrick Plattes <patrick@erdbeere.net>

Patrick,

> is there anything interessting in /var/log/* ?
No, there's absolutely nothing interesting in both 
kern.log and sys.log.

I did ln -sf ../init.d/usb-init S45usb in /etc/rc.d/rc3.d 
so that the modules would be loaded automatically at 
startup.

My /etc/rc.d/init.d/usb-init script
#!/bin/bash
#Begin /etc/rc.d/init.d/usb-init

source /etc/sysconfig/rc
source $rc_functions

case "$1" in
       start)
                echo "Initialising USB..."
                modprobe usbcore
                modprobe usb-ohci
                evaluate_retval
                ;;
       stop)
                echo "Unloading USB..."
                rmmod usb-ohci
                rmmod usbcore
                evaluate_retval
                ;;
       restart)
                $0 stop
                sleep 1
                $0 start
                ;;
       status)
                lsmod | grep usb-ohci
                evaluate_retval
                ;;
       *)
                echo "Usage: $0 
{start|stop|restart|status}"
                exit 1
                ;;
esac
# End /etc/rc.d/init.d/usb-init

---------- Excerpt from kern.log --------------
usb.c: registered new driver usbdevfs
usb.c: registered new driver hub
usb-ohci.c: USB OHCI at membase 0xe08cb00, IRQ 9
usb-ohci.c: usb-00:02.0, Acer Laboratories Inc. [ALi] USB 
1.1 Controller
usb.c: new USB bus registered, assigned bus number 1
hub.c: USB hub found
hub.c: 4 ports detected
(At this point the keyboard does not work, so I pressed 
the power button)
Kernel logging (proc) stopped
Kernel log daemon terminating
---------- end kern.log -----------------------

Exactly the above messages appear if I manually do the 
modprobe, except this time the keyboard no longer locks.

So, at this point I'm really out of ideas. Does anyone 
think posting my problem on linux-kernel would yield 
anything?

Virgil
-------------------------------------------------
Search for pictures with Euroseek Image Search
http://euroseek.com/image_search/

Euroseek Translation
http://www.euroseek.com/translator/


