Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E1568
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 20:54:43 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso7568980otr.2
        for <llvm@lists.linux.dev>; Thu, 09 Dec 2021 12:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HFSacAT887PNCoxtm3wOxVaKJ2m3E3kQPyuB0zZo9cM=;
        b=fr59f5tnC4cszL5DgLtSi0UUz1Iy7+x5sh6vLQZl5Dboa3KS29zlWZOgqp2HUf7ZqG
         qZRtuXWGmvkIIINqZWj4Bg7sCiUYAUggieow6Ygd+26sJ82tEcSP/zqdNS+u+uTs/ObJ
         jlcaYjk6FuhNL1c1+6DejBa821NqM7C7vtZqmy4boDd6vN0E6gV7RComJxcWvM36bY3O
         3i90hAWILkRPoViOS6xaaq+gmMqrR25QksD2nFmstnVsuOpsz7XK8+kXFUTvT7WQ9YaT
         t7uB1pIU0A8BV6NtmPY6wE0KqAiDuCsIaFnZIN6uFNSbvIDwSEze9DKBRfopo1XaQ1Vm
         iD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HFSacAT887PNCoxtm3wOxVaKJ2m3E3kQPyuB0zZo9cM=;
        b=vIAGS5acbX2VIdjkKlYCL4PbT/RV/Jw20pzR4R7+zRnVl3S7kc8Uk5L06zSI/4W1I7
         cf0BCo9JNDi+M6wd8RPkNZpLzVIQNxu/QFupEik/gmYPmgZXwACwZRe7XQsaJFPe+AI6
         YY1GzY51zvsQVWzl0NS6Vgqenm/7+/FR7z7SuFhpkx4bMrmASG6ERR0xCEtHdRsRtVSC
         f441GyMVPHcraw3JfzdqOPrdBvWitRtZ8jFBd/XhLm4MEq5R1/MJMg1vElsPqbJ/BOcA
         8KUabZkA7M1Ye6ceAtrOD4+qrl2eJxFH++hfvTW+Q9alICNu2TJuj7IpIv8Eo3J5zf/4
         0gdA==
X-Gm-Message-State: AOAM533X3q49EUgNIawTV2cgy1d9orXiH6ce4bOXwYvb/dGo1DI5RwQh
	lk3i5iGiFB7GlXijf4szWt4Uo1pU1h3lUrtZaysCfg==
X-Google-Smtp-Source: ABdhPJx+jBbOy/MOlCU/G64fMr/tJptIk0krtWcyASmfxTgqjw/Ub5EF2E3yF1uwX3k6YK+w8LVDL6PDG5PxjGwivkQ=
X-Received: by 2002:a9d:7548:: with SMTP id b8mr7516429otl.92.1639083282784;
 Thu, 09 Dec 2021 12:54:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YbHTKUjEejZCLyhX@elver.google.com> <202112091232.51D0DE5535@keescook>
In-Reply-To: <202112091232.51D0DE5535@keescook>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Dec 2021 21:54:30 +0100
Message-ID: <CANpmjNPJpbKzO46APQgxeirYV=K5YwCw3yssnkMKXG2SGorUPw@mail.gmail.com>
Subject: Re: randomize_kstack: To init or not to init?
To: Kees Cook <keescook@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Potapenko <glider@google.com>, Jann Horn <jannh@google.com>, 
	Peter Collingbourne <pcc@google.com>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Dec 2021 at 21:48, Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Dec 09, 2021 at 10:58:01AM +0100, Marco Elver wrote:
> > Clang supports CONFIG_INIT_STACK_ALL_ZERO, which appears to be the
> > default since dcb7c0b9461c2, which is why this came on my radar. And
> > Clang also performs auto-init of allocas when auto-init is on
> > (https://reviews.llvm.org/D60548), with no way to skip. As far as I'm
> > aware, GCC 12's upcoming -ftrivial-auto-var-init= doesn't yet auto-init
> > allocas.
> >
> > add_random_kstack_offset() uses __builtin_alloca() to add a stack
> > offset. This means, when CONFIG_INIT_STACK_ALL_{ZERO,PATTERN} is
> > enabled, add_random_kstack_offset() will auto-init that unused portion
> > of the stack used to add an offset.
> >
> > There are several problems with this:
> >
> >       1. These offsets can be as large as 1023 bytes. Performing
> >          memset() on them isn't exactly cheap, and this is done on
> >          every syscall entry.
> >
> >       2. Architectures adding add_random_kstack_offset() to syscall
> >          entry implemented in C require them to be 'noinstr' (e.g. see
> >          x86 and s390). The potential problem here is that a call to
> >          memset may occur, which is not noinstr.
> >
> > A defconfig kernel with Clang 11 and CONFIG_VMLINUX_VALIDATION shows:
> >
> >  | vmlinux.o: warning: objtool: do_syscall_64()+0x9d: call to memset() leaves .noinstr.text section
> >  | vmlinux.o: warning: objtool: do_int80_syscall_32()+0xab: call to memset() leaves .noinstr.text section
> >  | vmlinux.o: warning: objtool: __do_fast_syscall_32()+0xe2: call to memset() leaves .noinstr.text section
> >  | vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section
> >
> > Switching to INIT_STACK_ALL_NONE resolves the warnings as expected.
> >
> > To figure out what the right solution is, the first thing to figure out
> > is, do we actually want that offset portion of the stack to be
> > auto-init'd?
> >
> > There are several options:
> >
> >       A. Make memset (and probably all other mem-transfer functions)
> >          noinstr compatible, if that is even possible. This only solves
> >          problem #2.
>
> I'd agree: "A" isn't going to work well here.
>
> >
> >       B. A workaround could be using a VLA with
> >          __attribute__((uninitialized)), but requires some restructuring
> >          to make sure the VLA remains in scope and other trickery to
> >          convince the compiler to not give up that stack space.
>
> I was hoping the existing trickery would work for a VLA, but it seems
> not. It'd be nice if it could work with a VLA, which could just gain the
> attribute and we'd be done.
>
> >       C. Introduce a new __builtin_alloca_uninitialized().
>
> Hrm, this means conditional logic between compilers, too. :(

And as Segher just pointed out, I think Clang has a "bug" because
explicit alloca() calls aren't "automatic storage". I think Clang
needs a new -mllvm param.

Because I think making #B work is quite ugly and also brittle. :-/
