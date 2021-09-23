Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB293FC8
	for <llvm@lists.linux.dev>; Thu, 23 Sep 2021 10:07:30 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso7745238otb.11
        for <llvm@lists.linux.dev>; Thu, 23 Sep 2021 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PGizDeLzRGbblNybKFZtNPTDc7twErSudSG0K9dzTyI=;
        b=gx9iJmpVsc8VC7E6X1G9/vtVS9wUZJ2aHfzCzL7eNrFi4amBr08Tu0xEQNKip8IsdA
         YjmRTgXS+h66ufU2hH5mhyxN5jO0or5XLeCWMv3NtTu2wyzkvc70MJ6V12gyA9j7apsL
         G+Z0RVYZZGA+S3Y+iB2aBV3/vIhZvnWYv7yRfvmqiA+cIb7tGYhXhI5HIZx4Jvpxcy1y
         QlLHQZ+48XfbYmXAhLkxdB8Gihog2WYby21ipIwlaBn52KE8RXWW7ieJnVhk6l7/H8Te
         Sh+fML80EampCLvZLhfkdQ+YLLf1R5M57FlcqEcrS2c8P2mIwi8TJH6Yr65FeCpanA6x
         PyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PGizDeLzRGbblNybKFZtNPTDc7twErSudSG0K9dzTyI=;
        b=CKrXDHBd+J5p4QfD7qTgDMzxtBz6NpFAwBkeUFZPbDtuUPoASeLw0FyRqdeaVG5IPf
         asEl6qXeUm+YnAsUKd1f60E+zLfRCO7u+kVYvh5ux/c23+fhl2Yn44HB95ZEh04NU/DP
         +1KHn+utp2e/2Sf5gTfZ4R2cETiQfw/lgsSxjwEOub9Fk8bRc97fZQCg3r2HZoB5wt/u
         wHmxnetIOIzjjW4Dl7SUsA+63OHHTXXNI8jbbhdw1zWgChkSatri+/sRuum8c4m5zUyA
         JZetJJupysiw6apfKuKGfngKFOQ8NceoWP0qcYq+DPuKSByS40WfZL+apJKdpiyGbB59
         9+EA==
X-Gm-Message-State: AOAM5320TPhb9lLil1SssGmdi7VfmKo/hSxQQz3eoFo8ArzbaYJyue9E
	5x65SzRm3r4cBrKqe/rgR62GhHJsHT1NrAb/3K3/zg==
X-Google-Smtp-Source: ABdhPJxQcNl+E0hqlYvj6R3nzKpFx4Yhh0lkCFH7MUOEbWh5g8rHrqts6FdpO0TwI0sRMnxa8VbR/CKkCmzDr0KiJOg=
X-Received: by 2002:a9d:135:: with SMTP id 50mr3469525otu.295.1632391649222;
 Thu, 23 Sep 2021 03:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210922205525.570068-1-nathan@kernel.org>
In-Reply-To: <20210922205525.570068-1-nathan@kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 23 Sep 2021 12:07:17 +0200
Message-ID: <CANpmjNNqgUSbiPHOpD8z5JAv2aiujxAMiO4siymYdU6zpid_2g@mail.gmail.com>
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv <linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Sept 2021 at 22:55, Nathan Chancellor <nathan@kernel.org> wrote:
> Currently, the asan-stack parameter is only passed along if
> CFLAGS_KASAN_SHADOW is not empty, which requires KASAN_SHADOW_OFFSET to
> be defined in Kconfig so that the value can be checked. In RISC-V's
> case, KASAN_SHADOW_OFFSET is not defined in Kconfig, which means that
> asan-stack does not get disabled with clang even when CONFIG_KASAN_STACK
> is disabled, resulting in large stack warnings with allmodconfig:
>
> drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c:117:12:
> error: stack frame size (14400) exceeds limit (2048) in function
> 'lb035q02_connect' [-Werror,-Wframe-larger-than]
> static int lb035q02_connect(struct omap_dss_device *dssdev)
>            ^
> 1 error generated.
>
> Ensure that the value of CONFIG_KASAN_STACK is always passed along to
> the compiler so that these warnings do not happen when
> CONFIG_KASAN_STACK is disabled.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1453
> References: 6baec880d7a5 ("kasan: turn off asan-stack for clang-8 and earlier")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Marco Elver <elver@google.com>

[ Which tree are you planning to take it through? ]

Note, arch/riscv/include/asm/kasan.h mentions KASAN_SHADOW_OFFSET in
comment (copied from arm64). Did RISC-V just forget to copy over the
Kconfig option?


> ---
>  scripts/Makefile.kasan | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 801c415bac59..b9e94c5e7097 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -33,10 +33,11 @@ else
>         CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
>          $(call cc-param,asan-globals=1) \
>          $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
> -        $(call cc-param,asan-stack=$(stack_enable)) \
>          $(call cc-param,asan-instrument-allocas=1)
>  endif
>
> +CFLAGS_KASAN += $(call cc-param,asan-stack=$(stack_enable))
> +
>  endif # CONFIG_KASAN_GENERIC
>
>  ifdef CONFIG_KASAN_SW_TAGS
>
> base-commit: 4057525736b159bd456732d11270af2cc49ec21f
> --
> 2.33.0.514.g99c99ed825
>
>
