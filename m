Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973B2CA0
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 20:56:22 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id d10so8650377eje.10
        for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 12:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7kAa7DmbjkX1n6MBRDKFX0S7TuHMTyFcsHzd9jXMhHA=;
        b=og56HYNW9zMbHV1nD6aTZuf6AdxyUZ9n7vKKs6qsnU680T7gqS0/dggygfeoNeJVZa
         HYMHaayIP9pLqKZOQEdKeilJU1D7CAKnsS51s4IWQZIdxJ7RDc3FFH35/4wdChLKn0No
         A8OJbjwTb7w6iVu9Y7wmcsnRGe/+F/vZYMSG7MQUhTc/MP+s8N/kWQjzbb45jSSyvwA/
         b1JPehTXGWnpSc5ie5qy93atRVdyZ21OkAjzPkhVl6KjSj4XDYMmcVNhmDncTXyOC0Pw
         +jVNFVW3uuianZeewCS8LRWTooTEXBtQwT871s3Il4gN9vJa1m/x8YjgzMFyFLXumli8
         /VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7kAa7DmbjkX1n6MBRDKFX0S7TuHMTyFcsHzd9jXMhHA=;
        b=1bUX+gCiq9yLfvth0TPKMw1kgVzF1iz3mO/mZPUQgqOflU3faWd8B5kyWh8uIx1uXw
         /RaHQ0hu/qzAvSWBeVJ+pNxHeWy0W03bzReeXGmGf36L2M9VtLLSGEtCQQIEFofOxhEm
         i2Intpj/1RLUQ9dUTDvZn7UW8QPZDVAhEOWxqkX5OHVQ1UJ8O+F8dXORteYQdG3MByOJ
         YWhRaeCYS/hlaSVGaq0wzO3QgbZRCsphEg8zBvQK0KpjHPk19dXPiX8KA2u6LPlMVCLx
         Q/sD4pc8kJ01mjH6qyPR/KNhzv5s6mFX61jNAVsjRYUW08sNUN5YKO7I1O7fJ/z7HlZ6
         cWcw==
X-Gm-Message-State: AOAM530sQnqGqnzbZo/c/0h34X7JFIkHB+G0krANrATtyapvrlAN/WS+
	ETPQ22ECFyscrk4/flxkzPwQRD+LDmaDB9ek2W2B
X-Google-Smtp-Source: ABdhPJzZKQmoNqlsg8rvyl0Tp8b3ZVh7cenxJppM2y8n1depnFZUFw39U8AWrJeLyu/oL8Ho2LgSaUKtdEyVEZxFsfg=
X-Received: by 2002:a17:906:5d12:: with SMTP id g18mr4119574ejt.745.1643316980374;
 Thu, 27 Jan 2022 12:56:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211215211847.206208-1-morbo@google.com> <20211229021258.176670-1-morbo@google.com>
In-Reply-To: <20211229021258.176670-1-morbo@google.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 27 Jan 2022 12:56:09 -0800
Message-ID: <CAGG=3QW+P3pO24brQ62g82f0XKVZ3EtZQmrvqAGLCNqWA+5fhg@mail.gmail.com>
Subject: Re: [PATCH v2] x86: use builtins to read eflags
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Bump for review.


On Tue, Dec 28, 2021 at 6:13 PM Bill Wendling <morbo@google.com> wrote:
>
> GCC and Clang both have builtins to read and write the EFLAGS register.
> This allows the compiler to determine the best way to generate this
> code, which can improve code generation.
>
> This issue arose due to Clang's issue with the "=rm" constraint.  Clang
> chooses to be conservative in these situations, and so uses memory
> instead of registers. This is a known issue, which is currently being
> addressed.
>
> However, using builtins is benefiical in general, because it removes the
> burden of determining what's the way to read the flags register from the
> programmer and places it on to the compiler, which has the information
> needed to make that decision. Indeed, this piece of code has had several
> changes over the years, some of which were pinging back and forth to
> determine the correct constraints to use.
>
> With this change, Clang generates better code:
>
> Original code:
>         movq    $0, -48(%rbp)
>         #APP
>         # __raw_save_flags
>         pushfq
>         popq    -48(%rbp)
>         #NO_APP
>         movq    -48(%rbp), %rbx
>
> New code:
>         pushfq
>         popq    %rbx
>         #APP
>
> Note that the stack slot in the original code is no longer needed in the
> new code, saving a small amount of stack space.
>
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
> v2: - Kept the original function to retain the out-of-line symbol.
>     - Improved the commit message.
>     - Note that I couldn't use Nick's suggestion of
>
>         return IS_ENABLED(CONFIG_X86_64) ? ...
>
>       because Clang complains about using __builtin_ia32_readeflags_u32 in
>       64-bit mode.
> ---
>  arch/x86/include/asm/irqflags.h | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
> index c5ce9845c999..27f919ea7ac3 100644
> --- a/arch/x86/include/asm/irqflags.h
> +++ b/arch/x86/include/asm/irqflags.h
> @@ -19,20 +19,11 @@
>  extern inline unsigned long native_save_fl(void);
>  extern __always_inline unsigned long native_save_fl(void)
>  {
> -       unsigned long flags;
> -
> -       /*
> -        * "=rm" is safe here, because "pop" adjusts the stack before
> -        * it evaluates its effective address -- this is part of the
> -        * documented behavior of the "pop" instruction.
> -        */
> -       asm volatile("# __raw_save_flags\n\t"
> -                    "pushf ; pop %0"
> -                    : "=rm" (flags)
> -                    : /* no input */
> -                    : "memory");
> -
> -       return flags;
> +#ifdef CONFIG_X86_64
> +       return __builtin_ia32_readeflags_u64();
> +#else
> +       return __builtin_ia32_readeflags_u32();
> +#endif
>  }
>
>  static __always_inline void native_irq_disable(void)
> --
> 2.34.1.448.ga2b2bfdf31-goog
>
