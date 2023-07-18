Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320EC15AC1
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 17:50:33 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6378cec43ddso31452046d6.2
        for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 10:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689702633; x=1692294633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FakhO3efxXs79fOL17bUjDsDDzuXwblSHaFpqeVimdw=;
        b=bTuSMkUBvr4fylgeHAiAN25RP9JNHB7zTbDbqfWscsW2JgPB8o/8BeqWZQO/eXySTO
         slzdF+ITVkW8uOs8DMMyUiQdCVU1wjDg0vTuOvYmRLlVe9KNyOG3PNVGEEilR+9sUvxE
         VmqMGsuv3b9C0SNBB4uK3Og7dysZddca/g1zuNtjMVdk/r07Z2xTFkgTPL0VJAREIYmi
         28JrcRod5na0FQm1k1l8AEa2IshKh1vWVfPS5hpNUkb6YeLhVny8G+aJr49jF1mrjAdI
         sy2GvtCPN74I9Y4Ggd0UK+bW2+OhUDYsSytk/fWCG1oazheZguiZAS9aSVWUK2VdWYlp
         lnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689702633; x=1692294633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FakhO3efxXs79fOL17bUjDsDDzuXwblSHaFpqeVimdw=;
        b=PB7a9WDtyZf4d8PcsA1Y/I7B/k6WsuNtZK8OYSYd4BH4F+HpNvj897hN/fvGCFf9u6
         9wtezJTYpbtNFOT4dYk+xHbsreOgWZQ6PxheeAW+11Hco3zVuKcidYfshSqpYWswt2Nc
         LewYZgRGTd82/d1fAVtgIKSh7htX8mqfM5vUGM/DDdEwFE9HhjCEuT5r8g//EVRZYVrY
         99bZw1HhrZIF5Ezmkfbbi/yx67hrvyLLFPx2260tvrXFTyHwDzQOWwkxu3yBc0OGrisj
         kJzW8ZQsygdf0fqwkF5bAHwuRFJx1WDtbdMDRpIIkVP4gP5JX0D3+folENgjo4YQJFmW
         OKHQ==
X-Gm-Message-State: ABy/qLY4MyVvR4naikxss6T/ByqSwzsVwSkbfu1dwgNmb6G4WQcO6DlW
	j86PCALu/cCEUNC78nrANEfYIWIzdxOOrJnGnkLp0A==
X-Google-Smtp-Source: APBJJlFBlB2IMN6wQ9ljyKuk9C2ygg7N2wP9HjsaHvyNMgk7s3uVNoO1IdE3mpPvcaRxPv6noi+S8RXvGCinQtcL+Z4=
X-Received: by 2002:a0c:d990:0:b0:635:f23e:ef97 with SMTP id
 y16-20020a0cd990000000b00635f23eef97mr14273252qvj.7.1689702632732; Tue, 18
 Jul 2023 10:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230717-enable-kasan-lto1-v2-1-d47bf182f5c6@gmail.com>
In-Reply-To: <20230717-enable-kasan-lto1-v2-1-d47bf182f5c6@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Jul 2023 10:50:21 -0700
Message-ID: <CAKwvOdmjzgPF9g2e5fXtM=_bkGdYdhK21iuwR7EdZJUnCxRc_w@mail.gmail.com>
Subject: Re: [PATCH v2] arch: enable HAS_LTO_CLANG with KASAN and KCOV
To: Jakob Koschel <jkl820.git@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 11:49=E2=80=AFPM Jakob Koschel <jkl820.git@gmail.co=
m> wrote:
>
> Both KASAN and KCOV had issues with LTO_CLANG if DEBUG_INFO is enabled.
> With LTO inlinable function calls are required to have debug info if
> they are inlined into a function that has debug info.
>
> Starting with LLVM 17 this will be fixed ([1],[2]) and enabling LTO with
> KASAN/KCOV and DEBUG_INFO doesn't cause linker errors anymore.
>
> Link: https://github.com/llvm/llvm-project/commit/913f7e93dac67ecff47bade=
862ba42f27cb68ca9
> Link: https://github.com/llvm/llvm-project/commit/4a8b1249306ff11f229320a=
bdeadf0c215a00400
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
> ---
> Changes in v2:
> - Added correct To:/Cc:
> - Added comment about required LLVM 17 version dependency
> - Link to v1: https://lore.kernel.org/r/20230717-enable-kasan-lto1-v1-1-4=
71e706a5c4e@gmail.com
> ---
>  arch/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index aff2746c8af2..d722bcfcc870 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -745,7 +745,10 @@ config HAS_LTO_CLANG
>         depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
>         depends on ARCH_SUPPORTS_LTO_CLANG
>         depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
> -       depends on !KASAN || KASAN_HW_TAGS
> +       # KASAN & KCOV were missing necessary debug information prior to =
LLVM 17
> +       # which are required with LTO.

Hi Jakob,
Thanks for follow up with a v2.  I think Nathan meant he was literally
looking for a link here in the comment, like:

# https://github.com/ClangBuiltLinux/linux/issues/1721

Mind sending a v3 with that? You can replace the comment you added to
arch/Kconfig in v2 outright with that link.

If folks need to know more they can follow that link or run git blame on it=
.

> +       depends on (!KASAN || KASAN_HW_TAGS || CLANG_VERSION >=3D 170000)=
 || !DEBUG_INFO
> +       depends on (!KCOV || CLANG_VERSION >=3D 170000) || !DEBUG_INFO
>         depends on !GCOV_KERNEL
>         help
>           The compiler and Kconfig options support building with Clang's
>
> ---
> base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
> change-id: 20230717-enable-kasan-lto1-656754c76241
>
> Best regards,
> --
> Jakob Koschel <jkl820.git@gmail.com>
>


--=20
Thanks,
~Nick Desaulniers
