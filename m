Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2997F
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 17:24:34 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id s13so19979391ljd.4
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 10:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WGXDbLLtqPgbZ/3WaqTn0w4G97KhWPUzyJUyHiAl65c=;
        b=fXcRlI2bJl9PYMBbbXYz5hPVac9Q75B5BigJvoztYYM/pVGzLkBAOAilWRze4d2fcW
         rFJNGasK2WrVTwzztCCogHov0MUhSjZOalC1T3G/O40MKOiJpHmp2kL4C+8U1FeabOFK
         2sMuoLNSnITfk1n8NZpfORm0Lmgl8pG8furTP91T9b+w5xow9FxFbueWE6KOeeA+Onb7
         RRBfeaUQ6e3NR2lT8g4nQEMkRn9uGcqMpRgKcv9Ai6wZQ+OqTgDkPvwrEKXOqMTZJaZn
         a6D4k2GdYxEoTIs2uJERv1QWHVkYumcq9CU1sqa8TWf7bqaCHMHc9v8vCdJQxCkrXqr6
         E2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WGXDbLLtqPgbZ/3WaqTn0w4G97KhWPUzyJUyHiAl65c=;
        b=e7777BGKAIMQcOTA4TICea1coxdyPYXT6daB+AqMCMBFupESasylWyjbkk/MopoZEv
         EpUz0ZACc1l+SymI02w1U/EhLa016ZQQEGgvrNtgDy71U4qWD/ImcS+5SemA0LpvfhhY
         LOGIC+Qy9mSw25ac7iodz3T9jIJdOEUWzTKORC/WAB4LqWEEn/D4V45L2+4o0qTioItX
         91yiI0QH1TG4XU3/mmykG1Lh5pqP/noUx/ap8XUgj0F5vE6G37zRkf5D05LgugCbzi/s
         dQzdhPGXaGGBRqozpryDwzCja79LuJm0CMbJztJ0cXSkRBWhK1gksTPsZdpjqHiHt7s3
         /wlQ==
X-Gm-Message-State: AOAM532zkBSKTwQp/7+koMvQiiEPHr0KeHEZ1YP5vNYLiTAZdkln/u1r
	yEam7NXG0d6UhuRXjTvAdBtlF1PF6jai5sBW0RgCLQ==
X-Google-Smtp-Source: ABdhPJzZdGRm7zcejXzLCc1zvFixbWQgiEqigChk9f/02vn2hn+b1/g4LqMUsjcR0t4jXmGw+tReeOy+II+7fLstzEg=
X-Received: by 2002:a2e:8715:0:b0:255:a7e5:d50d with SMTP id
 m21-20020a2e8715000000b00255a7e5d50dmr3573997lji.26.1654622671928; Tue, 07
 Jun 2022 10:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607164000.447941-1-masahiroy@kernel.org>
In-Reply-To: <20220607164000.447941-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Jun 2022 10:24:20 -0700
Message-ID: <CAKwvOdk5ZrcSmQSPrFzreZ-z_Hpi4Lc-D-Y4NDuHPiUWpXdwzA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/check-local-export: avoid 'wait $!' for
 process substitution
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Michael Ellerman <mpe@ellerman.id.au>, 
	Wang Yugui <wangyugui@e16-tech.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 9:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Bash>=4.4 supports 'wait $!' to check the exit status of a process
> substitution, but some people using older bash versions reported an
> error like this:
>
> Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Wang Yugui <wangyugui@e16-tech.com>
> Tested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

Some comments below.

> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 34415ae1af1b..19c286c23786 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -32,6 +32,7 @@ you probably needn't concern yourself with pcmciautils.
>  GNU C                  5.1              gcc --version
>  Clang/LLVM (optional)  11.0.0           clang --version
>  GNU make               3.81             make --version
> +bash                   4.2              bash --version

/usr/bin/env bash
and definitely /bin/bash
both show up a lot in kernel sources. At this point, I think bash is a
requirement at this point, so it's good to document it finally.

> +# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> +# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> +# '2>/dev/null'. However, it suppresses real error messages as well. Add a
> +# hand-crafted error message here.
> +#
> +# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> +# binutils to 2.37, llvm to 13.0.0.

Might be nice to include `TODO:` in the comment block. Vim will
highlight these in comments.

-- 
Thanks,
~Nick Desaulniers
