Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C431363
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 20:49:32 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id bt26so7053707lfb.3
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 13:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F6d2skYVql+tVSKN+LeWI4wqrla7+wIiNypxUwRkHa4=;
        b=hMYd6pmTPI97+AcCZJh/Dn8QrpJ9HZZTcdS8TTMPkGWVSlqDKFYucXq6uh7LsUsts7
         XYPQnt6lwklNXpyprFv5V31939VSdLI/WWh9ySAmPfOmfEEOraklJJtoDhwbNPL7uVl0
         c0QHb14+qWmOw6B7QrY5S4H1spDxTv0lSNah/dILmDC1ONV8QwXT0XywtWhVLu5hTJFI
         X/tz9fDtANJolNAaaHFOIDu2Voab/vkYf6vCK5+yw4RcHvnhF7fOPHsN2yDybtQ9buZP
         rRdsBilp4kXieYloEzL5TNYP8JnzdEymBVGCCoRXt7qqpCf2WqsP9Vbc086TuWB9PWr8
         Csfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F6d2skYVql+tVSKN+LeWI4wqrla7+wIiNypxUwRkHa4=;
        b=DEZlmRNpTJuryMdtMXEiIUhE7ZmIOroDKEegPxVHUa7dnLnrMfjI6uHZq2PGjOpoZ0
         Pfyyv85cW031dbLr5AaGfYEz/3gCIgyg0vcTJEPBwxxe1PrybFF+C6o1f9VGrvd0cYHy
         xSMPXD5VkRO9Y0alDjMaSZXWgsgOsEqS1SVzhlu6YkKrf8UTlO/c0o6LrB0bcldhn3sA
         Z5T8Jv7u+8/9gLE4vNCBRWHh63chlL39XbroQWs4FsIEQqLGdxrCIxLOUVo3ieOrJ8cI
         PXlHnF52Bbwph92OaSHh8WbWYpEFdxzkqoPEwKVoK3SVJwqjLqEqx5eChuCxhsV10JR9
         Y69Q==
X-Gm-Message-State: AOAM532RUc8wSkGlk4MaIi1hs2zv+jhQp+dKqSmgEGBBmsVAMhFmHnrg
	QMwyO0q9cmpyUzCHLs6A+VNk1N+/0CQ/WY1GompdFg==
X-Google-Smtp-Source: ABdhPJwtN5JV7Er0QkmPA4FTptAsdOeyV1pqpypoQcR+zJKtwpSy5DFfObCmyKJ5WiGZs0EFARcFSwsA/J9wRS8COWQ=
X-Received: by 2002:ac2:5223:0:b0:448:5100:e427 with SMTP id
 i3-20020ac25223000000b004485100e427mr15308996lfl.87.1648846169999; Fri, 01
 Apr 2022 13:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220401201916.1487500-1-samitolvanen@google.com>
In-Reply-To: <20220401201916.1487500-1-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 1 Apr 2022 13:49:18 -0700
Message-ID: <CAKwvOdmHarC+O71PPJwUSnP4oZjknD0FHPZ5b9JbMJ-xOgwMwg@mail.gmail.com>
Subject: Re: [PATCH 0/3] cfi: Use __builtin_function_start
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <keescook@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 1, 2022 at 1:19 PM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> Clang 14 introduced the __builtin_function_start intrinsic, which
> makes it possible to cleanly implement the function_nocfi() macro in a
> way that also works with static initializers. Add a default
> function_nocfi() implementation and drop the arm64 inline assembly
> version.

For the series
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I wouldn't mind if patch 1/3 included a link to the llvm commit in the
commit message.

Link: https://github.com/llvm/llvm-project/commit/ec2e26eaf63558934f5b73a6e530edc453cf9508
Link: https://github.com/ClangBuiltLinux/linux/issues/1353

>
> Sami Tolvanen (3):
>   kbuild: Change CFI_CLANG to depend on __builtin_function_start
>   linux/compiler-clang.h: define function_nocfi
>   arm64: Drop the inline assembly implementation of function_nocfi
>
>  arch/Kconfig                      |  5 +----
>  arch/arm64/include/asm/compiler.h | 16 ----------------
>  include/linux/compiler-clang.h    | 10 ++++++++++
>  init/Kconfig                      |  3 +++
>  4 files changed, 14 insertions(+), 20 deletions(-)
>
> --
> 2.35.0
>


-- 
Thanks,
~Nick Desaulniers
