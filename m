From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 4/8] Loongson: YeeLoong: add battery driver
Date: Fri, 4 Dec 2009 09:04:08 +0100
Message-ID: <20091204080408.GA1540@ucw.cz>
References: <cover.1259932036.git.wuzhangjin@gmail.com> <059fa216d70771a6341edb2db4cc559e958273e9.1259932036.git.wuzhangjin@gmail.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <059fa216d70771a6341edb2db4cc559e958273e9.1259932036.git.wuzhangjin@gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wu Zhangjin <wuzhangjin@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-laptop@vger.kernel.org

On Fri 2009-12-04 21:34:17, Wu Zhangjin wrote:
> From: Wu Zhangjin <wuzhangjin@gmail.com>
> 
> This patch adds APM emulated Battery Driver, it provides standard
> interface(/proc/apm) for user-space applications(e.g. kpowersave,
> gnome-power-manager) to manage the battery.

It would be nicer if this went to drivers/power, and used its
interface -- providing not only percentage but also other values.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
