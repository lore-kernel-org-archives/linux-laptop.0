From: Chuck Gelm <gelmce@ameritech.net>
Subject: pcmcia-cs stopped working
Date: Sun, 05 Jan 2003 10:29:02 -0500
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <3E184F3E.F35C4DF9@ameritech.net>
Reply-To: chuck@gelm.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org

 My pcmcia-cs stopped working.  
modprobe ds.o fails.
depmod -a now returns about 100 lines of
e.g.
depmod: *** Unresolved symbols in /lib/modules/2.2.19/block/linear.o.gz
...
depmod: *** Unresolved symbols in
/lib/modules/2.2.19/video/matroxfb.o.gz

At the suggestion of some others in an IRC, I edited
/etc/pcmcia/wlan-ng.conf 
to get my system to recognize and configure a 
Belkin F5D6020 pcmcia card.
Now my pcmcia modules do not load!

What did I do wrong?
What do I do to fix it?

Thanks, Chuck
