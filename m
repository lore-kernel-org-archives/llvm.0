Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D0D2C81
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 18:57:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D72C6128A
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633460263;
	bh=akN3yRyYO6lO8xd97RV/0g3PB+QO3U2GWJQbnT2niOk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I0bDSIcdyMAIQuPXcY8Pb7yxH+9ZdyDK/viCfboKNPy+PR1HpgpQullbdBj2BvMd9
	 Rv8/oJ/mMeDeh9yETkR9az/64khEv0flg6YFwAXknBQV/R7f5tuO+1WY/j4IlXvrSt
	 QxSqGibGt9xpbWv31ksl/Zyiks2DBst21v6XP+Gx4cUcI5uc+MsFiEmGqy4AZaBoo4
	 ED/xUy4mDadFBbki0g2iVKQfZpphi4XOD06PdKsjfGJkqqVW9a7fG0F63qsdea+YoN
	 ggb+nquCNXqAY8A/JIvKZULfeyj3xCpn2Y6QQN7shz3Dei4X5G5+G9YHASuUPxAhER
	 QFWZH9a7sROgQ==
Received: by mail-ot1-f50.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so203080otj.2
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 11:57:43 -0700 (PDT)
X-Gm-Message-State: AOAM5332pt84r8vDEntjAkXFMxYOYr4aBJ3ziy2bNqIPiz4hlZGBLTAT
	DxY4PdSNUhAqD1xMyjBesZec8mka3kVkfZy0/60=
X-Google-Smtp-Source: ABdhPJzrzVPL2aP4gYe0xPiHK4HspyPr1/9PQhKdFlztv6Lb199bPhxfWZjOGSC7NZZ7nW3ojNVF0CLQkdfxzFuFxqc=
X-Received: by 2002:a05:6830:3189:: with SMTP id p9mr15711185ots.147.1633460262910;
 Tue, 05 Oct 2021 11:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211005071542.3127341-1-ardb@kernel.org> <20211005071542.3127341-9-ardb@kernel.org>
 <CAK8P3a3w+8iKqjhR0WgSVwP-kw7oCmUcOL6JKvDtMkpJu+jEeg@mail.gmail.com> <CAKwvOdmyxaPF1T0KXS9v=fp7fD7d=fDWjbzCKaEgHcW9h+D_9w@mail.gmail.com>
In-Reply-To: <CAKwvOdmyxaPF1T0KXS9v=fp7fD7d=fDWjbzCKaEgHcW9h+D_9w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 5 Oct 2021 20:57:31 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFn8PzV+6ytmG-fVFkTTwsP8DLOKONy66PNs4nAJu_pPg@mail.gmail.com>
Message-ID: <CAMj1kXFn8PzV+6ytmG-fVFkTTwsP8DLOKONy66PNs4nAJu_pPg@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] ARM: call_with_stack: add unwind support
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Kees Cook <keescook@chromium.org>, 
	Keith Packard <keithpac@amazon.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, 
	Kristof Beyls <Kristof.Beyls@arm.com>, Peter Smith <Peter.Smith@arm.com>, 
	Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Oct 2021 at 20:46, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Tue, Oct 5, 2021 at 5:22 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Oct 5, 2021 at 9:15 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > Restructure the code and add the unwind annotations so that both the
> > > frame pointer unwinder as well as the ELF unwind info based unwinder
> > > will be able to follow the call stack through call_with_stack().
> > >
> > > Note that the former cannot support GCC and Clang at the same time, as
> > > they use a different idiom for the prologue/epilogue. So the code uses
> > > the GCC idiom, adding full frame pointer based unwind support for GCC
> > > while preserving the existing behavior of the Clang version, which
> > > simply omits call_with_stack() from its call stack.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > I would like Nick to take a look at this for the clang support, he spent
> > some time on getting the frame pointer unwinder working with clang,
> > so he may have additional comments about this.
> >
> > > ---
> > >  arch/arm/lib/call_with_stack.S | 44 +++++++++++++++++---
> > >  1 file changed, 38 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/arch/arm/lib/call_with_stack.S b/arch/arm/lib/call_with_stack.S
> > > index 28b0341ae786..133dffa2404a 100644
> > > --- a/arch/arm/lib/call_with_stack.S
> > > +++ b/arch/arm/lib/call_with_stack.S
> > > @@ -8,25 +8,57 @@
> > >
> > >  #include <linux/linkage.h>
> > >  #include <asm/assembler.h>
> > > +#include <asm/unwind.h>
> > >
> > >  /*
> > >   * void call_with_stack(void (*fn)(void *), void *arg, void *sp)
> > >   *
> > >   * Change the stack to that pointed at by sp, then invoke fn(arg) with
> > >   * the new stack.
> > > + *
> > > + * The sequence below follows the APCS frame convention for frame pointer
> > > + * unwinding, and implements the unwinder annotations needed by the EABI
> > > + * unwinder.
> > > + */
> > > +
> > > +#if defined(CONFIG_THUMB2_KERNEL) || \
> > > +    (defined(CONFIG_UNWINDER_FRAME_POINTER) && defined(CONFIG_CC_IS_CLANG))
>
> Doesn't clang use r11 (fp) as the frame pointer in ARM mode?
> https://godbolt.org/z/1x4x99M1x
> Or is this what you meant by "So the best we can do here is not touch
> the frame pointer at all"?
>

Yes. Both unwinders expect to see the exact prologue that the
respective compiler generates, and there is no way we can do both at
the same time.

So by using r7 instead of r11, the call_with_stack() frame simply
disappears from the backtrace, which is unfortunate but not the end of
the world.

If someone wants to create a Clang clone of call_with_stack.S to work
around this, I wouldn't obje

> > > +/*
> > > + * Thumb-2 builds must use R7 as the frame pointer due to the way our unwind
> > > + * info based unwinder is constructed.
> > > + *
> > > + * The code below uses the GCC idiom for managing the frame pointer in the
> > > + * function prologue and epilogue, which Clang does not support. So the best we
>
> IIRC, it's only slightly different; it's just that FP points to the
> previous FP in clang, rather than LR; at a fixed offset. At least when
> looking through Doug's notes and diagrams:
>

GCC stores {fp, sp, lr, pc}, and makes FP point at PC. The fact that
they are only slightly different doesn't help - we either emit one or
the other, but we cannot do both.


 https://lore.kernel.org/lkml/20210507135509.1.I5d969beafa0d7507f1e37fadaa6e4d88d428253d@changeid/
> Though looking at the diagram, it looks like neither toolchain
> implements APCS...did I understand that correctly?
>
> There's also some documentation in
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/kernel/stacktrace.c#n11
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/lib/backtrace-clang.S#n31
>
> I guess I'm more so curious about this code when built with clang,
> both before and after this patch.  Was it broken for either unwinder
> on ARM or THUMB2+UNWINDER_ARM?  Does it regress with this patch?
> What's the best way to test/verify this?
>

Unwinding using unwind info as definitely broken, since there is no
way to track the SP change. Unwinding using frame pointers probably
worked, but call_switch_stack() itself would just not show up.
However, there are some heuristics in the frame pointer unwinder about
the next frame always being above the previous one, and so it also
depends on where the new stack lives in memory wrt to the old one.

The reason I am fixing this is so that the next patch doesn't result
in cases where we cannot tell from a backtrace where do_softirq() was
called from, which would be annoying.


> > > + * can do here is not touch the frame pointer at all: this will simply omit
> > > + * this frame when unwinding the call stack. So use R7 in this case as well,
> > > + * and leave R11 unmodified.
> > >   */
> > > +       fpreg   .req    r7
>
> TIL about `.req`: https://sourceware.org/binutils/docs/as/ARM-Directives.html
> This patch demonstrates the usage of quite a few of these!
>
> > > +#else
> > > +       fpreg   .req    fp
> > > +#endif
> > > +
> > >  ENTRY(call_with_stack)
> > > -       str     sp, [r2, #-4]!
> > > -       str     lr, [r2, #-4]!
> > > +UNWIND(        .fnstart                )
> > > +UNWIND(        .movsp  ip              )
> > > +       mov     ip, sp
> > > +
> > > +UNWIND(        .pad    #4              )
> > > +UNWIND(        .save   {fpreg, ip, lr} )
> > > +THUMB( sub     sp, #4          )
> > > +       push    {fpreg, ip, lr ARM(, pc)}
> > > +
> > > +UNWIND(        .setfp  fpreg, ip, #-4  )
> > > +       sub     fpreg, ip, #4
> > >
> > >         mov     sp, r2
> > >         mov     r2, r0
> > >         mov     r0, r1
> > >
> > > -       badr    lr, 1f
> > > -       ret     r2
> > > +       bl_r    r2
> > >
> > > -1:     ldr     lr, [sp]
> > > -       ldr     sp, [sp, #4]
> > > +       ldmdb   fpreg, {fpreg, ip, lr}
> > > +       mov     sp, ip
> > >         ret     lr
> > > +UNWIND(        .fnend                  )
> > >  ENDPROC(call_with_stack)
> > > --
> > > 2.30.2
> > >
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
