From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Do not suspend PCI devices twice [PATCH for testing]
Date: Mon, 4 Aug 2003 23:27:25 +0200
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20030804212724.GA2787@elf.ucw.cz>
References: <20030804212624.GA2452@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030804212624.GA2452@elf.ucw.cz>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel list <linux-kernel@vger.kernel.org>, linux-laptop@vger.kernel.org, sfr@canb.auug.org.au, david-b@pacbell.net

Hi!

> PCI devices are suspendend twice; once using pm_send_all() and once
> because of driver model (when using ACPI). That's bad.
> 
> If I kill pm_send_all() hook, they will not be suspended at all with
> APM, because APM does not call device_suspend(...,
> SUSPEND_SAVE_STATE). This patch fixes both of these.
> 
> Ouch, no it does not. You should > drivers/pci/power.c. Its no longer
> needed.
> 
> It compiles, and I'd like someone to test it ;-).

Oops, wrong patch attached.

-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
