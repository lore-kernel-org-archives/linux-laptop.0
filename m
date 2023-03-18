From: "Alan O." <aj.owens.001@gmail.com>
Subject: Issues with applying patch to Linux 6.2.1-060201-generic x86_64 - HP
 Omen - Zorin OS 16.2 based on Ubuntu 20.04 LTS (Focal Fossa)
Date: Sat, 18 Mar 2023 13:05:19 -0700
Message-ID: <CALSL_1caZrxpLC2F=0MWGzOjZxd9_t8hV8k+v9XNj=7cbDMTXA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679169946;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T3M+58gpIp+7PFq46/SjfI9x8EjBnNffRNtcXxrLmGc=;
        b=S/WM1CH5rclqlgnTBxrPOPb7p0kq1zKZNPF/zdaV6iTpKsIV7u67Q9H5bZTRprk7gw
         S5FZa0tZuhxzbOxUz5SG2RMSEBshTCeh9uEHr2Y/Y+PwN3xtVOqqQX1zZm5PsG13RGW+
         +rm+bfRaqTZW5hvAItsUICCRNEEKzaVcMFgBZbo12uTFpVHo5nSMylcaKSPzvPNfcw59
         VPwLsQfNQ9B0fbvk6DkTPit3tEBL9j/FU7e0iy+NfVyXLeN6jD9891Vj7VhRXply/3iR
         8WiC6Jcg5XxZrT+fVG+qTgGm4FG7GM3RXsIBpKOUQPL91HqpzO/eq9eFYud2Z7gNhVrm
         qeUA==
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-laptop@vger.kernel.org

Hello and Good Day!

Apologies for the attachments which had their text extracted by your
system and appended to the end of the email. I have removed the
attachments which were meant to contain the Terminal output for
`lsmod`, `cat /proc/version`, `lspci` and `dpkg -l`.  If these pieces
of information are required/requested, please let me know.

Please understand that I am by no means proficient with patching *anything,*
nor do I have much experience with Linux compared to most.  That said, I
have been working on this for a good while with no success at patching the
kernel to achieve my needs for better thermal control.  I have been
desperately searching for a way to *lower the temperature threshold at
which my fans are activated or increase RPM.   *Please help.

I am trying to apply this patch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=286e937efbc7177c114e80aae9b402131e3886c1

To my Linux 6.2.1-060201-generic x86_64 kernel:

*`cat /proc/version`*
> Linux version 6.2.1-060201-generic (buildd@lcy02-amd64-016)
(x86_64-linux-gnu-gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU
Binutils for Ubuntu) 2.34) #202302260629-Ubuntu SMP PREEMPT_DYNAMIC

*`lsb_release -a`*
> No LSB modules are available.
Distributor ID: Zorin
Description: Zorin OS 16.2
Release: 16
Codename: focal

Reason:
To Fix Thermal Policy Handling For Select Newer HP Omen Laptops
<https://www.phoronix.com/news/Linux-5.18-HP-Omen-Thermal>


Command issued:
`patch -p1 --verbose --dry-run -d
/usr/src/linux-headers-6.2.1-0
60201-generic -i
'/home/aj/Downloads/platform-drivers-x86/0001-platform-x86-hp-wmi-support-omen-thermal-profile-pol.patch'

Terminal output:
```
Hmm... Looks like a unified diff to me...
can't find file to patch at input line 27 Perhaps you used the wrong
-p or --strip option? The text leading up to this was:
--------------------------
|From 286e937efbc7177c114e80aae9b402131e3886c1 Mon Sep 17 00:00:00 2001
|From: Enver Balalic <balalic.enver@gmail.com>
|Date: Mon, 14 Mar 2022 13:14:53 +0100
|Subject: [PATCH] platform/x86: hp-wmi: support omen thermal profile policy v1
|
|As it turns out, these laptops have 2 thermal profile versions.
|A previous patch added support for v0, this patch adds support
|for v1 thermal policies that are in use on some devices.
|We obtain the thermal policy version by querying the get system
|design data WMI call and looking at the fourth byte it returns,
|except if the system board DMI Board ID is in a specific array
|that the windows command center app overrides to thermal policy
|v0 for some reason.
|
|Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
|Link: https://lore.kernel.org/r/20220314121453.kjszdciymtg6ctbq@omen
|Reviewed-by: Hans de Goede <hdegoede@redhat.com>
|Signed-off-by: Hans de Goede <hdegoede@redhat.com>
|---
| drivers/platform/x86/hp-wmi.c | 81 +++++++++++++++++++++++++++++------
| 1 file changed, 67 insertions(+), 14 deletions(-)
|
|diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
|index 1f9d6e1de5af..0e9a25b56e0e 100644
|--- a/drivers/platform/x86/hp-wmi.c
|+++ b/drivers/platform/x86/hp-wmi.c
--------------------------
File to patch:
```

From my understanding, it is asking me to enter the name(s) of the
file(s) that the patch is supposed to modify. This information should be
included in the patch file itself, typically in the header section, but I
don't see it unless I'm missing something. I opened up the patch file with
a text editor to check which file is being patched and I see some *paths*
that look to be pointing to a file named `hp-wmi.c`, but I don't know if that
is true or not.

It also occurs to me that this patch is meant to modify many files in
different directories within the kernel's source directory, in which
case, I would be required to enter each and every single one in that
prompt.  Probably not the way this patch command was meant to be run,
which leads me to believe that my kernel's source directory at
/usr/src/linux-headers-6.2.1-060201-generic
needs a whole new directory with the same structure as seen in this
path in the patch file: a/drivers/platform/x86/hp-wmi.c

Would this imply that I need to have something like:
usr/src/linux-headers-6.2.1-060201-generic/a/drivers/platform/x86 and
then create a blank .TXT named hp-wmi.c?

Without creating the "a" directory, I did try to navigate into the
.../linux-headers-6.2.1-060201-generic/drivers/platform/x86
folder and create this file I mentioned above, then entered that
file in the Terminal prompt via drag/drop, but it still says that the
directory or file does not exist.

I assume that once I know the file name or have a working directory,
I just enter it at the prompt and press enter - but I just don't know what I'm
supposed to do to get the file *OR* directory I need, that will
satisfy the `patch` command so that the patch files can be moved into the
kernel directory that is being patched.

Requesting some kind of guidance or input on what I might be doing
wrong and how I might be able to fix this so I can better control my thermals.

If this is a known issue or something which your team can confirm is
an issue, requesting to know any helpful information regarding the plan
of action moving forward.

If the issue is that I just need to apply a specific kernel which has
this fix already included in it, please

let me know which kernel it is, and any relevant steps to take in
order to apply that kernel.


Please let me know if I can provide any further information and I will
get back to you ASAP.

My email address is aj.owens.001@gmail.com

Best regards,

Alan O.
