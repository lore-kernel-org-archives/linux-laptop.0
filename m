From: Richard Spencer <rspr@sunflower.com>
Subject: NetGear FA410TX
Date: Sat, 1 Feb 2003 10:13:57 -0500
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20030201101357.B719@jetty>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

I was wondering if someone could look at my start-up messages and tell me 
where to look for information which might help me to solve my current dilemna.

I am attempting to use a fast ethernet card, the NetGear FA410TX, with my Dell
Latitude laptop, running Redhat 6.2 and Linux 2.2.22.

I recently upgraded the kernel via rpm as a security fix (errata 
RHSA-2002:264-05 and installed pcmcia-cs-2.2.22-6.2.3,  _and_then_
pcmcia-cs-3.2.3.

Relelvant /var/log/messages:

Feb  1 04:34:45 jetty pcmcia: Starting PCMCIA services:
Feb  1 04:34:45 jetty kernel: Linux PCMCIA Card Services 3.2.3
Feb  1 04:34:45 jetty kernel:   kernel build: 2.2.22-6.2.3 #1 Thu Nov 21 14:01:19 EST 2002
Feb  1 04:34:45 jetty kernel:   options:  [pci] [apm]
Feb  1 04:34:46 jetty kernel: Intel ISA/PCI/CardBus PCIC probe:
Feb  1 04:34:46 jetty kernel:   Cirrus PD6729 rev 00 PCI-to-PCMCIA at slot 00:04, port 0xfcfc
Feb  1 04:34:46 jetty kernel:     host opts [0]: [ring] [1/3/2] [1/9/2]
Feb  1 04:34:46 jetty kernel:     host opts [1]: [ring] [1/3/2] [1/9/2]
Feb  1 04:34:46 jetty kernel:     ISA irqs (default) = 3,4,5,7,9,10,11,12 polling interval = 1000 ms
Feb  1 04:34:46 jetty pcmcia: cardmgr[428]: error in file 'config' line 2236: syntax error
Feb  1 04:34:46 jetty cardmgr[428]: error in file 'config' line 2236: syntax error
Feb  1 04:34:46 jetty pcmcia: cardmgr[428]: watching 2 sockets
Feb  1 04:34:46 jetty cardmgr[428]: watching 2 sockets
Feb  1 04:34:46 jetty cardmgr[429]: starting, version is 3.2.3
Feb  1 04:34:46 jetty pcmcia: done.
Feb  1 04:34:46 jetty rc: Starting pcmcia succeededFeb  1 04:34:46 jetty keytable: Loading keymap:
Feb  1 04:34:46 jetty kernel: cs: memory probe 0x0d0000-0x0dffff: clean.
Feb  1 04:34:46 jetty cardmgr[429]: socket 0: NE2000 Compatible Fast Ethernet
Feb  1 04:34:46 jetty cardmgr[429]: executing: 'modprobe pcnet_cs'
Feb  1 04:34:47 jetty keytable: Loading /usr/lib/kbd/keymaps/i386/qwerty/us.kmap.gz
Feb  1 04:34:47 jetty cardmgr[429]: + /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o: invalid parameter parm_irq
Feb  1 04:34:47 jetty cardmgr[429]: + /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o: insmod /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o failed
Feb  1 04:34:47 jetty cardmgr[429]: + /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o: insmod pcnet_cs failed
Feb  1 04:34:47 jetty cardmgr[429]: modprobe exited with status 255
Feb  1 04:34:47 jetty cardmgr[429]: executing: 'insmod /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o'
Feb  1 04:34:47 jetty cardmgr[429]: + /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o: unresolved symbol ei_open
Feb  1 04:34:47 jetty cardmgr[429]: + /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o: unresolved symbol ethdev_init
Feb  1 04:34:47 jetty cardmgr[429]: + /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o: unresolved symbol ei_interrupt
Feb  1 04:34:47 jetty cardmgr[429]: + /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o: unresolved symbol NS8390_init

Feb  1 04:34:47 jetty cardmgr[429]: + /lib/modules/2.2.22-6.2.3/pcmcia/pcnet_cs.o: unresolved symbol ei_close
Feb  1 04:34:47 jetty cardmgr[429]: insmod exited with status 1
:
Feb  1 04:34:47 jetty keytable: Loading system font:
Feb  1 04:34:47 jetty rc: Starting keytable succeeded
Feb  1 04:34:48 jetty cardmgr[429]: get dev info on socket 0 failed: Resource temporarily unavailable

When I insert my Orinoco Gold card, it works! Look here:

Feb  1 04:53:15 jetty cardmgr[429]: socket 1: Lucent Technologies WaveLAN/IEEE Adapter
Feb  1 04:53:15 jetty cardmgr[429]: executing: 'modprobe orinoco_cs'
Feb  1 04:53:16 jetty kernel: cs: IO port probe 0x0100-0x04ff: excluding 0x220-0x22f 0x330-0x337 0x378-0x37f 0x388-0x38f 0x4d0-0x4d7
Feb  1 04:53:16 jetty kernel: cs: IO port probe 0x0230-0x032f: clean.
Feb  1 04:53:16 jetty kernel: cs: IO port probe 0x0338-0x0377: clean.
Feb  1 04:53:16 jetty kernel: cs: IO port probe 0x0380-0x0387: clean.
Feb  1 04:53:16 jetty kernel: cs: IO port probe 0x0390-0x04cf: clean.
Feb  1 04:53:16 jetty kernel: cs: IO port probe 0x04d8-0x04ff: clean.
Feb  1 04:53:16 jetty kernel: cs: IO port probe 0x0800-0x08ff: clean.
Feb  1 04:53:16 jetty kernel: cs: IO port probe 0x0a00-0x0aff: clean.
Feb  1 04:53:16 jetty kernel: cs: IO port probe 0x0c00-0x0cff: excluding 0xcf8-0xcff
Feb  1 04:53:16 jetty cardmgr[429]: executing: './network start eth0'


Any ideas?
