From: Beartooth <vze2r8s9@verizon.net>
Subject: Connect YDL on iBook to Airport Base Station?
Date: Mon, 23 Sep 2002 16:07:05 -0400
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <amns3i$3ig$1@main.gmane.org>
Reply-To: karhunhammas@lserv.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org

The main partition on my new Terrasoft ibook is
Yellow Dog, installed by Terrasoft. An apple-fancier
friend managed to get it to connect to Apple's wireless
hub, which in turn is cabled to my DSL modem.

	My understanding is that the hub connects to the
laptop (and will eventually connect to my desktop, over
another cable rather than wirelessly) by DHCP, whatever
that is, rather than the way the DSL modem connects to
the hub, whatever that is.

	I have the Terrasoft YDL manual, and have tried
repeatedly to follow Appendix D on setting up the
connection between the YDL partition and the hub; I
*think* I have all the info out of the OSX connection
-- but that was such a dental-surgery operation that I
can't be sure.

	In particular,  I can't guess what the manual means
(page 254) by "different network values, such as IP
address, for your AirPort card," in the file ifcfg-eth1
nor by the parenthesis in the command (p. 256) for
"cleaning the route tables," which looks like this:

route del default gw (IP address)

	I want to use the machine with GPSdrive, which I
can't even download till I get it connected. :-(

-- 
Beartooth the Stubborn <karhunhammas (at) lserv.com>
double retiree & linux hatchling w/ RH 7.2, YDL 2.2, & OSX 10.1
Pine 4.43, Opera 6.03, Pan 0.11.2, Galeon 1.2.5, Mozilla 1.0
Delenda est MegaSleazo! http://www.linuxmall.com/refund/


