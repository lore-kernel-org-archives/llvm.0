Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF987137C
	for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 13:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E591C43146
	for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666014596;
	bh=cVbTBys4QY/+4OrJqqpY4vnMEBSGMFjEPQuoM2lpzek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rutma+kRxkw7vk2KlS6yGAiGODDwXBzfJz4ZHhOcXQqqT4T+rYgJq8CJBcWd9VTrZ
	 rg/IawzhiiXlN1eWGQ+7Z3ZL28h/yUfl0U+TXYCTrrqh+/bbRIFHB6TeG0eoonDqj1
	 G3/9gu/3MEbiMoDWWUWqhUwt5X4H0zgwEVzw/AbibinItrI7XAl00vrxkyFGESYiJ0
	 dtf/0E67Hi1SNnKhxHGOUAokqIf6jFC/yNtZs5/o9mqXar1oIiZlKxlP66O0NJ7vSs
	 sqLGLAOFgDm9X+RY1tyU9RFtYLcMmL3kpjxs25yPUXGcH8jsgAKg0Lhq+PcC2TvkXl
	 htUFcsVqWeriQ==
Received: by mail-lf1-f41.google.com with SMTP id f37so17580557lfv.8
        for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 06:49:56 -0700 (PDT)
X-Gm-Message-State: ACrzQf3SFGs6xHphDYnFgVno4A54uptYcsYmH/2xzxj7+vKaCbKhsASF
	EktrXHTu6ayH5bVW4rIOzeSDqwIFAVpWNMqwn18=
X-Google-Smtp-Source: AMsMyM62T0Lmer/YAVd8RGaILt9+Yt130QoT0nBCComifQ0MDL/NMeRs/SRysB4MaOfT/8HNfr3ESn7tYDzvNQMgc48=
X-Received: by 2002:a05:6512:150e:b0:492:d9fd:9bdf with SMTP id
 bq14-20020a056512150e00b00492d9fd9bdfmr3823504lfb.583.1666014594327; Mon, 17
 Oct 2022 06:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210072120.V1O2SuKY-lkp@intel.com> <20221010175134.2671410-1-ndesaulniers@google.com>
In-Reply-To: <20221010175134.2671410-1-ndesaulniers@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 17 Oct 2022 15:49:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFpBH-aOR47fONFdt3B_w7WkmveD2PcS4AbEE=ZqAHX+A@mail.gmail.com>
Message-ID: <CAMj1kXFpBH-aOR47fONFdt3B_w7WkmveD2PcS4AbEE=ZqAHX+A@mail.gmail.com>
Subject: Re: [PATCH] lib/xor: use r10 rather than r7 in xor_arm4regs_{2|3}
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Oct 2022 at 19:51, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> kbuild test robot reports:
> In file included from crypto/xor.c:17:
> ./arch/arm/include/asm/xor.h:61:3: error: write to reserved register 'R7'
>                 GET_BLOCK_4(p1);
>                 ^
> ./arch/arm/include/asm/xor.h:20:10: note: expanded from macro 'GET_BLOCK_4'
>         __asm__("ldmia  %0, {%1, %2, %3, %4}" \
>                 ^
> ./arch/arm/include/asm/xor.h:63:3: error: write to reserved register 'R7'
>                 PUT_BLOCK_4(p1);
>                 ^
> ./arch/arm/include/asm/xor.h:42:23: note: expanded from macro 'PUT_BLOCK_4'
>         __asm__ __volatile__("stmia     %0!, {%2, %3, %4, %5}" \
>                              ^
> ./arch/arm/include/asm/xor.h:83:3: error: write to reserved register 'R7'
>                 GET_BLOCK_4(p1);
>                 ^
> ./arch/arm/include/asm/xor.h:20:10: note: expanded from macro 'GET_BLOCK_4'
>         __asm__("ldmia  %0, {%1, %2, %3, %4}" \
>                 ^
> ./arch/arm/include/asm/xor.h:86:3: error: write to reserved register 'R7'
>                 PUT_BLOCK_4(p1);
>                 ^
> ./arch/arm/include/asm/xor.h:42:23: note: expanded from macro 'PUT_BLOCK_4'
>         __asm__ __volatile__("stmia     %0!, {%2, %3, %4, %5}" \
>                              ^
> Thumb2 uses r7 rather than r11 as the frame pointer. Let's use r10
> rather than r7 for these temporaries.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1732
> Link: https://lore.kernel.org/llvm/202210072120.V1O2SuKY-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm/include/asm/xor.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/include/asm/xor.h b/arch/arm/include/asm/xor.h
> index 669cad5194d3..934b549905f5 100644
> --- a/arch/arm/include/asm/xor.h
> +++ b/arch/arm/include/asm/xor.h
> @@ -51,7 +51,7 @@ xor_arm4regs_2(unsigned long bytes, unsigned long * __restrict p1,
>         register unsigned int a1 __asm__("r4");
>         register unsigned int a2 __asm__("r5");
>         register unsigned int a3 __asm__("r6");
> -       register unsigned int a4 __asm__("r7");
> +       register unsigned int a4 __asm__("r10");
>         register unsigned int b1 __asm__("r8");
>         register unsigned int b2 __asm__("r9");
>         register unsigned int b3 __asm__("ip");
> @@ -73,7 +73,7 @@ xor_arm4regs_3(unsigned long bytes, unsigned long * __restrict p1,
>         register unsigned int a1 __asm__("r4");
>         register unsigned int a2 __asm__("r5");
>         register unsigned int a3 __asm__("r6");
> -       register unsigned int a4 __asm__("r7");
> +       register unsigned int a4 __asm__("r10");
>         register unsigned int b1 __asm__("r8");
>         register unsigned int b2 __asm__("r9");
>         register unsigned int b3 __asm__("ip");
> --
> 2.38.0.rc2.412.g84df46c1b4-goog
>
