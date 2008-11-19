From: Niels de Vos <niels.devos@wincor-nixdorf.com>
Subject: [PATCH] apm: Remove CONFIG_APM_REAL_MODE_POWER_OFF in favor of kernel
 parameter
Date: Wed, 19 Nov 2008 15:18:03 +0100
Message-ID: <4924201B.8010301@wincor-nixdorf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: sfr@canb.auug.org.au, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org

Remove CONFIG_APM_REAL_MODE_POWER_OFF like CONFIG_APM_POWER_OFF which
has been done for linux-2.2.14pre8 (http://lkml.org/lkml/1999/11/23/3).

Re-introducing CONFIG_APM_POWER_OFF got nack-ed. Stephen didn't bother
to remove CONFIG_APM_REAL_MODE_POWER_OFF, let's get rid of it now.
	Reference: http://lkml.org/lkml/2008/5/7/97

Signed-off-by: Niels de Vos <niels.devos@wincor-nixdorf.com>

---
 arch/x86/Kconfig         |    7 -------
 arch/x86/kernel/apm_32.c |    4 ----
 2 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 93224b5..d0b9ef7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1629,13 +1629,6 @@ config APM_ALLOW_INTS
 	  many of the newer IBM Thinkpads.  If you experience hangs when you
 	  suspend, try setting this to Y.  Otherwise, say N.
=20
-config APM_REAL_MODE_POWER_OFF
-	bool "Use real mode APM BIOS call to power off"
-	help
-	  Use real mode APM BIOS calls to switch off the computer. This is
-	  a work-around for a number of buggy BIOSes. Switch this option on if
-	  your computer crashes instead of powering off properly.
-
 endif # APM
=20
 source "arch/x86/kernel/cpu/cpufreq/Kconfig"
diff --git a/arch/x86/kernel/apm_32.c b/arch/x86/kernel/apm_32.c
index 5145a6e..3a26525 100644
--- a/arch/x86/kernel/apm_32.c
+++ b/arch/x86/kernel/apm_32.c
@@ -391,11 +391,7 @@ static int power_off;
 #else
 static int power_off =3D 1;
 #endif
-#ifdef CONFIG_APM_REAL_MODE_POWER_OFF
-static int realmode_power_off =3D 1;
-#else
 static int realmode_power_off;
-#endif
 #ifdef CONFIG_APM_ALLOW_INTS
 static int allow_ints =3D 1;
 #else


--=20
WINCOR NIXDORF International GmbH=20
Sitz der Gesellschaft: Paderborn=20
Registergericht Paderborn HRB 3507
Gesch=E4ftsf=FChrer: Eckard Heidloff (Vorsitzender), Stefan Auerbach, Dr. J=
=FCrgen Wunram
Vorsitzender des Aufsichtsrats: Karl-Heinz Stiller=20
Steuernummer: 339/5884/0020 - Ust-ID Nr.: DE812927716 - WEEE-Reg.-Nr. DE444=
77193

Diese E-Mail enth=E4lt vertrauliche Informationen. Wenn Sie nicht der richt=
ige Adressat sind oder diese E-Mail irrt=FCmlich erhalten haben, informiere=
n Sie bitte sofort den Absender und vernichten Sie diese E-Mail. Das unerla=
ubte Kopieren sowie die unbefugte Weitergabe dieser E-Mail ist nicht gestat=
tet.

This e-mail may contain confidential information. If you are not the intend=
ed recipient (or have received this e-mail in error) please notify the send=
er immediately and destroy this e-mail. Any unauthorised copying, disclosur=
e or distribution of the material in this e-mail is strictly forbidden.=20

