From: FaRaOhh <faraohh@ih.com.br>
Subject: Re: Problem kernel 2.6 with Toshiba
Date: 21 Aug 2003 10:44:13 -0300
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <1061473007.578.24.camel@toshibao>
References: <BF1FE1855350A0479097B3A0D2A80EE009FC65@hdsmsx402.hd.intel.com>
	 <1061070314.553.13.camel@toshibao>  <rvq65ksy7ly.fsf@alkofen.muc.sdm.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <rvq65ksy7ly.fsf@alkofen.muc.sdm.de>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Perkens-Golomb, Burkhard" <burkhard.perkens-golomb@sdm.de>
Cc: linux-laptop@vger.kernel.org

Em Qua, 2003-08-20 =E0s 06:57, Perkens-Golomb, Burkhard escreveu:
> I'm not sure but did you set all necessary IDE parameters during
> kernel configuration? Particulary:
>=20
> ,----
> | # CONFIG_BLK_DEV_HD_IDE is not set
> | # CONFIG_BLK_DEV_HD is not set
> | CONFIG_BLK_DEV_IDEDISK=3Dm
> `----
>=20
> I remember the error message when I forgot to include IDE support in
> the kernel :-) .
>=20
>     Burkhard
>=20
Change the error.

devfs_mk_dir: Invalid argument <6>hda: hda1 hda2 hda3 hda4
ACPI: (supports S0 S3 S4 S5)
hda: bad access: block=3D 21462842, count=3D2
end_request: I/O error, dev hda, sector 21462842
EXT2-fs: unable to read superblock
hda: bad access: block 21462904, count=3D2
end_request: I/O error, dev hda, sector 21462904
isofs_full_super: bread failed, dev=3Dhda3, iso_blknum=3D16, block=3D32
kernel panic: VFS Unable to mount root fs on hda3

My /boot/grub/menu.lst is:
root(hd0,2)
kernel /boot/vmlinuz-2.6.0-test2 root=3D/dev/hda3

Now do you think that is? help me again...

-
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
