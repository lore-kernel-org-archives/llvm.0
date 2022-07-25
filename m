Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF71372
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 14:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FE7C341D1
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658759757;
	bh=8YAdK42qqbqAY64DK1NyJcyaeYoywJhEGa74ocjFyLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=btmw0M+imuPsrJudphHVgl7R5KvTrbEm28wzpuVk3F0cQIhNNUjN+1JOZ9Yv+67lT
	 WVWiBI93japOYL4GqvbJDuXkGYeIg2KHNI3XfaXad/6KO/4HAK36gg8JVV7Fifez/t
	 J/fEk/EiOBun08qB8Hj6xhqxUR/YwepMSI11is4AOGsyXDrrwlchLKQZsFH4co43a5
	 53cYs59EmilqGnMzfcFuQZ0FWOBeK+9oDe4LjEh/ENb6+eRQJ7m7JBaPJXHy91fQoH
	 Vz+94V9jAmIaJg2aBuk6FEN/NY4Dm5h5YHa0VvFjGuz01vU2S+tY3rG64Afl16hqfN
	 TRcUHMazQR0aQ==
Received: by mail-ed1-f51.google.com with SMTP id w5so1783095edd.13
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 07:35:56 -0700 (PDT)
X-Gm-Message-State: AJIora/zGJEPVvPZnvnw7eWZL1Fsr53k0KsBwLhoNhV7TmOXZjMGF/EK
	kjE3cAnJkNI3GJ2HxT2rlM3lGZ3VmnxIOY+ddhw=
X-Google-Smtp-Source: AGRyM1sUthx3LrE7tgfM/0y9QOiYr2frDpjwJn/EPcg19s7vbWCnJqX8iKP+C/w78ap34jT38fFq4Y6IBIu4zH1epFs=
X-Received: by 2002:a05:6402:1003:b0:43a:75d8:a0e with SMTP id
 c3-20020a056402100300b0043a75d80a0emr13537599edu.303.1658759755306; Mon, 25
 Jul 2022 07:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207250449.BYMZbIA2-lkp@intel.com> <Yt3KObFVIUI2mFGt@zx2c4.com>
 <CAMj1kXHTf4f+onREnWhYk-vYXkPaQtPpZz+SqFCP+Ey7+bOXkQ@mail.gmail.com>
 <Yt5Y/cIKIDlyFWMQ@kroah.com> <CAMj1kXGPjFAY0y-SPZv64CRhpo9s1+__z4bya86aMcTs9=f8pw@mail.gmail.com>
 <CAK8P3a0g4NT1oDW5gq7YO540Eo0UDoqbK1tmtb8QHteiDNXj5Q@mail.gmail.com>
In-Reply-To: <CAK8P3a0g4NT1oDW5gq7YO540Eo0UDoqbK1tmtb8QHteiDNXj5Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Jul 2022 16:35:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ZfEr+4OWWteZHpDYGw8U0dQgMfF_OFwQDEtY=GaTfQA@mail.gmail.com>
Message-ID: <CAK8P3a2ZfEr+4OWWteZHpDYGw8U0dQgMfF_OFwQDEtY=GaTfQA@mail.gmail.com>
Subject: Re: [linux-stable-rc:linux-5.15.y 6874/8723] arch/arm/lib/xor-neon.c:30:2:
 warning: This code requires at least version 4.6 of GCC
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	kernel test robot <lkp@intel.com>, "Justin M. Forbes" <jforbes@fedoraproject.org>, 
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Jason A. Donenfeld" <zx2c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 25, 2022 at 2:55 PM Arnd Bergmann <arnd@kernel.org> wrote:

> The other easy workaround would be to just turn off the xor-neon code
> when building with clang, e.g. using this Makefile hack:
>
> diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
> index 6d2ba454f25b..8e4fe6421dd2 100644
> --- a/arch/arm/lib/Makefile
> +++ b/arch/arm/lib/Makefile
> @@ -43,8 +43,10 @@ endif
>  $(obj)/csumpartialcopy.o:      $(obj)/csumpartialcopygeneric.S
>  $(obj)/csumpartialcopyuser.o:  $(obj)/csumpartialcopygeneric.S
>
> +ifdef CONFIG_CC_IS_CLANG
>  ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
>    NEON_FLAGS                   := -march=armv7-a -mfloat-abi=softfp -mfpu=neon
>    CFLAGS_xor-neon.o            += $(NEON_FLAGS)
>    obj-$(CONFIG_XOR_BLOCKS)     += xor-neon.o
>  endif
> +endif

Nevermind, this does not actually work. Just turning off the warning
is probably best then, as actually disabling this code would still
be invasive not do much beyond saving a little bit of kernel .text size.

        Arnd
