From: Maximilian Decker <burbon04@gmx.de>
Subject: linux-wlan-ng and kernel 2.6.10-rc3
Date: Thu, 16 Dec 2004 11:29:49 +0100
Message-ID: <41C1639D.4040303@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-laptop@vger.kernel.org, linux-wlan-user@lists.linux-wlan.com

Hi all,

sorry for posting that again, but my recent mail seemed to get
lost somewhere (at least it is not shown in the archives ....)
... please apologize if some of you get it twice ...

----------

Like many others I also had problems with prism2 based pcmcia cards
and the 2.6.10 kernels - the logs showed messages about unresolved
symbols and the card just refused to work.
It turned out that internal changes in the recent linux kernels
simply broke compatibility to software like linux-wlan-ng.
(well, maybe the next version of linux-wlan-ng will solve that issue,
but I do not know when it will be released .....
.... if someone knows, please let me know - thanks)

If you want to use linux-wlan-ng-0.2.1pre23 with linux 2.6.10-rc3, you
might want to try my patch that brings back the deprecated "dev_get"
and again exports hotplug_path. I know it is kind of ugly to workaround
like that, but I did not want to wait for the next linux-wlan-ng release
;-) Well, it works for me...

if you are interested, you can get it here:
http://burbon04.gmxhome.de/linux/files/2.6.10_old_hotplug.diff.gz

for more information see:
http://burbon04.gmxhome.de/linux/2.6.10_hotplug.html

(use it at your own risk ! absolutely no warranty ;-)



Cheers,

- Maximilian




