Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10164138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:16:12 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id m23so19662106ljc.0
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 14:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0pyM/dGPrMvG6mnoHbdfk5duPjwZk8VDdfN9LbJtBhU=;
        b=oLmIvXsVQtmo+mQoKeM5Ng+2p865gPqUSRlJzomijrfZR+uRnEu6S5gmFr51O79oF9
         HXFOmuFFAU9ydlxwXXqzayQ+CuxmYdyJVZSSoeXwSUsvImcAKagHjoDrUkxN7L8Qt3JQ
         8VXxa1NoZ755myqvlKHgqJj3nwyi0SI3x/8gqsLsKcM3LSWoqKd6zxEOSL79tByeqfYM
         CqXSvgYpUBJg8ADvoLvsVF7zRIqd0fmtzm9dMYMt5Ze9m7cs6jHpKDiqprwZNxpSWCyU
         tRXXVQpBxULun68DVKnrBwVWl9owNDHhOT1OCOZe84PFupYW3qfslsZyTRMrmDqvpPJ+
         LLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0pyM/dGPrMvG6mnoHbdfk5duPjwZk8VDdfN9LbJtBhU=;
        b=dc3QT/uebeyUAIzCOzI+181uVNEbJ01E32728TAX7kjBD4DaaQFMrTP0TzbsccVET7
         yGZGdcNpvi/zSd2SRMc5dRncKV2aLMHdF6cOCYAg6Bv1rS60ufM0Rx7FkYGdFsY4fNwe
         FEf/uWbg4XDJhZsLw+q7/BDSdhQxX33X00Obaovi5K7Yc3CwAEck5KaEVaORBzUbff3x
         Dj4cL/v9whcEUqMhixiG8oy8DVHx7yQJlRY4xwn/HX7QWqf9CCVB22OQUoOPRZ2KQ/gv
         EfjcQJccCuwZ3olKdSMEhUUwTWN9fAT4gPOl15zZ0KebPY4Eol424+ZlgQUEp7V+M0qm
         9HRg==
X-Gm-Message-State: AOAM533yTAWE07hj8vNwinw9cidnzkHaGIMB5QWlZWH9bkhcoUqrq1C0
	s0YpPDAxSyeRjSwS+XHH9LnhebzYaAXG1pasPpbbvA==
X-Google-Smtp-Source: ABdhPJw9PQYQgUgAt8gKkAfmc4S1ts/cLSZQ0l2aqvl1K3hvc5CDrxCDVNwyaXc4Z9rbV1eOXjAYjhrw+SOFBSg6ktY=
X-Received: by 2002:a05:651c:101:b0:250:896d:f870 with SMTP id
 a1-20020a05651c010100b00250896df870mr12063160ljb.235.1652735770007; Mon, 16
 May 2022 14:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220516210954.1660716-1-ndesaulniers@google.com> <20220516210954.1660716-4-ndesaulniers@google.com>
In-Reply-To: <20220516210954.1660716-4-ndesaulniers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 May 2022 14:15:58 -0700
Message-ID: <CAKwvOd=x9Fcedp8TaHtReLtjc0MARRH8Wo7aCCLfyG-rV02okA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ARM: only use -mtp=cp15 for the compiler
To: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

+ Ard (I messed up my command line invocation of git send-email, sorry
for more noise)
https://lore.kernel.org/llvm/20220516210954.1660716-1-ndesaulniers@google.com/

On Mon, May 16, 2022 at 2:10 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Avoids an error from the assembler for CONFIG_THUMB2 kernels:
>
> clang-15: error: hardware TLS register is not supported for the thumbv4t
> sub-architecture
>
> This flag only makes sense to pass to the compiler, not the assembler.
>
> Perhaps CFLAGS_ABI can be renamed to CPPFLAGS_ABI to reflect that they
> will be passed to both the compiler and assembler for sources that
> require pre-processing.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/arm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 99a7ed7e9f09..1029c2503aef 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -108,7 +108,7 @@ CFLAGS_ABI  += -meabi gnu
>  endif
>
>  ifeq ($(CONFIG_CURRENT_POINTER_IN_TPIDRURO),y)
> -CFLAGS_ABI     += -mtp=cp15
> +KBUILD_CFLAGS  += -mtp=cp15
>  endif
>
>  # Accept old syntax despite ".syntax unified"
> --
> 2.36.0.550.gb090851708-goog
>


-- 
Thanks,
~Nick Desaulniers
