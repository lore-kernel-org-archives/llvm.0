Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23D2FAE
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 19:06:12 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id y26so29677920lfa.11
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+gCA8R/q8DA5l/Yv1Vf3OioGIfO849q423Tpx5LPaTM=;
        b=AECqIrUylRKEXCIN5T+00SF+0yJ8GxO/5Agylwk+EUD5TXDWvWc9SUhEh+QdyepOCF
         JPrIGC96e+MeBJ9zmDLh1QGETXM6EfAdKicHFpyRhX6JBv0LJdAdJGHWgBkrO9iA/5nB
         2k9Z+EmR+JJQlScEIAfrpAhXWE9yhHU2gY03pTxXTmVz0t1csyMutOc0oPWHwYYFwtkW
         awy0OAB3G0YzSf8Ij8kREE1a1S4dXle1vXTEAl1ZEJljKw3EvDleYVzIjO58TCxZ3p+I
         D4LBkltjSBPDo/xHrgill2DgT658i7/jxgkxOjyKyuK3PAGF26Gk0ckenc7PV4p2fOX7
         7ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+gCA8R/q8DA5l/Yv1Vf3OioGIfO849q423Tpx5LPaTM=;
        b=dPpDbBCRc8ndhXBv725Au1NFhasF3n7rsD0W0x0HCUnl9Xgb/UJ/GfoUoghgjoLc5R
         0Et4lJtkT/yEPgTFtZQruZthvYqFmVl1NAUZAujHCl7Z9mfn3QhBZQtlwar4LX3s7oXQ
         6nAE9JDRLwP4jWjP8UPbCKMZwm7AHdbj9hff64Z2sGRgldgSGaYjUpEVidVOoydRhj1F
         OuqS71DKtkR8eNpHneyKfZ2RlWhcAxylWIIXgu26kjQf41/AK9VbaSOKfR3+UhDmY4T2
         RJTo9QKSccV3I/zdtKus3GItBtaL4JDpsC8/uDSDjPCCfyvudMTQL1kHCEllvi+4mA2j
         4kSg==
X-Gm-Message-State: AOAM530GnDzElfG+oFWTz26+hbAwqmwCA4PrX2UysHzjPMiNEGhpIK+P
	+fdwsquH0a/pLG8wc13HOowky3JK4yJ6U4hQUYdhFA==
X-Google-Smtp-Source: ABdhPJy9zs84yOnD/x9yZpPrFP29J5YMCsH3vIcOjsBghvbxT/aOAXOzDmJlgx+sg0EByBaMvjAzsaR0WMTd9DlVW/4=
X-Received: by 2002:a05:6512:2294:: with SMTP id f20mr814723lfu.489.1633028770167;
 Thu, 30 Sep 2021 12:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com> <20210930180531.1190642-11-samitolvanen@google.com>
In-Reply-To: <20210930180531.1190642-11-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 30 Sep 2021 12:05:58 -0700
Message-ID: <CAKwvOdkcjAAzxTvYGSi4XD3DEFfESDTyCynQNWjdQ2zssF9sHw@mail.gmail.com>
Subject: Re: [PATCH v4 10/15] x86/purgatory: Disable CFI
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 11:06 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> Disable CONFIG_CFI_CLANG for the stand-alone purgatory.ro.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/x86/purgatory/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
> index 95ea17a9d20c..911954fec31c 100644
> --- a/arch/x86/purgatory/Makefile
> +++ b/arch/x86/purgatory/Makefile
> @@ -55,6 +55,10 @@ ifdef CONFIG_RETPOLINE
>  PURGATORY_CFLAGS_REMOVE                += $(RETPOLINE_CFLAGS)
>  endif
>
> +ifdef CONFIG_CFI_CLANG
> +PURGATORY_CFLAGS_REMOVE                += $(CC_FLAGS_CFI)
> +endif
> +
>  CFLAGS_REMOVE_purgatory.o      += $(PURGATORY_CFLAGS_REMOVE)
>  CFLAGS_purgatory.o             += $(PURGATORY_CFLAGS)
>
> --
> 2.33.0.800.g4c38ced690-goog
>


-- 
Thanks,
~Nick Desaulniers
