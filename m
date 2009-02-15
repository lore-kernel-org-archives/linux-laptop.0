From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [0/3] lenovo-sl-laptop : new driver for drivers/staging
Date: Sun, 15 Feb 2009 09:29:56 -0300
Message-ID: <20090215122956.GB7660@khazad-dum.debian.net>
References: <20090214051214.359d4fd4@leftboat.lan> <20090214145256.GA7071@infradead.org> <1234627163.7293.196.camel@violet>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754869AbZBOMaT@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1234627163.7293.196.camel@violet>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Christoph Hellwig <hch@infradead.org>, Alexandre Rostovtsev <tetromino@gmail.com>, linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org

On Sat, 14 Feb 2009, Marcel Holtmann wrote:
> > > Patches against 2.6.29-rc5 will be in following emails.
> > Please submit it to the kernel proper, not the staging tree.  Also
> > please just submit it in one patch instead of the split.
> 
> I can only second that. This is not a driver that belongs anywhere near
> the staging tree. It should be instead sent to the ACPI mailing list for
> review.
> 
> The staging tree should _NOT_ be used as a shortcut for upstream
> inclusion.

I don't think that was what was happening (I should hope nothing can
get promoted from staging without the usual reviews, anyway!), but
whatever.

We will be happy to review the driver in linux-acpi.  Submitting it as
a single patch against latest Linus is probably best.  Oh, and it
should be checkpatch-clean if it isn't already.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
