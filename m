From: Ian Collier <Ian.Collier@comlab.ox.ac.uk>
Subject: Re: Dell precision M50 and _very_ slow process startup
Date: Mon, 13 Jan 2003 16:41:03 +0000
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <20030113164103.G5472@comlab.ox.ac.uk>
References: <200301131627.h0DGRX101413@rapfast.petcom.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <200301131627.h0DGRX101413@rapfast.petcom.com>; from roe@petcom.com on Mon, Jan 13, 2003 at 10:27:32AM -0600
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 13, 2003 at 10:27:32AM -0600, Roe Peterson wrote:
> I'm guessing that this process watches for cd insertion, changes
> to home directory, et. al.

Something like that.  I think it's part of GNOME and is responsible for
making sure there's a CD icon on the screen, or something.

We had a different problem with this beast after installing RH6 some
time ago.  Every few seconds it would cause a spew of messages to the
syslog reporting basically what we knew: there is no CD in the drive.
It turned out though that these messages went away when the CD was
properly reconfigured as a CD-writer by appending "hdc=ide-scsi" to
the boot parameters.  Not that this is at all relevant...

Anyway, no I don't know much about it.

imc
