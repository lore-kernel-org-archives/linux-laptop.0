From: Roe Peterson <roe@rapfast.petcom.com>
Subject: Dell precision M50 and _very_ slow process startup
Date: Mon, 13 Jan 2003 10:27:32 -0600 (CST)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <200301131627.h0DGRX101413@rapfast.petcom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org


After _quite_ a bit more investigation, and some good pointers from
the net (thanks, all!), this has turned out _not_ to be a problem
with swapping/paging at all.

For some reason, the magicdev process slows the system to a crawl!

I'm guessing that this process watches for cd insertion, changes
to home directory, et. al.

There seems to be no man page or info for magicdev itself.

Does anyone know more about this beast?

I've solved the problem temporarily by simply renameing
/usr/bin/magicdev...

