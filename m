From: Riccardo Vestrini <riccardov@sssup.it>
Subject: Re: is it really better speedstep-ich vs. p4-clockmod cpufreq driver?
Date: Fri, 23 Jul 2004 01:10:07 +0200
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <4100494F.1020803@sssup.it>
References: <40FF88BE.2090507@sssup.it> <Pine.LNX.4.58.0407220902350.9845@simba.math.ucla.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0407220902350.9845@simba.math.ucla.edu>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-laptop@vger.kernel.org

Jim Carter wrote:
> On Thu, 22 Jul 2004, Riccardo Vestrini wrote:
  >>it seems that speedstep-ich and acpi cpufreq driver have only two=20
usable clock
>>frequencies, while p4-clockmod has eight
>>my cpu is: Intel Mobile Intel(R) Pentium(R) 4   CPU 3.06GHz stepping =
09
>=20
>=20
> Definitely the voltage modulation is important to have.
you right, but I do not know if it is better to have a 0.3 GHz clock=20
most of the time, or a 1.5 GHz with half voltage
>=20
> Also as for strategies, if you have dynamic speed modulation, general=
ly if
> the CPU is busy less than 73% of the time, then my machine should be =
run at
> the lowest speed, whereas if tasks are waiting to run then it should =
be put
> in the highest speed.  In a typical workload it's very rare for the n=
eeded
> throughput to be steadily between 73% and 100% so the intermediate sp=
eeds
> could be useful; this is true even if the available speed range is gr=
eater. =20
> Actually, hardly anyone uses the full capacity of their CPU, and I do=
n't
> even bother to run the dynamic modulation daemon, just leaving it at =
low
> speed all the time.  I switch manually if I have a big simulation to =
do.
>=20
it is the same for me, cpu is almost always set to the lowest frequency=
,=20
  but I often compile programs, so I need the full power

  I consider strange the fact that a more specific driver=20
(speedstep-ich) is not able to put my laptop to half voltage + mininum=20
clock (which is 0.3 GHz) while p4-clockmod is only able to adjust clock=
=20
and not voltage;
probably these capabilities can be merged some way ...
I will try to write the authors

thank you

--=20

                                Riccardo Vestrini
                               <riccardov@sssup.it>

"Io ho una deformazione professionale, sono Ingegnere, e il problema in
quello che lei dice =E8 l'essere umano, perch=E9 una macchina pu=F2 sba=
gliare
ma l'essere umano ha sicuramente molti pi=F9 difetti" --
sconosciuto ad un congresso, mentre un manager parlava di risorse umane

-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
