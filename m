From: Daniel Pittman <daniel@rimspace.net>
Subject: Re: Laptop hot under linux
Date: Tue, 14 Sep 2004 10:45:26 +1000
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <878ybd8yqh.fsf@enki.rimspace.net>
References: <4145D617.1030308@spymac.com>
	<000001c499e2$82015300$0201a8c0@migueliyo>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

On 14 Sep 2004, Miguel A. wrote:

It is generally much nicer to write replies *under* the existing text,
rather than at the top, since that is the natural way people read
English text. :)

[... overheating since the fan does not activate under Linux ...]

> Thanks for the idea, but ACPI is already enable and even I can do a  
> "acpi -t" and see how temperature is going up but fan do not speed up
> :(

One of the problems with ACPI is that while it can improve power
management performance it can also cause issues if it depends on the OS
doing work than Linux does not.

The other thing to try is turning *off* ACPI support in Linux, and
determine if it works correctly then.

Regards,
        Daniel
-- 
Vision without action is merely a dream. Action without vision just
passes the time. Vision with action can change the world.
        -- Joel Barker

