From: Felix Seeger <felix.seeger@gmx.de>
Subject: Re: fsck and shutdown
Date: Sun, 9 Jun 2002 16:08:05 +0200
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <200206091608.05626.felix.seeger@gmx.de>
References: <Pine.LNX.4.21.0206091419030.9105-100000@dnabank.bot.tcd.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0206091419030.9105-100000@dnabank.bot.tcd.ie>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am Sonntag, 9. Juni 2002 15:29 schrieb Nicolas Salamin:
> Hi,
>
> I've got SuSE linux 7.3 installed on a Dell Inspiron 2500. I recently got
> a problem when shutting down (or restarting) the computer. At boot up, the
> message "/dev/hda4 (root partition) not cleanly unmouted" appears and
> fsck is run to check the filesystems. But that's when "shutdown -h (or
> -r) now" is used to shutdown the computer, and even when the "/dev/hda4
> unmounted" appears in the message log during the shutdown.
> I tried to check /etc/fstab or /etc/inittab but nothing seems wrong. Any
> ideas??
>
> Thanks,
>
> Nicolas

Don't know if that is possible but can you add a sleep after sync --> umount 
- --> sleep?
Maybe the notebook goes down to fast.

have fun
Felix
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9A2FFS0DOrvdnsewRAi9yAJ91aMq7IRIqGSTjvI2n9PJD+sf35wCfTNTA
tUpMg/f3CglKvN+1+ab9Q6I=
=tDsQ
-----END PGP SIGNATURE-----

