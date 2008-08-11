From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Network install fails at TFTP load on client pc
Date: Mon, 11 Aug 2008 13:16:45 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0808111300010.4067@xena.cft.ca.us>
References: <282223.71623.qm@web59715.mail.ac4.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <282223.71623.qm@web59715.mail.ac4.yahoo.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil C <hpypenguin@yahoo.com>
Cc: Laptop Mailing List <linux-laptop@vger.kernel.org>

On Thu, 7 Aug 2008, Phil C wrote:

>   I am trying to isntall ubuntu via the network to a laptop that has no 
>  installed os and no optical or disk drive.

That's hard!

>  #  Cleaned up dhcpd.conf file.
> --snip--
>      filename "/var/lib/tftpboot/test/pxelinux.0";

Is this a pre-installer kernel and initrd for Ubuntu to be used for PXE 
booting?  Often the two components are in separate files; the initrd may be 
called "root.image" or something like that.

>  The services both show that they are active and the laptop recieves DHCP 
>  requests on boot and is assigned an ip address. It then attempts to initiate 
>  TFTP and times out. The following is the end of dmesg 

dmesg or /var/log/syslog on the server running tftpd and dhcpd, right?

>  ###end of dmesg###
>  ### All ip addresses and mac addresses obscured for security ###
>  
>  x:xx:xx SRC=192.168.10.xx DST=192.168.10.xx LEN=78 TOS=0x00 PREC=0x00 TTL=20 
>  ID=2 PROTO=UDP SPT=2070 DPT=69 LEN=58 
>  [101285.992494] Unknown InputIN=eth0 OUT= 
>  MAC=00:0b:cd:05:a9:c0:00:08:0d:b5:dc:xx:xx:xx SRC=192.168.10.xx 
>  DST=192.168.10.xx LEN=78 TOS=0x00 PREC=0x00 TTL=20 ID=3 PROTO=UDP SPT=2071 
>  DPT=69 LEN=58 

It looks like the firewall on the server is tossing TFTP packets from some 
other machine, presumably the laptop.  Since TFTP is the most insecure of 
protocols, this is very likely behavior for a firewall.  Temporarily allow 
UDP port 69 to enter the server and the laptop's booter should be a lot 
happier.  But you'll have to figure out the right way to do this on the 
Ubuntu firewall (I'm assuming it's Ubuntu on the server).

>  I downloaded the gutsy netboot package and extracted it into the folder 
>  /var/lib/tftpboot/test. iptables has been configured to allow all 
>  connections to and from the laptop on the local connection.

Well, the server's kernel is still logging TFTP packets, so there must be 
another place in the iptables that needs to be perforated (temporarily).  
Likely the firewall specifically blocks a laundry list of ports (or more 
likely, allows only listed ports) no matter where they come from, plus 
there is probably a chain to whitelist a specific IP address range and 
block all others.  Both chains must be passed for the packet to be 
accepted.  That's how a lot of firewalls work, but I've never seen what 
Ubuntu gives you.

Can you borrow a USB external DVD drive?  That's what we do when the 
optical drive on a machine is unuseable: take the external drive off our 
burner host and use it on the uncooperative machine.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)
