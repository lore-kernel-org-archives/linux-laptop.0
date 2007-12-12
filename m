From: ice` <icestorm@ngi.it>
Subject: new HP Laptop: frequency scaling not supported on C2D T7500 -> High
 CPU Temps
Date: Wed, 12 Dec 2007 09:43:39 +0100
Message-ID: <475F9F3B.9050400@ngi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-laptop@vger.kernel.org

Hi,
I've just bought an HP Pavillon DV26xx (DV2500 series).
My ubuntu 7.10 64bit is working perfectly apart from CPU Frequency scal=
ing.
This is CPU data:

brex@ubuntu-box:~$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 15
model name      : Intel(R) Core(TM)2 Duo CPU     T7500  @ 2.20GHz
stepping        : 11
cpu MHz         : 2194.736
cache size      : 4096 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge=20
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall=20
nx lm constant_tsc pni monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr lahf_=
lm
bogomips        : 4393.94
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

(same for Processor 1 - the second core)

this is when I try to load acpi-cpufreq

brex@ubuntu-box:~$ sudo modprobe acpi-cpufreq
=46ATAL: Error inserting acpi_cpufreq=20
(/lib/modules/2.6.22-14-generic/kernel/arch/x86_64/kernel/cpufreq/acpi-=
cpufreq.ko):=20
No such device

no other modules for frequency scaling work....

I also get this errors about ACPI when loading acpi-cpufreq:

[ 1008.017253] ACPI Error (psargs-0355): [\_PR_.CPU0._PSS] Namespace=20
lookup failure, AE_NOT_FOUND
[ 1008.017259] ACPI Error (psparse-0551): Method parse/execution failed=
=20
[\_PR_.CPU1._PSS] (Node ffff81007cf59de0), AE_NOT_FOUND
[ 1008.017293] ACPI Exception (processor_perflib-0234): AE_NOT_FOUND,=20
Evaluating _PSS [20070126]

I'm already using latest BIOS for my laptop (F.21...there was a F.13=20
standard when I bought it but I didn't pay attention if speedstep was=20
working on it.)

This problem is quite annoying since when CPU runs at 100% for long tim=
e=20
I get temps about 70-80=B0C and the laptop gets quite hot.

Any suggestion?
Thanks
-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
