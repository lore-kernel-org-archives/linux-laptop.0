From: Miloslav Trmac <mitr@volny.cz>
Subject: Re: [PATCH] drivers/input/misc: Added Acer TravelMate 240 support
 to the wistron button interface
Date: Sun, 11 Dec 2005 06:27:40 +0100
Message-ID: <439BB8CC.4000301@volny.cz>
References: <81083a450512102116o50d71fa0gbb53557f0e3d8748@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <81083a450512102116o50d71fa0gbb53557f0e3d8748@mail.gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ashutosh Naik <ashutosh.naik@gmail.com>
Cc: bero@arklinux.org, dtor@mail.ru, akpm@osdl.org, vojtech@suse.cz, linux-input@atrey.karlin.mff.cuni.cz, linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org

Ashutosh Naik wrote:
> This patch adds Acer TravelMate 240 support to the wistron button
> interface. This means that the buttons on top of the
> keyboard(including ones for Wifi and Bluetooth),  which hitherto did
> not work, work now. I have tested it on my laptop and it seems to work
> great.
Please check that the ACPI "button.ko" driver can't provide the
functionality; newer laptops apparently work better with that driver
(http://lkml.org/lkml/2005/12/2/61).

Thanks,
	Mirek
