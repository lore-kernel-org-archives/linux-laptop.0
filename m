From: Kenneth Crudup <kenny@panix.com>
Subject: Re: sometimes kernel cannot detect GlidePoint input Device
Date: Sat, 11 Jul 2009 21:02:30 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0907112100480.9685@hp9800.localdomain>
References: <62c294d80907112005n6458193dye48d5bd3203d50f4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-laptop-owner@vger.kernel.org>
In-Reply-To: <62c294d80907112005n6458193dye48d5bd3203d50f4@mail.gmail.com>
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: haiyang kang <cornsea@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-laptop@vger.kernel.org


I had this problem once; try putting

  i8042.noloop=1

... in your kernel command line.

	-Kenny

-- 
Kenneth R. Crudup  Sr. SW Engineer, Scott County Consulting, Los Angeles
O: 3630 S. Sepulveda Blvd. #138, L.A., CA 90034-6809      (888) 454-8181
