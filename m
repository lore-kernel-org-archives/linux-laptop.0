From: Niels de Vos <niels.devos@wincor-nixdorf.com>
Subject: [PATCH] apm: make apm=power-off configurable like apm=realmode-power-off
Date: Wed, 07 May 2008 15:55:09 +0200
Message-ID: <4821B4BD.9010402@wincor-nixdorf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: sfr@canb.auug.org.au, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: niels.devos@wincor-nixdorf.com

On some systems (with broken BIOSes?) apm=3Dpower-off should be appended
as kernel parameter. apm=3Drealmode-power-off is configurable during=20
compile-time. apm=3Dpower-off should be configurable likewise.

On non-SMP systems apm=3Dpower-off is the default. For kernels with SMP
support it is not.

Signed-off-by: Niels de Vos <niels.devos@wincor-nixdorf.com>
--
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bbcafaa..e051f38 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1457,6 +1457,16 @@ config APM_ALLOW_INTS
 	  many of the newer IBM Thinkpads.  If you experience hangs when you
 	  suspend, try setting this to Y.  Otherwise, say N.
=20
+config APM_POWER_OFF
+	bool "Power off on shutdown"
+	depends on APM && SMP
+	help
+	  Force a power off on shutdown. Needed for some buggy BIOSes. If you
+	  run an SMP kernel on a non-SMP system with APM, you try turning on
+	  this option if your system does not power-off properly.
+
+	  Note: this option is equivalent to apm=3Dpower-off on the cmdline.
+
 config APM_REAL_MODE_POWER_OFF
 	bool "Use real mode APM BIOS call to power off"
 	help
diff --git a/arch/x86/kernel/apm_32.c b/arch/x86/kernel/apm_32.c
index bf9290e..e3015da 100644
--- a/arch/x86/kernel/apm_32.c
+++ b/arch/x86/kernel/apm_32.c
@@ -385,7 +385,7 @@ static int bounce_interval __read_mostly =3D DEFAULT_BO=
UNCE_INTERVAL;
 static int debug __read_mostly;
 static int smp __read_mostly;
 static int apm_disabled =3D -1;
-#ifdef CONFIG_SMP
+#if defined(CONFIG_SMP) && !defined(CONFIG_APM_POWER_OFF)
 static int power_off;
 #else
 static int power_off =3D 1;

--=20
Wincor Nixdorf International GmbH
Sitz der Gesellschaft: Paderborn
Registergericht Paderborn HRB 3507
Gesch=E4ftsf=FChrer: Eckard Heidloff (Vorsitzender), Stefan Auerbach, Dr. J=
=FCrgen Wunram
Vorsitzender des Aufsichtsrats: Karl-Heinz Stiller
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
e or distribution of the material in this e-mail is strictly forbidden.

