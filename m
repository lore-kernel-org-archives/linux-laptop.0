From: Alexandre Rostovtsev <tetromino@gmail.com>
Subject: [0/3] lenovo-sl-laptop : new driver for drivers/staging
Date: Sat, 14 Feb 2009 05:12:14 -0500
Message-ID: <20090214051214.359d4fd4@leftboat.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:x-mailer:mime-version:content-type
         :content-transfer-encoding;
        bh=czNU6h2oMGjUBTGm18nfCO7IXOjr6izIE99sjuLH4Gk=;
        b=uYznRK+8/mAk+vTjABkxLg0XPFcC6Po2Mu3l0GPqbpJtQ/EMsyfykQnsQWyHJS2FJZ
         tGqolVbgzb4pGay/HPWNQ0MwvgaJRirZv5tKvqkUOw1Qg2P7unukic+AAoT+FuvDycrb
         bhLBJUxgUjO35ztQlRoPn+kKp00TxxMZtsO5M=
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-laptop@vger.kernel.org

lenovo-sl-laptop is a new driver that adds support for hotkeys,
bluetooth, LEDs and screen brightness on the Lenovo ThinkPad SL series
laptops. [1] These laptops are not supported by the normal
thinkpad_acpi driver because their firmware is quite different from the
"real" ThinkPads. [2] After I wrote the SL series driver, I posted it
on the linux thinkpad mailing list, asking whether it would be a good
idea to try to merge it with thinkpad_acpi. Henrique de Moraes
Holschuh, the thinkpad_acpi maintainer, replied that lenovo-sl-laptop
should be kept separate from thinkpad_acpi. [3] Since then, I have
received a number of emails from users who had tried the driver on
their laptops and found that it works. Thus, I am posting it here for
review and hope for eventual inclusion in staging.

Patches against 2.6.29-rc5 will be in following emails.

One important note concerning the backlight. Currently, the ACPI video
driver has poor support for the ThinkPad SL series because their _BCL
and _BQC methods violate the ACPI spec. Thus, the lenovo-sl-laptop
driver adds optional (controlled via module parameter, default off)
support for setting the backlight brightness.
Zhang Rui has stated that he will be working on making the ACPI video
driver properly support the ThinkPad SL series and other laptops with
non-standard backlight brightness interfaces. When he is finished,
backlight functionality can probably be safely removed from
lenovo-sl-laptop. [4]

Finally, a list of things that the driver does not currently support.
There is no support for the hdaps accelerometer (and adding it would be
difficult), no sensor information (I don't yet understand how to decode
it), and no fan speed control.

[1] Homepage: http://github.com/tetromino/lenovo-sl-laptop
[2] http://mailman.linux-thinkpad.org/pipermail/linux-thinkpad/2009-January/046122.html
[3] http://mailman.linux-thinkpad.org/pipermail/linux-thinkpad/2009-January/046172.html
[4] http://bugzilla.kernel.org/show_bug.cgi?id=12249

Signed-off-by: Alexandre Rostovtsev <tetromino@gmail.com>

 Documentation/laptops/lenovo-sl-laptop.txt         |  130 +++
 drivers/staging/Kconfig                            |    2 +
 drivers/staging/Makefile                           |    1 +
 drivers/staging/lenovo-sl-laptop/Kconfig           |   16 +
 drivers/staging/lenovo-sl-laptop/Makefile          |    1 +
 .../staging/lenovo-sl-laptop/lenovo-sl-laptop.c    | 1089 ++++++++++++++++++++
 6 files changed, 1239 insertions(+), 0 deletions(-)
