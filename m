From: Phil C <hpypenguin@yahoo.com>
Subject: Network install fails at TFTP load on client pc
Date: Thu, 7 Aug 2008 22:30:33 -0700 (PDT)
Message-ID: <282223.71623.qm@web59715.mail.ac4.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laptop Mailing List <linux-laptop@vger.kernel.org>

  I am trying to isntall ubuntu via the network to a laptop that has no installed 

 os and no optical or disk drive. Attemps at installing via USB drive have also 
 proven unsuccesful due to compatibility issues. The laptop is a Toshiba Portege 
 M205-s810. I have configured dhcp3 using the following dhcpd.conf file. 
 
 
 #
 #  Cleaned up dhcpd.conf file.
 ## arbitrary ip addresses ##
 #  Last edit was at 0652 2008.08.07 to allow booting
 #
 
 authoritative;
 allow booting;
 allow bootp;
 
 default-lease-time 14400;
 max-lease-time 86400;
 ddns-ttl 14400;
 
 subnet 192.168.10.0 netmask 255.255.255.224 {
     range 192.168.10.24 192.168.10.30;
     }
     
     ignore client-updates;
 
     #options
     option subnet-mask 255.255.255.224;
     option broadcast-address 192.168.10.31;
 
     option routers 127.0.0.1;
     option domain-name-servers 192.168.10.9, 192.168.10.5;
     option domain-name "network.install";
 
     #Declare laptop
 
     #tftpd server info
     next-server 192.168.10.xx; #Last octet deleted for security
     host tftpclient {
     hardware ethernet 00:08:0d:xx:xx:xx; #Last 3 hex numbers deleted for 
 security
     fixed-address 192.168.10.xx;         #Last octet deleted for security
     filename "/var/lib/tftpboot/test/pxelinux.0";
     }
 
 ## end dhcpd.conf ##
 ## All ip addresses and mac addresses obscured for security ##
 
 I then launch tftpd and dhcpd using the following commands as root
 
 #>in.tftpd /var/lib/tftpboot/test
 #>/etc/init.d/dhcp3-server restart
 
 The services both show that they are active and the laptop recieves DHCP 
 requests on boot and is assigned an ip address. It then attempts to initiate 
 TFTP and times out. The following is the end of dmesg during these attempts.
 
 ###end of dmesg###
 ### All ip addresses and mac addresses obscured for security ###
 
 x:xx:xx SRC=192.168.10.xx DST=192.168.10.xx LEN=78 TOS=0x00 PREC=0x00 TTL=20 
 ID=2 PROTO=UDP SPT=2070 DPT=69 LEN=58 
 [101285.992494] Unknown InputIN=eth0 OUT= 
 MAC=00:0b:cd:05:a9:c0:00:08:0d:b5:dc:xx:xx:xx SRC=192.168.10.xx 
 DST=192.168.10.xx LEN=78 TOS=0x00 PREC=0x00 TTL=20 ID=3 PROTO=UDP SPT=2071 
 DPT=69 LEN=58 
 [101290.001452] Unknown InputIN=eth0 OUT= 
 MAC=00:0b:cd:05:a9:c0:00:08:0d:b5:dc:xx:xx:xx SRC=192.168.10.xx 
 DST=192.168.10.xx LEN=78 TOS=0x00 PREC=0x00 TTL=20 ID=4 PROTO=UDP SPT=2072 
 DPT=69 LEN=58 
 [101295.987430] Unknown InputIN=eth0 OUT= 
 MAC=00:0b:cd:05:a9:c0:00:08:0d:b5:dc:xx:xx:xx SRC=192.168.10.xx 
 DST=192.168.10.xx LEN=78 TOS=0x00 PREC=0x00 TTL=20 ID=5 PROTO=UDP SPT=2073 
 DPT=69 LEN=58 
 
 
 The following is displayed on the laptop after failure.
 
 PXE-E32: TFTP open timeout
 PXE-E32: TFTP open timeout
 PXE-E32: TFTP open timeout
 PXE-M0F: Exiting Intel Boot Agent.
 
 I downloaded the gutsy netboot package and extracted it into the folder 
 /var/lib/tftpboot/test. iptables has been configured to allow all connections to 
 and from the laptop on the local connection.
 
 Am I missing something? What am I doing wrong? Thanks
 
 - Phil C



      

