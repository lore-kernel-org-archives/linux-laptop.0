From: Guilherme Mesquita <guilhermemesquita@spymac.com>
Subject: Re: Laptop hot under linux
Date: Mon, 13 Sep 2004 17:17:11 +0000
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <4145D617.1030308@spymac.com>
References: <000a01c499c8$d91a39a0$0201a8c0@migueliyo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <000a01c499c8$d91a39a0$0201a8c0@migueliyo>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Miguel A. Garrido." <migueliyo@ya.com>
Cc: linux-laptop@vger.kernel.org

Hello Miguel,

Did you enable the ACPI in your kernel? It has a "fan" module, maybe you 
could check it out... Also enable the IC thermal monitors so you can 
just check up if things are getting cooler or not... I think this might 
help.

-- Guilherme

Miguel A. Garrido. wrote:

>Hi, I have a problem with my laptop under linux. When it runs in Windows XP,
>the fan increase speed in case the cpu warm but with any distro (currently
>I'm using debian) the fan operates at the same speed and therefore it isn't
>capable to cool the processor and the laptop finishes turning off
>(fortunately ;) )
>It is not a common laptop trademark, but it has a Wistron motherboard with a
>PIV 2.4 proccessor. 
>Any idea?
>
>Sorry about my English, I'm spaniard.
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-laptop" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>

