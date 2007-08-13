From: joe@perches.com
Subject: [PATCH] [44/2many] MAINTAINERS - APM DRIVER
Date: Sun, 12 Aug 2007 23:22:46 -0700
Message-ID: <46bff8b6.XgYxpWqOSD9Itfw6%joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@linux-foundation.org, sfr@canb.auug.org.au, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 016f342..da9bc6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -428,6 +428,9 @@ M:	sfr@canb.auug.org.au
 L:	linux-laptop@vger.kernel.org
 W:	http://www.canb.auug.org.au/~sfr/
 S:	Supported
+F:	arch/i386/boot/apm.c
+F:	arch/i386/kernel/apm.c
+F:	include/linux/apm_bios.h
 
 APPLE SMC DRIVER
 P:	Nicolas Boichat
