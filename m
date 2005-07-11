From: Bob Toxen <bob@verysecurelinux.com>
Subject: Re: system call to check battery energy?
Date: Mon, 11 Jul 2005 16:28:39 -0400
Message-ID: <20050711202839.GB32183@verysecurelinux.com>
References: <20050711134454.45790.qmail@web33514.mail.mud.yahoo.com>
Reply-To: bob@verysecurelinux.com
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050711134454.45790.qmail@web33514.mail.mud.yahoo.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod <geekvinod@yahoo.com>, linux-laptop@vger.kernel.org

Hi Vinod,
> Hi All. 

> Would anyone know if i could make a simple system call
> and find the battery energy remaining?
You could read the file "/proc/apm".  The number with the "%"
after it is the battery level.  The two hex numbers before it
are flags, such as whether or not AC power is present, etc.
You could either read the doc, read the Kernel source, etc.
to determine the meanings of these flags or experiment.

> I am relatively new to linux, but i have uncovered
> that apm and acpi are power management tools. trying
> apm gives me the lifetime  ,not in terms of energy say
> in terms of mAh. acpi on the other hand does
> seem(havent tried it yet) to give me values in terms
> of energy. But i was wondering if there is a way i can
> just do a system call and find the energy value than
> having to configure acpi. Would appreciate any
> pointers.

> Thanks,
> Vinod 

Best regards,

Bob Toxen, CTO
Fly-By-Day Consulting, Inc.
d/b/a Horizon Network Security
"Your expert in Firewalls, Virus and Spam Filters, VPNs,
Network Monitoring, and Network Security consulting"

http://www.verysecurelinux.com       [Network & Linux/Unix Security Consulting]
http://www.realworldlinuxsecurity.com [My 5* book: "Real World Linux Security"]
http://www.verysecurelinux.com/sunset.html                    [Sunset Computer]
bob@verysecurelinux.com (e-mail)
