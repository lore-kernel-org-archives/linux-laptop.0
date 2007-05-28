From: walter harms <wharms@bfs.de>
Subject: Re: [KJ] linux-2.6.21: apm.c remove unused variables
Date: Mon, 28 May 2007 13:04:40 +0200
Message-ID: <465AB748.9080606@bfs.de>
References: <46446F84.5020000@bfs.de>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-bounces@lists.linux-foundation.org>
In-Reply-To: <46446F84.5020000@bfs.de>
List-Id: <linux-laptop.vger.kernel.org>
List-Unsubscribe: <https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors>,
	<mailto:kernel-janitors-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linux-foundation.org/pipermail/kernel-janitors>
List-Post: <mailto:kernel-janitors@lists.linux-foundation.org>
List-Help: <mailto:kernel-janitors-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors>,
	<mailto:kernel-janitors-request@lists.linux-foundation.org?subject=subscribe>
Sender: kernel-janitors-bounces@lists.linux-foundation.org
Errors-To: kernel-janitors-bounces@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Cc: kj <kernel-janitors@lists.osdl.org>, linux-laptop@vger.kernel.org


hi list,
i did not get any comment about this patch. does that mean everyone is happy ?

re,
 wh


walter harms wrote:
> Hello list,
> 
> this patch removes the unused variables
> clock_cmos_diff
> got_clock_diff
> from apm.c
> 
> 
> note:
> an other clock_cmos_diff is defined (and used):
> x86_64/kernel/time.c:static long clock_cmos_diff;
> 
> Signed-off-by: walter harms <wharms@bfs.de>
> 
> 
> --- linux-2.6.21/arch/i386/kernel/apm.c.org     2007-05-11 15:25:06.000000000 +0200
> +++ linux-2.6.21/arch/i386/kernel/apm.c 2007-05-11 15:25:47.000000000 +0200
> @@ -383,14 +383,6 @@
>  static int                     ignore_sys_suspend;
>  static int                     ignore_normal_resume;
>  static int                     bounce_interval __read_mostly = DEFAULT_BOUNCE_INTERVAL;
> -
> -#ifdef CONFIG_APM_RTC_IS_GMT
> -#      define  clock_cmos_diff 0
> -#      define  got_clock_diff  1
> -#else
> -static long                    clock_cmos_diff;
> -static int                     got_clock_diff;
> -#endif
>  static int                     debug __read_mostly;
>  static int                     smp __read_mostly;
>  static int                     apm_disabled = -1;
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
> 
> 
> 
