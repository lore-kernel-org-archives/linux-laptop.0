From: Aaron Baer <judah@opusnet.com>
Subject: Re: RH 9 and Toshiba Satellite 2545XCDT
Date: 04 Jun 2003 14:24:17 -0700
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <1054761857.2751.8.camel@localhost.localdomain>
References: <20030604094030.A10210@helium.inexs.com>
	 <20030604131623.GA24291@fede2.tumsan.fi>
	 <20030604131623.GA24291@fede2.tumsan.fi>
	 <5.2.1.1.0.20030604125622.018cb200@fluent2.pyramid.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <5.2.1.1.0.20030604125622.018cb200@fluent2.pyramid.net>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Satchell <list@fluent2.pyramid.net>
Cc: linux-laptop <linux-laptop@vger.kernel.org>

On Wed, 2003-06-04 at 13:25, Stephen Satchell wrote:
>   I'm trying to find out why 
> there is a routing table entry for 169.254.0.0/16 on eth0.  (I suspect a 
> script blew up, but I have to trace it.)  

This is a new to RH9 and it has to do with Zeroconf
http://www.zeroconf.org/ , zero configuration ip addressing like
connection two laptops together with a cross over cable. "without
needing a man in a white lab coat to set it all up for you" as they say
on their site. 


It can be turned off by adding 

NOZEROCONF=yes

to any of your /etc/sysconfig/network-scripts/ifcfg-* files.. 

ifcfg-eth0 for instance.

A-

-- 
----
Aaron Baer
judah@opusnet.com
http://www.cat.pdx.edu/~baera/

