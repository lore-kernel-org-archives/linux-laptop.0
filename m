From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: Issues with applying patch to Linux 6.2.1-060201-generic x86_64 -
 HP Omen - Zorin OS 16.2 based on Ubuntu 20.04 LTS (Focal Fossa)
Date: Sat, 18 Mar 2023 13:22:08 -0700
Message-ID: <7f51bb57-3adc-47f3-023f-008886c62dea@infradead.org>
References: <CALSL_1ehW6nu5YtAWJp92_k_BrQsaKf8paMmjta0Dk=vGqexZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=xFXhaQf6JpWKig7JkREJsKBA82IcfYS06RE3F9uwjf4=; b=xkUPHYmrQ7A1b/3vWnvDqj2nOM
        D64NjmcmMybH473nMnzB9PmjCWUa27NaKKtnC6L37fAimQWJo0guGzAgrqLdxM30YOaUVeA/zwNyr
        s9yxgCClnhc+IdWLRh88fz63MksDYPBnbT6TgH+i9ICkEcVKigEK+Kq1EJP3iLP24Rrwo3ktDll/3
        1FTONu3MJq74w/McIjtXdFBeolp+bTCYPMKgsIWCK0GwfVTOCWt3IvmBOBKfbeMlIk3MoBbMRAgB0
        CzPWxGWImEYL6EXIdhotRqQGEe9ZhTfaLOD7myKNI/pWY1knIGrwuwktl6ivvIiAZ0MmtDpUxCruJ
        Cd8J99kQ==;
Content-Language: en-US
In-Reply-To: <CALSL_1ehW6nu5YtAWJp92_k_BrQsaKf8paMmjta0Dk=vGqexZQ@mail.gmail.com>
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alan O." <aj.owens.001@gmail.com>, linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org

Hi--

On 3/18/23 11:18, Alan O. wrote:
> Hello and Good Day!
> 
> Please understand that I am by no means proficient with patching *anything,*
> nor do I have much experience with Linux compared to most.  That said, I
> have been working on this for a good while with no success at patching the
> kernel to achieve my needs for better thermal control.  I have been
> desperately searching for a way to *lower the temperature threshold at
> which my fans are activated or increase RPM.   *Please help.
> 
> I am trying to apply this patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=286e937efbc7177c114e80aae9b402131e3886c1
> 
> To my Linux 6.2.1-060201-generic x86_64 kernel:
> 
> *`cat /proc/version`*
>> Linux version 6.2.1-060201-generic (buildd@lcy02-amd64-016)
> (x86_64-linux-gnu-gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU
> Binutils for Ubuntu) 2.34) #202302260629-Ubuntu SMP PREEMPT_DYNAMIC

I don't have that exact kernel since I an not using Ubuntu.

When I try to apply this patch to plain vanilla 6.2.1 from kernel.org,
'patch' tells me:

Using Plan A...
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
Hunk #1 ignored at 57.
Hunk #2 ignored at 117.
Hunk #3 ignored at 151.
Hunk #4 ignored at 407.
Hunk #5 ignored at 431.
Hunk #6 ignored at 1053.
Hunk #7 ignored at 1072.
7 out of 7 hunks ignored

so it appears that 6.2.1 already has this patch merged into it.
Can you check your kernel source tree for that?

(more below)

> *`lsb_release -a`*
>> No LSB modules are available.
> Distributor ID: Zorin
> Description: Zorin OS 16.2
> Release: 16
> Codename: focal
> 
> Reason:
> To Fix Thermal Policy Handling For Select Newer HP Omen Laptops
> <https://www.phoronix.com/news/Linux-5.18-HP-Omen-Thermal>
> 
> 
> Command issued:
> `patch -p1 --verbose --dry-run -d
> /usr/src/linux-headers-6.2.1-060201-generic -i
> '/home/aj/Downloads/platform-drivers-x86/0001-platform-x86-hp-wmi-support-omen-thermal-profile-pol.patch'
> 
> Terminal output:
> ```
> Hmm... Looks like a unified diff to me...
> can't find file to patch at input line 27 Perhaps you used the wrong
> -p or --strip option? The text leading up to this was:
> --------------------------
> |From 286e937efbc7177c114e80aae9b402131e3886c1 Mon Sep 17 00:00:00 2001
> |From: Enver Balalic <balalic.enver@gmail.com>
> |Date: Mon, 14 Mar 2022 13:14:53 +0100
> |Subject: [PATCH] platform/x86: hp-wmi: support omen thermal profile policy v1
> |
> |As it turns out, these laptops have 2 thermal profile versions.
> |A previous patch added support for v0, this patch adds support
> |for v1 thermal policies that are in use on some devices.
> |We obtain the thermal policy version by querying the get system
> |design data WMI call and looking at the fourth byte it returns,
> |except if the system board DMI Board ID is in a specific array
> |that the windows command center app overrides to thermal policy
> |v0 for some reason.
> |
> |Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> |Link: https://lore.kernel.org/r/20220314121453.kjszdciymtg6ctbq@omen
> |Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> |Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> |---
> | drivers/platform/x86/hp-wmi.c | 81 +++++++++++++++++++++++++++++------
> | 1 file changed, 67 insertions(+), 14 deletions(-)
> |
> |diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> |index 1f9d6e1de5af..0e9a25b56e0e 100644
> |--- a/drivers/platform/x86/hp-wmi.c
> |+++ b/drivers/platform/x86/hp-wmi.c
> --------------------------
> File to patch:
> ```
> 
> From my understanding, it is asking me to enter the name(s) of the
> file(s) that the patch is supposed to modify. This information should be
> included in the patch file itself, typically in the header section, but I
> don't see it unless I'm missing something. I opened up the patch file with
> a text editor to check which file is being patched and I see some *paths*
> that look to be pointing to a file named `hp-wmi.c`, but I don't know if that
> is true or not.
> 
> It also occurs to me that this patch is meant to modify many files in
> different directories within the kernel's source directory, in which
> case, I would be required to enter each and every single one in that
> prompt.  Probably not the way this patch command was meant to be run,
> which leads me to believe that my kernel's source directory at
> /usr/src/linux-headers-6.2.1-060201-generic
> needs a whole new directory with the same structure as seen in this
> path in the patch file: a/drivers/platform/x86/hp-wmi.c
> 
> Would this imply that I need to have something like:
> usr/src/linux-headers-6.2.1-060201-generic/a/drivers/platform/x86 and
> then create a blank .TXT named hp-wmi.c?
> 
> Without creating the "a" directory, I did try to navigate into the
> .../linux-headers-6.2.1-060201-generic/drivers/platform/x86
> folder and create this file I mentioned above, then entered that
> file in the Terminal prompt via drag/drop, but it still says that the
> directory or file does not exist.
> 
> I assume that once I know the file name or have a working directory,
> I just enter it at the prompt and press enter - but I just don't know what I'm
> supposed to do to get the file *OR* directory I need, that will
> satisfy the `patch` command so that the patch files can be moved into the
> kernel directory that is being patched.
> 
> Requesting some kind of guidance or input on what I might be doing
> wrong and how I might be able to fix this so I can better control my thermals.
> 
> If this is a known issue or something which your team can confirm is
> an issue, requesting to know any helpful information regarding the plan
> of action moving forward.
> 
> If the issue is that I just need to apply a specific kernel which has
> this fix already included in it, please
> 
> let me know which kernel it is, and any relevant steps to take in
> order to apply that kernel.
> 
> 
> Please let me know if I can provide any further information and I will
> get back to you ASAP.

Somewhere along the way the hp drivers were moved into
drivers/platform/x86/hp/ (likewise for the dell drivers into
drivers/platform/x86/dell/).

What I did to test applying this patch to my 6.2.1 kernel tree
is modify the patch file's filenames by inserting "hp/"
just before hp-wmi.c, like this:

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 1f9d6e1de5afe..0e9a25b56e0e4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c

then at least 'patch' can find the correct file to patch,
although it reports that the patch has already been applied.

-- 
~Randy
