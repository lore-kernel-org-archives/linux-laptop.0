From: FaRaOhh <faraohh@ih.com.br>
Subject: Framebuffer problema.
Date: Sat, 06 Sep 2003 11:24:58 -0300
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <1062858298.4630.123.camel@toshibao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop <linux-laptop@vger.kernel.org>

Hi all,
	I have one Notebook toshiba satellite 2430-S255 (graphics Geforce 4 go
32mb) and I've compilled kernel-2.6.0-test4, but I have one problem too
:) I have set:

# Graphics support
#
CONFIG_FB=y
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_IMSTT is not set
CONFIG_FB_VGA16=y
CONFIG_FB_VESA=y
CONFIG_VIDEO_SELECT=y
# CONFIG_FB_HGA is not set
CONFIG_FB_RIVA=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_MDA_CONSOLE=m
CONFIG_DUMMY_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_PCI_CONSOLE=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y

	When restart I put the GRUB vga=788 till 791 but the screen gets black
and normally runs, that is, no kernel panic but I don't see nothing.
Does anybody know how to solve the problem?

-- 
Debian User:629
FaRaOhh - Marcello Henrique
Inhumas - Goias - Brasil

