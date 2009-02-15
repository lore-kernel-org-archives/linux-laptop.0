From: Alexandre Rostovtsev <tetromino@gmail.com>
Subject: Re: [0/3] lenovo-sl-laptop : new driver for drivers/staging
Date: Sun, 15 Feb 2009 11:35:32 -0500
Message-ID: <4ab4bbae0902150835h1158118wcb95be75d17ec37c@mail.gmail.com>
References: <20090214051214.359d4fd4@leftboat.lan>
	 <20090214145256.GA7071@infradead.org>
	 <1234627163.7293.196.camel@violet>
	 <20090215122956.GB7660@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754445AbZBOQfp@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=lIZ9F5Aqxu4A/pJtfyv0KH+T8MzYF41f0O6CBXA40Og=;
        b=LLzMUbEZNLr/2Fi7jkuwmW/L4Tj/LC6re08d5cWLARPwlBcGGX6L7JcDaKXiVrKlpl
         5lMDwfXnlYqptu1kjvuEZeO05E+0RllLUtbhDPkx0OnZok/9JX7kMKZIZFwM8UvfTMzj
         SA4rfCzMpGCtWNk1IAKSYq0xGLvR83gYZthxc=
In-Reply-To: <20090215122956.GB7660@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Marcel Holtmann <marcel@holtmann.org>, Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org

On Sun, Feb 15, 2009 at 7:29 AM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> We will be happy to review the driver in linux-acpi.  Submitting it as
> a single patch against latest Linus is probably best.

I think I found the fan speed interface; I will resubmit to linux-acpi
after I finish it.

> Oh, and it
> should be checkpatch-clean if it isn't already.

Checkpatch complains about static variables initialized to 0. Since
it's my first time writing kernel code, I have to ask what are
probably obvious questions.
1. Why is initializing a static variable to 0 bad? or worse than
initializing that variable to 1, or -1?
2. If I want to have a module parameter whose default value is 0, what
should I do to stop checkpatch from complaining?

-Alexandre
