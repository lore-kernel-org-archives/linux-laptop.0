From: "Miguel A. Garrido." <migueliyo@ya.com>
Subject: RE: Laptop hot under linux
Date: Tue, 14 Sep 2004 00:39:18 +0200
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <000001c499e2$82015300$0201a8c0@migueliyo>
References: <4145D617.1030308@spymac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <4145D617.1030308@spymac.com>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Guilherme Mesquita' <guilhermemesquita@spymac.com>
Cc: linux-laptop@vger.kernel.org

Thanks for the idea, but ACPI is already enable and even I can do a  
"acpi -t" and see how temperature is going up but fan do not speed up :(

Miguel A.



-----Mensaje original-----
De: linux-laptop-owner@vger.kernel.org
[mailto:linux-laptop-owner@vger.kernel.org] En nombre de Guilherme Mesquita
Enviado el: lunes, 13 de septiembre de 2004 19:17
Para: Miguel A. Garrido.
CC: linux-laptop@vger.kernel.org
Asunto: Re: Laptop hot under linux

Hello Miguel,

Did you enable the ACPI in your kernel? It has a "fan" module, maybe you 
could check it out... Also enable the IC thermal monitors so you can 
just check up if things are getting cooler or not... I think this might 
help.

-- Guilherme

Miguel A. Garrido. wrote:

>Hi, I have a problem with my laptop under linux. When it runs in Windows
XP,
>the fan increase speed in case the cpu warm but with any distro (currently
>I'm using debian) the fan operates at the same speed and therefore it isn't
>capable to cool the processor and the laptop finishes turning off
>(fortunately ;) )
>It is not a common laptop trademark, but it has a Wistron motherboard with
a
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

-
To unsubscribe from this list: send the line "unsubscribe linux-laptop" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

