Received: from condef-06.nifty.com (condef-06.nifty.com [202.248.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87C3B33
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 05:02:58 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-06.nifty.com with ESMTP id 21H4txD4019569
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 13:55:59 +0900
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 21H4tbgx030315
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 13:55:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 21H4tbgx030315
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1645073738;
	bh=XT+hixO3OHzRLvB8+uXJ8rcVlX1aTroBtBRh2n+1zQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=y7dYjnFd4wsC3TTZW1BdEoNjB4sXAHPx0oJ8ABx+P0g3nx4tKIj8RHnGp5PTqxZxP
	 F/NwszPL7gcDNXn8C95gahpJKOuhawN36TQNiyqpII8iJ7j1obZhq9H1Jm8mU4AoDo
	 tYEsoc19rtHNgG0UMiUzgfJi6rdU5DmfXuNc6rgFuhRYpHfhA52pBSeYa4fofhQDYN
	 ARoDDn05/6oJ8613UFpkQwaDNAV3QbUGSNTBVmLB+VEJ/3eyMmAXbAvyCJOZ4ZvD2i
	 sKEiwUEm3utUkypeph7bZ8SWyRkIahSFZHZrsY4kepFKduHoMAgcYGBF7Vz4YdhaHP
	 qCnjo7q5wYCSQ==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id v8-20020a17090a634800b001bb78857ccdso6051829pjs.1
        for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 20:55:38 -0800 (PST)
X-Gm-Message-State: AOAM530oWO7/1IqSf6HHoirzIKJUW2sEKRd0JXzKCIujvwqmh3wSWcyH
	uz7GObFQCNXw6sST6X8UtognPpwf6FFUO02fzf0=
X-Google-Smtp-Source: ABdhPJxFswrX5ZhULOVqkkTeNUddZz5GKFlBSh38FlNOFO45DNJA/a61t3Ziez+i+J+9QUNCxhaseXwszlPu87Vxsso=
X-Received: by 2002:a17:902:e8d7:b0:149:3b5d:2b8b with SMTP id
 v23-20020a170902e8d700b001493b5d2b8bmr1173473plg.162.1645073737215; Wed, 16
 Feb 2022 20:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217002843.2312603-1-keescook@chromium.org>
In-Reply-To: <20220217002843.2312603-1-keescook@chromium.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 17 Feb 2022 13:54:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMobjuAen+_O4eFOgkOoUwf5ANk6_TjL4SdtT47Jge-w@mail.gmail.com>
Message-ID: <CAK7LNASMobjuAen+_O4eFOgkOoUwf5ANk6_TjL4SdtT47Jge-w@mail.gmail.com>
Subject: Re: [PATCH] um: Allow builds with Clang
To: Kees Cook <keescook@chromium.org>
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>, David Gow <davidgow@google.com>,
        linux-um@lists.infradead.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
        kunit-dev@googlegroups.com, llvm@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 17, 2022 at 9:28 AM Kees Cook <keescook@chromium.org> wrote:
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


Does this work for the i386 host?

UML supports i386 and x86_64 as the host architecture as of now,
but this always compiles UML for x86_64?







>  CLANG_TARGET_FLAGS             := $(CLANG_TARGET_FLAGS_$(SRCARCH))
>
>  ifeq ($(CROSS_COMPILE),)
> --
> 2.30.2
>


-- 
Best Regards
Masahiro Yamada
