From: Huang Weiyi <weiyi.huang@gmail.com>
Subject: arch/x86/kernel/apm_32.c: Removed duplicated include
Date: Wed, 23 Jul 2008 22:44:56 +0800
Message-ID: <20080723215240.941C.WEIYI.HUANG@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject:cc
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer;
        bh=6Nw6TW9jDpYeOjGSyUAdVSEXvv4gur0b51U5DH1ztgs=;
        b=eZejKNIrBt2WxA32A3p51ob4zT6o7DaK8PctbU0IJwnbh304iN5Ap6SJ00+xk6b33x
         OdEemAEKieJjxEbQga009AGzAJp1ysIfKDxRUpJ7U40qDY6cPQq2lBzwDVba2Ecv072e
         sXHZU/in1NceToeMPGiSaWINQ/bBJsVdFqWZY=
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sfr@canb.auug.org.au
Cc: linux-laptop@vger.kernel.org

UmVtb3ZlZCBkdXBsaWNhdGVkIGluY2x1ZGUgZmlsZSA8bGludXgvc21wX2xvY2suaD4gaW4gDQph
cmNoL3g4Ni9rZXJuZWwvYXBtXzMyLmMuDQoNClNpZ25lZC1vZmYtYnk6IEh1YW5nIFdlaXlpIDx3
ZWl5aS5odWFuZ0BnbWFpbC5jb20+DQoNCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvYXBt
XzMyLmMgYi9hcmNoL3g4Ni9rZXJuZWwvYXBtXzMyLmMNCmluZGV4IGJmOWI0NDEuLmY0OTk4MDgg
MTAwNjQ0DQotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvYXBtXzMyLmMNCisrKyBiL2FyY2gveDg2L2tl
cm5lbC9hcG1fMzIuYw0KQEAgLTIyOSw3ICsyMjksNiBAQA0KICNpbmNsdWRlIDxsaW51eC9zdXNw
ZW5kLmg+DQogI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4NCiAjaW5jbHVkZSA8bGludXgvamlm
Zmllcy5oPg0KLSNpbmNsdWRlIDxsaW51eC9zbXBfbG9jay5oPg0KDQogI2luY2x1ZGUgPGFzbS9z
eXN0ZW0uaD4NCiAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4NCg==

