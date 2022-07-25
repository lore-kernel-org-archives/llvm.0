Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC3A1375
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 12:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1B5C341CE
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658753761;
	bh=Ocs5hztpzo9hNvSzYVdqDXeQpBIVga6VGoPNKHQ7rvA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m6LX9br5ws7ghvLQfKL8jZ5FqaDjyouTtOMy5blpWWF0O5Kc0zGg0mxPfQYvV8Gmz
	 ON3TEuu74RKD3GFSIUIz4gxZp0STVzw+d5Aa0r9SwKf7aC7zVF+xpnwQ+7qFKUkpN3
	 kLA9uRcpRl7yyY8DTbRbEc1BzHZ5esC2pgTeXk7POcUdtUff/M7g0ZV6G5k46JZW3p
	 x0AkxO1Ue5eAYzY2xLVWCWI/FpmvHIY65z8sG2D0RCnae9GmhxltUAX7JdxSHznOgP
	 DZDzrz68YYqmFAnPwmqofiWm5V5aWIqLNsrpKIUwwoyAyMgvEmAJQ8TuXfzjyA4+EV
	 B/9cd8uzmIDJw==
Received: by mail-ej1-f54.google.com with SMTP id mf4so20448146ejc.3
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 05:56:01 -0700 (PDT)
X-Gm-Message-State: AJIora/wl+Ruoji2bXfqVE0AfRXBfBv0FDHtytLBFwNZTzxhxELkwRoa
	KlMBAGk3t9FTgqH0wCa9l1ee3f4RM25Sy1cqE+A=
X-Google-Smtp-Source: AGRyM1uFwePnWFLSGm7VODXIFS62XfHViTmk1T7KBXIgR4MibFPnIXWzp5ZFBhSklV+pNb9rkpcfCMZYw2Fe0T4yvIw=
X-Received: by 2002:a17:907:d0f:b0:72e:db1f:9b91 with SMTP id
 gn15-20020a1709070d0f00b0072edb1f9b91mr10174393ejc.470.1658753760025; Mon, 25
 Jul 2022 05:56:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207250449.BYMZbIA2-lkp@intel.com> <Yt3KObFVIUI2mFGt@zx2c4.com>
 <CAMj1kXHTf4f+onREnWhYk-vYXkPaQtPpZz+SqFCP+Ey7+bOXkQ@mail.gmail.com>
 <Yt5Y/cIKIDlyFWMQ@kroah.com> <CAMj1kXGPjFAY0y-SPZv64CRhpo9s1+__z4bya86aMcTs9=f8pw@mail.gmail.com>
In-Reply-To: <CAMj1kXGPjFAY0y-SPZv64CRhpo9s1+__z4bya86aMcTs9=f8pw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Jul 2022 14:55:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0g4NT1oDW5gq7YO540Eo0UDoqbK1tmtb8QHteiDNXj5Q@mail.gmail.com>
Message-ID: <CAK8P3a0g4NT1oDW5gq7YO540Eo0UDoqbK1tmtb8QHteiDNXj5Q@mail.gmail.com>
Subject: Re: [linux-stable-rc:linux-5.15.y 6874/8723] arch/arm/lib/xor-neon.c:30:2:
 warning: This code requires at least version 4.6 of GCC
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	kernel test robot <lkp@intel.com>, "Justin M. Forbes" <jforbes@fedoraproject.org>, 
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Jason A. Donenfeld" <zx2c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 25, 2022 at 2:41 PM Ard Biesheuvel <ardb@kernel.org> wrote:

> > I would love to backport this as it bugs me to no end on some various
> > gerrit systems all the time.  I'll look into it later this week unless
> > someone beats me to it :)
> >
>
> If backporting is an issue, we could just drop this warning - GCC
> before 4.6 hasn't been supported for a while anyway, and Clang never
> had the SIMD accelerated XOR to begin with (it needs the __restrict
> annotations that the parent patch introduces)

The other easy workaround would be to just turn off the xor-neon code
when building with clang, e.g. using this Makefile hack:

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 6d2ba454f25b..8e4fe6421dd2 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -43,8 +43,10 @@ endif
 $(obj)/csumpartialcopy.o:      $(obj)/csumpartialcopygeneric.S
 $(obj)/csumpartialcopyuser.o:  $(obj)/csumpartialcopygeneric.S

+ifdef CONFIG_CC_IS_CLANG
 ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
   NEON_FLAGS                   := -march=armv7-a -mfloat-abi=softfp -mfpu=neon
   CFLAGS_xor-neon.o            += $(NEON_FLAGS)
   obj-$(CONFIG_XOR_BLOCKS)     += xor-neon.o
 endif
+endif

As far as I understand it, without your patch the code is the same as the
generic version anyway, we just never turned it off in mainline this way because
the plan was always to make it work. It now does work, and for the stable
kernel the mainline patch would only be a performance optimization that we
normally don't backport.

       Arnd
