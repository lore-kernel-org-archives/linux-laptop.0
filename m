From: Jean Delvare <j.delvare@hexanet.fr>
Subject: Re: Sound on a Sony 505TR - SuSE8.0
Date: Fri, 16 Aug 2002 10:02:00 +0200
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20020816100200.142a9a4a.j.delvare@hexanet.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jay Vollmer <jvollmer@visi.com>
Cc: linux-laptop@vger.kernel.org


> I'm hoping that someone can give me a hint on how I can get SuSE Linux
> 8.0 to recognise the sound chip in a Sony VAIO 505TR Laptop.  IIRC,
> this box uses an Ensonic ESS1879.

I would give a try to the ALSA drivers. ASLA being developed by SuSE, I
have no doubt there is an up-to-date package ready for installation for
your system (actually, maybe 3 packages: alsa-drivers, alsa-lib and
alsa-utils). ESS 1800 series are told to be supported (see the matrix at
http://www.alsa-project.org/alsa-doc/, look for ES18xx).

-- 
Jean Delvare
