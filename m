From: Laszlo 'GCS' Boszormenyi <gcs@lsc.hu>
Subject: reboot instead of halt
Date: Sun, 17 Oct 2004 15:39:18 +0200
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20041017133918.GA24594@pooh>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

Hi,

 I have a Gericom 1st Supersonic notebook. I am using it since 2.4.14 or
so. 2.6.8.1 runs fine, but 2.6.9-final and some older kernels I have
tried (2.6.9-rc4, -rc3, -rc2) all have the following problem:
when I type halt, the notebook shuts down, but restarts. I have read
that there were problems with APIC, but I have already switched off all
of that. What else should I look for?
If relevant, I use Debian Sarge, with my own compiled kernel, which has
the same config file the previous kernels had.

Thanks,
Laszlo/GCS

