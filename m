From: Peter Fedorow <fedorowp@yahoo.com>
Subject: PROBLEM: Laptop keyboard redetected each time computer screen wakes
 up from powerdown
Date: Sun, 04 Apr 2004 17:00:43 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <4070777B.1050609@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vojtech@suse.cz, linux-laptop@vger.kernel.org

[1.] One line summary of the problem:
Laptop keyboard re-detected each time computer screen wakes up from 
power down.

[2.] Full description of the problem/report:
Each time a key is pressed to wake up the screen on an IBM ThinkPad 560X 
laptop with the screen APM powered down, the followed message appears on 
the foreground console: "input: AT Translated Set 2 keyboard on 
isa0060/serio0".  This is a problem because the message throws off the 
console output in some applications.

[3.] Keywords (i.e., modules, networking, kernel):
laptop, input, APM, keyboard, IBM, Thinkpad, 560X

[4.] Kernel version (from /proc/version):
Linux version 2.6.3 (root@herojr) (gcc version 3.3.3 (Debian 20040321)) 
#15 Tue Mar 30 13:51:21 EST 2004

[5.] Output of Oops.. message (if applicable) with symbolic information
      resolved (see Documentation/oops-tracing.txt):
n/a

[6.] A small shell script or example program which triggers the problem 
(if possible):
Enable APM in Linux.  Wait for the screen to turn off.  Press any key on 
the keyboard to wake the computer up.

[7.] Environment

[7.1.] Software (add the output of the ver_linux script here):
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux herojr 2.6.3 #15 Tue Mar 30 13:51:21 EST 2004 i586 GNU/Linux

Gnu C                  3.3.3
Gnu make               3.80
binutils               2.14.90.0.7
util-linux             2.12
mount                  2.12
module-init-tools      3.0-pre10
e2fsprogs              1.35
pcmcia-cs              3.2.5
PPP                    2.4.2
nfs-utils              1.0.6
Linux C Library        2.3.2
Dynamic linker (ldd)   2.3.2
Procps                 3.2.0
Net-tools              1.60
Console-tools          0.2.3
Sh-utils               5.0.91
Modules Loaded         snd_pcm_oss snd_mixer_oss snd_cs4236 snd_opl3_lib 
snd_hwdep snd_cs4236_lib snd_mpu401_uart snd_rawmidi snd_cs4231_lib 
snd_pcm snd_timer snd_page_alloc snd soundcore

[7.2.] Processor information (from /proc/cpuinfo):
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 5
model		: 8
model name	: Mobile Pentium MMX
stepping	: 1
cpu MHz		: 231.857
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: yes
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 1
wp		: yes
flags		: fpu vme de pse tsc msr mce cx8 mmx
bogomips	: 457.72

[7.3.] Module information (from /proc/modules):
snd_pcm_oss 58340 0 - Live 0xc6940000
snd_mixer_oss 19392 1 snd_pcm_oss, Live 0xc6928000
snd_cs4236 17380 0 - Live 0xc6906000
snd_opl3_lib 10336 1 snd_cs4236, Live 0xc68b4000
snd_hwdep 9280 1 snd_opl3_lib, Live 0xc68c7000
snd_cs4236_lib 16608 1 snd_cs4236, Live 0xc68ee000
snd_mpu401_uart 7552 1 snd_cs4236, Live 0xc68bc000
snd_rawmidi 24640 1 snd_mpu401_uart, Live 0xc68f7000
snd_cs4231_lib 30240 2 snd_cs4236,snd_cs4236_lib, Live 0xc68dd000
snd_pcm 103076 3 snd_pcm_oss,snd_cs4236_lib,snd_cs4231_lib, Live 0xc690d000
snd_timer 26180 3 snd_opl3_lib,snd_cs4231_lib,snd_pcm, Live 0xc68e6000
snd_page_alloc 12292 2 snd_cs4231_lib,snd_pcm, Live 0xc68c2000
snd 55812 11 
snd_pcm_oss,snd_mixer_oss,snd_cs4236,snd_opl3_lib,snd_hwdep,snd_cs4236_lib,snd_mpu401_uart,snd_rawmidi,snd_cs4231_lib,snd_pcm,snd_timer, 
Live 0xc68ce000
soundcore 9408 1 snd, Live 0xc68b8000


[7.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem):
0000-001f : dma1
0020-0021 : pic1
0040-005f : timer
0060-006f : keyboard
0080-008f : dma page reg
00a0-00a1 : pic2
00c0-00df : dma2
00f0-00ff : fpu
01f0-01f7 : ide0
0200-020f : CS4236+ SB
0388-0389 : OPL2/3 (left)
038a-038b : OPL2/3 (right)
03c0-03df : vga+
03f6-03f6 : ide0
04d0-04d1 : pnp 00:0a
0530-0533 : CS4231
0538-053f : CS4232 Control
0cf8-0cff : PCI conf1
15e0-15ef : pnp 00:0a
4000-40ff : PCI CardBus #01
4400-44ff : PCI CardBus #01
4800-48ff : PCI CardBus #05
   4800-487f : 0000:05:00.0
     4800-487f : xircom_cb
4c00-4cff : PCI CardBus #05
9000-901f : 0000:00:01.2
ef00-efaf : pnp 00:0a
fcf0-fcff : 0000:00:01.1
   fcf0-fcf7 : ide0

00000000-0009fbff : System RAM
0009fc00-0009ffff : reserved
000a0000-000bffff : Video RAM area
000c0000-000c7fff : Video ROM
000f0000-000fffff : System ROM
00100000-05fcffff : System RAM
   00100000-00269604 : Kernel code
   00269605-00304eff : Kernel data
05fd0000-05fdefff : ACPI Tables
05fdf000-05fdffff : ACPI Non-volatile Storage
08000000-08ffffff : 0000:00:03.0
09000000-090fffff : 0000:00:03.0
09200000-093fffff : 0000:00:03.0
10000000-103fffff : PCI CardBus #01
10400000-107fffff : PCI CardBus #01
10800000-10bfffff : PCI CardBus #05
   10800000-10803fff : 0000:05:00.0
10c00000-10ffffff : PCI CardBus #05
   10c00000-10c007ff : 0000:05:00.0
   10c00800-10c00fff : 0000:05:00.0
20821000-20821fff : 0000:00:02.1
   20821000-20821fff : yenta_socket
20822000-20822fff : 0000:00:02.0
   20822000-20822fff : yenta_socket
fffe0000-ffffffff : reserved

[7.5.] PCI information ('lspci -vvv' as root)
00:00.0 Host bridge: Intel Corp. 430TX - 82439TX MTXC (rev 01)
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap- 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort+ >SERR- <PERR-
	Latency: 8

00:01.0 Bridge: Intel Corp. 82371AB/EB/MB PIIX4 ISA (rev 01)
	Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap- 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
	Latency: 0

00:01.1 IDE interface: Intel Corp. 82371AB/EB/MB PIIX4 IDE (rev 01) 
(prog-if 80 [Master])
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap- 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
	Latency: 32
	Region 4: I/O ports at fcf0 [size=16]

00:01.2 USB Controller: Intel Corp. 82371AB/EB/MB PIIX4 USB (rev 01) 
(prog-if 00 [UHCI])
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap- 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
	Latency: 48
	Interrupt: pin D routed to IRQ 10
	Region 4: I/O ports at 9000 [size=32]

00:01.3 Bridge: Intel Corp. 82371AB/EB/MB PIIX4 ACPI (rev 01)
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap- 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
	Interrupt: pin ? routed to IRQ 9

00:02.0 CardBus bridge: Texas Instruments PCI1250 (rev 02)
	Subsystem: IBM: Unknown device 0092
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap+ 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
	Latency: 168, Cache Line Size: 0x08 (32 bytes)
	Interrupt: pin A routed to IRQ 10
	Region 0: Memory at 20822000 (32-bit, non-prefetchable) [size=4K]
	Bus: primary=00, secondary=01, subordinate=04, sec-latency=176
	Memory window 0: 10000000-103ff000 (prefetchable)
	Memory window 1: 10400000-107ff000
	I/O window 0: 00004000-000040ff
	I/O window 1: 00004400-000044ff
	BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset+ 16bInt+ PostWrite+
	16-bit legacy interface ports at 0001

00:02.1 CardBus bridge: Texas Instruments PCI1250 (rev 02)
	Subsystem: IBM: Unknown device 0092
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap+ 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
	Latency: 168, Cache Line Size: 0x08 (32 bytes)
	Interrupt: pin B routed to IRQ 10
	Region 0: Memory at 20821000 (32-bit, non-prefetchable) [size=4K]
	Bus: primary=00, secondary=05, subordinate=08, sec-latency=176
	Memory window 0: 10800000-10bff000 (prefetchable)
	Memory window 1: 10c00000-10fff000
	I/O window 0: 00004800-000048ff
	I/O window 1: 00004c00-00004cff
	BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset- 16bInt- PostWrite+
	16-bit legacy interface ports at 0001

00:03.0 VGA compatible controller: Neomagic Corporation NM2160 
[MagicGraph 128XD] (prog-if 00 [VGA])
	Subsystem: IBM MagicGraph 128XD
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap- 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
	Latency: 0 (4000ns min, 63750ns max)
	Interrupt: pin A routed to IRQ 10
	Region 0: Memory at 08000000 (32-bit, prefetchable) [size=16M]
	Region 1: Memory at 09200000 (32-bit, non-prefetchable) [size=2M]
	Region 2: Memory at 09000000 (32-bit, non-prefetchable) [size=1M]

05:00.0 Ethernet controller: Xircom Cardbus Ethernet 10/100 (rev 03)
	Subsystem: Intel Corp. EtherExpress PRO/100 Mobile CardBus 32 Adapter
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap+ 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
	Latency: 64 (5000ns min, 10000ns max)
	Interrupt: pin A routed to IRQ 10
	Region 0: I/O ports at 4800 [size=128]
	Region 1: Memory at 10c00000 (32-bit, non-prefetchable) [size=2K]
	Region 2: Memory at 10c00800 (32-bit, non-prefetchable) [size=2K]
	Expansion ROM at 10800000 [disabled] [size=16K]
	Capabilities: [dc] Power Management version 1
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=2 PME-

[7.6.] SCSI information (from /proc/scsi/scsi)
n/a

[7.7.] Other information that might be relevant to the problem
        (please look in /proc and include all information that you
        think to be relevant):
/proc/apm:
1.16ac 1.2 0x03 0x01 0x00 0x01 100% -1 ?


