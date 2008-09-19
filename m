From: nr@cs.tufts.edu (Norman Ramsey)
Subject: gigabit ethernet on Thinkpad X300?
Date: Thu, 18 Sep 2008 22:15:35 -0400 (EDT)
Message-ID: <20080919021535.1FE01E80FD@jindo.eecs.harvard.edu>
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

I've just booted kernel 2.6.26 (Debian lenny) on my new Thinkpad X300.
Things seem working OK so far except I can't get gigabit ethernet.
Output from ethtool says:

Settings for eth0:
        Supported ports: [ TP ]
        Supported link modes:   10baseT/Half 10baseT/Full 
                                100baseT/Half 100baseT/Full 
                                1000baseT/Full 
        Supports auto-negotiation: Yes
        Advertised link modes:  10baseT/Half 10baseT/Full 
                                100baseT/Half 100baseT/Full 
                                1000baseT/Full 
        Advertised auto-negotiation: Yes
        Speed: 100Mb/s
        Duplex: Full
        Port: Twisted Pair
        PHYAD: 1
        Transceiver: internal
        Auto-negotiation: on
        Supports Wake-on: pumbag
        Wake-on: g
        Current message level: 0x00000001 (1)
        Link detected: yes


As you can see both the hardware and the link support full duplex
1000baseT, but I'm getting only 100Mb/s (confirmed by lights on switch).

I tried

  sudo ifconfig eth0 media 1000baseT

but that media type isn't even recognized.

I also tried

  sudo ethtool -s eth0 speed 1000

but this seems to have broken the ethernet port entirely
(although a reboot brings it back).

Does anybody have any ideas?


Norman

P.S. After all this messaing around, it now negotiates down to 10Mb/s.
Booting 2.6.24 seems to get back to 100Mb/s.
