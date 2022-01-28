Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A8129CA
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 19:23:15 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id p203so14150097oih.10
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 11:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FV7ijIEFX2KU+OD0295yjVLA5VTPNJCCnKWoIm2Gjp4=;
        b=iUhb6agjSx5jWLGzq34eJlbUvULhpyoMpZvDkEsoxstrF4eu/dpf+iBl1XU5kgk8aL
         IPkShYjKV81JID3tUiedmh883nQgZEokqG4xYr6we7aM7Qwy987TTfEcxqzTtgrWV01b
         3pd6vfxchYqCI4GEhVvGCaOytpoGXI7dJutuDIH2ut7l+FA5zBjn/N4vbdSqqrARDXzj
         lg8FV7l1TFsOXcPdPqmV7Y3v0SDO1DBe5wcw5tq5L2yOXPpv4M2+DLC+C8LEHBvRvFmA
         UiWEZMeuoMA6HFzPM8ZOxQxH2iqVX1YuXmonv3B4SUuRN0d/hB1njPXkv2+Zhd1Tx4tj
         Np9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FV7ijIEFX2KU+OD0295yjVLA5VTPNJCCnKWoIm2Gjp4=;
        b=AloySZGh3apNmacnmjbdzf69IbJOjAU/gwDxPqwF7jZhwm4+CKfYre6kKdllwdPanC
         i18FoDiBrYrn2niQEY9Eghht13YZT/TnRnnfVk7xoZ3BVQ6vVGUVxEduIj4wavky137o
         pLppBfHlO61But8BxHEk1uqfpeNIXiTWIjpgg99yDkIFCqPjJ1gkuwBvi/j3iwRK5xIh
         THwJ8Q9JdsNDuCp0d3qK41kVt8nlp5e4Hkph6yImgXNgkqUzaNX/1XAnEUXBNQ8lJHhF
         XjchmKHEBv7oWZC6Pd3uv0Exphxojpf1vNr+d59tl4BX8FdHxG73+7PtoT9qDWeJnOus
         yIKQ==
X-Gm-Message-State: AOAM530EHdHYB/vBkUD9HXZjbuRl7jmfXzumvVF6DZXeEBsJyemKYCCI
	LSS6GAXVOMJwFRo/KL2rtvs1r7SW/TsRiT2pEbZIBHX5YfY=
X-Google-Smtp-Source: ABdhPJx4KbdjBP/JlGZxxFynPzlG6BGWoGP9FURjIW3s4gYN+KMRGy0s5GJQzfCA6XqqYcNlRHgCMhNEuf2hknIeSys=
X-Received: by 2002:aca:2b16:: with SMTP id i22mr9759910oik.128.1643397794720;
 Fri, 28 Jan 2022 11:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220128114446.740575-1-elver@google.com> <20220128114446.740575-2-elver@google.com>
 <202201281058.83EC9565@keescook>
In-Reply-To: <202201281058.83EC9565@keescook>
From: Marco Elver <elver@google.com>
Date: Fri, 28 Jan 2022 20:23:02 +0100
Message-ID: <CANpmjNNaQ=06PfmPudBsLG7r9RsFXYo-NQR4CSM=iO11LFSHKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] stack: Constrain stack offset randomization with
 Clang builds
To: Kees Cook <keescook@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Jan 2022 at 20:10, Kees Cook <keescook@chromium.org> wrote:
[...]
> >       2. Architectures adding add_random_kstack_offset() to syscall
> >          entry implemented in C require them to be 'noinstr' (e.g. see
> >          x86 and s390). The potential problem here is that a call to
> >          memset may occur, which is not noinstr.
[...]
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -1163,6 +1163,7 @@ config RANDOMIZE_KSTACK_OFFSET
> >       bool "Support for randomizing kernel stack offset on syscall entry" if EXPERT
> >       default y
> >       depends on HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> > +     depends on INIT_STACK_NONE || !CC_IS_CLANG || CLANG_VERSION >= 140000
>
> This makes it _unavailable_ for folks with Clang < 14, which seems
> too strong, especially since it's run-time off by default. I'd prefer
> dropping this hunk and adding some language to the _DEFAULT help noting
> the specific performance impact on Clang < 14.

You're right, if it was only about performance. But there's the
correctness issue with ARCH_WANTS_NOINSTR architectures, where we
really shouldn't emit a call. In those cases, even if compiled in,
enabling the feature may cause trouble.

That's how this got on my radar in the first place (the objtool warnings).

So my proposal is to add another "|| !ARCH_WANTS_NO_INSTR", and add
the performance note to the help text for the !ARCH_WANTS_NO_INSTR
case if Clang < 14.

Is that reasonable?

Sadly both arm64 and x86 are ARCH_WANTS_NO_INSTR. :-/

> >       help
> >         The kernel stack offset can be randomized (after pt_regs) by
> >         roughly 5 bits of entropy, frustrating memory corruption
> > diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> > index 91f1b990a3c3..5c711d73ed10 100644
> > --- a/include/linux/randomize_kstack.h
> > +++ b/include/linux/randomize_kstack.h
> > @@ -17,8 +17,18 @@ DECLARE_PER_CPU(u32, kstack_offset);
> >   * alignment. Also, since this use is being explicitly masked to a max of
> >   * 10 bits, stack-clash style attacks are unlikely. For more details see
> >   * "VLAs" in Documentation/process/deprecated.rst
> > + *
> > + * The normal alloca() can be initialized with INIT_STACK_ALL. Initializing the
> > + * unused area on each syscall entry is expensive, and generating an implicit
> > + * call to memset() may also be problematic (such as in noinstr functions).
> > + * Therefore, if the compiler provides it, use the "uninitialized" variant.
>
> Can you include the note that GCC doesn't initialize its alloca()?

I'm guessing this won't change any time soon, so probably adding it in
the code comment is ok.

Thanks,
-- Marco
