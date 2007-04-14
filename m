From: ice <icestorm@ngi.it>
Subject: Re: Linux stops my F10 (or others) keys to work at boot
Date: Sat, 14 Apr 2007 17:52:10 +0200
Message-ID: <4620F8AA.3060201@ngi.it>
References: <C12A1DBF6F3D471FA4FD1948D5D6604C@LaptopHP> <4620F76C.7010801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <4620F76C.7010801@gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Maciej Rutecki <maciej.rutecki@gmail.com>
Cc: linux-laptop@vger.kernel.org

Maciej Rutecki wrote:
> Please remove psmouse module before You reboot/halt. Its known bug in HP
> BIOS. Add line "rmmod psmouse" in /etc/init.d/halt and
> /etc/init.d/reboot (Debian). Or remove all power sources (AC and
> battery) after halt.
>   
hi thanks,
I did found this solution googling...thanks anyway! :)
