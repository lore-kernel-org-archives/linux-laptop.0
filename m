From: "Brown, Len" <len.brown@intel.com>
Subject: RE: Sony Vaio PCG-FRV27 Memory Stick Reader
Date: Tue, 15 Jun 2004 09:15:15 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <29AC424F54821A4FB5D7CBE081922E40BF1C73@hdsmsx403.hd.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steev Klimaszewski <threeway@gmail.com>
Cc: linux-laptop@vger.kernel.org


>On Tue, 15 Jun 2004 07:04:25 -0400, Steev Klimaszewski
><threeway@gmail.com> wrote:
>> 
>> 
>> On 15 Jun 2004 00:41:34 -0400, Len Brown <len.brown@intel.com> wrote:
>> >
>> > Is the memory card reader enumerated by ACPI?
>> >
>> > acpidmp | acpixtract DSDT > DSDT
>> > iasl -d DSDT
>> > grep PNP0C0D DSDT.dsl

oops, typo on my part,
Card Readers are PNP0C14
(something I noticed for the 1st time just yesterday)
dunno what possessed me to type the LID-id,
must have been doing too many things at once...

>> > You could write a driver to attach to this PNPid
>> > and get its current resources.
>> >
>> > does the DSDT do anything special for Windows?
>> > make it do the same for you, boot with
>> > acpi_os_name="Microsoft Windows NT"
>> >
>> > -Len
>> >
>> > 
>> Thanks for the quick reply Len.  What exactly is the PNP0C0D?  I got
>> the DSDT.dsl file, though - in the latest acpica-unix-20040527
>> package, some of the directory names are uppercase, and it took me a
>> minute to figure out why it couldn't find things (first example was
>> that it couldn't find ../namespace/nssomething.c.....) .  How do I
>> know if the DSDT does anything special for Windows?  I am almost
>> certain that writing a driver for the memory stick reader is above my
>> abilities (currently) but I have been considering it.

good work.  Yes, the CAPITALIZED directory names are a tools
bug that bit in the last two ACPICA releases.

Re: Windows
Grep DSDT.dsl for Windows -- Special OS hooks key off the OS name itself
using either _OS and/or _OSI methods.

>Windows says that the device is a Sony Memory Stick (WB)  so, a search
>through the DSDT.dsl file comes up with
>
>                    Device (WBMS)
>                    {
>                        Name (_HID, EisaId ("WEC0515"))

Looks promising.

_PRS below probably tells you what you're looking for:
IO (Decode16, 0x03F8, 0x03F8, 0x01, 0x08)
IRQ (Edge, ActiveHigh, Exclusive) {4}

This _HID is an OEM-specific device.
(standard devices start with "PNP")
It may or may not be what you're looking for.
You can copy, say, the fan driver in Linux
to your own driver and hack it to attach it the same way
except using WEC0515.
Then evaluate the _CRS for the device and decode
the resources for the IO and IRQ.
Unless there is something tricky going on
you'll probably come up with the resources above.

cheers,
-Len


>                        Method (_STA, 0, NotSerialized)
>                        {
>                            If (\_SB.PCI0.PIB.WBMR.STSC ())
>                            {
>                                Return (0x00)
>                            }
>                            Else
>                            {
>                                \_SB.PCI0.PIB.WBMR.SETD (0x01)
>                                And (\_SB.PCI0.PIB.WBMR.READ (0x30),
>0x01, Local0)
>                                If (Local0)
>                                {
>                                    Store (0x0F, Local0)
>                                }
>                                Else
>                                {
>                                    Store (0x0D, Local0)
>                                }
>
>                                Return (Local0)
>                            }
>                        }
>
>                        Method (_DIS, 0, NotSerialized)
>                        {
>                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x30, 0x00)
>                            \_SB.PCI0.PIB.WBMR.EXCF ()
>                        }
>
>                        Method (_CRS, 0, NotSerialized)
>                        {
>                            Name (BUF0, ResourceTemplate ()
>                            {
>                                IO (Decode16, 0x0000, 0x0000, 
>0x01, 0x00)
>                                IRQNoFlags () {}
>                            })
>                            Acquire (MTX0, 0xFFFF)
>                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
>                            CreateByteField (BUF0, 0x02, IOL0)
>                            CreateByteField (BUF0, 0x03, IOH0)
>                            CreateByteField (BUF0, 0x04, IOL1)
>                            CreateByteField (BUF0, 0x05, IOH1)
>                            CreateByteField (BUF0, 0x07, LEN0)
>                            CreateWordField (BUF0, 0x09, IRQW)
>                            Store (\_SB.PCI0.PIB.WBMR.READ 
>(0x60), IOH0)
>                            Store (\_SB.PCI0.PIB.WBMR.READ 
>(0x61), IOL0)
>                            Store (\_SB.PCI0.PIB.WBMR.READ 
>(0x60), IOH1)
>                            Store (\_SB.PCI0.PIB.WBMR.READ 
>(0x61), IOL1)
>                            Store (0x08, LEN0)
>                            And (\_SB.PCI0.PIB.WBMR.READ 
>(0x70), 0x0F, Local0)
>                            If (Local0)
>                            {
>                                ShiftLeft (One, Local0, IRQW)
>                            }
>                            Else
>                            {
>                                Store (Zero, IRQW)
>                            }
>
>                            \_SB.PCI0.PIB.WBMR.EXCF ()
>                            Release (MTX0)
>                            Return (BUF0)
>                        }
>
>                        Method (_PRS, 0, NotSerialized)
>                        {
>                            Acquire (MTX0, 0xFFFF)
>                            Name (PRSA, ResourceTemplate ()
>                            {
>                                StartDependentFnNoPri ()
>                                {
>                                    IO (Decode16, 0x03F8, 
>0x03F8, 0x01, 0x08)
>                                    IRQ (Edge, ActiveHigh, 
>Exclusive) {4}
>                                }
>                                EndDependentFn ()
>                            })
>                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
>                            Store (PRSA, Local0)
>                            \_SB.PCI0.PIB.WBMR.EXCF ()
>                            Release (MTX0)
>                            Return (Local0)
>                        }
>
>                        Method (_SRS, 1, NotSerialized)
>                        {
>                            Acquire (MTX0, 0xFFFF)
>                            CreateByteField (Arg0, 0x02, IOL0)
>                            CreateByteField (Arg0, 0x03, IOH0)
>                            CreateByteField (Arg0, 0x04, IOL1)
>                            CreateByteField (Arg0, 0x05, IOH1)
>                            CreateByteField (Arg0, 0x07, LEN0)
>                            CreateWordField (Arg0, 0x09, IRQW)
>                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x30, 0x01)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x60, IOH0)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x61, IOL0)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x60, IOH1)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x61, IOL1)
>                            FindSetLeftBit (IRQW, Local0)
>                            If (LNot (LEqual (Local0, Zero)))
>                            {
>                                Subtract (Local0, 0x01, Local0)
>                            }
>
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x70, Local0)
>                            \_SB.PCI0.PIB.WBMR.EXCF ()
>                            Release (MTX0)
>                        }
>
>                        Mutex (MTX0, 0x01)
>                        Method (_PS0, 0, NotSerialized)
>                        {
>                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x22, 0xE0)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x30, 0x01)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x60, 0x03)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x61, 0xF8)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x70, 0x04)
>                            \_SB.PCI0.PIB.WBMR.EXCF ()
>                        }
>
>                        Method (_PS3, 0, NotSerialized)
>                        {
>                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x30, 0x00)
>                            \_SB.PCI0.PIB.WBMR.WRIT (0x22, 0x00)
>                            \_SB.PCI0.PIB.WBMR.EXCF ()
>                        }
>                    }
>                }
>            }
>
>Is this what I would be looking for if/when I were to write a driver?
>
