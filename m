Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E612168
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 20:00:35 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z29so10831180edl.7
        for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 12:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q0XkDnd9rfU1MUcenfWHo+SB4Xc7LndS1UE4PEQaUiU=;
        b=og6LNWlfTRMf0WLdHDpT/4Kt31jcqaMAfYOz6dmD0tDQvIlqp3Z8xis7zBgftxlzlq
         l8gTqnnOpJnL0lOzDbeSgGMJ/CR+J71u7xKQuDjptDRaww/1VYYcD1mxnT1aifyaSrGl
         F0HTPuXwHzKiwhd+exmoP8S9QX2kDdmI8H5MAbMwz/hZhn72/g3Vtlycm42oNwzT9xp9
         wxHMhGzhO7n+vopMdcbr4ju0R5J3bNcHSnYu5bfk/b86hZSfUOPSS7TMMOMvjS65t0e3
         gRnrbGtkKgpC0Hmd7K98NAlf+sYPqeDTFNd/P8jtv9g5ONlwrpWLk/ARfxJ/Iyv0Nb8Y
         UnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q0XkDnd9rfU1MUcenfWHo+SB4Xc7LndS1UE4PEQaUiU=;
        b=uAeZifw+Nb+yHg3xSKS7rb7VrHKzVduJo3eHrqsVu4cp4cnJBj6pNPCdzaXvFUPmk+
         3cFYzF5jTzLd3DimzCqNpGBzX7o4fe+DpzkEGuZY0wKE9GOfq1c3xNyePLHpCKIaE8xI
         gSLdbyh8dXfdnJqvSD2SatosFzxj+2Vx+ugSOS9CYn9qqi2ri6MQPAx8yHJV8LfhqX1H
         +yW+G+4OHKHjpI3lNXRyLuyPCwgMPihmYQB/FQi2kjaCbbOic2fsNEGxmlHnRtocnJoH
         D+M1zffLNmoktuiDt4lRLxzzYK9djycQd39a9+b9vJOZIBsZIE2vJ3C3gomv86pMvwS7
         a5Sg==
X-Gm-Message-State: AOAM531um5UL0pR4oKhOlwZL9IMAd6N3oi29YPVQAd7GC+u51EgYTg24
	Y+T2g929dKQOKKreA/HxviaPrMzmYOG2D+VeSDvi
X-Google-Smtp-Source: ABdhPJyia2LU8ntg9wHEYBVDyF9z6NG9j6pHhTizw65dDXyTzXTaivZqrnEXy8IVl1NidEKyt31fzWWNjKo7sOWzeIU=
X-Received: by 2002:a05:6402:1691:: with SMTP id a17mr9901782edv.109.1639684833322;
 Thu, 16 Dec 2021 12:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211215211847.206208-1-morbo@google.com> <20211215232605.GJ16608@worktop.programming.kicks-ass.net>
In-Reply-To: <20211215232605.GJ16608@worktop.programming.kicks-ass.net>
From: Bill Wendling <morbo@google.com>
Date: Thu, 16 Dec 2021 12:00:21 -0800
Message-ID: <CAGG=3QUGmNRYOXYGKarULHwZxP6X=TNhcvbDKOFNMB4PQY23ag@mail.gmail.com>
Subject: Re: [PATCH] x86: use builtins to read eflags
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Juergen Gross <jgross@suse.com>, 
	Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

()On Wed, Dec 15, 2021 at 3:26 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Dec 15, 2021 at 01:18:47PM -0800, Bill Wendling wrote:
> > GCC and Clang both have builtins to read from and write to the
> > EFLAGS register. This allows the compiler to determine the best way
> > to generate the code, which can improve code generation.
>
> Only because clang is still brain-dead wrt "rm" constraints, right?
>
That's one reason. That needs to be addressed, but builtins are
usually better than using inline assembly.

> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> >  arch/x86/include/asm/irqflags.h | 24 +++++-------------------
> >  1 file changed, 5 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
> > index c5ce9845c999..574fb44b82f7 100644
> > --- a/arch/x86/include/asm/irqflags.h
> > +++ b/arch/x86/include/asm/irqflags.h
> > @@ -15,25 +15,11 @@
> >   * Interrupt control:
> >   */
> >
> > -/* Declaration required for gcc < 4.9 to prevent -Werror=missing-prototypes */
> > -extern inline unsigned long native_save_fl(void);
> > -extern __always_inline unsigned long native_save_fl(void)
> > -{
> > -     unsigned long flags;
> > -
> > -     /*
> > -      * "=rm" is safe here, because "pop" adjusts the stack before
> > -      * it evaluates its effective address -- this is part of the
> > -      * documented behavior of the "pop" instruction.
> > -      */
> > -     asm volatile("# __raw_save_flags\n\t"
> > -                  "pushf ; pop %0"
> > -                  : "=rm" (flags)
> > -                  : /* no input */
> > -                  : "memory");
> > -
> > -     return flags;
> > -}
> > +#ifdef CONFIG_X86_64
> > +#define native_save_fl()     __builtin_ia32_readeflags_u64()
> > +#else
> > +#define native_save_fl()     __builtin_ia32_readeflags_u32()
> > +#endif
>
> Also note the thing was extern inline, and there's actually an
> out-of-line symbol for them too. The out-of-line thing is explicitly
> using %rax due to paravirt muck.
>
> I'm thinking you wrecked that bit.

If you prefer, it could be written like so:

extern inline unsigned long native_save_fl(void);
extern __always_inline unsigned long native_save_fl(void)
{
#ifdef CONFIG_X86_64
    return __builtin_ia32_readeflags_u64();
#else
    return __builtin_ia32_readeflags_u32();
#endif
}

-bw
