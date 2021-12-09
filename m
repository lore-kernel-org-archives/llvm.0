Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9E968
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 21:11:58 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id b67so6066851qkg.6
        for <llvm@lists.linux.dev>; Thu, 09 Dec 2021 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f39DFnoj8lua8eJKcrSxpR3sJ0r+3/YfBmxC1RnRv7o=;
        b=HD6w//AO6uml4ld5E8Xhkso1YCkTqbGrrybkpcBPHs6LFvdrib5ZYvWcDCzMiUEwzk
         //CJr092ZQp5EAYBkCrwppQ33u6E8LVQ0baAIi5waPox0vU8qeFa21yTI/Pim0vMyEmc
         KVekMMbMbogCwa6cbpO8l4rh9NbXXZu4oPECjAVBaxNxRjMRZzVX/hC4/IS57cJfxnKN
         qYcvtHs8mOFLAvjLqdkbG+oyXNHSAwXLiYCrRNOTOIKMdfVuj2kjttoo5/V5HMimc5cM
         9fBb0y35KpUoOnbkrp6D2GUrErAMzJIUAIiKxwOJeZTKtP4H4aOedeWtjoXZ1WUoR+NL
         EJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f39DFnoj8lua8eJKcrSxpR3sJ0r+3/YfBmxC1RnRv7o=;
        b=NBYCq0/XXRlxp8exkKj2xf+zYI+ABuy9+8oa3AhSkUYmUavL8H4kHR26yJ+1I7+Y+G
         2n1lK6Ac8JQZeT9ZTAg3mKqaGJGTDVF2xo6WgDRYIPTZY09HC861XqijbLNZrNsaV4VB
         tyBswUP0U0apq3lLYnuxySRLt8wInZzBKlpm5LgDsCujWk049ODZqP03MXWCLF7RKKvZ
         0iLCUF8PobWjgcb/4RdVKlvUL5tdhm3osugu4cjdyJgvnooYn/Rg80iP/Iwu9HFQeCox
         qgL3KndXiMwcycecdW9eRGzmZBNmqAzcK1QXV1ViABEUlVEKejRfby4m/UdBF3awiKSS
         k0uw==
X-Gm-Message-State: AOAM533VJsS0vdEwDLKvHAKlXLxtWNlBzzOZkFHDR5W2RXLzhFvQHV7N
	Aoe/S5WnzVShgH7e6I1LJbzbps26snhreY11UjG4GA==
X-Google-Smtp-Source: ABdhPJxYDMrJsQkvRbmr7z1OOg+Etw1M5Jk+XurqStbkPbcRURo8sMHswotQg+nY0pRSzQohcu40qMjmBuof5M57B04=
X-Received: by 2002:a05:620a:2848:: with SMTP id h8mr16571622qkp.610.1639084317071;
 Thu, 09 Dec 2021 13:11:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YbHTKUjEejZCLyhX@elver.google.com> <202112091232.51D0DE5535@keescook>
 <CANpmjNPJpbKzO46APQgxeirYV=K5YwCw3yssnkMKXG2SGorUPw@mail.gmail.com>
In-Reply-To: <CANpmjNPJpbKzO46APQgxeirYV=K5YwCw3yssnkMKXG2SGorUPw@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 9 Dec 2021 22:11:19 +0100
Message-ID: <CAG_fn=WEOb_3_u3CrAG36=j_moeHu0hmFmqM+sXSTepnN8kLjw@mail.gmail.com>
Subject: Re: randomize_kstack: To init or not to init?
To: Marco Elver <elver@google.com>, segher@kernel.crashing.org
Cc: Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
	Peter Collingbourne <pcc@google.com>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2021 at 9:54 PM Marco Elver <elver@google.com> wrote:
>
> On Thu, 9 Dec 2021 at 21:48, Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Dec 09, 2021 at 10:58:01AM +0100, Marco Elver wrote:
> > > Clang supports CONFIG_INIT_STACK_ALL_ZERO, which appears to be the
> > > default since dcb7c0b9461c2, which is why this came on my radar. And
> > > Clang also performs auto-init of allocas when auto-init is on
> > > (https://reviews.llvm.org/D60548), with no way to skip. As far as I'm
> > > aware, GCC 12's upcoming -ftrivial-auto-var-init=3D doesn't yet auto-=
init
> > > allocas.
> > >
> > > add_random_kstack_offset() uses __builtin_alloca() to add a stack
> > > offset. This means, when CONFIG_INIT_STACK_ALL_{ZERO,PATTERN} is
> > > enabled, add_random_kstack_offset() will auto-init that unused portio=
n
> > > of the stack used to add an offset.
> > >
> > > There are several problems with this:
> > >
> > >       1. These offsets can be as large as 1023 bytes. Performing
> > >          memset() on them isn't exactly cheap, and this is done on
> > >          every syscall entry.
> > >
> > >       2. Architectures adding add_random_kstack_offset() to syscall
> > >          entry implemented in C require them to be 'noinstr' (e.g. se=
e
> > >          x86 and s390). The potential problem here is that a call to
> > >          memset may occur, which is not noinstr.
> > >
> > > A defconfig kernel with Clang 11 and CONFIG_VMLINUX_VALIDATION shows:
> > >
> > >  | vmlinux.o: warning: objtool: do_syscall_64()+0x9d: call to memset(=
) leaves .noinstr.text section
> > >  | vmlinux.o: warning: objtool: do_int80_syscall_32()+0xab: call to m=
emset() leaves .noinstr.text section
> > >  | vmlinux.o: warning: objtool: __do_fast_syscall_32()+0xe2: call to =
memset() leaves .noinstr.text section
> > >  | vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset=
() leaves .noinstr.text section
> > >
> > > Switching to INIT_STACK_ALL_NONE resolves the warnings as expected.
> > >
> > > To figure out what the right solution is, the first thing to figure o=
ut
> > > is, do we actually want that offset portion of the stack to be
> > > auto-init'd?
> > >
> > > There are several options:
> > >
> > >       A. Make memset (and probably all other mem-transfer functions)
> > >          noinstr compatible, if that is even possible. This only solv=
es
> > >          problem #2.
> >
> > I'd agree: "A" isn't going to work well here.
> >
> > >
> > >       B. A workaround could be using a VLA with
> > >          __attribute__((uninitialized)), but requires some restructur=
ing
> > >          to make sure the VLA remains in scope and other trickery to
> > >          convince the compiler to not give up that stack space.
> >
> > I was hoping the existing trickery would work for a VLA, but it seems
> > not. It'd be nice if it could work with a VLA, which could just gain th=
e
> > attribute and we'd be done.
> >
> > >       C. Introduce a new __builtin_alloca_uninitialized().
> >
> > Hrm, this means conditional logic between compilers, too. :(
>
> And as Segher just pointed out, I think Clang has a "bug" because
> explicit alloca() calls aren't "automatic storage". I think Clang
> needs a new -mllvm param.

I don't think the original Clang flag was built with just "automatic
storage" in mind.
After all, people do forget to initialize their variables, regardless
of whether they are automatic stack variables, or malloc() or alloca()
allocations.

If __builtin_alloca() wasn't banned in the kernel, we'd probably want
it to return initialized memory, because otherwise people would be
making the same mistakes using it.
Now that there's a single call to __builtin_alloca() that happens to
suffer from initialization, it is hard to justify that initializing
allocas is a good thing to do.
But I believe developers in other projects don't want to worry about
how they allocate their memory when turning stack initialization on -
they just want to be on the safe side.

> Because I think making #B work is quite ugly and also brittle. :-/



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
