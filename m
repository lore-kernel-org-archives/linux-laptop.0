From: "Enugala Venkata Ramana" <caps_linux@rediffmail.com>
Subject: Installation of latest kernel on laptop
Date: 1 Aug 2002 04:27:58 -0000
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20020801042758.1380.qmail@webmail30.rediffmail.com>
Reply-To: "Enugala Venkata Ramana" <caps_linux@rediffmail.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

Hi ,
  This is what is existing configuration
    have compaq presario 1200 12XL506 model notebook
    installed Redhat Linux 7.1
    Everything is fine except the usb to ethernet (SmartNic2 1500 
) does not work although it is shown in the /proc/usb/devices

  This is what i tried
   downloaded latest kernel 2.5.29
   Installed kernel on linux laptop
   I am not very sure of what needs to be configured in the kernel 
config
   When i tried "make xconfig" there is some error and x windows 
does not start
   i did manual configuration and able to compile the new kernel 
and boot on to it
   After boot on new kernel
   Now even the usb mouse is not recognized, Xwindows which is 
working previously with kernel 2.4.x does not work.

Now what i want to know is
   What i need to select in kernel configurations so that it 
supports my model with all basic features?
   Why there is always an error in prevois versions of my kernel 
as well ('Error in line 5 in /etc/sysconfig/mouse') I comment line 
fine everything is fine?

Please do reply in case anybody know any details on this.

thanks
Regards
Venku.

