Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2772
	for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 22:08:18 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id b1so32914551lfs.13
        for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 14:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XYg5uRA+tu1JqcQE8rlr/QJGe6qG9Ux78+pZZQSXsFM=;
        b=pqcwefPtl2C39bPh39Zo+SthZ5QeY4Z0B7iPMHhCZiGqS0+a+IWsPsHHd2pELUPVaP
         RzPQUggCQB8feReTKi9yP3Y0Lr7K4swjqErpSuLoXOfrm7JNrfNQBDzuv+66m7VFza3e
         A0b1mtwuk2BFICkHr0xHPJxXFbICL9JYAytVha0+2kt+SIZEC9eB+vvXgd6rbP4mqJIL
         oREe9BWspd1OCukaf8d68mciIecpbFAIcpt2sEsd4VgFDYWIwnbsRzzfQ695H/CC+YO4
         qH04/mt6nGHaE1hZKbl2BxAPqQ0lc4DXhHLS73PMVVkX4v+D58k/RBmmADGzF2zRd0dy
         /w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XYg5uRA+tu1JqcQE8rlr/QJGe6qG9Ux78+pZZQSXsFM=;
        b=mWxnoQF5KOBLR9yCGlW3ypJUfYve4hVm3tLi+a6qaBUUJs6j6+3kOfAMcv0UP/5v9X
         jx8K+vHU6TOCjAZW4JjjIAmWcM/rVThPgCe9sYOlRA0m/WDTJccdyBMgVNjj7NYwMEgU
         Q3lDDSl7rP9MgiFCkf7H+oW35Ml1WE24Y8r3HbqGnxRGJqqmDOmIMIQ21HPnoXCADtMZ
         I/FrBzmPlHFwQGp0j81B+PZqsIEOz9ho2UUPKuf45CPPKjtwboOP7RLFSa0bybFByOdT
         GOn+KKlrqyQwcn6o1xLS/ABCg/eR0/Cgc7AQg1EsK0c0NEQP2hR1dhObfXfVmfHBoKye
         RhUA==
X-Gm-Message-State: AOAM530iQR5h7Xtwtl2uosYa9N4U550TM05eOBhGAJ0ZMpkAqxdashcx
	8RfOJbqeiN1AHMUIw2CEAdIywUhVmefEVbU8eTKQhQ==
X-Google-Smtp-Source: ABdhPJw4l5qkRrzNZ0ISMkYnecapXw8Nfhqb+OjXZGolwknTDbYOtM2AUW4b+qX0d1MjvXR9nV0H6GZ7wEqyAv946KI=
X-Received: by 2002:a05:6512:3d16:: with SMTP id d22mr26621791lfv.523.1637273296109;
 Thu, 18 Nov 2021 14:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211118185421.GK174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211118185421.GK174703@worktop.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 18 Nov 2021 14:08:04 -0800
Message-ID: <CAKwvOdkrN0tLMrEyx98JY6wGdwi0Be3Z8fbTQ3vNHckM4dmG8g@mail.gmail.com>
Subject: Re: [PATCH] x86: Use -mindirect-branch-cs-prefix for RETPOLINE builds
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	"H.J. Lu" <hjl.tools@gmail.com>, llvm@lists.linux.dev, 
	linux-toolchains@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 18, 2021 at 10:54 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
>
> In order to further enable commit:
>
>   bbe2df3f6b6d ("x86/alternative: Try inline spectre_v2=retpoline,amd")
>
> add the new GCC flag -mindirect-branch-cs-prefix:
>
>   https://gcc.gnu.org/g:2196a681d7810ad8b227bf983f38ba716620545e
>
> to RETPOLINE=y builds. This should allow fully inlining retpoline,amd
> for GCC builds.

Do you mind adding the following link tags:

Link: https://gcc.gnu.org/g:2196a681d7810ad8b227bf983f38ba716620545e
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102952
Link: https://bugs.llvm.org/show_bug.cgi?id=52323

If the feature would be helpful to implement in Clang, would you mind
keeping the cc-option, but moving the check outside of the `ifdef
CONFIG_CC_IS_GCC` block? That way, we don't need to revisit the
Makefile?

(Tangential: I wonder why RETPOLINE_CFLAGS aren't defined in
arch/x86/Makefile; they seem to be x86 specific at the moment).

With the above link tags, and with or without moving this outside the
gcc-specific guard:
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 9e12c14ea0fb..5fd5b5f091ae 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -690,6 +690,7 @@ endif
>
>  ifdef CONFIG_CC_IS_GCC
>  RETPOLINE_CFLAGS       := $(call cc-option,-mindirect-branch=thunk-extern -mindirect-branch-register)
> +RETPOLINE_CFLAGS       += $(call cc-option,-mindirect-branch-cs-prefix)
>  RETPOLINE_VDSO_CFLAGS  := $(call cc-option,-mindirect-branch=thunk-inline -mindirect-branch-register)
>  endif
>  ifdef CONFIG_CC_IS_CLANG



-- 
Thanks,
~Nick Desaulniers
