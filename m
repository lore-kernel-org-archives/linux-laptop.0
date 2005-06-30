From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: PCI Power management (was: Re: [PATCH 4/13]: PCI Err: e100
	ethernet driver recovery
Date: Fri, 01 Jul 2005 09:32:43 +1000
Message-ID: <1120174364.31924.57.camel@gaston>
References: <20050628235848.GA6376@austin.ibm.com>
	<1120009619.5133.228.camel@gaston>
	<20050629155954.GH28499@austin.ibm.com>
	<20050629165828.GA73550@muc.de> <20050630203931.GY28499@austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc64-dev-bounces@ozlabs.org>
In-Reply-To: <20050630203931.GY28499@austin.ibm.com>
List-Id: <linux-laptop.vger.kernel.org>
List-Unsubscribe: <https://ozlabs.org/mailman/listinfo/linuxppc64-dev>,
	<mailto:linuxppc64-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc64-dev>
List-Post: <mailto:linuxppc64-dev@ozlabs.org>
List-Help: <mailto:linuxppc64-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc64-dev>,
	<mailto:linuxppc64-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc64-dev-bounces@ozlabs.org
Errors-To: linuxppc64-dev-bounces@ozlabs.org
Content-Type: text/plain; charset="us-ascii"
To: Linas Vepstas <linas@austin.ibm.com>
Cc: sfr@canb.auug.org.au, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, long <tlnguyen@snoqualmie.dp.intel.com>, Greg KH <greg@kroah.com>, linux-laptop@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@muc.de>, pavel@suse.cz, Paul Mackerras <paulus@samba.org>, linuxppc64-dev <linuxppc64-dev@ozlabs.org>, linux-pci@atrey.karlin.mff.cuni.cz, johnrose@us.ibm.com, mochel@transmeta.com

On Thu, 2005-06-30 at 15:39 -0500, Linas Vepstas wrote:

> Thus, the right thing to do might be to split up the 
> struct pci_dev->suspend() and pci_dev->resume() calls into
> 
>    suspend()
>    poweroff()
>    poweron()
>    resume()

No. There are very good reasons not to do that split at the pci_dev
level.
 
> and then have the generic pci error recovery routines call
> suspend/resume only, skipping the poweroff-on calls.  Does that 
> sound good?
> 
> I'm not sure I can pull this off without having someone from 
> the power-management world throw a brick at me.

Just keep the error recovery callbacks for now, and we might be able to
provide a generic "helper" doing the watchdog thing (yes, there is a
watchdog in the net core)

Ben.
