From: Zwane Mwaikambo <zwane@linuxpower.ca>
Subject: Re: 2.5.69+bk: oops in apmd after waking up from suspend mode
Date: Mon, 19 May 2003 17:57:48 -0400 (EDT)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.50.0305190840080.28750-100000@montezuma.mastecende.com>
References: <200305191216.h4JCGONj015081@harpo.it.uu.se>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <200305191216.h4JCGONj015081@harpo.it.uu.se>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mikpe@csd.uu.se
Cc: alexander.riesen@synopsys.COM, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org

On Mon, 19 May 2003 mikpe@csd.uu.se wrote:

> As to _why_ kapmd's current->mm is NULL, I don't know. It isn't
> when I test APM suspend in 2.5.69-bk. A lot of code dereferences
> current->mm without checking, so I guess current->mm==NULL is a bug.

For kernel threads (as is the case with kapmd) current->mm would be NULL.

	Zwane

-- 
function.linuxpower.ca
