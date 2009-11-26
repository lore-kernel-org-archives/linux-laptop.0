From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: Re: [PATCH v2] [loongson] yeeloong2f: add platform specific support
Date: Thu, 26 Nov 2009 14:26:44 +0800
Message-ID: <1259216804.4989.54.camel@falcon.domain.org>
References: <9ef5a0038ec5e9b584be8c960693c434a323620a.1258803311.git.wuzhangjin@gmail.com>
	 <9ef5a0038ec5e9b584be8c960693c434a323620a.1258803311.git.wuzhangjin@gmail.com>
	 <20091126041047.GC23244@core.coreip.homeip.net>
	 <1259215215.4989.38.camel@falcon.domain.org>
	 <20091126060854.GK23244@core.coreip.homeip.net>
Reply-To: wuzhangjin@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:organization:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=PDrEKOcis+SqanyZVA5rquxUEuL9tlF5pvqWxfAJzlY=;
        b=p/dL9UajF6LAw6ssGTtI1wOYIAahiJqLSSawL8k1awrr9PMABSQi4gF55z47mqq0Gn
         l0JDX51urH6nAso37fxQHAOQExrXtYWriUqllWNxVQITUq4Kd4w7qmQJoBf3srj7t1uN
         7/k406X1zFx1h9bWrQaAaEHrMSDzjDqK/JcAo=
In-Reply-To: <20091126060854.GK23244@core.coreip.homeip.net>
Sender: linux-input-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Richard Purdie <rpurdie@rpsys.net>, lm-sensors@lm-sensors.org, linux-input@vger.kernel.org, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, sfr@linuxcare.com, linux-kernel@vger.kernel.org

On Wed, 2009-11-25 at 22:08 -0800, Dmitry Torokhov wrote:
[...]
> > > > +	/* SW_VIDEOOUT_INSERT? not included in hald-addon-input! */
> > > > +	{KE_KEY, EVENT_CRT_DETECT, KEY_PROG1},
> > 
> > any available event for reporting the inserted CRT in hald-addon-input?
> 
> Hmm.. not really. Again, does not seem to be related to input subsystem
> but video one.

It's time to remove it from keymap now, I have done some job in the
video_output subdriver for this event ;)

> > > > +	/* Seems battery subdriver should report it */
> > > > +	{KE_KEY, EVENT_OVERTEMP, KEY_PROG2},
> > > 
> > > Does not seem to be an input event?
> > > 
> > 
> > It is not an input event, Will remove it from the keymap table.
> >  
> > BTW: how can we handle this stuff(overtemp...)? lm-sensors? Perhaps
> > temp1_max_alarm or temp1_crit_alarm?
> > 
> 
> Not really sure... HWMON list is a good place to ask I think.

okay, will split the hwmon driver out and send it to lm-sensors mailing
list.

> 
> > > > +	/*{KE_KEY, EVENT_AC_BAT, KEY_BATTERY},*/
> > > > +	{KE_KEY, EVENT_CAMERA, KEY_CAMERA},	/* Fn + ESC */
> > > > +	{KE_KEY, EVENT_SLEEP, KEY_SLEEP},	/* Fn + F1 */
> > > > +	/* Seems not clear? not included in hald-addon-input! */
> > > > +	{KE_KEY, EVENT_BLACK_SCREEN, KEY_PROG3},	/* Fn + F2 */
> > > 
> > > Do you mean "lock screen"?
> > 
> > not lock, close the backlight of the display, any available event here?
> 
> What is it then? A switch that turns off backlight? What is the expected
> reaction to it?
> 

Yes, a switch for turning off/on the backlight, seems no need to report
this key to the users, will remove it too.

> > > > +	if (!yeeloong_hotkey_dev)
> > > > +		return -ENOMEM;
> > > 
> > > Error unwinding?
> > 
> > Sorry, not clear what do you mean here?
> 
> If you just return you will have the SCI stuff that you did a few lines
> above installed... I am concerned whether it is a good idea.
> 

get it, thanks!

I have checked the return value in the module init function:

[...]

yeeloong_init()
{
	[...]
        ret = yeeloong_hotkey_init(&yeeloong_pdev->dev);
        if (ret) {
                yeeloong_hotkey_exit();
                printk(KERN_INFO "Fail init yeeloong hotkey driver.\n");
                return ret;
        }
	[...]

}

[...]

static void yeeloong_hotkey_exit(void)
{
        /* free irq */
        remove_irq(SCI_IRQ_NUM, &sci_irqaction);
	 ...
}

but as a standalone driver, It's better to do something as following:

if (!yeeloong_hotkey_dev) {
	yeeloong_hotkey_exit();
	return -ENOMEM;
}

Thanks & Regards!
	Wu Zhangjin

