From: John Ruttenberg <rutt@chezrutt.com>
Subject: Dell Inspiron i8100 with 2 batteries
Date: Wed, 15 May 2002 11:14:38 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <200205151514.g4FFEcY29899@gate.chezrutt.com>
Reply-To: rutt@chezrutt.com
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org, sfr@canb.auug.org.au

I am using 2.4.18 and have a Dell I8100 with 2 batteries.  If combined charge
of the batteries is less than 50% (according to the bios), then /proc/apm
shows the battery power level X 2.  If the combined charge of the batteries is
greater than 50%, then /proc/apm shows:

    1.16 1.2 0x03 0x01 0xff 0x10 -1% -1 ?

I think this is because the bogus calculation it would make would result in a
percentage > 100.

I took a quick look at arch/i386/kernel/apm.c but it wasn't obvious what to
do.

Does anyone else have any experience with this?
