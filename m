From: Simeon Penev <simeon_penev@web.de>
Subject: 2.6.17-1.2174_FC5: : Disabling IRQ #7 / nobody cared / usb_hcd_irq
Date: Sun, 03 Sep 2006 19:16:14 +0200
Message-ID: <790873504@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-laptop@vger.kernel.org

Hi,

i'm running FC5 on an Asus A6T-AP005H laptop. My kernel is 2.6.17-1.217=
4_FC5.
Somewhere at about 10 minutes after i start the system, the USB subsyst=
em dies with the message:

dmesg:
-----------------------------BEGIN-------------------------------------=
-
irq 7: nobody cared (try booting with the "irqpoll" option)

Call Trace: <IRQ> <ffffffff802b3317>{__report_bad_irq+48}
       <ffffffff802b3515>{note_interrupt+433} <ffffffff802b2e2e>{__do_I=
RQ+189}
       <ffffffff80271506>{do_IRQ+60} <ffffffff8026ff23>{default_idle+0}
       <ffffffff8026302a>{ret_from_intr+0} <EOI> <ffffffff8026ff23>{def=
ault_idle+0}
       <ffffffff802678f6>{thread_return+0} <ffffffff8026ff4e>{default_i=
dle+43}
       <ffffffff8024c90d>{cpu_idle+151} <ffffffff80279f14>{start_second=
ary+1131}
handlers:
[<ffffffff803d36f1>] (usb_hcd_irq+0x0/0x55)
Disabling IRQ #7
------------------------------END--------------------------------------=
-

After that only the usb mouse continues to work. My external USB harddi=
sk and the USB soundcard are not accessible anymore. This behaviour is =
reproducable after each reboot.=20
The only way i found to keep the USB running is reading some file const=
antly from the external harddrive. However if i stop accessing the part=
ition on the drive, eventually i get the same exception.

In order to boot successfully i boot the kernel with the 'noapic' optio=
n, or else i'm getting 'kernel panic' in some point right after the acp=
i initialization.
I hope someone could help me fix this problem. If needed i'm able to re=
compile the kernel and test any patches.

Here is the list of the hardware:

lspci:
-----------------------------BEGIN-------------------------------------=
-
00:00.0 RAM memory: nVidia Corporation C51 Host Bridge (rev a2)
00:00.1 RAM memory: nVidia Corporation C51 Memory Controller 0 (rev a2)
00:00.2 RAM memory: nVidia Corporation C51 Memory Controller 1 (rev a2)
00:00.3 RAM memory: nVidia Corporation C51 Memory Controller 5 (rev a2)
00:00.4 RAM memory: nVidia Corporation C51 Memory Controller 4 (rev a2)
00:00.5 RAM memory: nVidia Corporation C51 Host Bridge (rev a2)
00:00.6 RAM memory: nVidia Corporation C51 Memory Controller 3 (rev a2)
00:00.7 RAM memory: nVidia Corporation C51 Memory Controller 2 (rev a2)
00:03.0 PCI bridge: nVidia Corporation C51 PCI Express Bridge (rev a1)
00:04.0 PCI bridge: nVidia Corporation C51 PCI Express Bridge (rev a1)
00:09.0 RAM memory: nVidia Corporation MCP51 Host Bridge (rev a2)
00:0a.0 ISA bridge: nVidia Corporation MCP51 LPC Bridge (rev a3)
00:0a.1 SMBus: nVidia Corporation MCP51 SMBus (rev a3)
00:0a.3 Co-processor: nVidia Corporation MCP51 PMU (rev a3)
00:0b.0 USB Controller: nVidia Corporation MCP51 USB Controller (rev a3=
)
00:0b.1 USB Controller: nVidia Corporation MCP51 USB Controller (rev a3=
)
00:0d.0 IDE interface: nVidia Corporation MCP51 IDE (rev a1)
00:10.0 PCI bridge: nVidia Corporation MCP51 PCI Bridge (rev a2)
00:10.1 Audio device: nVidia Corporation MCP51 High Definition Audio (r=
ev a2)
00:18.0 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]=
 HyperTransport Technology Configuration
00:18.1 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]=
 Address Map
00:18.2 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]=
 DRAM Controller
00:18.3 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]=
 Miscellaneous Control
01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. Unknown de=
vice 8168 (rev 01)
02:00.0 VGA compatible controller: nVidia Corporation Unknown device 03=
98 (rev a1)
03:01.0 CardBus bridge: Ricoh Co Ltd RL5c476 II (rev b3)
03:01.1 FireWire (IEEE 1394): Ricoh Co Ltd R5C552 IEEE 1394 Controller =
(rev 08)
03:01.2 Class 0805: Ricoh Co Ltd R5C822 SD/SDIO/MMC/MS/MSPro Host Adapt=
er (rev 17)
03:01.3 System peripheral: Ricoh Co Ltd R5C592 Memory Stick Bus Host Ad=
apter (rev 08)
03:03.0 Network controller: Broadcom Corporation BCM4318 [AirForce One =
54g] 802.11g Wireless LAN Controller (rev 02)
------------------------------END--------------------------------------=
-

dmesg:
-----------------------------BEGIN-------------------------------------=
-
Bootdata ok (command line is ro root=3DLABEL=3D/ noapic )
Linux version 2.6.17-1.2174_FC5 (brewbuilder@hs20-bc2-3.build.redhat.co=
m) (gcc version 4.1.1 20060525 (Red Hat 4.1.1-1)) #1 SMP Tue Aug 8 15:3=
0:44 EDT 2006
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000003ffc0000 (usable)
 BIOS-e820: 000000003ffc0000 - 000000003ffce000 (ACPI data)
 BIOS-e820: 000000003ffce000 - 000000003fff0000 (ACPI NVS)
 BIOS-e820: 000000003fff0000 - 0000000040000000 (reserved)
 BIOS-e820: 00000000fec00000 - 00000000fec01000 (reserved)
 BIOS-e820: 00000000fee00000 - 00000000fef00000 (reserved)
 BIOS-e820: 00000000ff7c0000 - 0000000100000000 (reserved)
DMI present.
ACPI: RSDP (v000 ACPIAM                                ) @ 0x0000000000=
0fbb90
ACPI: RSDT (v001 A M I  OEMRSDT  0x07000604 MSFT 0x00000097) @ 0x000000=
003ffc0000
ACPI: FADT (v002 A M I  OEMFACP  0x07000604 MSFT 0x00000097) @ 0x000000=
003ffc0200
ACPI: MADT (v001 A M I  OEMAPIC  0x07000604 MSFT 0x00000097) @ 0x000000=
003ffc0390
ACPI: MCFG (v001 A M I  OEMMCFG  0x07000604 MSFT 0x00000097) @ 0x000000=
003ffc0400
ACPI: OEMB (v001 A M I  AMI_OEM  0x07000604 MSFT 0x00000097) @ 0x000000=
003ffce040
ACPI: DSDT (v001  A0427 A0427000 0x00000000 INTL 0x02002026) @ 0x000000=
0000000000
Scanning NUMA topology in Northbridge 24
Number of nodes 1
Node 0 MemBase 0000000000000000 Limit 000000003ffc0000
NUMA: Using 63 for the hash shift.
Using node hash shift of 63
Bootmem setup node 0 0000000000000000-000000003ffc0000
On node 0 totalpages: 256338
  DMA zone: 2385 pages, LIFO batch:0
  DMA32 zone: 253953 pages, LIFO batch:31
Nvidia board detected. Ignoring ACPI timer override.
ACPI: PM-Timer IO Port: 0x508
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
Processor #0 15:8 APIC version 16
ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
Processor #1 15:8 APIC version 16
ACPI: Skipping IOAPIC probe due to 'noapic' option.
Using ACPI for processor (LAPIC) configuration information
Intel MultiProcessor Specification v1.4
    Virtual Wire compatibility mode.
OEM ID: ASUS     Product ID:  APIC at: 0xFEE00000
I/O APIC #2 Version 17 at 0xFEC00000.
Setting APIC routing to physical flat
Processors: 2
Allocating PCI resources starting at 50000000 (gap: 40000000:bec00000)
Checking aperture...
CPU 0: aperture @ 1f10000000 size 32 MB
Aperture from northbridge cpu 0 too small (32 MB)
No AGP bridge found
SMP: Allowing 2 CPUs, 0 hotplug CPUs
Built 1 zonelists
Kernel command line: ro root=3DLABEL=3D/ noapic
Initializing CPU#0
PID hash table entries: 4096 (order: 12, 32768 bytes)
Disabling vsyscall due to use of PM timer
time.c: Using 3.579545 MHz WALL PM GTOD PM timer.
time.c: Detected 1607.324 MHz processor.
Console: colour VGA+ 80x25
Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
Memory: 1022420k/1048320k available (2387k kernel code, 25512k reserved=
, 1700k data, 200k init)
Calibrating delay using timer specific routine.. 3218.77 BogoMIPS (lpj=3D=
6437557)
Security Framework v1.0.0 initialized
SELinux:  Initializing.
SELinux:  Starting in permissive mode
selinux_register_security:  Registering secondary module capability
Capability LSM initialized as secondary
Mount-cache hash table entries: 256
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 512K (64 bytes/line)
CPU 0/0(2) -> Node 0 -> Core 0
ACPI Error (psloop-0193): Found unknown opcode FD at AML address ffffc2=
0000016003 offset 5B9F, ignoring [20060127]
ACPI Error (psloop-0193): Found unknown opcode FD at AML address ffffc2=
00000160b2 offset 5C4E, ignoring [20060127]
ACPI Error (psloop-0193): Found unknown opcode FD at AML address ffffc2=
0000016003 offset 5B9F, ignoring [20060127]
ACPI Error (psloop-0193): Found unknown opcode FD at AML address ffffc2=
00000160b2 offset 5C4E, ignoring [20060127]
ACPI: setting ELCR to 0200 (from 0ca0)
Using local APIC timer interrupts.
result 12557166
Detected 12.557 MHz APIC timer.
Booting processor 1/2 APIC 0x1
Initializing CPU#1
spurious 8259A interrupt: IRQ7.
Calibrating delay using timer specific routine.. 3221.76 BogoMIPS (lpj=3D=
6443526)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 512K (64 bytes/line)
CPU 1/1(2) -> Node 0 -> Core 1
AMD Turion(tm) 64 X2 Mobile Technology TL-52 stepping 02
CPU 1: Syncing TSC to CPU 0.
CPU 1: synchronized TSC with CPU 0 (last diff 0 cycles, maxerr 462 cycl=
es)
Brought up 2 CPUs
testing NMI watchdog ... OK.
migration_cost=3D272
checking if image is initramfs... it is
=46reeing initrd memory: 1152k freed
NET: Registered protocol family 16
ACPI: bus type pci registered
PCI: BIOS Bug: MCFG area at e0000000 is not E820-reserved
PCI: Not using MMCONFIG.
PCI: Using configuration type 1
ACPI: Subsystem revision 20060127
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (0000:00)
PCI: Probing PCI hardware (bus 00)
Boot video device is 0000:02:00.0
PCI: Transparent bridge - 0000:00:10.0
PCI: Bus #04 (-#07) is hidden behind transparent bridge #03 (-#04) (try=
 'pci=3Dassign-busses')
Please report the result to linux-kernel to fix this permanently
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P9._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0PA._PRT]
ACPI: Embedded Controller [EC0] (gpe 32) interrupt mode.
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P1._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNKB] (IRQs 5 7 10 *11 14 15)
ACPI: PCI Interrupt Link [LNKC] (IRQs *5 7 10 11 14 15)
ACPI: PCI Interrupt Link [LNKD] (IRQs *5 7 10 11 14 15)
ACPI: PCI Interrupt Link [LNEA] (IRQs 5 7 10 *11 14 15)
ACPI: PCI Interrupt Link [LNEB] (IRQs 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNEC] (IRQs 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNED] (IRQs 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LUB0] (IRQs 5 7 10 *11 14 15)
ACPI: PCI Interrupt Link [LUB2] (IRQs 5 *7 10 11 14 15)
ACPI: PCI Interrupt Link [LMAC] (IRQs 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LAZA] (IRQs 5 7 *10 11 14 15)
ACPI: PCI Interrupt Link [LACI] (IRQs 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LMC9] (IRQs 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LSMB] (IRQs *5 7 10 11 14 15)
ACPI: PCI Interrupt Link [LPMU] (IRQs 5 7 *10 11 14 15)
ACPI: PCI Interrupt Link [LSA0] (IRQs 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LSA1] (IRQs 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LATA] (IRQs 5 7 10 11 14 15) *0, disabled.
Linux Plug and Play Support v0.97 (c) Adam Belay
pnp: PnP ACPI init
pnp: PnP ACPI: found 12 devices
usbcore: registered new driver usbfs
usbcore: registered new driver hub
PCI: Using ACPI for IRQ routing
PCI: If a device doesn't work, try "pci=3Drouteirq".  If it helps, post=
 a report
PCI-DMA: Disabling IOMMU.
PCI: Bridge: 0000:00:03.0
  IO window: c000-cfff
  MEM window: dcf00000-dcffffff
  PREFETCH window: disabled.
PCI: Bridge: 0000:00:04.0
  IO window: d000-dfff
  MEM window: dd000000-df6fffff
  PREFETCH window: c0000000-cfffffff
PCI: Bus 4, cardbus bridge: 0000:03:01.0
  IO window: 0000e000-0000e0ff
  IO window: 0000e400-0000e4ff
  PREFETCH window: da000000-dbffffff
  MEM window: 50000000-51ffffff
PCI: Bridge: 0000:00:10.0
  IO window: e000-efff
  MEM window: df700000-dfffffff
  PREFETCH window: da000000-dbffffff
PCI: Setting latency timer of device 0000:00:03.0 to 64
PCI: Setting latency timer of device 0000:00:04.0 to 64
PCI: Setting latency timer of device 0000:00:10.0 to 64
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 11
PCI: setting IRQ 11 as level-triggered
ACPI: PCI Interrupt 0000:03:01.0[A] -> Link [LNKB] -> GSI 11 (level, lo=
w) -> IRQ 11
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 6, 262144 bytes)
TCP established hash table entries: 131072 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 9, 2097152 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
IA32 emulation $Id: sys_ia32.c,v 1.32 2002/03/24 13:02:28 ak Exp $
audit: initializing netlink socket (disabled)
audit(1157298703.200:1): initialized
Total HugeTLB memory allocated, 0
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
SELinux:  Registering netfilter hooks
Initializing Cryptographic API
ksign: Installing public key data
Loading keyring
- Added public key D4AD441F6DB3F282
- User ID: Red Hat, Inc. (Kernel Module GPG key)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
PCI: Setting latency timer of device 0000:00:03.0 to 64
pcie_portdrv_probe->Dev[02fd:10de] has invalid IRQ. Check vendor BIOS
assign_interrupt_mode Found MSI capability
Allocate Port Service[0000:00:03.0:pcie00]
PCI: Setting latency timer of device 0000:00:04.0 to 64
pcie_portdrv_probe->Dev[02fb:10de] has invalid IRQ. Check vendor BIOS
assign_interrupt_mode Found MSI capability
Allocate Port Service[0000:00:04.0:pcie00]
pci_hotplug: PCI Hot Plug PCI Core version: 0.5
ACPI: Processor [CPU1] (supports 8 throttling states)
ACPI: Thermal Zone [TZ00] (63 C)
Real Time Clock Driver v1.12ac
Non-volatile memory driver v1.2
Linux agpgart interface v0.101 (c) Dave Jones
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enable=
d
RAMDISK driver initialized: 16 RAM disks of 16384K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebu=
s=3Dxx
NFORCE-MCP51: IDE controller at PCI slot 0000:00:0d.0
NFORCE-MCP51: chipset revision 161
NFORCE-MCP51: not 100% native mode: will probe irqs later
NFORCE-MCP51: 0000:00:0d.0 (rev a1) UDMA133 controller
    ide0: BM-DMA at 0xffa0-0xffa7, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0xffa8-0xffaf, BIOS settings: hdc:DMA, hdd:pio
Probing IDE interface ide0...
hda: TSSTcorpCD/DVDW TS-L632D, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Probing IDE interface ide1...
hdc: ST9100824A, ATA DISK drive
ide1 at 0x170-0x177,0x376 on irq 15
hdc: max request size: 512KiB
hdc: 195371568 sectors (100030 MB) w/8192KiB Cache, CHS=3D16383/255/63,=
 UDMA(100)
hdc: cache flushes supported
 hdc: hdc1 hdc2 hdc3 hdc4 < hdc5 hdc6 >
hda: ATAPI 24X DVD-ROM DVD-R-RAM CD-R/RW drive, 2048kB Cache, UDMA(33)
Uniform CD-ROM driver Revision: 3.20
ide-floppy driver 0.99.newide
ACPI: PCI Interrupt 0000:03:01.0[A] -> Link [LNKB] -> GSI 11 (level, lo=
w) -> IRQ 11
Yenta: CardBus bridge found at 0000:03:01.0 [1043:1367]
Yenta: ISA IRQ mask 0x0438, PCI irq 11
Socket status: 30000006
pcmcia: parent PCI bridge I/O window: 0xe000 - 0xefff
pcmcia: parent PCI bridge Memory window: 0xdf700000 - 0xdfffffff
pcmcia: parent PCI bridge Memory window: 0xda000000 - 0xdbffffff
usbcore: registered new driver libusual
usbcore: registered new driver hiddev
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.6:USB HID core driver
PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
i8042.c: Detected active multiplexing controller, rev 1.1.
serio: i8042 AUX0 port at 0x60,0x64 irq 12
serio: i8042 AUX1 port at 0x60,0x64 irq 12
serio: i8042 AUX2 port at 0x60,0x64 irq 12
serio: i8042 AUX3 port at 0x60,0x64 irq 12
serio: i8042 KBD port at 0x60,0x64 irq 1
mice: PS/2 mouse device common for all mice
md: md driver 0.90.3 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
md: bitmap version 4.39
TCP bic registered
Initializing IPsec netlink socket
NET: Registered protocol family 1
NET: Registered protocol family 17
powernow-k8: Found 2 AMD Athlon 64 / Opteron processors (version 1.60.2=
)
powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x13 (1075 mV)
powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x1e (800 mV)
cpu_init done, current fid 0x8, vid 0x11
powernow-k8: ph2 null fid transition 0x8
ACPI wakeup devices:
P0P8 P0P9 RTGB P0PA NSMB USB0 USB2 P0P1  CBC FIRE WLAN HDAC MC97 SLPB
ACPI: (supports S0 S1 S3 S4 S5)
=46reeing unused kernel memory: 200k freed
Write protecting the kernel read-only data: 919k
input: AT Translated Set 2 keyboard as /class/input/input0
SCSI subsystem initialized
libata version 1.20 loaded.
device-mapper: 4.6.0-ioctl (2006-02-17) initialised: dm-devel@redhat.co=
m
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
Synaptics Touchpad, model: 1, fw: 6.1, id: 0xa3a0b3, caps: 0xa04713/0x1=
0008
input: SynPS/2 Synaptics TouchPad as /class/input/input1
audit(1157298707.588:2): enforcing=3D1 old_enforcing=3D0 auid=3D4294967=
295
security:  3 users, 6 roles, 1481 types, 152 bools, 1 sens, 256 cats
security:  58 classes, 43474 rules
SELinux:  Completing initialization.
SELinux:  Setting up existing superblocks.
SELinux: initialized (dev hdc3, type ext3), uses xattr
SELinux: initialized (dev tmpfs, type tmpfs), uses transition SIDs
SELinux: initialized (dev debugfs, type debugfs), uses genfs_contexts
SELinux: initialized (dev selinuxfs, type selinuxfs), uses genfs_contex=
ts
SELinux: initialized (dev mqueue, type mqueue), uses transition SIDs
SELinux: initialized (dev hugetlbfs, type hugetlbfs), uses genfs_contex=
ts
SELinux: initialized (dev devpts, type devpts), uses transition SIDs
SELinux: initialized (dev eventpollfs, type eventpollfs), uses task SID=
s
SELinux: initialized (dev inotifyfs, type inotifyfs), uses genfs_contex=
ts
SELinux: initialized (dev tmpfs, type tmpfs), uses transition SIDs
SELinux: initialized (dev futexfs, type futexfs), uses genfs_contexts
SELinux: initialized (dev pipefs, type pipefs), uses task SIDs
SELinux: initialized (dev sockfs, type sockfs), uses task SIDs
SELinux: initialized (dev cpuset, type cpuset), not configured for labe=
ling
SELinux: initialized (dev proc, type proc), uses genfs_contexts
SELinux: initialized (dev bdev, type bdev), uses genfs_contexts
SELinux: initialized (dev rootfs, type rootfs), uses genfs_contexts
SELinux: initialized (dev sysfs, type sysfs), uses genfs_contexts
audit(1157298707.832:3): policy loaded auid=3D4294967295
SELinux: initialized (dev usbfs, type usbfs), uses genfs_contexts
ohci_hcd: 2005 April 22 USB 1.1 'Open' Host Controller (OHCI) Driver (P=
CI)
ACPI: PCI Interrupt Link [LUB0] enabled at IRQ 11
ACPI: PCI Interrupt 0000:00:0b.0[A] -> Link [LUB0] -> GSI 11 (level, lo=
w) -> IRQ 11
PCI: Setting latency timer of device 0000:00:0b.0 to 64
ohci_hcd 0000:00:0b.0: OHCI Host Controller
ohci_hcd 0000:00:0b.0: new USB bus registered, assigned bus number 1
ohci_hcd 0000:00:0b.0: irq 11, io mem 0xdcebe000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 8 ports detected
ACPI: PCI Interrupt Link [LUB2] enabled at IRQ 7
PCI: setting IRQ 7 as level-triggered
ACPI: PCI Interrupt 0000:00:0b.1[B] -> Link [LUB2] -> GSI 7 (level, low=
) -> IRQ 7
PCI: Setting latency timer of device 0000:00:0b.1 to 64
ehci_hcd 0000:00:0b.1: EHCI Host Controller
ehci_hcd 0000:00:0b.1: new USB bus registered, assigned bus number 2
ehci_hcd 0000:00:0b.1: debug port 1
PCI: cache line size of 64 is not supported by device 0000:00:0b.1
ehci_hcd 0000:00:0b.1: irq 7, io mem 0xdcebfc00
ehci_hcd 0000:00:0b.1: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 8 ports detected
ACPI: PCI Interrupt Link [LNEA] enabled at IRQ 11
ACPI: PCI Interrupt 0000:01:00.0[A] -> Link [LNEA] -> GSI 11 (level, lo=
w) -> IRQ 11
PCI: Setting latency timer of device 0000:01:00.0 to 64
eth0: Identified chip type is 'RTL8168B/8111B'.
eth0: r10001.03, the Linux device driver for Realtek Ethernet Controlle=
rs at 0xc800, 00:17:31:f3:b6:e5, IRQ 11
eth0: Auto-negotiation Enabled.
Realtek RTL8168/8111 Family PCI-E Gigabit Ethernet Network Adapter
Driver version:1.03
Released date:2006/05/26
Link Status:Linked
Link Speed:100Mbps
Duplex mode:Full-Duplex
I/O Base:0xC800(I/O port)
IRQ:11
ieee1394: Initialized config rom entry `ip1394'
sdhci: Secure Digital Host Controller Interface driver, 0.11
sdhci: Copyright(c) Pierre Ossman
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 5
PCI: setting IRQ 5 as level-triggered
ACPI: PCI Interrupt 0000:03:01.2[C] -> Link [LNKD] -> GSI 5 (level, low=
) -> IRQ 5
mmc0: SDHCI at 0xdf7ff800 irq 5 PIO
usb 2-1: new high speed USB device using ehci_hcd and address 2
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 5
ACPI: PCI Interrupt 0000:03:01.1[B] -> Link [LNKC] -> GSI 5 (level, low=
) -> IRQ 5
ohci1394: fw-host0: OHCI-1394 1.0 (PCI): IRQ=3D[5]  MMIO=3D[df7ff000-df=
7ff7ff]  Max Packet=3D[2048]  IR/IT contexts=3D[4/4]
usb 2-1: configuration #1 chosen from 1 choice
nvidia: module license 'NVIDIA' taints kernel.
ACPI: PCI Interrupt 0000:02:00.0[A] -> Link [LNEA] -> GSI 11 (level, lo=
w) -> IRQ 11
PCI: Setting latency timer of device 0000:02:00.0 to 64
NVRM: loading NVIDIA Linux x86_64 Kernel Module  1.0-8774  Tue Aug  1 2=
1:42:17 PDT 2006
usb 2-3: new high speed USB device using ehci_hcd and address 3
usb 2-3: configuration #1 chosen from 1 choice
Initializing USB Mass Storage driver...
usb 2-5: new high speed USB device using ehci_hcd and address 5
usb 2-5: configuration #1 chosen from 1 choice
ieee1394: Host added: ID:BUS[0-00:1023]  GUID[00e0180003607b43]
ohci_hcd 0000:00:0b.0: wakeup
ACPI: PCI Interrupt Link [LAZA] enabled at IRQ 10
PCI: setting IRQ 10 as level-triggered
ACPI: PCI Interrupt 0000:00:10.1[B] -> Link [LAZA] -> GSI 10 (level, lo=
w) -> IRQ 10
PCI: Setting latency timer of device 0000:00:10.1 to 64
scsi0 : SCSI emulation for USB Mass Storage devices
usb-storage: device found at 3
usb-storage: waiting for device to settle before scanning
usbcore: registered new driver usb-storage
USB Mass Storage support registered.
usbcore: registered new driver snd-usb-audio
usb 1-4: new low speed USB device using ohci_hcd and address 2
hda_codec: Unknown model for ALC861, trying auto-probe from BIOS...
usb 1-4: configuration #1 chosen from 1 choice
input: Logitech USB-PS/2 Optical Mouse as /class/input/input2
input: USB HID v1.10 Mouse [Logitech USB-PS/2 Optical Mouse] on usb-000=
0:00:0b.0-4
usb 1-7: new full speed USB device using ohci_hcd and address 3
usb 1-7: configuration #1 chosen from 1 choice
Bluetooth: Core ver 2.8
NET: Registered protocol family 31
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: HCI USB driver ver 2.9
usbcore: registered new driver hci_usb
floppy0: no floppy controllers found
lp: driver loaded but no devices found
  Vendor: SAMSUNG   Model: HD300LD           Rev: 0000
  Type:   Direct-Access                      ANSI SCSI revision: 00
SCSI device sda: 586072368 512-byte hdwr sectors (300069 MB)
sda: Write Protect is off
sda: Mode Sense: 27 00 00 00
sda: assuming drive cache: write through
SCSI device sda: 586072368 512-byte hdwr sectors (300069 MB)
sda: Write Protect is off
sda: Mode Sense: 27 00 00 00
sda: assuming drive cache: write through
 sda: sda1 sda2
sd 0:0:0:0: Attached scsi disk sda
usb-storage: device scan complete
sd 0:0:0:0: Attached scsi generic sg0 type 0
ACPI: AC Adapter [AC0] (on-line)
Asus Laptop ACPI Extras version 0.29
  Error calling BSTS
  A6T model detected, unsupported, trying default values, supply the de=
velopers with your DSDT
ACPI: Battery Slot [BAT0] (battery present)
ACPI: Power Button (FF) [PWRF]
ACPI: Sleep Button (CM) [SLPB]
ACPI: Lid Switch [LID]
ACPI: Power Button (CM) [PWRB]
ibm_acpi: ec object not found
ACPI: Video Device [VGA] (multi-head: yes  rom: no  post: no)
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
EXT3 FS on hdc3, internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS on hdc2, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
SELinux: initialized (dev hdc2, type ext3), uses xattr
SELinux: initialized (dev tmpfs, type tmpfs), uses transition SIDs
SELinux: initialized (dev hdc1, type vfat), uses genfs_contexts
Adding 2048248k swap on /dev/hdc5.  Priority:-1 extents:1 across:204824=
8k
SELinux: initialized (dev binfmt_misc, type binfmt_misc), uses genfs_co=
ntexts
ip_tables: (C) 2000-2006 Netfilter Core Team
Netfilter messages via NETLINK v0.30.
ip_conntrack version 2.4 (4095 buckets, 32760 max) - 304 bytes per conn=
track
ndiswrapper version 1.18 loaded (preempt=3Dno,smp=3Dyes)
ndiswrapper (load_pe_images:573): fixing KI_USER_SHARED_DATA address in=
 the driver
ndiswrapper: driver bcmwl5 (Broadcom,02/11/2005, 3.100.64.0) loaded
ACPI: PCI Interrupt 0000:03:03.0[A] -> Link [LNKB] -> GSI 11 (level, lo=
w) -> IRQ 11
ndiswrapper: using irq 11
wlan0: vendor: ''
wlan0: ndiswrapper ethernet device 00:17:31:e4:b2:2f using driver bcmwl=
5, 14E4:4318.5.conf
wlan0: encryption modes supported: WEP; TKIP with WPA, WPA2, WPA2PSK; A=
ES/CCMP with WPA, WPA2, WPA2PSK
ndiswrapper (iw_set_bitrate:502): setting bit rate failed (C00000BB)
SELinux: initialized (dev rpc_pipefs, type rpc_pipefs), uses genfs_cont=
exts
Bluetooth: L2CAP ver 2.8
Bluetooth: L2CAP socket layer initialized
Bluetooth: HIDP (Human Interface Emulation) ver 1.1
SELinux: initialized (dev autofs, type autofs), uses genfs_contexts
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
IPv6 over IPv4 tunneling driver
audit(1157298743.743:4): avc:  denied  { read } for  pid=3D2341 comm=3D=
"gpm" name=3D"localtime" dev=3Dhdc3 ino=3D2807083 scontext=3Dsystem_u:s=
ystem_r:gpm_t:s0 tcontext=3Duser_u:object_r:etc_t:s0 tclass=3Dfile
audit(1157298743.743:5): avc:  denied  { read } for  pid=3D2341 comm=3D=
"gpm" name=3D"localtime" dev=3Dhdc3 ino=3D2807083 scontext=3Dsystem_u:s=
ystem_r:gpm_t:s0 tcontext=3Duser_u:object_r:etc_t:s0 tclass=3Dfile
audit(1157298743.743:6): avc:  denied  { read } for  pid=3D2341 comm=3D=
"gpm" name=3D"localtime" dev=3Dhdc3 ino=3D2807083 scontext=3Dsystem_u:s=
ystem_r:gpm_t:s0 tcontext=3Duser_u:object_r:etc_t:s0 tclass=3Dfile
audit(1157298743.747:7): avc:  denied  { read } for  pid=3D2341 comm=3D=
"gpm" name=3D"localtime" dev=3Dhdc3 ino=3D2807083 scontext=3Dsystem_u:s=
ystem_r:gpm_t:s0 tcontext=3Duser_u:object_r:etc_t:s0 tclass=3Dfile
audit(1157298743.755:8): avc:  denied  { read } for  pid=3D2341 comm=3D=
"gpm" name=3D"localtime" dev=3Dhdc3 ino=3D2807083 scontext=3Dsystem_u:s=
ystem_r:gpm_t:s0 tcontext=3Duser_u:object_r:etc_t:s0 tclass=3Dfile
audit(1157298743.755:9): avc:  denied  { read } for  pid=3D2341 comm=3D=
"gpm" name=3D"localtime" dev=3Dhdc3 ino=3D2807083 scontext=3Dsystem_u:s=
ystem_r:gpm_t:s0 tcontext=3Duser_u:object_r:etc_t:s0 tclass=3Dfile
audit(1157298743.759:10): avc:  denied  { read } for  pid=3D2341 comm=3D=
"gpm" name=3D"localtime" dev=3Dhdc3 ino=3D2807083 scontext=3Dsystem_u:s=
ystem_r:gpm_t:s0 tcontext=3Duser_u:object_r:etc_t:s0 tclass=3Dfile
eth0: no IPv6 routers present
eth1: no IPv6 routers present
kjournald starting.  Commit interval 5 seconds
EXT3 FS on dm-0, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
SELinux: initialized (dev dm-0, type ext3), uses xattr
application artsd uses obsolete OSS audio interface
application xmms uses obsolete OSS audio interface
irq 7: nobody cared (try booting with the "irqpoll" option)

Call Trace: <IRQ> <ffffffff802b3317>{__report_bad_irq+48}
       <ffffffff802b3515>{note_interrupt+433} <ffffffff802b2e2e>{__do_I=
RQ+189}
       <ffffffff80271506>{do_IRQ+60} <ffffffff8026ff23>{default_idle+0}
       <ffffffff8026302a>{ret_from_intr+0} <EOI> <ffffffff8026ff23>{def=
ault_idle+0}
       <ffffffff802678f6>{thread_return+0} <ffffffff8026ff4e>{default_i=
dle+43}
       <ffffffff8024c90d>{cpu_idle+151} <ffffffff80279f14>{start_second=
ary+1131}
handlers:
[<ffffffff803d36f1>] (usb_hcd_irq+0x0/0x55)
Disabling IRQ #7
------------------------------END--------------------------------------=
-

Thank you for your help in advance!

Best regards,
simeon

_______________________________________________________________________=
___
Erweitern Sie FreeMail zu einem noch leistungsst=E4rkeren E-Mail-Postfa=
ch!	=09
Mehr Infos unter http://freemail.web.de/home/landingpad/?mc=3D021131


--=20
VGER BF report: U 0.5
-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
