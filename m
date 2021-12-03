Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACF768
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 16:07:33 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id x32so10604077ybi.12
        for <llvm@lists.linux.dev>; Fri, 03 Dec 2021 08:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UGM7UBMu9hpWc2CpdHHwIO9PerlU890k24SrZiue448=;
        b=N6sEXlj+o/uYovaKtOnHtS3iWp++ez1sdPFxvq0U0x9CPrKqNF7G4GyZWnRb6RC4LS
         9daz1H/B9g2ugXoyyaijPGsjG90NK7HyHk10gzvQqhr6iv7iNhKOgjsP525OQ8z9DUZG
         WiZ/B+Vx7/U7w41cTwM+S2POYpDeKa7VE1SEWKYiFQe38hFqoNgHlIAT1z2mWjOfmBZa
         vDBnG4UXNGjtmZ2ou4KpRRzEkBUKhskIdVy0XuDvz+fUJbqAN7zexWcKgqLLQ6ru1b/x
         bFf+QMKN2NEN+U/OlR8pThIz6diqVCR5DLt9E5J7nUNrvH1GfPURXqp2uIqEVyuecIRy
         XIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UGM7UBMu9hpWc2CpdHHwIO9PerlU890k24SrZiue448=;
        b=jhaPa3WcjOnCLbOYo3J/uAdXLiBiq2CKdH5RDNcQonNxs8GCDbmNVoXAyEIaIqxmVz
         NnFwY5ONv7MKWQwDU4/Ga4qv/qvdzcG5FU4qLj/mSLsEpK3KJVIxaKr5YxvUAkz45bu0
         3YokslpJkBMI8rlKJnP+vequxZrvY2tOKrzhNLC5xo7N1Igx4HTDFq3gNJ4CmAn/9v6w
         vcJy+ZnrG1fY93E0MnV1dR2xjcHJjI1AQaeiRNii7TmdOjvmnB+I95A4TSsGcmD2kb4o
         Z9Y6ZA1gnOt55Q+lpC1qlMfIZlxSIPpir9piJb/7fvpZdEy81k9WUGvq4aSgKWwTnAB4
         ADOQ==
X-Gm-Message-State: AOAM53144JgsWrxSkyjIB6CzIuwbJ/ON/4deEYryhTjsoiQ5HtW7p0ey
	F2ClM2XHHmZ6+zaYKXB1xY+QVwOr9gO2ViohNu3fwQ==
X-Google-Smtp-Source: ABdhPJz6uNB4YJ0bQ7FWsAHlz+kuVJK0fVf6C9Ze629WR8+BmMgjr0LuKxp936uRsYd0I+7nFLi7jwf2FGYnWLmARdU=
X-Received: by 2002:a25:b204:: with SMTP id i4mr23135408ybj.263.1638547651747;
 Fri, 03 Dec 2021 08:07:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211203052908.7467-1-ben.dai@unisoc.com> <Yan7nD6U1I0m5uKY@FVFF77S0Q05N>
In-Reply-To: <Yan7nD6U1I0m5uKY@FVFF77S0Q05N>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 3 Dec 2021 08:07:20 -0800
Message-ID: <CABCJKuf__Lm7eJN8FqRRs1Ax3guX_WpD66Hahs5zzmSo5bbe7Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: fix the address of syscall in arch_syscall_addr if
 CFI is enabled
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ben Dai <ben.dai9703@gmail.com>, ndesaulniers@google.com, rostedt@goodmis.org, 
	mingo@redhat.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Ben Dai <ben.dai@unisoc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Peter Zijlstra <peter.zijlstra@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 3:12 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi Ben,
>
> Please Cc the arm64 maintainers for arm64 patches, you can find the relevant
> folk in the MAINTAINERS file, and you can use the get_maintainer.pl script to
> find them automatically (e.g. with `./scripts/get_maintainer.pl ${PATCH}` or
> `./scripts/get_maintainer.pl -f ${FILE}`).
>
> For arm64 patches, you should also see LAKML
> (linux-arm-kernel@lists.infradead.org).
>
> I've added Will and Catalin now, and Ard and Peter too since they've btoh been
> fighting with things in this area.
>
> On Fri, Dec 03, 2021 at 01:29:08PM +0800, Ben Dai wrote:
> > With CONFIG_CFI_CLANG, the addresses in sys_call_table[] actually point to
> > jump instructions like "b __arm64_sys_*", and if CONFIG_LTO_CLANG_FULL is
> > enabled, the compiler will not generate a symbol for each jump. It causes
> > syscall tracer can't get symbol name in find_syscall_meta() and fail to
> > initialize.
> >
> > To fix this problem, implement an strong definition of arch_syscall_addr()
> > to get the actual addresses of system calls.
> >
> > Signed-off-by: Ben Dai <ben.dai@unisoc.com>

I don't think this is the correct solution. I believe Nick fixed the
issue with missing symbols in https://reviews.llvm.org/D107934, so we
should probably just require a newer compiler version here.

> > ---
> >  arch/arm64/kernel/syscall.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
> > index 50a0f1a38e84..2b911603966b 100644
> > --- a/arch/arm64/kernel/syscall.c
> > +++ b/arch/arm64/kernel/syscall.c
> > @@ -12,6 +12,8 @@
> >  #include <asm/debug-monitors.h>
> >  #include <asm/exception.h>
> >  #include <asm/fpsimd.h>
> > +#include <asm/insn.h>
> > +#include <asm/patching.h>
> >  #include <asm/syscall.h>
> >  #include <asm/thread_info.h>
> >  #include <asm/unistd.h>
> > @@ -19,6 +21,25 @@
> >  long compat_arm_syscall(struct pt_regs *regs, int scno);
> >  long sys_ni_syscall(void);
> >
> > +#ifdef CONFIG_CFI_CLANG
> > +unsigned long __init arch_syscall_addr(int nr)
> > +{
> > +     u32 insn;
> > +     unsigned long addr = (unsigned long)sys_call_table[nr];
> > +
> > +     /*
> > +      * Clang's CFI will replace the address of each system call function
> > +      * with the address of a jump table entry. In this case, the jump
> > +      * target address is the actual address of the system call.
> > +      */
> > +     aarch64_insn_read((void *)addr, &insn);
> > +     if (likely(aarch64_insn_is_b(insn)))
> > +             addr += aarch64_get_branch_offset(insn);
>
> The problemn is not your fault, but I absolutely hate this, because we're
> bodging around the compiler having broken stuff for us in the first place.
> We've been encountering more of these cases over time, and had we been aware of
> them to begin with we'd have strongly pushed back on marging the CFI patches
> until the compiler offered a better solution.
>
> My view is that the current clang CFI scheme is broken by design here, and we
> should mark tracing as incompatible with it for now, and work with the compiler
> folk to get a scheme that actually works, rather than trying to bodge around
> it.

We are actively fixing compiler issues when they're discovered. In the
meanwhile, Android uses both CFI and tracing without any major issues,
so I don't see why we should mark the combination broken.

Sami
