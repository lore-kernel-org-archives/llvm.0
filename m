Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574F2C81
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 18:46:26 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id n8so33444268lfk.6
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qf+/7GYH/dqOlHqnzDC/mgzV3VbMflJSRveOpjDB3zg=;
        b=Jmqni0t67qo2EyzLak8p/Xd7/W3FTlAG8Xv32cjSGJYesi/uT7xScK8vznf6VqlatO
         gTvfUE5V7q7+rN6QOaTfo1UlJxgM51Zgd2ry8jXoDUWtntkkChAHHa+uobvSaPNgz8Nr
         Be3XW/YSkmb7D2qsU/5bDmW53p6v6zzCklMhDrrzyV5NQNi20OsbQLl9ssany/FRB7NA
         IrIXqrb6zsFp5T8W+9HeSNx6nwkGbT62v69PDALokAb9P4NvuzH5qu4Sk0LSFeXmLYfD
         ELuaGgBsP86U9p3VgxJ8RfuP5+A0qUxkcLpuAe3QFAMO3ChtLccJeSnhn614zfSL2arZ
         gImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qf+/7GYH/dqOlHqnzDC/mgzV3VbMflJSRveOpjDB3zg=;
        b=ETgZFXwgJm32PCCEm6auHo9sUmWZ5ol0N5lGmZzcG3VCv2swr7WNZA1fnzJw4HG81R
         APhU2IGni9lpT5mdGKoNPW8/6HxBIubQruxj/x7KomMRyrvy2ofZ06ouVbUzk9UfFsO0
         5v7GHcn7tD7DBmthCwvjoasVURXoj7UhJIcYS3T5PUdzxAJCll1oqd68rWlVabq3YMqt
         bHlNw9x9YLsEJP4xwhbpzkE/gy5xRv6OEnBYFIOSP6QH2mbk3STp66mZekTZBsLu6oxA
         7iBYIkvDyRlfkXDmnpVGSLeFnG5jvKt3GeXYT/l2LiZHt1/MG24OqvqxpSl92f5umfzT
         2TKg==
X-Gm-Message-State: AOAM5330jELxcCj+cwwb2o3K2QCfy/tUt+XGGLqS1nHwqVzXi/iaE7pm
	4Efg/gFMIZRihZtVCU5sqDmKbmKruY0gppRwNwvtQg==
X-Google-Smtp-Source: ABdhPJwabTCgkZTi237RlyW1jbXSqRaPJ/isOYZ1P2x1cE77kcNp5TY0M5OmSTc8TeV3br+QPOy3+JFM7YsJJi67pKA=
X-Received: by 2002:a2e:5059:: with SMTP id v25mr23433781ljd.128.1633459584225;
 Tue, 05 Oct 2021 11:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211005071542.3127341-1-ardb@kernel.org> <20211005071542.3127341-9-ardb@kernel.org>
 <CAK8P3a3w+8iKqjhR0WgSVwP-kw7oCmUcOL6JKvDtMkpJu+jEeg@mail.gmail.com>
In-Reply-To: <CAK8P3a3w+8iKqjhR0WgSVwP-kw7oCmUcOL6JKvDtMkpJu+jEeg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Oct 2021 11:46:12 -0700
Message-ID: <CAKwvOdmyxaPF1T0KXS9v=fp7fD7d=fDWjbzCKaEgHcW9h+D_9w@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] ARM: call_with_stack: add unwind support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Kees Cook <keescook@chromium.org>, 
	Keith Packard <keithpac@amazon.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, 
	Kristof Beyls <Kristof.Beyls@arm.com>, Peter Smith <Peter.Smith@arm.com>, 
	Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 5, 2021 at 5:22 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Oct 5, 2021 at 9:15 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > Restructure the code and add the unwind annotations so that both the
> > frame pointer unwinder as well as the ELF unwind info based unwinder
> > will be able to follow the call stack through call_with_stack().
> >
> > Note that the former cannot support GCC and Clang at the same time, as
> > they use a different idiom for the prologue/epilogue. So the code uses
> > the GCC idiom, adding full frame pointer based unwind support for GCC
> > while preserving the existing behavior of the Clang version, which
> > simply omits call_with_stack() from its call stack.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> I would like Nick to take a look at this for the clang support, he spent
> some time on getting the frame pointer unwinder working with clang,
> so he may have additional comments about this.
>
> > ---
> >  arch/arm/lib/call_with_stack.S | 44 +++++++++++++++++---
> >  1 file changed, 38 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/lib/call_with_stack.S b/arch/arm/lib/call_with_stack.S
> > index 28b0341ae786..133dffa2404a 100644
> > --- a/arch/arm/lib/call_with_stack.S
> > +++ b/arch/arm/lib/call_with_stack.S
> > @@ -8,25 +8,57 @@
> >
> >  #include <linux/linkage.h>
> >  #include <asm/assembler.h>
> > +#include <asm/unwind.h>
> >
> >  /*
> >   * void call_with_stack(void (*fn)(void *), void *arg, void *sp)
> >   *
> >   * Change the stack to that pointed at by sp, then invoke fn(arg) with
> >   * the new stack.
> > + *
> > + * The sequence below follows the APCS frame convention for frame pointer
> > + * unwinding, and implements the unwinder annotations needed by the EABI
> > + * unwinder.
> > + */
> > +
> > +#if defined(CONFIG_THUMB2_KERNEL) || \
> > +    (defined(CONFIG_UNWINDER_FRAME_POINTER) && defined(CONFIG_CC_IS_CLANG))

Doesn't clang use r11 (fp) as the frame pointer in ARM mode?
https://godbolt.org/z/1x4x99M1x
Or is this what you meant by "So the best we can do here is not touch
the frame pointer at all"?

> > +/*
> > + * Thumb-2 builds must use R7 as the frame pointer due to the way our unwind
> > + * info based unwinder is constructed.
> > + *
> > + * The code below uses the GCC idiom for managing the frame pointer in the
> > + * function prologue and epilogue, which Clang does not support. So the best we

IIRC, it's only slightly different; it's just that FP points to the
previous FP in clang, rather than LR; at a fixed offset. At least when
looking through Doug's notes and diagrams:
https://lore.kernel.org/lkml/20210507135509.1.I5d969beafa0d7507f1e37fadaa6e4d88d428253d@changeid/
Though looking at the diagram, it looks like neither toolchain
implements APCS...did I understand that correctly?

There's also some documentation in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/kernel/stacktrace.c#n11
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/lib/backtrace-clang.S#n31

I guess I'm more so curious about this code when built with clang,
both before and after this patch.  Was it broken for either unwinder
on ARM or THUMB2+UNWINDER_ARM?  Does it regress with this patch?
What's the best way to test/verify this?

> > + * can do here is not touch the frame pointer at all: this will simply omit
> > + * this frame when unwinding the call stack. So use R7 in this case as well,
> > + * and leave R11 unmodified.
> >   */
> > +       fpreg   .req    r7

TIL about `.req`: https://sourceware.org/binutils/docs/as/ARM-Directives.html
This patch demonstrates the usage of quite a few of these!

> > +#else
> > +       fpreg   .req    fp
> > +#endif
> > +
> >  ENTRY(call_with_stack)
> > -       str     sp, [r2, #-4]!
> > -       str     lr, [r2, #-4]!
> > +UNWIND(        .fnstart                )
> > +UNWIND(        .movsp  ip              )
> > +       mov     ip, sp
> > +
> > +UNWIND(        .pad    #4              )
> > +UNWIND(        .save   {fpreg, ip, lr} )
> > +THUMB( sub     sp, #4          )
> > +       push    {fpreg, ip, lr ARM(, pc)}
> > +
> > +UNWIND(        .setfp  fpreg, ip, #-4  )
> > +       sub     fpreg, ip, #4
> >
> >         mov     sp, r2
> >         mov     r2, r0
> >         mov     r0, r1
> >
> > -       badr    lr, 1f
> > -       ret     r2
> > +       bl_r    r2
> >
> > -1:     ldr     lr, [sp]
> > -       ldr     sp, [sp, #4]
> > +       ldmdb   fpreg, {fpreg, ip, lr}
> > +       mov     sp, ip
> >         ret     lr
> > +UNWIND(        .fnend                  )
> >  ENDPROC(call_with_stack)
> > --
> > 2.30.2
> >



-- 
Thanks,
~Nick Desaulniers
