From: Nicolas Salamin <salaminn@tcd.ie>
Subject: fsck and shutdown
Date: Sun, 9 Jun 2002 14:29:58 +0100 (IST)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0206091419030.9105-100000@dnabank.bot.tcd.ie>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

Hi,

I've got SuSE linux 7.3 installed on a Dell Inspiron 2500. I recently got
a problem when shutting down (or restarting) the computer. At boot up, the
message "/dev/hda4 (root partition) not cleanly unmouted" appears and
fsck is run to check the filesystems. But that's when "shutdown -h (or
-r) now" is used to shutdown the computer, and even when the "/dev/hda4 
unmounted" appears in the message log during the shutdown.
I tried to check /etc/fstab or /etc/inittab but nothing seems wrong. Any
ideas??

Thanks,

Nicolas

-- 

===============================================
Nicolas Salamin
Department of Botany
Trinity College
Dublin 2 / Ireland

e-mail: salaminn@tcd.ie
	 or n.salamin@rbgkew.org.uk

tel: +353-1-608-1421
fax: +353-1-608-1147

web page:
http://www.tcd.ie/Botany/Postgrad/NSalamin.html
-----------------------------------------------

