Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A52FAF
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 20:57:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC2C4611EF
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 20:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632949062;
	bh=z4p1G85CcZY4Hw6JjpFyc6yNDWNhKYa5qIXjea56ROk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hX/m5oruemvFJ2xw+NLGdYQl5EP4YB562BE8Ce33YV2TYAUFCPMucjIUMCpejGpXv
	 gRiYW6X5YMXqV0glEMglLL6974OGx897yvAtt+wg244sTkvKgbsg5JlPhzdf0jF0O1
	 7Fi9M9F1m1dbO0+YEGj3TQwqyhP0plwQ4UImg40yQeL/xlaUYNsxHvwAxan/kV2TpF
	 fH3YxEAqRBEz7S4Ilyqce48V4w6ODYsoOrmUGCQWOA1HxlfNf5mB5/+cHkTVkBQPbo
	 YPsrd/NfoGOSdsvZzZj7HhWyTrxJB2XA0FGz7hg47pXybx9XxdiUk4WegVaVjJ75TV
	 aJPNvCz7qJ8ug==
Received: by mail-oi1-f178.google.com with SMTP id w206so4562066oiw.4
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 13:57:42 -0700 (PDT)
X-Gm-Message-State: AOAM532yJjDshlBOkwTUyuXMp/0pC2X9DSAxs5FIddrg1hsInnlggIiz
	hbdbe2sBc5NT5R+k09Kk5nQvuxAWXoT7hR5MJ9k=
X-Google-Smtp-Source: ABdhPJyQ02Eim0iYMuBFE57S99npQ7Xq2PVHC2N79V8Y/pD0vYiVEfJaKQfKSJ6bLch4lf8Y8TeZF5z/Sk5/ExHwDk0=
X-Received: by 2002:aca:32c2:: with SMTP id y185mr9488548oiy.47.1632949062268;
 Wed, 29 Sep 2021 13:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmjZ+QmjTJnQ-w5hLPJjow1gYnWTe6f8RBhQUJ2b3cYnw@mail.gmail.com>
 <20210929192026.1604095-1-ndesaulniers@google.com>
In-Reply-To: <20210929192026.1604095-1-ndesaulniers@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 29 Sep 2021 22:57:30 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHkcTZOR1eb-GVVe3m77Lfg8qdp+wLgHMOr7yNTecBGOw@mail.gmail.com>
Message-ID: <CAMj1kXHkcTZOR1eb-GVVe3m77Lfg8qdp+wLgHMOr7yNTecBGOw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: mm: proc-macros: ensure *_tlb_fns are 4B aligned
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Fangrui Song <maskray@google.com>, 
	Peter Smith <peter.smith@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Dave Martin <dave.martin@arm.com>, Nicolas Pitre <nico@fluxnic.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Sept 2021 at 21:20, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> QEMU 6.1.0 is more correct about trapping on misaligned accesses.

Btw, this is not entirely relevant. QEMU now behaves like every single
hardware implementation does, and reports an alignment fault when
using a load-multiple instruction on an address that is not 32-bit
aligned, as the architecture requires.


> A
> kernel built with CONFIG_THUMB2_KERNEL=y and using clang as the
> assembler could generate non-naturally-aligned v7wbi_tlb_fns which
> results in a boot failure. The original commit adding the macro missed
> the .align directive on this data.
>
> Fixes: 66a625a88174 ("ARM: mm: proc-macros: Add generic proc/cache/tlb struct definition macros")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1447
> Link: https://lore.kernel.org/all/0699da7b-354f-aecc-a62f-e25693209af4@linaro.org/
> Debugged-by: Ard Biesheuvel <ardb@kernel.org>
> Debugged-by: Nathan Chancellor <nathan@kernel.org>
> Debugged-by: Richard Henderson <richard.henderson@linaro.org>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * Drop accidentally committed Kconfig change.
> * Pick up Ard's AB tag.
>
>  arch/arm/mm/proc-macros.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
> index e2c743aa2eb2..d9f7dfe2a7ed 100644
> --- a/arch/arm/mm/proc-macros.S
> +++ b/arch/arm/mm/proc-macros.S
> @@ -340,6 +340,7 @@ ENTRY(\name\()_cache_fns)
>
>  .macro define_tlb_functions name:req, flags_up:req, flags_smp
>         .type   \name\()_tlb_fns, #object
> +       .align 2
>  ENTRY(\name\()_tlb_fns)
>         .long   \name\()_flush_user_tlb_range
>         .long   \name\()_flush_kern_tlb_range
>
> base-commit: 02d5e016800d082058b3d3b7c3ede136cdc6ddcb
> prerequisite-patch-id: 3edbe4a8485c7a75a61dbbe299e8ce1985d87ee0
> --
> 2.33.0.685.g46640cef36-goog
>
