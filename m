From: damon fasching <damon3937@yahoo.com>
Subject: installing debian woody and setting up X on a Presario 721
Date: Sat, 3 Aug 2002 18:46:48 -0700 (PDT)
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <43578.1715358191$1028425582@news.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-632576839-1028425608=:23256"
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
To: linux-x11@vger.kernel.org, linux-laptop@vger.kernel.org, debian-laptop@lists.debian.org
Cc: dpfasching@lbl.gov

--0-632576839-1028425608=:23256
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I posted a couple of days ago with a question
regarding configuring X under debian for a presario
721.  Thanks go to Derek, Bonz, Kevin and Juraj for
the help!  I'm happy now.  And for those of you who
may be faced with a similar task in the future...

The basic problem was I had selected the wrong xserver
driver.  I chose xserver-s3 instead of xserver-savage.
 A couple of related problems, I was using debian
potato and version 3.x of X.  You'll definitely want
to use the woody distribution and version 4.x of X.

Here are a few Presario specific details for a network
installation of Debian woody and configuration of X. 
This is not a recipe for network installation of
Debian (the recipe is basically pop in the rescue
floppy and hit return a few times, but be ready to
answer a few system specific questions...).

To do the network installation, you will need to grab
the two driver floppies in addition to the rescue and
root floppies from:
http://ftp.us.debian.org/debian/dists/woody/main/disks-i386/current/images-1.44/compact
You'll need the drivers because the NIC driver is not
included in the installation disks.

Do the usual, boot with the rescue floppy and follow
the menus.  When you get to the "install kernel and
driver modules" select floppy and ... follow the
instructions.  After the two driver floppies have
installed, the next option is "configure device driver
modules".  Here you will need to configure "net" and
choose the 8139too driver for the realtek-8139 NIC
that comes with the Presario.  After installing that
it kicks you into "configure the network" where you
will need to answer the usual networking questions. 
Then you should be ready to "install the base system"
from the network.  That's it as far as installation
goes.

At this point, reboot with the boot floppy which I'm
sure you made at the end of the installation and
answer the configuration questions.  I'm pretty sure
you need to keep pcmcia support even though the
default is not to.  (Let me know if I'm wrong about
that.  The Presario has a PC card slot, so I assume if
I want to use it I need to have pcmcia support...)

For apt, I selected non-free, non-us and contrib.  I
also chose "select another apt source" and then the
edit by hand option.  I changed stable to unstable
everywhere.  If you choose not to do this, you will
have different versions of some of the packages and
the configuration stuff below may not apply.  (btw,
the editor is a little funky here.  Changing stable to
unstable caused a couple of the lines to wrap. 
Instead of just wrapping the lines, the editor
actually inserted a newline! This screwed things up
and I had to go back and do it again.  If this happens
to you, insert a blank space at the end of the
truncated line and then backspace its tail, which is
on the next line, back over the newline.)

I said NO to tasksel and then YES to dselect.  I just
wanted to grab X and my window manager.  In dselect, I
got xdm, fvwm and everything on which it depends. 
This is going to grab X for you.  Or, you can probably
just grab xlibs directly.  xlibs suggests
xserver-xfree86...GET IT.  I grabbed a few other
suggested packages (xbase-clients, xfonts-100dpi,
sfonts-base, xterm, xutils).

For package configuration, I said only bother me with
high priority questions.

When you get to xserver-xfree86 configuration, there
are a lot of ways to answer the questions.  I'll just
put down my answers because it worked.
  take savage for the driver  (this is a must)
  yes to kernel framebuffer device interface
           (savage chip supports frame buffers)
  /dev/psaux mouse port and PS/2 mouse
  LCD monitor
  1024x768 @ 60 Hz

After the configuration was finished and all the boot
stuff was set up (won't go into that, mine is dual
boot with xp), reboot.

Ok, at this point, X was ALMOST working.  My colors
were off, the resolution was poor, and the pointing
device was not aligned correctly (it actually appeared
above and to the left of the item it was selecting). 
Rebooting again fixed the colors, go figure.  For the
rest, I checked into /etc/X11/XF86Config-4 and found
that the default color depth was 24 bits and that at
24 bits the resolution was set to 800x600.  Why does X
configuration ask the monitor resolution if it is just
going to ignore the answer?  Good question.  Change
the mode there to "1024x768".  That is the only mode
you need.  24 bit color should be the default.  I just
deleted the others.  That solved the problem. 
Everything worked fine.  Just for good measure, I
changed the refresh and sync rates as well.

I've included the configuration file I'm using.

Damon


__________________________________________________
Do You Yahoo!?
Yahoo! Health - Feel better, live better
http://health.yahoo.com
--0-632576839-1028425608=:23256
Content-Type: application/octet-stream; name=XF86Config-4
Content-Transfer-Encoding: base64
Content-Description: XF86Config-4
Content-Disposition: attachment; filename=XF86Config-4

IyMjIEJFR0lOIERFQkNPTkYgU0VDVElPTgojIFhGODZDb25maWctNCAoWEZy
ZWU4NiBzZXJ2ZXIgY29uZmlndXJhdGlvbiBmaWxlKSBnZW5lcmF0ZWQgYnkg
ZGV4Y29uZiwgdGhlCiMgRGViaWFuIFggQ29uZmlndXJhdGlvbiB0b29sLCB1
c2luZyB2YWx1ZXMgZnJvbSB0aGUgZGViY29uZiBkYXRhYmFzZS4KIwojIEVk
aXQgdGhpcyBmaWxlIHdpdGggY2F1dGlvbiwgYW5kIHNlZSB0aGUgWEY4NkNv
bmZpZy00IG1hbnVhbCBwYWdlLgojIChUeXBlICJtYW4gWEY4NkNvbmZpZy00
IiBhdCB0aGUgc2hlbGwgcHJvbXB0LikKIwojIElmIHlvdSB3YW50IHlvdXIg
Y2hhbmdlcyB0byB0aGlzIGZpbGUgcHJlc2VydmVkIGJ5IGRleGNvbmYsIG9u
bHkgbWFrZSBjaGFuZ2VzCiMgYmVmb3JlIHRoZSAiIyMjIEJFR0lOIERFQkNP
TkYgU0VDVElPTiIgbGluZSBhYm92ZSwgYW5kL29yIGFmdGVyIHRoZQojICIj
IyMgRU5EIERFQkNPTkYgU0VDVElPTiIgbGluZSBiZWxvdy4KIwojIFRvIGNo
YW5nZSB0aGluZ3Mgd2l0aGluIHRoZSBkZWJjb25mIHNlY3Rpb24sIHJ1biB0
aGUgY29tbWFuZDoKIyAgIGRwa2ctcmVjb25maWd1cmUgeHNlcnZlci14ZnJl
ZTg2CiMgYXMgcm9vdC4gIEFsc28gc2VlICJIb3cgZG8gSSBhZGQgY3VzdG9t
IHNlY3Rpb25zIHRvIGEgZGV4Y29uZi1nZW5lcmF0ZWQKIyBYRjg2Q29uZmln
IG9yIFhGODZDb25maWctNCBmaWxlPyIgaW4gL3Vzci9zaGFyZS9kb2MveGZy
ZWU4Ni1jb21tb24vRkFRLmd6LgoKU2VjdGlvbiAiRmlsZXMiCglGb250UGF0
aAkidW5peC86NzEwMCIJCQkjIGxvY2FsIGZvbnQgc2VydmVyCgkjIGlmIHRo
ZSBsb2NhbCBmb250IHNlcnZlciBoYXMgcHJvYmxlbXMsIHdlIGNhbiBmYWxs
IGJhY2sgb24gdGhlc2UKCUZvbnRQYXRoCSIvdXNyL2xpYi9YMTEvZm9udHMv
bWlzYyIKCUZvbnRQYXRoCSIvdXNyL2xpYi9YMTEvZm9udHMvY3lyaWxsaWMi
CglGb250UGF0aAkiL3Vzci9saWIvWDExL2ZvbnRzLzEwMGRwaS86dW5zY2Fs
ZWQiCglGb250UGF0aAkiL3Vzci9saWIvWDExL2ZvbnRzLzc1ZHBpLzp1bnNj
YWxlZCIKCUZvbnRQYXRoCSIvdXNyL2xpYi9YMTEvZm9udHMvVHlwZTEiCglG
b250UGF0aAkiL3Vzci9saWIvWDExL2ZvbnRzL1NwZWVkbyIKCUZvbnRQYXRo
CSIvdXNyL2xpYi9YMTEvZm9udHMvMTAwZHBpIgoJRm9udFBhdGgJIi91c3Iv
bGliL1gxMS9mb250cy83NWRwaSIKRW5kU2VjdGlvbgoKU2VjdGlvbiAiTW9k
dWxlIgoJTG9hZAkiR0xjb3JlIgoJTG9hZAkiYml0bWFwIgoJTG9hZAkiZGJl
IgoJTG9hZAkiZGRjIgoJTG9hZAkiZHJpIgoJTG9hZAkiZXh0bW9kIgoJTG9h
ZAkiZnJlZXR5cGUiCglMb2FkCSJnbHgiCglMb2FkCSJpbnQxMCIKCUxvYWQJ
InBleDUiCglMb2FkCSJyZWNvcmQiCglMb2FkCSJzcGVlZG8iCglMb2FkCSJ0
eXBlMSIKCUxvYWQJInZiZSIKCUxvYWQJInhpZSIKRW5kU2VjdGlvbgoKU2Vj
dGlvbiAiSW5wdXREZXZpY2UiCglJZGVudGlmaWVyCSJHZW5lcmljIEtleWJv
YXJkIgoJRHJpdmVyCQkia2V5Ym9hcmQiCglPcHRpb24JCSJDb3JlS2V5Ym9h
cmQiCglPcHRpb24JCSJYa2JSdWxlcyIJInhmcmVlODYiCglPcHRpb24JCSJY
a2JNb2RlbCIJInBjMTA0IgoJT3B0aW9uCQkiWGtiTGF5b3V0IgkidXMiCkVu
ZFNlY3Rpb24KClNlY3Rpb24gIklucHV0RGV2aWNlIgoJSWRlbnRpZmllcgki
Q29uZmlndXJlZCBNb3VzZSIKCURyaXZlcgkJIm1vdXNlIgoJT3B0aW9uCQki
Q29yZVBvaW50ZXIiCglPcHRpb24JCSJEZXZpY2UiCQkiL2Rldi9wc2F1eCIK
CU9wdGlvbgkJIlByb3RvY29sIgkJIlBTLzIiCglPcHRpb24JCSJFbXVsYXRl
M0J1dHRvbnMiCSJ0cnVlIgoJT3B0aW9uCQkiWkF4aXNNYXBwaW5nIgkJIjQg
NSIKRW5kU2VjdGlvbgoKU2VjdGlvbiAiSW5wdXREZXZpY2UiCglJZGVudGlm
aWVyCSJHZW5lcmljIE1vdXNlIgoJRHJpdmVyCQkibW91c2UiCglPcHRpb24J
CSJTZW5kQ29yZUV2ZW50cyIJInRydWUiCglPcHRpb24JCSJEZXZpY2UiCQki
L2Rldi9pbnB1dC9taWNlIgoJT3B0aW9uCQkiUHJvdG9jb2wiCQkiSW1QUy8y
IgoJT3B0aW9uCQkiRW11bGF0ZTNCdXR0b25zIgkidHJ1ZSIKCU9wdGlvbgkJ
IlpBeGlzTWFwcGluZyIJCSI0IDUiCkVuZFNlY3Rpb24KClNlY3Rpb24gIkRl
dmljZSIKCUlkZW50aWZpZXIJIkdlbmVyaWMgVmlkZW8gQ2FyZCIKCURyaXZl
cgkJInNhdmFnZSIKCU9wdGlvbgkJIlVzZUZCRGV2IgkJInRydWUiCkVuZFNl
Y3Rpb24KClNlY3Rpb24gIk1vbml0b3IiCglJZGVudGlmaWVyCSJHZW5lcmlj
IE1vbml0b3IiCglIb3JpelN5bmMJMzAtNzAKCVZlcnRSZWZyZXNoCTUwLTkw
CglPcHRpb24JCSJEUE1TIgpFbmRTZWN0aW9uCgpTZWN0aW9uICJTY3JlZW4i
CglJZGVudGlmaWVyCSJEZWZhdWx0IFNjcmVlbiIKCURldmljZQkJIkdlbmVy
aWMgVmlkZW8gQ2FyZCIKCU1vbml0b3IJCSJHZW5lcmljIE1vbml0b3IiCglE
ZWZhdWx0RGVwdGgJMjQKCVN1YlNlY3Rpb24gIkRpc3BsYXkiCgkJRGVwdGgJ
CTI0CgkJTW9kZXMJCSIxMDI0eDc2OCIKCUVuZFN1YlNlY3Rpb24KRW5kU2Vj
dGlvbgoKU2VjdGlvbiAiU2VydmVyTGF5b3V0IgoJSWRlbnRpZmllcgkiRGVm
YXVsdCBMYXlvdXQiCglTY3JlZW4JCSJEZWZhdWx0IFNjcmVlbiIKCUlucHV0
RGV2aWNlCSJHZW5lcmljIEtleWJvYXJkIgoJSW5wdXREZXZpY2UJIkNvbmZp
Z3VyZWQgTW91c2UiCglJbnB1dERldmljZQkiR2VuZXJpYyBNb3VzZSIKRW5k
U2VjdGlvbgoKU2VjdGlvbiAiRFJJIgoJTW9kZQkwNjY2CkVuZFNlY3Rpb24K
CiMjIyBFTkQgREVCQ09ORiBTRUNUSU9OCg==

--0-632576839-1028425608=:23256--
