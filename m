From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: 2.6.17-1.2174_FC5: : Disabling IRQ #7 / nobody cared / usb_hcd_irq
Date: Wed, 06 Sep 2006 11:36:56 -0400
Message-ID: <44FEEB18.105@tmr.com>
References: <790873504@web.de> <44FD8932.60906@tmr.com> <44FED3A4.2010204@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <44FED3A4.2010204@web.de>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Simeon Penev <simeon_penev@web.de>
Cc: linux-laptop@vger.kernel.org

Did you all see that the Croc Hunter Simeon Penev wrote:

>Hi Bill,
>
>thank you for the fast reply!
>
>Bill Davidsen wrote:
>  
>
>>Although IRQ7 is traditionally LP, it seems to get identified for almost
>>any unexpected interrupt. I knew why once, but I haven't seen this for
>>some time. The real problem is that the kernel disables the IRQ, making
>>the system unusable. You can try any of several things:
>>- try the last 2.6.16 kernel
>>- remove the IRQ disable code, or add a counter. It happens only once on
>>many machines,
>>  as something comes ready.
>>    
>>
>
>I'll try that, but actually i wanted to help fix the problem if it's a
>bug with the kernel.
>  
>
Matter of approach. I would not disable an IRQ until there had been some 
number of uncaught interrupts in a row, others feel the number is one. 
But there really is an interrupt, so it's probably not a "bug" in that 
sense.

>  
>
>>- disable any CPU speed stuff you have running (just for information)
>>    
>>
>
>Yes, i'm using cpufreq, but it's a feature i'm not willing to give away
>because the laptop is more silent. The fan works less.
>  
>
Noted, but "just for information" would let you see if the speedstep was 
the cause, or at least contributed. That would help run it down.

>  
>
>>Yes, that's a shotgun approach, I'm still running 2.6.16.2111 on FC4
>>because later kernels don't init the video or wireless correctly.
>>
>>    
>>
>
>Thank you once again.
>
I have a machine which does zero or one of these, so I'm familiar with 
the problem. I am running an older kernel which whines but doesn't 
disable, and since I don't need IRQ7 I wouldn't be too unhappy if it did 
disable. But I think there's an underlying hardware issue, or at least 
hardware to driver mismatch. Since you said irqpoll causes problems 
there's definitely something not working right.

-- 
bill davidsen <davidsen@tmr.com>
  CTO TMR Associates, Inc
  Doing interesting things with small computers since 1979

