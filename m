From: Steev Klimaszewski <threeway@gmail.com>
Subject: Re: Sony Vaio PCG-FRV27 Memory Stick Reader
Date: Tue, 15 Jun 2004 07:15:05 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <bca9c542040615041568a433d4@mail.gmail.com>
References: <bca9c5420406141906416c0698@mail.gmail.com> <1087274493.2920.161.camel@dhcppc4> <bca9c54204061504045d5c3636@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <bca9c54204061504045d5c3636@mail.gmail.com>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Len Brown <len.brown@intel.com>
Cc: linux-laptop@vger.kernel.org

On Tue, 15 Jun 2004 07:04:25 -0400, Steev Klimaszewski
<threeway@gmail.com> wrote:
> 
> 
> On 15 Jun 2004 00:41:34 -0400, Len Brown <len.brown@intel.com> wrote:
> >
> > Is the memory card reader enumerated by ACPI?
> >
> > acpidmp | acpixtract DSDT > DSDT
> > iasl -d DSDT
> > grep PNP0C0D DSDT.dsl
> >
> > You could write a driver to attach to this PNPid
> > and get its current resources.
> >
> > does the DSDT do anything special for Windows?
> > make it do the same for you, boot with
> > acpi_os_name="Microsoft Windows NT"
> >
> > -Len
> >
> > 
> Thanks for the quick reply Len.  What exactly is the PNP0C0D?  I got
> the DSDT.dsl file, though - in the latest acpica-unix-20040527
> package, some of the directory names are uppercase, and it took me a
> minute to figure out why it couldn't find things (first example was
> that it couldn't find ../namespace/nssomething.c.....) .  How do I
> know if the DSDT does anything special for Windows?  I am almost
> certain that writing a driver for the memory stick reader is above my
> abilities (currently) but I have been considering it.
> 

I forgot to mention (still new to gmail, getting used to it) 

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
...
Windows says that the device is a Sony Memory Stick (WB)  so, a search
through the DSDT.dsl file comes up with

                    Device (WBMS)
                    {
                        Name (_HID, EisaId ("WEC0515"))
                        Method (_STA, 0, NotSerialized)
                        {
                            If (\_SB.PCI0.PIB.WBMR.STSC ())
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                \_SB.PCI0.PIB.WBMR.SETD (0x01)
                                And (\_SB.PCI0.PIB.WBMR.READ (0x30),
0x01, Local0)
                                If (Local0)
                                {
                                    Store (0x0F, Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }

                                Return (Local0)
                            }
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x30, 0x00)
                            \_SB.PCI0.PIB.WBMR.EXCF ()
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16, 0x0000, 0x0000, 0x01, 0x00)
                                IRQNoFlags () {}
                            })
                            Acquire (MTX0, 0xFFFF)
                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
                            CreateByteField (BUF0, 0x02, IOL0)
                            CreateByteField (BUF0, 0x03, IOH0)
                            CreateByteField (BUF0, 0x04, IOL1)
                            CreateByteField (BUF0, 0x05, IOH1)
                            CreateByteField (BUF0, 0x07, LEN0)
                            CreateWordField (BUF0, 0x09, IRQW)
                            Store (\_SB.PCI0.PIB.WBMR.READ (0x60), IOH0)
                            Store (\_SB.PCI0.PIB.WBMR.READ (0x61), IOL0)
                            Store (\_SB.PCI0.PIB.WBMR.READ (0x60), IOH1)
                            Store (\_SB.PCI0.PIB.WBMR.READ (0x61), IOL1)
                            Store (0x08, LEN0)
                            And (\_SB.PCI0.PIB.WBMR.READ (0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, IRQW)
                            }
                            Else
                            {
                                Store (Zero, IRQW)
                            }

                            \_SB.PCI0.PIB.WBMR.EXCF ()
                            Release (MTX0)
                            Return (BUF0)
                        }

                        Method (_PRS, 0, NotSerialized)
                        {
                            Acquire (MTX0, 0xFFFF)
                            Name (PRSA, ResourceTemplate ()
                            {
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16, 0x03F8, 0x03F8, 0x01, 0x08)
                                    IRQ (Edge, ActiveHigh, Exclusive) {4}
                                }
                                EndDependentFn ()
                            })
                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
                            Store (PRSA, Local0)
                            \_SB.PCI0.PIB.WBMR.EXCF ()
                            Release (MTX0)
                            Return (Local0)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            Acquire (MTX0, 0xFFFF)
                            CreateByteField (Arg0, 0x02, IOL0)
                            CreateByteField (Arg0, 0x03, IOH0)
                            CreateByteField (Arg0, 0x04, IOL1)
                            CreateByteField (Arg0, 0x05, IOH1)
                            CreateByteField (Arg0, 0x07, LEN0)
                            CreateWordField (Arg0, 0x09, IRQW)
                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x30, 0x01)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x60, IOH0)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x61, IOL0)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x60, IOH1)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x61, IOL1)
                            FindSetLeftBit (IRQW, Local0)
                            If (LNot (LEqual (Local0, Zero)))
                            {
                                Subtract (Local0, 0x01, Local0)
                            }

                            \_SB.PCI0.PIB.WBMR.WRIT (0x70, Local0)
                            \_SB.PCI0.PIB.WBMR.EXCF ()
                            Release (MTX0)
                        }

                        Mutex (MTX0, 0x01)
                        Method (_PS0, 0, NotSerialized)
                        {
                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x22, 0xE0)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x30, 0x01)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x60, 0x03)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x61, 0xF8)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x70, 0x04)
                            \_SB.PCI0.PIB.WBMR.EXCF ()
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            \_SB.PCI0.PIB.WBMR.SETD (0x01)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x30, 0x00)
                            \_SB.PCI0.PIB.WBMR.WRIT (0x22, 0x00)
                            \_SB.PCI0.PIB.WBMR.EXCF ()
                        }
                    }
                }
            }

Is this what I would be looking for if/when I were to write a driver?
