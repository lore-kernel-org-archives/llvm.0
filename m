Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522213FC0
	for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 22:27:43 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id k5so2159527lfu.4
        for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 15:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lT1I55KczeyyrBKJaTcaNt3EKQYdb66gBkFV3oKdmU=;
        b=cLLRlG3z2UJOYGSV2OFLN7nala7hSRKkm1NT2+fUl0YaMiiOZlYsWCw7ByaZKyYdej
         eG8dr3UbwvIMU/RM8z2rsQ4DgasSeZTh0i/Rftbh7OwRpJDOTDumqCCxERtqfeOPINQO
         xPDmZ92Q0CLLogMTcGI5GgcmEeQiRAwo7+DjtUhyVKRKEfry50YDK6jbyL7zmr8hoadn
         xt0f1POpvE/7AJPn7S4IcaP5zIZqyuNVPONf+dLiQYTIAEDYVIGjift9BtHsgPAhQusE
         GSNawaJdNcayCnxbUi9s9cWUCu+mOqqxtNS64tIGdilUeRLu5SvkNkd+azkaiHG6ZYZf
         AF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lT1I55KczeyyrBKJaTcaNt3EKQYdb66gBkFV3oKdmU=;
        b=ohpVSBRMxyMyXmvanaBJQxEQaSNganfZSZx3fhSeWWWxLOdIZlSbYZjvTOvGynrL0X
         YxiCrkIKl7AIhVWqJwfoQtrs91fxR+2esvPDjIq088lSQfn4uJKO7r9xbPjupVLW3sQI
         fC0PKic9MYS0/1oqvsywAK59ZNTwpu0EUJvN0FB2RagtnZTHYNrfsFaqvln/IOwXikyK
         wjcH5okeQPw1xHstIJq4aI3/tbtnucxfRsAAqN7kqxVC6DucvrHwCYjuawgKeIGl6Z4b
         YcKBlKDUJmBnBwuDTh4Nx82yp82jhLEBAq3RpZzJPpLP/Xn5yWGtnjPYzT09HeDHfhCs
         RvFg==
X-Gm-Message-State: AOAM5316F1tPW9imAAzkNY8rusH7EdZAghbidqp9kGHjbKXwaL+vTPZe
	T3tT7Dxu0iRZlpmGnOm8grylEQk+JrRYwgm4I3YVLw==
X-Google-Smtp-Source: ABdhPJz69LBJzlo7mshI5KNm0XFcBV9epeSDC13/1omU+QcDvmsdJXT9mzNuW+AIOyT9FilOddxsxsY8rgdU9BNEkZA=
X-Received: by 2002:a05:6512:3991:: with SMTP id j17mr285821lfu.374.1629930461195;
 Wed, 25 Aug 2021 15:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210824022640.2170859-1-nathan@kernel.org> <20210824022640.2170859-3-nathan@kernel.org>
In-Reply-To: <20210824022640.2170859-3-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Aug 2021 15:27:29 -0700
Message-ID: <CAKwvOdk8nj6Yu=+k+cDx_rKh=ug6+VyYRzzFGDiZjrQQ8q7eCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Add -Werror=ignored-optimization-argument to CLANG_FLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	x86@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	clang-built-linux@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 23, 2021 at 7:27 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Similar to commit 589834b3a009 ("kbuild: Add
> -Werror=unknown-warning-option to CLANG_FLAGS").
>
> Clang ignores certain GCC flags that it has not implemented, only
> emitting a warning:
>
> $ echo | clang -fsyntax-only -falign-jumps -x c -
> clang-14: warning: optimization flag '-falign-jumps' is not supported
> [-Wignored-optimization-argument]
>
> When one of these flags gets added to KBUILD_CFLAGS unconditionally, all
> subsequent cc-{disable-warning,option} calls fail because -Werror was
> added to these invocations to turn the above warning and the equivalent
> -W flag warning into errors.
>
> To catch the presence of these flags earlier, turn
> -Wignored-optimization-argument into an error so that the flags can
> either be implemented or ignored via cc-option and there are no more
> weird errors.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Good idea.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.clang | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 4cce8fd0779c..2fe38a9fdc11 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -29,7 +29,11 @@ CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>  else
>  CLANG_FLAGS    += -fintegrated-as
>  endif
> +# By default, clang only warns on unknown warning or optimization flags
> +# Make it behave more like gcc by erroring when these flags are encountered
> +# so they can be implemented or wrapped in cc-option.
>  CLANG_FLAGS    += -Werror=unknown-warning-option
> +CLANG_FLAGS    += -Werror=ignored-optimization-argument
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
