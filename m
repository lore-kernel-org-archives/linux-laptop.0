From: Ashutosh Naik <ashutosh.naik@gmail.com>
Subject: Re: [PATCH] drivers/input/misc: Added Acer TravelMate 240 support to the wistron button interface
Date: Sun, 11 Dec 2005 11:18:20 +0530
Message-ID: <81083a450512102148u2db386aat7ad51056bcc02f82@mail.gmail.com>
References: <81083a450512102116o50d71fa0gbb53557f0e3d8748@mail.gmail.com>
	 <439BB8CC.4000301@volny.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161102AbVLKFsW@vger.kernel.org>
In-Reply-To: <439BB8CC.4000301@volny.cz>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Miloslav Trmac <mitr@volny.cz>
Cc: bero@arklinux.org, dtor@mail.ru, akpm@osdl.org, vojtech@suse.cz, linux-input@atrey.karlin.mff.cuni.cz, linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org

On 12/11/05, Miloslav Trmac <mitr@volny.cz> wrote:

> > This patch adds Acer TravelMate 240 support to the wistron button
> > interface. This means that the buttons on top of the
> > keyboard(including ones for Wifi and Bluetooth),  which hitherto did
> > not work, work now. I have tested it on my laptop and it seems to work
> > great.
> Please check that the ACPI "button.ko" driver can't provide the
> functionality; newer laptops apparently work better with that driver
> (http://lkml.org/lkml/2005/12/2/61).

The Acer TravelMate 240 laptop supports ACPI, but the ACPI does not
support hotkeys. Hence hotkeys just would not work without this
module.

Regards
Ashutosh
