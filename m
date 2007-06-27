From: Chuck Ebbert <cebbert@redhat.com>
Subject: Re: 2.6.22-rcX Transmeta/APM regression
Date: Wed, 27 Jun 2007 17:26:18 -0400
Message-ID: <4682D5FA.4050005@redhat.com>
References: <20070627153114.17953.qmail@science.horizon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <20070627153114.17953.qmail@science.horizon.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux@horizon.com
Cc: linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org, hpa@zytor.com

On 06/27/2007 11:31 AM, linux@horizon.com wrote:
> Hardware: Fujitsu Lifebook P-2040, TM5800 800 MHz processor
> 2.6.21: Closing the lid causes APM suspend.  Opening it resumes just fine.
> 2.6.22-rc5/-rc6: On resume, backlight comes on, but system is otherwise
> 	frozen.  Nothing happens until I hold the power button to force
> 	a power off.
> 

.config and contents of /proc/cpuinfo would be helpful...
