Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFD14420
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 17:38:41 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id m16so7052777ljh.10
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zQj9SC9LzzvOt29hChR7g7E0Lc7GX6Hy0KSuYXInGDE=;
        b=f1TD0jljg/IWNfS09CDUXQ2i7XWpMyLwkZYu7JGV2gzXGa2UVnksceghpfLAy/UQC6
         AJ114v+NuGgFr7knklFFpz6ynue3oYETOfOm5R//r6OUBA7BELjDo5Wk3tlBs1wDb689
         O923kaNhZUnHvdp476b/5NIklZmtWSPbnYd5u8VIpENd0nwqvMtIwuwospT0OuzRRfFD
         yM6dWj90pCYNGJRTDqlWUJo/Nu7KHUnfX0Dzn2Dj1MmFEQJwptkhESV4I+WFwN4PRbMS
         wIrYu07ulUmuOQggE46pqVEpy2So5a9Vp6pUcKuZ+2W31x+Drf9hUABiGkzYO5DfaZ+C
         dJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zQj9SC9LzzvOt29hChR7g7E0Lc7GX6Hy0KSuYXInGDE=;
        b=aqIgigeAUxNDJIBbK9YE0U/t7ChUvrHquRCb7N9F2XaiX4R1DU3gsZZKpeN5qAOd6M
         HdxKIndZ/82moTavHqGiJOWXwlhlxtoCTF5iOQwZT1GJmR2RsRDaL2a78aYT83BufnfW
         CDccHgGKK2G64BRccmmM1BQW/GeF+FMhLiQz8L9sqc09lEghvx6ffoU29SRHZfLcu+wu
         k4E+yFvXGbbaSg4BQunyE3KckpN2Nh969fmna1ok0VHXnzr1ZhxFQzmMnMUDjUUGSZUN
         5jpW7i5pF4YbwogFRMX9xTSTC56VsDK6QCp3bsSFuIUJfBmkoJy7E+qSJ+VGdyydL+LI
         tVMw==
X-Gm-Message-State: AJIora9uPRrYNCu1Ya6EYBMtXI6jd3Eb7dkfD6K+GKblWqvtu2W2cwOT
	uHUKo2CHZk5P+rglYUVVOmvcNYNPeCcaz1zkL32hYw==
X-Google-Smtp-Source: AGRyM1u0DMzzoMdO3sxBWXuOKwxHG4cPlzL7241+1VuSMH0ejamZIb6JycU8Bwpc+nLYSgUU3vNiSrLtM6MHva0BM8c=
X-Received: by 2002:a05:651c:2104:b0:25b:f4ed:db93 with SMTP id
 a4-20020a05651c210400b0025bf4eddb93mr10900111ljq.295.1657561118922; Mon, 11
 Jul 2022 10:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220710071117.446112-1-maskray@google.com>
In-Reply-To: <20220710071117.446112-1-maskray@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Jul 2022 10:38:25 -0700
Message-ID: <CAKwvOd=yTio6SDG-dEEB1W3nQdZZNk67x_DsiedmC5t95P8XNg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
To: Fangrui Song <maskray@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Khem Raj <raj.khem@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 10, 2022 at 12:11 AM Fangrui Song <maskray@google.com> wrote:
>
> lld since
> https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
> (milestone: 15.0.0) has implemented some RISC-V linker relaxation.
> -mno-relax is no longer needed in KBUILD_CFLAGS/KBUILD_AFLAGS to
> suppress R_RISCV_ALIGN which older lld can not handle:
>
> ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax
>
> Signed-off-by: Fangrui Song <maskray@google.com>

Thanks for implementing relaxation in LLD for RISC-V!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 34cf8a598617..7e4ceb2a0981 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -37,6 +37,7 @@ else
>  endif
>
>  ifeq ($(CONFIG_LD_IS_LLD),y)
> +ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
>         KBUILD_CFLAGS += -mno-relax
>         KBUILD_AFLAGS += -mno-relax
>  ifndef CONFIG_AS_IS_LLVM
> @@ -44,6 +45,7 @@ ifndef CONFIG_AS_IS_LLVM
>         KBUILD_AFLAGS += -Wa,-mno-relax
>  endif
>  endif
> +endif
>
>  # ISA string setting
>  riscv-march-$(CONFIG_ARCH_RV32I)       := rv32ima
> --
> 2.37.0.144.g8ac04bfd2-goog
>
>


-- 
Thanks,
~Nick Desaulniers
