From: Peter Koellner <peter@asgalon.net>
Subject: testing kernel 2.6.0-test9 on a dell inspiron 5150
Date: Sun, 30 Nov 2003 17:01:32 +0100 (CET)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0311301619080.1230@noisydwarf>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

hi!

yesterday i have downloaded and installed kernel 2.6.0-test9 on a dell insprion
5150 laptop. since i have only just discovered that i missed the test11
version, i won't go into too much details and provide some more recent infos
later, and split that into laptop-specific and kernel-related topics too.

so these are only a few impressions:

1. general

basically, the kernel works. it does not freeze on startup, the display
looks ok, harddisk and dvd-burner are recognized. the broadcom ethernet and
wlan cards are not recognized immediately due to broadcoms driver policy.
the linuxant wlan driverloader module compiles and works. i did not yet
test the latest version of the bcm4400 ethernet driver from broadcom, the one
i am using for kernel 2.4 did not compile.

2. possible problems

first of all, the hard disc seems to be overly active. i don't know if
there is still a configuration problem or some driver problem. i will
check in detail with the latest kernel version.

/proc/acpi/thermal_zone/THM/temperature shows 72 C, and the fan blows at
full power, the air is really hot. top shows 62% system activity, with
event/0 eating CPU time. i am not sure what that means.
i have aborted the test at that point to avoid damages by high temperature..

uhci does not recognize the logitec wireless mouse anymore.


i guess i could start collecting bug reports and test results soon...


some system infos (collected with kernel 2.4.21):


/proc/cpuinfo

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Genuine Intel(R) CPU 3.06GHz
stepping        : 9
cpu MHz         : 3056.515
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips        : 6094.84

lspci

00:00.0 Host bridge: Intel Corp. 82852/855GM Host Bridge (rev 02)
00:00.1 System peripheral: Intel Corp.: Unknown device 3584 (rev 02)
00:00.3 System peripheral: Intel Corp.: Unknown device 3585 (rev 02)
00:01.0 PCI bridge: Intel Corp.: Unknown device 3581 (rev 02)
00:1d.0 USB Controller: Intel Corp. 82801DB USB (Hub #1) (rev 01)
00:1d.1 USB Controller: Intel Corp. 82801DB USB (Hub #2) (rev 01)
00:1d.2 USB Controller: Intel Corp. 82801DB USB (Hub #3) (rev 01)
00:1d.7 USB Controller: Intel Corp. 82801DB USB2 (rev 01)
00:1e.0 PCI bridge: Intel Corp. 82801BAM/CAM PCI Bridge (rev 81)
00:1f.0 ISA bridge: Intel Corp. 82801DBM LPC Interface Controller (rev 01)
00:1f.1 IDE interface: Intel Corp. 82801DBM Ultra ATA Storage Controller (rev 01)
00:1f.5 Multimedia audio controller: Intel Corp. 82801DB AC'97 Audio Controller (rev 01)
00:1f.6 Modem: Intel Corp. 82801DB AC'97 Modem Controller (rev 01)
01:00.0 VGA compatible controller: ATI Technologies Inc Radeon R250 Lf [Radeon Mobility 9000 M9] (rev 02)
02:01.0 Ethernet controller: Broadcom Corporation BCM4401 100Base-T (rev 01)
02:02.0 Network controller: Broadcom Corporation BCM94306 802.11g (rev 02)
02:04.0 CardBus bridge: Texas Instruments PCI4510 PC card Cardbus Controller (rev 02)
02:04.1 FireWire (IEEE 1394): Texas Instruments PCI4510 IEEE-1394 Controller


kernel parameters:

kernel /boot/vmlinuz-2.6.0-test9 root=/dev/hdc5 acpi=on agp_try_unsupported=1 hda=ide-scsi


dmesg:


Nov 29 22:23:25 noisydwarf syslogd 1.4.1#13: restart.
Nov 29 22:23:25 noisydwarf kernel: klogd 1.4.1#13, log source = /proc/kmsg started.
Nov 29 22:23:25 noisydwarf kernel: Inspecting /boot/System.map-2.6.0-test9
Nov 29 22:23:25 noisydwarf kernel: Loaded 31329 symbols from /boot/System.map-2.6.0-test9.
Nov 29 22:23:25 noisydwarf kernel: Symbols match kernel version 2.6.0.
Nov 29 22:23:25 noisydwarf kernel: No module symbols loaded - kernel modules not enabled.
Nov 29 22:23:25 noisydwarf kernel: Linux version 2.6.0-test9 (root@noisydwarf) (gcc version 3.3.2 (Debian)) #3 Sat Nov 29 22:21:14 CET 2003
Nov 29 22:23:25 noisydwarf kernel: BIOS-provided physical RAM map:
Nov 29 22:23:25 noisydwarf kernel:  BIOS-e820: 0000000000000000 - 000000000009f000 (usable)
Nov 29 22:23:25 noisydwarf kernel:  BIOS-e820: 000000000009f000 - 00000000000a0000 (reserved)
Nov 29 22:23:25 noisydwarf kernel:  BIOS-e820: 0000000000100000 - 000000003ffcf800 (usable)
Nov 29 22:23:25 noisydwarf kernel:  BIOS-e820: 000000003ffcf800 - 0000000040000000 (reserved)
Nov 29 22:23:25 noisydwarf kernel:  BIOS-e820: 00000000fec00000 - 00000000fec20000 (reserved)
Nov 29 22:23:25 noisydwarf kernel:  BIOS-e820: 00000000feda0000 - 00000000fee10000 (reserved)
Nov 29 22:23:25 noisydwarf kernel:  BIOS-e820: 00000000ffb00000 - 0000000100000000 (reserved)
Nov 29 22:23:25 noisydwarf kernel: 127MB HIGHMEM available.
Nov 29 22:23:25 noisydwarf kernel: 896MB LOWMEM available.
Nov 29 22:23:25 noisydwarf kernel: On node 0 totalpages: 262095
Nov 29 22:23:25 noisydwarf kernel:   DMA zone: 4096 pages, LIFO batch:1
Nov 29 22:23:25 noisydwarf kernel:   Normal zone: 225280 pages, LIFO batch:16
Nov 29 22:23:25 noisydwarf kernel:   HighMem zone: 32719 pages, LIFO batch:7
Nov 29 22:23:25 noisydwarf kernel: DMI 2.3 present.
Nov 29 22:23:25 noisydwarf kernel: Dell Inspiron with broken BIOS detected. Refusing to enable the local APIC.
Nov 29 22:23:25 noisydwarf kernel: ACPI: RSDP (v000 DELL                                      ) @ 0x000fdea0
Nov 29 22:23:25 noisydwarf kernel: ACPI: RSDT (v001 DELL    CPi R   0x27d30813 ASL  0x00000061) @ 0x3fff0000
Nov 29 22:23:25 noisydwarf kernel: ACPI: FADT (v001 DELL    CPi R   0x27d30813 ASL  0x00000061) @ 0x3fff0400
Nov 29 22:23:25 noisydwarf kernel: ACPI: MADT (v001 DELL    CPi R   0x27d30813 ASL  0x00000047) @ 0x3fff0c00
Nov 29 22:23:25 noisydwarf kernel: ACPI: DSDT (v001 INT430 SYSFexxx 0x00001001 MSFT 0x0100000e) @ 0x00000000
Nov 29 22:23:25 noisydwarf kernel: ACPI: Local APIC address 0xfee00000
Nov 29 22:23:25 noisydwarf kernel: ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
Nov 29 22:23:25 noisydwarf kernel: Processor #0 15:2 APIC version 20
Nov 29 22:23:25 noisydwarf kernel: ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] disabled)
Nov 29 22:23:25 noisydwarf kernel: ACPI: LAPIC_NMI (acpi_id[0x00] polarity[0x1] trigger[0x1] lint[0x1])
Nov 29 22:23:25 noisydwarf kernel: ACPI: LAPIC_NMI (acpi_id[0x01] polarity[0x1] trigger[0x1] lint[0x1])
Nov 29 22:23:25 noisydwarf kernel: ACPI: IOAPIC (id[0x01] address[0xfec00000] global_irq_base[0x0])
Nov 29 22:23:25 noisydwarf kernel: IOAPIC[0]: Assigned apic_id 1
Nov 29 22:23:25 noisydwarf kernel: IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, IRQ 0-23
Nov 29 22:23:25 noisydwarf kernel: ACPI: INT_SRC_OVR (bus[0] irq[0x0] global_irq[0x2] polarity[0x0] trigger[0x0])
Nov 29 22:23:25 noisydwarf kernel: ACPI: INT_SRC_OVR (bus[0] irq[0x9] global_irq[0x9] polarity[0x1] trigger[0x3])
Nov 29 22:23:25 noisydwarf kernel: Enabling APIC mode:  Flat.  Using 1 I/O APICs
Nov 29 22:23:25 noisydwarf kernel: Using ACPI (MADT) for SMP configuration information
Nov 29 22:23:25 noisydwarf kernel: Building zonelist for node : 0
Nov 29 22:23:25 noisydwarf kernel: Kernel command line: root=/dev/hdc5 acpi=on agp_try_unsupported=1 hda=ide-scsi
Nov 29 22:23:25 noisydwarf kernel: ide_setup: hda=ide-scsi
Nov 29 22:23:25 noisydwarf kernel: Initializing CPU#0
Nov 29 22:23:25 noisydwarf kernel: PID hash table entries: 4096 (order 12: 32768 bytes)
Nov 29 22:23:25 noisydwarf kernel: Detected 3057.238 MHz processor.
Nov 29 22:23:25 noisydwarf kernel: Console: colour VGA+ 80x25
Nov 29 22:23:25 noisydwarf kernel: Memory: 1033248k/1048380k available (2379k kernel code, 14212k reserved, 991k data, 152k init, 130876k highmem)
Nov 29 22:23:25 noisydwarf kernel: Calibrating delay loop... 6045.69 BogoMIPS
Nov 29 22:23:25 noisydwarf kernel: Security Scaffold v1.0.0 initialized
Nov 29 22:23:25 noisydwarf kernel: Capability LSM initialized
Nov 29 22:23:25 noisydwarf kernel: Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Nov 29 22:23:25 noisydwarf kernel: Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Nov 29 22:23:25 noisydwarf kernel: Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Nov 29 22:23:25 noisydwarf kernel: CPU: Trace cache: 12K uops, L1 D cache: 8K
Nov 29 22:23:25 noisydwarf kernel: CPU: L2 cache: 512K
Nov 29 22:23:25 noisydwarf kernel: Intel machine check architecture supported.
Nov 29 22:23:25 noisydwarf kernel: Intel machine check reporting enabled on CPU#0.
Nov 29 22:23:25 noisydwarf kernel: CPU#0: Intel P4/Xeon Extended MCE MSRs (12) available
Nov 29 22:23:25 noisydwarf kernel: CPU#0: Thermal monitoring enabled
Nov 29 22:23:25 noisydwarf kernel: CPU: Intel Genuine Intel(R) CPU 3.06GHz stepping 09
Nov 29 22:23:25 noisydwarf kernel: Enabling fast FPU save and restore... done.
Nov 29 22:23:25 noisydwarf kernel: Enabling unmasked SIMD FPU exception support... done.
Nov 29 22:23:25 noisydwarf kernel: Checking 'hlt' instruction... OK.
Nov 29 22:23:25 noisydwarf kernel: POSIX conformance testing by UNIFIX
Nov 29 22:23:25 noisydwarf kernel: NET: Registered protocol family 16
Nov 29 22:23:25 noisydwarf kernel: PCI: PCI BIOS revision 2.10 entry at 0xfcf1e, last bus=2
Nov 29 22:23:25 noisydwarf kernel: PCI: Using configuration type 1
Nov 29 22:23:25 noisydwarf kernel: mtrr: v2.0 (20020519)
Nov 29 22:23:25 noisydwarf kernel: ACPI: Subsystem revision 20031002
Nov 29 22:23:25 noisydwarf kernel: ACPI: Interpreter enabled
Nov 29 22:23:25 noisydwarf kernel: ACPI: Using IOAPIC for interrupt routing
Nov 29 22:23:25 noisydwarf kernel: ACPI: PCI Root Bridge [PCI0] (00:00)
Nov 29 22:23:25 noisydwarf kernel: PCI: Probing PCI hardware (bus 00)
Nov 29 22:23:25 noisydwarf kernel: PCI: Ignoring BAR0-3 of IDE controller 0000:00:1f.1
Nov 29 22:23:25 noisydwarf kernel: Transparent bridge - 0000:00:1e.0
Nov 29 22:23:25 noisydwarf kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 9 10 *11)
Nov 29 22:23:25 noisydwarf kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 5 7)
Nov 29 22:23:25 noisydwarf kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 9 10 *11)
Nov 29 22:23:25 noisydwarf kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 5 7 9 10 *11)
Nov 29 22:23:25 noisydwarf kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
Nov 29 22:23:25 noisydwarf kernel: ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
Nov 29 22:23:25 noisydwarf kernel: Linux Plug and Play Support v0.97 (c) Adam Belay
Nov 29 22:23:25 noisydwarf kernel: PnPBIOS: Scanning system for PnP BIOS support...
Nov 29 22:23:25 noisydwarf kernel: PnPBIOS: Found PnP BIOS installation structure at 0xc00fe2d0
Nov 29 22:23:25 noisydwarf kernel: PnPBIOS: PnP BIOS version 1.0, entry 0xf0000:0xe2f4, dseg 0x40
Nov 29 22:23:25 noisydwarf kernel: PnPBIOS: 12 nodes reported by PnP BIOS; 12 recorded by driver
Nov 29 22:23:25 noisydwarf kernel: SCSI subsystem initialized
Nov 29 22:23:25 noisydwarf kernel: Linux Kernel Card Services
Nov 29 22:23:25 noisydwarf kernel:   options:  [pci] [cardbus] [pm]
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/core/usb.c: registered new driver usbfs
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/core/usb.c: registered new driver hub
Nov 29 22:23:25 noisydwarf kernel: PCI: Using ACPI for IRQ routing
Nov 29 22:23:25 noisydwarf kernel: PCI: if you experience problems, try using option 'pci=noacpi' or even 'acpi=off'
Nov 29 22:23:25 noisydwarf kernel: Machine check exception polling timer started.
Nov 29 22:23:25 noisydwarf kernel: cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
Nov 29 22:23:25 noisydwarf kernel: ikconfig 0.7 with /proc/config*
Nov 29 22:23:25 noisydwarf kernel: highmem bounce pool size: 64 pages
Nov 29 22:23:25 noisydwarf kernel: Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Nov 29 22:23:25 noisydwarf kernel: udf: registering filesystem
Nov 29 22:23:25 noisydwarf kernel: Initializing Cryptographic API
Nov 29 22:23:25 noisydwarf kernel: ACPI: AC Adapter [AC] (on-line)
Nov 29 22:23:25 noisydwarf kernel: ACPI: Battery Slot [BAT0] (battery present)
Nov 29 22:23:25 noisydwarf kernel: ACPI: Lid Switch [LID]
Nov 29 22:23:25 noisydwarf kernel: ACPI: Power Button (CM) [PBTN]
Nov 29 22:23:25 noisydwarf kernel: ACPI: Sleep Button (CM) [SBTN]
Nov 29 22:23:25 noisydwarf kernel: ACPI: Processor [CPU0] (supports C1 C2 C3, 8 throttling states)
Nov 29 22:23:25 noisydwarf kernel: ACPI: Thermal Zone [THM] (58 C)
Nov 29 22:23:25 noisydwarf kernel: pty: 256 Unix98 ptys configured
Nov 29 22:23:25 noisydwarf kernel: i8k: unable to get SMM Dell signature
Nov 29 22:23:25 noisydwarf kernel: i8k: unable to get SMM BIOS version
Nov 29 22:23:25 noisydwarf kernel: Linux agpgart interface v0.100 (c) Dave Jones
Nov 29 22:23:25 noisydwarf kernel: agpgart: Detected an Intel 855GM Chipset.
Nov 29 22:23:25 noisydwarf kernel: agpgart: Maximum main memory to use for agp memory: 941M
Nov 29 22:23:25 noisydwarf kernel: agpgart: AGP aperture is 128M @ 0xe0000000
Nov 29 22:23:25 noisydwarf kernel: [drm] Initialized radeon 1.9.0 20020828 on minor 0
Nov 29 22:23:25 noisydwarf kernel: Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
Nov 29 22:23:25 noisydwarf kernel: ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
Nov 29 22:23:25 noisydwarf kernel: ICH4: IDE controller at PCI slot 0000:00:1f.1
Nov 29 22:23:25 noisydwarf kernel: PCI: Enabling device 0000:00:1f.1 (0005 -> 0007)
Nov 29 22:23:25 noisydwarf kernel: ICH4: chipset revision 1
Nov 29 22:23:25 noisydwarf kernel: ICH4: not 100%% native mode: will probe irqs later
Nov 29 22:23:25 noisydwarf kernel:     ide0: BM-DMA at 0xbfa0-0xbfa7, BIOS settings: hda:DMA, hdb:pio
Nov 29 22:23:25 noisydwarf kernel:     ide1: BM-DMA at 0xbfa8-0xbfaf, BIOS settings: hdc:DMA, hdd:pio
Nov 29 22:23:25 noisydwarf kernel: hda: PHILIPS DVD+RW SDVD6004, ATAPI CD/DVD-ROM drive
Nov 29 22:23:25 noisydwarf kernel: Using anticipatory io scheduler
Nov 29 22:23:25 noisydwarf kernel: ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Nov 29 22:23:25 noisydwarf kernel: hdc: FUJITSU MHT2060AT, ATA DISK drive
Nov 29 22:23:25 noisydwarf kernel: ide1 at 0x170-0x177,0x376 on irq 15
Nov 29 22:23:25 noisydwarf kernel: hdc: max request size: 128KiB
Nov 29 22:23:25 noisydwarf kernel: hdc: 117210240 sectors (60011 MB) w/2048KiB Cache, CHS=65535/16/63, UDMA(100)
Nov 29 22:23:25 noisydwarf kernel:  hdc: hdc1 hdc2 hdc3 hdc4 < hdc5 hdc6 hdc7 >
Nov 29 22:23:25 noisydwarf kernel: scsi0 : SCSI host adapter emulation for IDE ATAPI devices
Nov 29 22:23:25 noisydwarf kernel:   Vendor: PHILIPS   Model: DVD+RW SDVD6004   Rev: 0.99
Nov 29 22:23:25 noisydwarf kernel:   Type:   CD-ROM                             ANSI SCSI revision: 02
Nov 29 22:23:25 noisydwarf kernel: sr0: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
Nov 29 22:23:25 noisydwarf kernel: Uniform CD-ROM driver Revision: 3.12
Nov 29 22:23:25 noisydwarf kernel: Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 5
Nov 29 22:23:25 noisydwarf kernel: PCI: Enabling device 0000:02:04.0 (0000 -> 0002)
Nov 29 22:23:25 noisydwarf kernel: Yenta: CardBus bridge found at 0000:02:04.0 [1028:015f]
Nov 29 22:23:25 noisydwarf kernel: Yenta: ISA IRQ list 04f8, PCI irq16
Nov 29 22:23:25 noisydwarf kernel: Socket status: 30000006
Nov 29 22:23:25 noisydwarf kernel: ehci_hcd 0000:00:1d.7: EHCI Host Controller
Nov 29 22:23:25 noisydwarf kernel: ehci_hcd 0000:00:1d.7: irq 23, pci mem f8841c00
Nov 29 22:23:25 noisydwarf kernel: ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 1
Nov 29 22:23:25 noisydwarf kernel: ehci_hcd 0000:00:1d.7: enabled 64bit PCI DMA
Nov 29 22:23:25 noisydwarf kernel: PCI: cache line size of 128 is not supported by device 0000:00:1d.7
Nov 29 22:23:25 noisydwarf kernel: ehci_hcd 0000:00:1d.7: USB 2.0 enabled, EHCI 1.00, driver 2003-Jun-13
Nov 29 22:23:25 noisydwarf kernel: hub 1-0:1.0: USB hub found
Nov 29 22:23:25 noisydwarf kernel: hub 1-0:1.0: 6 ports detected
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/core/usb.c: registered new driver audio
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/class/audio.c: v1.0.0:USB Audio Class driver
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/core/usb.c: registered new driver usblp
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver
Nov 29 22:23:25 noisydwarf kernel: Initializing USB Mass Storage driver...
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/core/usb.c: registered new driver usb-storage
Nov 29 22:23:25 noisydwarf kernel: USB Mass Storage support registered.
Nov 29 22:23:25 noisydwarf kernel: mice: PS/2 mouse device common for all mice
Nov 29 22:23:25 noisydwarf kernel: i8042.c: Warning: Keylock active.
Nov 29 22:23:25 noisydwarf kernel: input: PS/2 Synaptics TouchPad on isa0060/serio1
Nov 29 22:23:25 noisydwarf kernel: serio: i8042 AUX port at 0x60,0x64 irq 12
Nov 29 22:23:25 noisydwarf kernel: input: AT Translated Set 2 keyboard on isa0060/serio0
Nov 29 22:23:25 noisydwarf kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Nov 29 22:23:25 noisydwarf kernel: NET: Registered protocol family 2
Nov 29 22:23:25 noisydwarf kernel: IP: routing cache hash table of 8192 buckets, 64Kbytes
Nov 29 22:23:25 noisydwarf kernel: TCP: Hash tables configured (established 262144 bind 65536)
Nov 29 22:23:25 noisydwarf kernel: NET: Registered protocol family 1
Nov 29 22:23:25 noisydwarf kernel: NET: Registered protocol family 17
Nov 29 22:23:25 noisydwarf kernel: cpufreq: No CPUs supporting ACPI performance management found.
Nov 29 22:23:25 noisydwarf kernel: ACPI: (supports S0 S1 S3 S4 S4bios S5)
Nov 29 22:23:25 noisydwarf kernel: kjournald starting.  Commit interval 5 seconds
Nov 29 22:23:25 noisydwarf kernel: EXT3-fs: mounted filesystem with ordered data mode.
Nov 29 22:23:25 noisydwarf kernel: VFS: Mounted root (ext3 filesystem) readonly.
Nov 29 22:23:25 noisydwarf kernel: Freeing unused kernel memory: 152k freed
Nov 29 22:23:25 noisydwarf kernel: Adding 2097136k swap on /dev/hdc6.  Priority:-1 extents:1
Nov 29 22:23:25 noisydwarf kernel: EXT3 FS on hdc5, internal journal
Nov 29 22:23:25 noisydwarf kernel: Real Time Clock Driver v1.12
Nov 29 22:23:25 noisydwarf kernel: Non-volatile memory driver v1.2
Nov 29 22:23:25 noisydwarf kernel: ohci1394: $Rev: 1045 $ Ben Collins <bcollins@debian.org>
Nov 29 22:23:25 noisydwarf kernel: ohci1394_0: OHCI-1394 1.1 (PCI): IRQ=[16]  MMIO=[faffb800-faffbfff]  Max Packet=[2048]
Nov 29 22:23:25 noisydwarf kernel: sbp2: $Rev: 1034 $ Ben Collins <bcollins@debian.org>
Nov 29 22:23:25 noisydwarf kernel: video1394: Installed video1394 module
Nov 29 22:23:25 noisydwarf kernel: raw1394: /dev/raw1394 device initialized
Nov 29 22:23:25 noisydwarf kernel: I2O Core - (C) Copyright 1999 Red Hat Software
Nov 29 22:23:25 noisydwarf kernel: I2O: Event thread created as pid 80
Nov 29 22:23:25 noisydwarf kernel: i2o: Checking for PCI I2O controllers...
Nov 29 22:23:25 noisydwarf kernel: I2O Block Storage OSM v0.9
Nov 29 22:23:25 noisydwarf kernel:    (c) Copyright 1999-2001 Red Hat Software.
Nov 29 22:23:25 noisydwarf kernel: i2o_block: registered device at major 80
Nov 29 22:23:25 noisydwarf kernel: i2o_block: Checking for Boot device...
Nov 29 22:23:25 noisydwarf kernel: i2o_block: Checking for I2O Block devices...
Nov 29 22:23:25 noisydwarf kernel: CSLIP: code copyright 1989 Regents of the University of California
Nov 29 22:23:25 noisydwarf kernel: PPP generic driver version 2.4.2
Nov 29 22:23:25 noisydwarf kernel: PPP BSD Compression module registered
Nov 29 22:23:25 noisydwarf kernel: PPP Deflate Compression module registered
Nov 29 22:23:25 noisydwarf kernel: airo:  Probing for PCI adapters
Nov 29 22:23:25 noisydwarf kernel: airo:  Finished probing for PCI adapters
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/core/usb.c: registered new driver hiddev
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/core/usb.c: registered new driver hid
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/input/hid-core.c: v2.0:USB HID core driver
Nov 29 22:23:25 noisydwarf kernel: Linux video capture interface: v1.00
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/core/usb.c: registered new driver ov511
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/media/ov511.c: v1.64 for Linux 2.5 : ov511 USB Camera Driver
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/core/usb.c: registered new driver usbscanner
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/image/scanner.c: 0.4.15:USB Scanner Driver
Nov 29 22:23:25 noisydwarf kernel: NTFS driver 2.1.4 [Flags: R/W MODULE].
Nov 29 22:23:25 noisydwarf kernel: ip_conntrack version 2.1 (8190 buckets, 65520 max) - 300 bytes per conntrack
Nov 29 22:23:25 noisydwarf kernel: ip_tables: (C) 2000-2002 Netfilter core team
Nov 29 22:23:25 noisydwarf kernel: IA-32 Microcode Update Driver: v1.13 <tigran@veritas.com>
Nov 29 22:23:25 noisydwarf kernel: Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing disabled
Nov 29 22:23:25 noisydwarf kernel: drivers/usb/host/uhci-hcd.c: USB Universal Host Controller Interface driver v2.1
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.0: UHCI Host Controller
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.0: irq 16, io base 0000bf80
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 2
Nov 29 22:23:25 noisydwarf kernel: hub 2-0:1.0: USB hub found
Nov 29 22:23:25 noisydwarf kernel: hub 2-0:1.0: 2 ports detected
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.1: UHCI Host Controller
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.1: irq 19, io base 0000bf40
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 3
Nov 29 22:23:25 noisydwarf kernel: hub 3-0:1.0: USB hub found
Nov 29 22:23:25 noisydwarf kernel: hub 3-0:1.0: 2 ports detected
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.2: UHCI Host Controller
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.2: irq 18, io base 0000bf20
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 4
Nov 29 22:23:25 noisydwarf kernel: hub 4-0:1.0: USB hub found
Nov 29 22:23:25 noisydwarf kernel: hub 4-0:1.0: 2 ports detected
Nov 29 22:23:25 noisydwarf kernel: hub 3-0:1.0: new USB device on port 1, assigned address 2
Nov 29 22:23:25 noisydwarf kernel: usb 3-1: control timeout on ep0out
Nov 29 22:23:25 noisydwarf kernel: uhci_hcd 0000:00:1d.1: Unlink after no-IRQ?Different ACPI or APIC settings may help.
Nov 29 22:23:27 noisydwarf usb.agent[293]: ... no modules for USB product 0/0/206
Nov 29 22:23:28 noisydwarf usb.agent[278]: ... no modules for USB product 0/0/206
Nov 29 22:23:28 noisydwarf usb.agent[312]: ... no modules for USB product 0/0/206
Nov 29 22:23:29 noisydwarf kernel: NET: Registered protocol family 10
Nov 29 22:23:29 noisydwarf kernel: IPv6 over IPv4 tunneling driver
Nov 29 22:23:34 noisydwarf kernel: agpgart: Found an AGP 2.0 compliant device at 0000:00:00.0.
Nov 29 22:23:34 noisydwarf kernel: agpgart: Putting AGP V2 device at 0000:00:00.0 into 1x mode
Nov 29 22:23:34 noisydwarf kernel: agpgart: Putting AGP V2 device at 0000:01:00.0 into 1x mode
Nov 29 22:23:34 noisydwarf kernel: [drm] Loading R200 Microcode
Nov 29 22:41:51 noisydwarf kernel: driverloader: module license 'see LICENSE file; Copyright (c)2003 Linuxant inc.' taints kernel.
Nov 29 22:41:57 noisydwarf kernel: 0000:02:02.0: cache line size not set; forcing 32
Nov 29 22:41:57 noisydwarf kernel: wlan0: New link status: Disconnected (0002)
Nov 29 22:42:12 noisydwarf kernel: driverloader: module license 'see LICENSE file; Copyright (c)2003 Linuxant inc.' taints kernel.
Nov 29 22:42:14 noisydwarf kernel: 0000:02:02.0: cache line size not set; forcing 32
Nov 29 22:42:14 noisydwarf kernel: wlan0: New link status: Disconnected (0002)
Nov 29 22:47:41 noisydwarf shutdown[1981]: shutting down for system reboot

-- 
peter koellner <peter@asgalon.net>

