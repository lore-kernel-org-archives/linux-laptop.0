From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [0/3] lenovo-sl-laptop : new driver for drivers/staging
Date: Sat, 14 Feb 2009 16:59:23 +0100
Message-ID: <1234627163.7293.196.camel@violet>
References: <20090214051214.359d4fd4@leftboat.lan>
	 <20090214145256.GA7071@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <20090214145256.GA7071@infradead.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Alexandre Rostovtsev <tetromino@gmail.com>, linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org

Hi Christoph,

> > Patches against 2.6.29-rc5 will be in following emails.
> 
> Please submit it to the kernel proper, not the staging tree.  Also
> please just submit it in one patch instead of the split.

I can only second that. This is not a driver that belongs anywhere near
the staging tree. It should be instead sent to the ACPI mailing list for
review.

The staging tree should _NOT_ be used as a shortcut for upstream
inclusion.

Regards

Marcel


