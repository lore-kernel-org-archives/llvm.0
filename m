Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F3272
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 06:01:12 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id z126so12432987oiz.12
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 23:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xTVsi87T0lDEPgn8Tsk62laBFA4FkXChR4d7SeUQje8=;
        b=tHM/UYL427rxn2tWoiTDXd3iQU9Vke57HC8n9OC5xFSWoVyx3H19wemimQ2tb9JgS5
         O48FSxpozzSGE3zWCEfm7lI5xW+pkbJw7X8J76GrAU8IvvHyy5myTDlKMJb3LyVUsbql
         ScqdyvZztT1r5Fg6yBOBmi6ux0phlBlJulSKvqsZ8dzhH7Mxf+cwFxjpn2qOsl/ZhtCH
         zCmqZo/TkkQroeaRE5mn+01i8Sw30eWgkDtNMn3vMdJ9NzIccHKFQX+OtYFncQU0VFh0
         QM0EnDM9wrGPiIKr4JCGt0Q66ezaRLNPuAXHD8TR8IbTNmtkYZhnwlJeQ3P5MvS8n3yS
         Lw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xTVsi87T0lDEPgn8Tsk62laBFA4FkXChR4d7SeUQje8=;
        b=U2GXONyhUHPkvlkSct8BLZg6GD1pDjhnCjIbr8+0AjGhSnxu8+Jd/uYRDhLgbAqcIK
         sBovQc4otcisz4E2pT4pBcfXcmjAPohryYF3Q/bguuJPUSTLgC9G8DjxVkXRmNOw3EvJ
         dBF03j3azKXeM32gdUkgpSQkTm/5gn+hiTXKOQCorWL8Ucnes/6wTlOZIw5IW+2CuG0I
         f/FTqPzgauDpb9n6M6il7WaiBX0iRvsTOBMxxiFPjdJE6wovTp5omQD2KRxPCLzsROBD
         32JS4oqg/ceP+eU9jczdLuOJi9FW48glZucVKnF1OP4FWINdycWH0HZEZsplhMQcbIzJ
         nS4g==
X-Gm-Message-State: AOAM532hGnufNFy5BLf1fZf3+oLV/ZDVFqNdQiTgWiaa+pfBjOVBoLGh
	aROYbXiur4SD6T9qbxZ/zDE/JqwXaHGT4alvLRY7VA==
X-Google-Smtp-Source: ABdhPJwGFC+eFxB6m0uGX0odIKSz8vkUWojqWACh17vlZYW2V2z1SF2UA06xoIDbCHBQvL5YgwuA40IwKit0r2F0wRM=
X-Received: by 2002:a05:6808:118c:: with SMTP id j12mr2641330oil.65.1634796071409;
 Wed, 20 Oct 2021 23:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211020200039.170424-1-keescook@chromium.org>
In-Reply-To: <20211020200039.170424-1-keescook@chromium.org>
From: Marco Elver <elver@google.com>
Date: Thu, 21 Oct 2021 08:00:00 +0200
Message-ID: <CANpmjNMPaLpw_FoMzmShLSEBNq_Cn6t86tO_FiYLR2eD001=4Q@mail.gmail.com>
Subject: Re: [PATCH] compiler-gcc.h: Define __SANITIZE_ADDRESS__ under
 hwaddress sanitizer
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Arvind Sankar <nivedita@alum.mit.edu>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Oct 2021 at 22:00, Kees Cook <keescook@chromium.org> wrote:
> When Clang is using the hwaddress sanitizer, it sets __SANITIZE_ADDRESS__
> explicitly:
>
>  #if __has_feature(address_sanitizer) || __has_feature(hwaddress_sanitizer)
>  /* Emulate GCC's __SANITIZE_ADDRESS__ flag */
>  #define __SANITIZE_ADDRESS__
>  #endif

Hmm, the comment is a little inaccurate if hwaddress sanitizer is on,
but I certainly wouldn't want compiler-clang.h to start emulating gcc
here and start defining __SANITIZE_HWADDRESS__ if the places where we
check it are the same as __SANITIZE_ADDRESS__. So this patch is the
right approach.

> Once hwaddress sanitizer was added to GCC, however, a separate define
> was created, __SANITIZE_HWADDRESS__. The kernel is expecting to find
> __SANITIZE_ADDRESS__ in either case, though, and the existing string
> macros break on supported architectures:
>
>  #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
>           !defined(__SANITIZE_ADDRESS__)
>
> where as other architectures (like arm32) have no idea about hwaddress
> sanitizer and just check for __SANITIZE_ADDRESS__:
>
>  #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)

arm32 doesn't support KASAN_SW_TAGS, so I think the bit about arm32 is
irrelevant.

Only arm64 can, and the reason that arm64 doesn't check against
"defined(CONFIG_KASAN)" is because we also have KASAN_HW_TAGS (no
compiler instrumentation).

> This would lead to compiler foritfy self-test warnings when building
> with CONFIG_KASAN_SW_TAGS=y:
>
> warning: unsafe memmove() usage lacked '__read_overflow2' symbol in lib/test_fortify/read_overflow2-memmove.c
> warning: unsafe memcpy() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-memcpy.c
> ...
>
> Sort this out by also defining __SANITIZE_ADDRESS__ in GCC under the
> hwaddress sanitizer.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Arvind Sankar <nivedita@alum.mit.edu>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

Other than that,

  Reviewed-by: Marco Elver <elver@google.com>

Thanks!

> ---
> I'm intending to take this via my overflow series, since that is what introduces
> the compile-test regression tests (which found this legitimate bug). :)
>
> -Kees
> ---
>  include/linux/compiler-gcc.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> index 6f24eb8c5dda..ccbbd31b3aae 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -121,6 +121,14 @@
>  #define __no_sanitize_coverage
>  #endif
>
> +/*
> + * Treat __SANITIZE_HWADDRESS__ the same as __SANITIZE_ADDRESS__ in the kernel,
> + * matching the defines used by Clang.
> + */
> +#ifdef __SANITIZE_HWADDRESS__
> +#define __SANITIZE_ADDRESS__
> +#endif
> +
>  /*
>   * Turn individual warnings and errors on and off locally, depending
>   * on version.
> --
> 2.30.2
>
