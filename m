Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DD41FC0
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 17:20:01 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id d19so3387908lfj.4
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xq5ml2d/MeiCgCuvTz1iX/vBFJV/Zf5wkHsF94chv1Q=;
        b=FoDLMQ1CUcXkPH5YH2WUvQkrh4wyHkUUHZHcdPJapmG1T0eHAY1wc8brR60ppGMa5J
         MvFXF3tuoDWJ6lkuzwDg+uXRKK1dpjzfA/uB5GQC4TIBsPxsrPlb2FDEA+M+F9oDz5r4
         vtrjLZL3T3cOwM7JK/DHccrk8RMKefToEtmE3ezQ84jzYnAtOuLgLmSS8SPIbwmYpL8e
         +569UZLjUuKlLJxuLia9HvqCZWJPaqW6wxZ2wKVmnB6sIpUzIEuoLVasYEAtGywHS+dy
         NOLgCVKyfJ/Tlp9jDY6Jr3DzFF11gOShM2S20Pm+kw6ankpEDU3X7veoarlOtuIzCHqv
         rMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xq5ml2d/MeiCgCuvTz1iX/vBFJV/Zf5wkHsF94chv1Q=;
        b=CaCHfj2GnqHSXAweLoH0hILgKCuUjGXONVQ3dvW0EffinixBcjvKtdUnGqtmPTgZCC
         vGoeiFcy+x3CfkE48ocZUdW5r9U5CxWU89CoQTkcJgDFGDw6URTPFtKt/hXZVMUy4Cpa
         auQI5XF3aApC+LMWK5yxevniVYTvNpJL84e5rc8C7ZfC5ofGugYQWpAZwhq8Q/izUdiG
         4rm0zL1/gzcHWPjhwxL5szlkuL2rXyhQQprsjKinkVV9KgJpYO3ohyVf6nnFV3oYYfwq
         6uXJ7wXyTfUq+AD9xEKuXrK+Nx9HLDp+YG2+fDEJnMZTMS8GQY/vIuTfXCBgGDCiR8qO
         9Iyw==
X-Gm-Message-State: AOAM531IczrNeS1F7zQ1S7gs4fDn5Mdm5c747CZMtZwLn54j10jBRNhr
	2YbSfpt6bBQRkfllt7iT2JrOYu2Czbx3WAC2ajoEbg==
X-Google-Smtp-Source: ABdhPJz9taxhLV4YRudjP7JD9rlg95k5LEcou1gLMLiVH/oLNlkumRLOmW/IlL/tmn/lb4A3bbzyo1/l2F7YyG1FIcQ=
X-Received: by 2002:a19:4303:0:b0:473:f5fb:27b2 with SMTP id
 q3-20020a194303000000b00473f5fb27b2mr12343182lfa.626.1652116799064; Mon, 09
 May 2022 10:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org> <20220508190631.2386038-4-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-4-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 10:19:47 -0700
Message-ID: <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into section-check.c
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Zijlstra <peterz@infradead.org>, linux-modules@vger.kernel.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> modpost.c is too big, and the half of the code is for section checks.
> Split it.
>
> I fixed some style issues in the moved code.

It would be helpful for review if the split and restyle were distinct
patches.  Otherwise I can't tell what has changed.

This does lose the ability to use git blame to get more context on
some of the oddities in modpost (which I have found useful in the
past).  I don't feel strongly though.

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v4:
>   - New patch
>
>  scripts/mod/Makefile        |    2 +-
>  scripts/mod/modpost.c       | 1202 +---------------------------------
>  scripts/mod/modpost.h       |   34 +-
>  scripts/mod/section-check.c | 1222 +++++++++++++++++++++++++++++++++++
>  4 files changed, 1240 insertions(+), 1220 deletions(-)
>  create mode 100644 scripts/mod/section-check.c
>
> diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> index c9e38ad937fd..ca739c6c68a1 100644
> --- a/scripts/mod/Makefile
> +++ b/scripts/mod/Makefile
> @@ -5,7 +5,7 @@ CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
>  hostprogs-always-y     += modpost mk_elfconfig
>  always-y               += empty.o
>
> -modpost-objs   := modpost.o file2alias.o sumversion.o
> +modpost-objs   := modpost.o section-check.o file2alias.o sumversion.o
>
>  devicetable-offsets-file := devicetable-offsets.h
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index a78b75f0eeb0..e7e2c70a98f5 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -31,7 +31,7 @@ static bool external_module;
>  /* Only warn about unresolved symbols */
>  static bool warn_unresolved;
>
> -static int sec_mismatch_count;
> +int sec_mismatch_count;

^ this should go in modpost.h if it is to be used in two translation
units, rather than forward declaring it in section-check.c.  You did
this for the functions.
-- 
Thanks,
~Nick Desaulniers
