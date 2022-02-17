Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCBA1FD2
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 02:59:41 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id m126-20020a1ca384000000b0037bb8e379feso5105289wme.5
        for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 18:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kn/LDmM7Giwjd+26mVkordTjd0rTELciFT9tMQUQryk=;
        b=dWYR8YZqLKZ1D9hrocyg1i5E9iNSh/XcwYZebZxs9WfuI9Sl7AygXFIFYUMFUXqIJh
         pPbd8D/CkRFc8HH/K545+Tbh/NYjfFaULbpvsJE+48r5suK21FhMQr600kF6cpiEOcEZ
         hIq/U2UIY81GUxg6sSz98GnrqGo+D6i0eHGQCce1Fw5LHFFvWaF0i7THTe8T7j5pukIU
         wx150gJpCocGcbtZ+MKWyC4ROneXRgDrLmnESdpsdJEV6BnA2CCco2PnLFTqEeB7Tzxt
         ynRfxGJ0bhcYRWmGKDxdm0AvrAOVx0wdS8lF/7V/pL6d/3usyVZpzwUd9RQwMzZvOZS9
         5AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kn/LDmM7Giwjd+26mVkordTjd0rTELciFT9tMQUQryk=;
        b=st91UncWhb6EqW+Zyfccc5FU4HF+mDOhz8FB0YmAbvCTl6qxirVObVN6UTx0cR8bSB
         si68mvpazjGu46NTRXHJ0fG6ca6txIWDYA5F3bdwasixUf49Td4fnOuCKEb27UU1gpLR
         rOdduFa8SWm0Nw2rZeSlh0ONDN7XPfLrfqcONYWhUu44fOFeza4m+oXvgi5eer6HOLNb
         8W5oVUpjCh6/zxITPTYXp7Mavj/Wi8IVUxBPWLZRzGhI5MVbJ9YdkysOWDMzEYmTImLD
         jIDzp8PXynUN23jp1HFT1T/2uiPgzDM9UBX8BhnLtLyI64xzxQ2gsxgi2I/5G1dklsQo
         fGbQ==
X-Gm-Message-State: AOAM5337fn3R1Amrrms0XDl06FCv17emPgcevoJzL23KjQyFSAwlvl4B
	WIZJfjcqoM0TWTC0lDxERGX4RQCDtO0OC+FptMwK1A==
X-Google-Smtp-Source: ABdhPJxsqZZCrzn79f6VaiQDnruwqgTNUuolyn2u2fWhw0sOJzG8OE9y9rTC7L0UD/I193BapB+nkoPAnfmCl744MM0=
X-Received: by 2002:a05:600c:1da4:b0:37c:729:f84d with SMTP id
 p36-20020a05600c1da400b0037c0729f84dmr4139433wms.131.1645066779319; Wed, 16
 Feb 2022 18:59:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217002843.2312603-1-keescook@chromium.org>
In-Reply-To: <20220217002843.2312603-1-keescook@chromium.org>
From: David Gow <davidgow@google.com>
Date: Thu, 17 Feb 2022 10:59:27 +0800
Message-ID: <CABVgOSk=oFxsbSbQE-v65VwR2+mXeGXDDjzq8t7FShwjJ3+kUg@mail.gmail.com>
Subject: Re: [PATCH] um: Allow builds with Clang
To: Kees Cook <keescook@chromium.org>
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-kbuild@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>, llvm@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 17, 2022 at 8:28 AM Kees Cook <keescook@chromium.org> wrote:
>
> Add x86-64 target for Clang+um and update user-offsets.c to use
> Clang-friendly assembler, similar to the fix from commit cf0c3e68aa81
> ("kbuild: fix asm-offset generation to work with clang").
>
> This lets me run KUnit tests with Clang:
>
> $ ./tools/testing/kunit/kunit.py config --make_options LLVM=1
> ...
> $ ./tools/testing/kunit/kunit.py run --make_options LLVM=1
> ...
>
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: David Gow <davidgow@google.com>
> Cc: linux-um@lists.infradead.org
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
> Cc: kunit-dev@googlegroups.com
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Thanks, this worked fine for me, with one small note:

I get the following warning with clang (13.0.1) under UML (but not
under x86_64):
clang: warning: argument unused during compilation:
'-mno-global-merge' [-Wunused-command-line-argument]

It's not really a problem unless -Werror is enabled, though, so this
is still definitely an improvement over clang not working at all.

With that caveat, this is:
Tested-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  arch/x86/um/user-offsets.c | 4 ++--
>  scripts/Makefile.clang     | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/um/user-offsets.c b/arch/x86/um/user-offsets.c
> index bae61554abcc..d9071827b515 100644
> --- a/arch/x86/um/user-offsets.c
> +++ b/arch/x86/um/user-offsets.c
> @@ -10,10 +10,10 @@
>  #include <asm/types.h>
>
>  #define DEFINE(sym, val) \
> -       asm volatile("\n->" #sym " %0 " #val : : "i" (val))
> +       asm volatile("\n.ascii \"->" #sym " %0 " #val "\"": : "i" (val))
>
>  #define DEFINE_LONGS(sym, val) \
> -       asm volatile("\n->" #sym " %0 " #val : : "i" (val/sizeof(unsigned long)))
> +       asm volatile("\n.ascii \"->" #sym " %0 " #val "\"": : "i" (val/sizeof(unsigned long)))
>
>  void foo(void)
>  {
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 51fc23e2e9e5..857b23de51c6 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -10,6 +10,7 @@ CLANG_TARGET_FLAGS_powerpc    := powerpc64le-linux-gnu
>  CLANG_TARGET_FLAGS_riscv       := riscv64-linux-gnu
>  CLANG_TARGET_FLAGS_s390                := s390x-linux-gnu
>  CLANG_TARGET_FLAGS_x86         := x86_64-linux-gnu
> +CLANG_TARGET_FLAGS_um          := x86_64-linux-gnu
>  CLANG_TARGET_FLAGS             := $(CLANG_TARGET_FLAGS_$(SRCARCH))
>
>  ifeq ($(CROSS_COMPILE),)
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/20220217002843.2312603-1-keescook%40chromium.org.
