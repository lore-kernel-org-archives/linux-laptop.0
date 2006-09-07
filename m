From: Simeon Penev <simeon_penev@web.de>
Subject: Re: 2.6.17-1.2174_FC5: : Disabling IRQ #7 / nobody cared / usb_hcd_irq
Date: Fri, 08 Sep 2006 00:22:15 +0200
Message-ID: <45009B97.70905@web.de>
References: <790873504@web.de> <44FD8932.60906@tmr.com> <44FED3A4.2010204@web.de> <44FEEB18.105@tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <44FEEB18.105@tmr.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Davidsen <davidsen@tmr.com>
Cc: linux-laptop@vger.kernel.org

Hi Bill,

thank you again for your help!

Bill Davidsen wrote:
> Matter of approach. I would not disable an IRQ until there had been some
> number of uncaught interrupts in a row, others feel the number is one.
> But there really is an interrupt, so it's probably not a "bug" in that
> sense.
> 
>>  
>>
>>> - disable any CPU speed stuff you have running (just for information)
>>>   
>>
>> Yes, i'm using cpufreq, but it's a feature i'm not willing to give away
>> because the laptop is more silent. The fan works less.
>>  
>>
> Noted, but "just for information" would let you see if the speedstep was
> the cause, or at least contributed. That would help run it down.

Cpuspeed doesn't seem to be the problem. After disabling the service,
the problem is still there.

> 
>>  
>>
>>> Yes, that's a shotgun approach, I'm still running 2.6.16.2111 on FC4
>>> because later kernels don't init the video or wireless correctly.
>>>
>>>   
>>
>> Thank you once again.
>>
> I have a machine which does zero or one of these, so I'm familiar with
> the problem. I am running an older kernel which whines but doesn't
> disable, and since I don't need IRQ7 I wouldn't be too unhappy if it did
> disable. But I think there's an underlying hardware issue, or at least
> hardware to driver mismatch. Since you said irqpoll causes problems
> there's definitely something not working right.
> 
Could it be that the noapic kernel parameter influences this behavior?

Best regards,
simeon
