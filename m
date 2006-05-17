From: "Brown, Len" <len.brown@intel.com>
Subject: RE: kernel vs user power management
Date: Wed, 17 May 2006 14:25:59 -0400
Message-ID: <CFF307C98FEABE47A452B27C06B85BB679BDD3@hdsmsx411.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-acpi-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Macht <hmacht@suse.de>
Cc: thoenig@suse.de, linux-acpi@vger.kernel.org, linux-laptop@vger.kernel.org, Andi Kleen <ak@suse.de>

 
>If you can reproduce that it switches to T2 when you do a rcpowersaved
>restart or on every unplug, it would actually be a bug which is worth
>to be reported.

happens on every un-plug event.

/etc/init.d/powersaved stop

didn't make it stop happening, so it is probably an ACPI bug.

thanks,
-Len
