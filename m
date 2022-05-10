Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DCB3D93
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 22:29:57 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id h29so526540lfj.2
        for <llvm@lists.linux.dev>; Tue, 10 May 2022 15:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/Vy98iqCmUGrB9IvUBBIMWzq8uFaKeITUU8skliCg4=;
        b=US5OD37cJmpUEfuQ6bjPS26/vOXP5wIzkW7P2mXs/DAO3VjaGtfAowSjPiJEsR8WSK
         s+c5ZT6adF4a0QLrNe7ex4NYs1YHinhBvAY2/SMBhTVbeDZ0rqvE+W1eKmIwRLzRHsq7
         SDUcwqvlToDlyGL+kt0viY0gdoK89ReeNJNCSRr55bbX4iftc03WLXN5xn1gJkevY/pH
         kZ/RI17qbdl4hqmhBFgBzEcpJ59ZY0Zrzc154k5kOcVYfDs4qn5mXLVLl9ruB7KJFPWP
         D1dmcDSaKAgjA9qhNBJFqCEtMJ7kDyhzW7T3wwF9+uJVCzr3lWMMzFY32ahGaKZstGgA
         aFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/Vy98iqCmUGrB9IvUBBIMWzq8uFaKeITUU8skliCg4=;
        b=kGVUBEACCQ0qXWFfuIlmRXcofdMtoPArHuDm48GT+g1zCAnHg/GvQdI3+77+xP3tiU
         zLFO62FLS3NBdfmMBZAHmqGEe4ftmEeFUv9JnWBAiknBAB3esLa3+V9MzhnkSnaE3grK
         U7Wja+tBw3H4ZCtVJkyEmL0YufadcukYqwGVgi4K/G+AMLFlzaD1swxEoBuBs50pZrzc
         LYpaOs5bivo0vPNmugLBs9YBhrM95l1Yohfgp3usNwjddQb9NcQuCwprH/YHsBOMf42L
         +bdjhPOUy3kXYoyMktKeiuq23yZMr4SaMSmsS48yVQEDY7eUQyZYD/rH8x5LKE89Osug
         UAbw==
X-Gm-Message-State: AOAM5338spboU0SBc17/2Fzol1sXFDBd8fEzb8c+3XgnwcmXtXo4hjVc
	34h65VyRvuJGIpyiDg3HHgoc2rrje/zfuXijFEL56A==
X-Google-Smtp-Source: ABdhPJz4l/nrKd+2Xxuo9LOHRe0BHYg1O/Zigav6jvOgs/tMfTUPDYmeVm8s7LsvjWD5xGbD+Hcr4PMb4SYnKdO9ax4=
X-Received: by 2002:ac2:5e86:0:b0:473:d044:60f5 with SMTP id
 b6-20020ac25e86000000b00473d04460f5mr17988066lfq.87.1652221795170; Tue, 10
 May 2022 15:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220510142550.1686866-1-mailhol.vincent@wanadoo.fr> <20220510142550.1686866-2-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20220510142550.1686866-2-mailhol.vincent@wanadoo.fr>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 10 May 2022 15:29:43 -0700
Message-ID: <CAKwvOdnorHJWesiardEnhYACM4NY_PHBHaoJZB1miJjgKukg2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/asm/bitops: ffs: use __builtin_ffs to evaluate
 constant expressions
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 10, 2022 at 7:26 AM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> For x86_64, the current ffs() implementation does not produce
> optimized code when called with a constant expression. On the
> contrary, the __builtin_ffs() function of both GCC and clang is able
> to simplify the expression into a single instruction.
>
> * Example *
>
> Let's consider two dummy functions foo() and bar() as below:
>
> | #include <linux/bitops.h>
> | #define CONST 0x01000000
> |
> | unsigned int foo(void)
> | {
> |       return ffs(CONST);
> | }
> |
> | unsigned int bar(void)
> | {
> |       return __builtin_ffs(CONST);
> | }
>
> GCC would produce below assembly code:
>
> | 0000000000000000 <foo>:
> |    0: b8 ff ff ff ff          mov    $0xffffffff,%eax
> |    5: 0f bc c7                bsf    %edi,%eax
> |    8: 83 c0 01                add    $0x1,%eax
> |    b: c3                      ret
> |    c: 0f 1f 40 00             nopl   0x0(%rax)
> |
> | 0000000000000010 <bar>:
> |   10: b8 19 00 00 00          mov    $0x19,%eax
> |   15: c3                      ret
>
> And clang would produce:
>
> | 0000000000000000 <foo>:
> |    0: 55                      push   %rbp
> |    1: 48 89 e5                mov    %rsp,%rbp
> |    4: b8 ff ff ff ff          mov    $0xffffffff,%eax
> |    9: 0f bc 05 00 00 00 00    bsf    0x0(%rip),%eax        # 10 <foo+0x10>
> |   10: ff c0                   inc    %eax
> |   12: 5d                      pop    %rbp
> |   13: c3                      ret
> |   14: 66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
> |   1b: 00 00 00
> |   1e: 66 90                   xchg   %ax,%ax
> |
> | 0000000000000020 <bar>:
> |   20: 55                      push   %rbp
> |   21: 48 89 e5                mov    %rsp,%rbp
> |   24: b8 19 00 00 00          mov    $0x19,%eax
> |   29: 5d                      pop    %rbp
> |   2a: c3                      ret

Right, we need to allocate registers to move the inputs into the asm
block, and the results back out. Inline asm is analogous to a call
with a custom calling convention, where we don't look into the body of
the inline asm.

Does -fomit-frame-pointer clean make these snippets clearer, or did
you not build with -O2?  Consider using those flags if so, since we
generally prefer the ORC unwinder on x86, not the frame pointer
unwinder.  If the compilers are forcing a frame pointer when using the
builtins once optimizations are enabled, that's a problem (that we've
seen in the past with the builtins for reading eflags with clang; now
fixed).

>
> For both examples, we clearly see the benefit of using __builtin_ffs()
> instead of the kernel's asm implementation for constant expressions.
>
> However, for non constant expressions, the ffs() asm version of the
> kernel remains better for x86_64 because, contrary to GCC, it doesn't
> emit the CMOV assembly instruction, c.f. [1] (noticeably, clang is
> able optimize out the CMOV call).
>
> This patch uses the __builtin_constant_p() to select between the
> kernel's ffs() and the __builtin_ffs() depending on whether the
> argument is constant or not.
>
>
> As a side benefit, this patch also removes below -Wshadow warning:
>
> | ./arch/x86/include/asm/bitops.h:283:28: warning: declaration of 'ffs' shadows a built-in function [-Wshadow]
> |   283 | static __always_inline int ffs(int x)

Nice! :)

>
> [1] commit ca3d30cc02f7 ("x86_64, asm: Optimise fls(), ffs() and fls64()")
> http://lkml.kernel.org/r/20111213145654.14362.39868.stgit@warthog.procyon.org.uk

+ David, author of ca3d30cc02f7.  I was wondering if this applied to
more than just x86, but I see now that some architectures just include
include/asm-generic/bitops/builtin-ffs.h into their
arch/*/include/asm/bitops.h. It's only when we want to beat the
compiler for non-ICE expressions.

Patch LGTM; just minor comments on commit message, naming, and formatting.

>
>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> ---
>  arch/x86/include/asm/bitops.h | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
> index a288ecd230ab..535a7a358c14 100644
> --- a/arch/x86/include/asm/bitops.h
> +++ b/arch/x86/include/asm/bitops.h
> @@ -269,18 +269,7 @@ static __always_inline unsigned long __fls(unsigned long word)
>  #undef ADDR
>
>  #ifdef __KERNEL__
> -/**
> - * ffs - find first set bit in word
> - * @x: the word to search
> - *
> - * This is defined the same way as the libc and compiler builtin ffs
> - * routines, therefore differs in spirit from the other bitops.
> - *
> - * ffs(value) returns 0 if value is 0 or the position of the first
> - * set bit if value is nonzero. The first (least significant) bit
> - * is at position 1.
> - */
> -static __always_inline int ffs(int x)
> +static __always_inline int __ffs_asm(int x)

How about variable_ffs rather than __ffs_asm? Let's try to stick with
the convention used by test_bit?

>  {
>         int r;
>
> @@ -310,6 +299,22 @@ static __always_inline int ffs(int x)
>         return r + 1;
>  }
>
> +/**
> + * ffs - find first set bit in word
> + * @x: the word to search
> + *
> + * This is defined the same way as the libc and compiler builtin ffs
> + * routines, therefore differs in spirit from the other bitops.
> + *
> + * ffs(value) returns 0 if value is 0 or the position of the first
> + * set bit if value is nonzero. The first (least significant) bit
> + * is at position 1.
> + */
> +#define ffs(x)                                 \
> +        (__builtin_constant_p(x) ?             \
> +         __builtin_ffs(x) :                    \
> +         __ffs_asm(x))
> +

I think this whole #define can fit on one line? If not, perhaps the
BCP can start on the initial line?  Otherwise it looks like the
then/else clauses are indented by 1 tab followed by 1 space. Consider
just using tabs.

>  /**
>   * fls - find last set bit in word
>   * @x: the word to search
> --
> 2.35.1
>


--
Thanks,
~Nick Desaulniers
