From: davidsen@tmr.com (bill davidsen)
Subject: Re: 2.5.69+bk: oops in apmd after waking up from suspend mode
Date: 22 May 2003 17:01:25 GMT
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <baivp5$jc9$1@gatekeeper.tmr.com>
References: <200305191216.h4JCGONj015081@harpo.it.uu.se> <20030519123119.GA20385@Synopsys.COM> <20030519144130.GM32559@Synopsys.COM> <3ECA05FA.6090008@gmx.net>
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

In article <3ECA05FA.6090008@gmx.net>,
Carl-Daniel Hailfinger  <c-d.hailfinger.kernel.2003@gmx.net> wrote:

| Could you try to compile with gcc-3.3? In another thread (2.5.69-mm6:
| pccard oops) this helped IIRC. I'm suspecting gcc 3.2.3 generates
| incorrect code for some cases.

Seems to, there have been comments regarding this on other lists.
-- 
bill davidsen <davidsen@tmr.com>
  CTO, TMR Associates, Inc
Doing interesting things with little computers since 1979.
