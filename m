Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00E68
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 21:40:55 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso7661273ots.6
        for <llvm@lists.linux.dev>; Thu, 09 Dec 2021 13:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2j4bcO0qWcjtdm6gaythjKIq7TrKLkjf4762fiQLRQ0=;
        b=n+iW5W03vOmikDQVZSWQcgPuAXsqlpYitFH3tqr1et/5xDWgIOK9kThPpB4jjcss7O
         ZjKxF3TDq3+qYgAR34dCu9tp7H29+MEY+CKVOT8Cu5nSalC9nry4JRVeQwtb5mFMGxx4
         0Lrq7s1aA6kfllDO2MYNWDOxtPlfeKSyCNjCmjQQkbinkKepobynjZB6jMFVB7zRu+PI
         HA3tTIceGbVxrBdplywneV5MEcGEf9V9+aUNX+klezWgHY8yJV2RfQRBLEAWhP+53zaZ
         SZWl51lhczQ6oKPPd3mHs3KDTspweD+IxPTjc8DLzr1bJEU5iEfGredzBeBHFOV6jMAc
         Bxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2j4bcO0qWcjtdm6gaythjKIq7TrKLkjf4762fiQLRQ0=;
        b=isu8NGr9TBrC03Ti+jCc3dfB7K2nIiWni89rmdCDpmh0eup4JZandDmJqCxl8cmHo6
         Ld/xDjRLGxtamGM0KQ+ynXe2hsVDB86kirEKwRToa6dHI8ouIde6Y8z3+uWHOM5WxKId
         e259kdYbD6kgXieAvNO7QadY3divYmn8smRXR+qhjH6ZzOPVv8QCbtyWpqBr6a/e6wwj
         V/p/81aST2SypRMfgi5ILmnvfobu0SWh5ZjeQRBSGaPiT3TuoSzUlVz5DQKMoxcNGcKx
         dh5bCS2q0xwN8H6rxW58TgNacbpcanJfb9oZe1Fh5/KrFt4M4gm+/BE9W3aKMm+NqsaX
         GctQ==
X-Gm-Message-State: AOAM533bt8T+AU42LTfdq3Dh7UqdH/pg2LmMQ/D/9JCb6ffa3mwCDBUg
	67iMbsj85EVqdkfDOM4away5wR1YpcXShFp84x9sIg==
X-Google-Smtp-Source: ABdhPJwpwysTautUApz45OTaJShVoj3kfQ/D0iI37xiT5amNXd6UQf69KpysDtdv3QZosj8cf/QWH8aL9M87PP25N+M=
X-Received: by 2002:a9d:7548:: with SMTP id b8mr7757039otl.92.1639086054434;
 Thu, 09 Dec 2021 13:40:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YbHTKUjEejZCLyhX@elver.google.com> <CAG48ez0dZwigkLHVWvNS6Cg-7bL4GoCMULyQzWteUv4zZ=OnWQ@mail.gmail.com>
In-Reply-To: <CAG48ez0dZwigkLHVWvNS6Cg-7bL4GoCMULyQzWteUv4zZ=OnWQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Dec 2021 22:40:42 +0100
Message-ID: <CANpmjNOA2BKJfPAFH56etdQ70hsoPFb_VJizipKdJMgEgf3jTg@mail.gmail.com>
Subject: Re: randomize_kstack: To init or not to init?
To: Jann Horn <jannh@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Alexander Potapenko <glider@google.com>, 
	Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Collingbourne <pcc@google.com>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Dec 2021 at 22:16, Jann Horn <jannh@google.com> wrote:
>
> On Thu, Dec 9, 2021 at 10:58 AM Marco Elver <elver@google.com> wrote:
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
> >         1. These offsets can be as large as 1023 bytes. Performing
> >            memset() on them isn't exactly cheap, and this is done on
> >            every syscall entry.
> >
> >         2. Architectures adding add_random_kstack_offset() to syscall
> >            entry implemented in C require them to be 'noinstr' (e.g. see
> >            x86 and s390). The potential problem here is that a call to
> >            memset may occur, which is not noinstr.
>
> This doesn't just affect alloca(), right? According to godbolt.org
> (https://godbolt.org/z/jYrWEx7o8):
>
> void bar(char *p);
> void foo() {
>   char arr[512];
>   bar(arr);
> }
>
> when compiled with "-ftrivial-auto-var-init=pattern -O2 -mno-sse"
> gives this result:
>
> foo:                                    # @foo
>         push    rbx
>         sub     rsp, 512
>         mov     rbx, rsp
>         mov     edx, 512
>         mov     rdi, rbx
>         mov     esi, 170
>         call    memset@PLT
>         mov     rdi, rbx
>         call    bar
>         add     rsp, 512
>         pop     rbx
>         ret
>
> So I think to fix this properly in a way that doesn't conflict with
> noinstr validation, I think you'll have to add a compiler flag that
> lets you specify a noinstr-safe replacement for memset() that should
> be used here?

Yeah, this story isn't over with __builtin_alloca().

A workaround would be to use __attribute__((uninitialized)). Of course
that implies there are no uninit bugs. ;-)
To initialize in noinstr, __memset can be used explicitly.

Maybe there's some guidance on what is and what isn't ok in noinstr
code so we can actually decide what is the right thing to do. I found
this: https://lore.kernel.org/all/878rx5b7i5.ffs@tglx/

Thanks,
-- Marco
