From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: build #310 failed for 2.6.23-rc1-g05ff097 in
 linux/arch/i386/kernel/apm.c
Date: Mon, 30 Jul 2007 19:40:29 +1000
Message-ID: <20070730194029.10a05731.sfr@canb.auug.org.au>
References: <200707301058.02103.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <200707301058.02103.toralf.foerster@gmx.de>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Toralf =?UTF-8?B?RsO2cnN0ZXI=?= <toralf.foerster@gmx.de>
Cc: linux-laptop@vger.kernel.org

On Mon, 30 Jul 2007 10:57:59 +0200 Toralf F=C3=B6rster <toralf.foerster=
@gmx.de> wrote:
>
> Hello,
>=20
> the build with the attached .config failed, make ends with:
> ...
>   LD      arch/i386/kernel/cpu/built-in.o
>   CC      arch/i386/kernel/reboot.o
>   CC      arch/i386/kernel/cpuid.o
>   CC      arch/i386/kernel/microcode.o
>   CC      arch/i386/kernel/apm.o
> arch/i386/kernel/apm.c: In function 'suspend':
> arch/i386/kernel/apm.c:1211: error: implicit declaration of function =
'save_processor_state'
> arch/i386/kernel/apm.c:1214: error: implicit declaration of function =
'restore_processor_state'

hmm CONFIG_PM_SLEEP was not set.  Can you try the patch below, please?

> arch/i386/kernel/apm.c: In function 'apm_init':
> arch/i386/kernel/apm.c:2240: warning: format '%lx' expects type 'long=
 unsigned int', but argument 3 has type 'u32'

Someone else has posted a trivial patch for that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

=46rom: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] APM support depend on PM_SLEEP

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/i386/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/i386/Kconfig b/arch/i386/Kconfig
index abb582b..7eefa7d 100644
--- a/arch/i386/Kconfig
+++ b/arch/i386/Kconfig
@@ -938,7 +938,7 @@ source "drivers/acpi/Kconfig"
=20
 menuconfig APM
 	tristate "APM (Advanced Power Management) BIOS support"
-	depends on PM && !X86_VISWS
+	depends on PM && !X86_VISWS && PM_SLEEP
 	---help---
 	  APM is a BIOS specification for saving power using several differen=
t
 	  techniques. This is mostly useful for battery powered laptops with
--=20
1.5.2.4

-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
