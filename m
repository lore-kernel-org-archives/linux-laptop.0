From: Maximilian Decker <burbon04@gmx.de>
Subject: linux-wlan-ng and kernel 2.6.10-rc3
Date: Wed, 15 Dec 2004 09:12:11 +0100
Message-ID: <41BFF1DB.6080309@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-laptop@vger.kernel.org

Hi all,

Like many others I also had problems with prism2 based cards and the
2.6.10 kernels - the logs showed messages about unresolved symbols and
the card just refused to work. It turned out that internal changes in
the recent linux kernels simply broke compatibility to software like
linux-wlan-ng.
(well, maybe the next version of linux-wlan-ng will solve that issue,
but I do not know when it will be released .....
.... if someone knows, please let me know - thanks)

If you want to use linux-wlan-ng-0.2.1pre23 with linux 2.6.10-rc3, you
might want to try my patch that brings back the deprecated "dev_get"
and again exports hotplug_path. I know it is kind of ugly to workaround
like that, but I did not want to wait for the next linux-wlan-ng release
;-) Well, it works for me.

if you are interested, you can find it here:
http://burbon04.gmxhome.de/linux/2.6.10_hotplug.html

(use it at your own risk ! absolutely no warranty ;-)



Cheers,

- Maximilian



