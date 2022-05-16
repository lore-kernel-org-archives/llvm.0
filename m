Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A831361
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 17:15:37 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2fb9a85a124so157670917b3.13
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 10:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGf6wjrvSBA9+5luKWtA8S1TB1Ho/iykZkRoevKUR/M=;
        b=sG0LBzcw6X5gtPxGyrwzWMTlfNPOaO9928SvntnUZYb9/aTe8ETQvXR+oTGM+2Q01E
         FT27+UEachU8nZ1/6NE6iFT0H7w2Z3yA+Xt2mScQcVbGHTAWTIC7oC4Ow2OaFjZ9yRPC
         zsYacU5leVMUJP7q08JQQ5kO8v4LF8Y18NuJOV1FQrJzkb1Q6HVJDb2aR5qUZZ4fxb8L
         j83sHlqEvTkYQHwcihaYzN7Qej80njRn7ld+NLQm+PvbJhpZV4rhRz6XHZUrjQV7dE19
         0b1Wx+2l3Noy/e5cucVImILRyz95RaT9Ba/0fxbWcc15VZWfUSGKEh7MDJ5UgWmgO8Wm
         Fp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGf6wjrvSBA9+5luKWtA8S1TB1Ho/iykZkRoevKUR/M=;
        b=0blsiN5N/K+qzO1eUhXUU46yN/u+igdyENahHcEJ9aG+o/P4ymQ9v+xQL8P1zLXyKN
         HALMY07tVP4YCmaogRW+q71N1k4zEQ8M7wm34bIiXQTw12ekwN0nXegkHXG9Ifjssjgq
         fl5uiffjUcfWe53mKfou3s7MID6cd5NxCxL03FVuC33ZuVyr4MIUirgsQucNByz2XTpX
         BNQBvBkViAj1++DeXH9E1s7nJEwG+LByb7Cy3I12WvLx8uSn211D+Yuj3OL6jL7W7RWz
         uDmIyKI+0cm4vcsQoGfI1/2g0yqG1o4i2tFeB8C+O/zRLaAbUS17QANGYZGSogAR3Wul
         CemA==
X-Gm-Message-State: AOAM533vY71A1r30+b1tEZW0quBPs2voycioEdaNMjlFSAt7nIsXaf1t
	ZjdPJ2hZd+i9M7pF91gXggBRZOLSSJgHhQgj1S4PBg==
X-Google-Smtp-Source: ABdhPJwVJxOR6miZJ4+xQc2WHDZMKppmkvrGNnjVqxWGG/tKcoV/VdOV2r77ffndCOhGZP+04/DkGyU0orcJhTS4elU=
X-Received: by 2002:a0d:d747:0:b0:2ff:22b9:9281 with SMTP id
 z68-20020a0dd747000000b002ff22b99281mr186733ywd.305.1652721336717; Mon, 16
 May 2022 10:15:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-21-samitolvanen@google.com> <YoIfWENLV1AR2ijj@hirez.programming.kicks-ass.net>
In-Reply-To: <YoIfWENLV1AR2ijj@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 10:15:00 -0700
Message-ID: <CABCJKucXA2jbTc9TF1mLUsEDKu52t71tzxpnsGOXY3_ks+W4Bg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 20/21] x86: Add support for CONFIG_CFI_CLANG
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, May 16, 2022 at 2:54 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, May 13, 2022 at 01:21:58PM -0700, Sami Tolvanen wrote:
> > With CONFIG_CFI_CLANG, the compiler injects a type preamble
> > immediately before each function and a check to validate the target
> > function type before indirect calls:
> >
> >   ; type preamble
> >   __cfi_function:
> >     int3
> >     int3
> >     mov <id>, %eax
> >     int3
> >     int3
> >   function:
> >     ...
>
> When I enable CFI_CLANG and X86_KERNEL_IBT I get:
>
> 0000000000000c80 <__cfi_io_schedule_timeout>:
> c80:   cc                      int3
> c81:   cc                      int3
> c82:   b8 b5 b1 39 b3          mov    $0xb339b1b5,%eax
> c87:   cc                      int3
> c88:   cc                      int3
>
> 0000000000000c89 <io_schedule_timeout>:
> c89:   f3 0f 1e fa             endbr64
>
>
> That seems unfortunate. Would it be possible to get an additional
> compiler option to suppress the endbr for all symbols that get a __cfi_
> preaamble?

What's the concern with the endbr? Dropping it would currently break
the CFI+IBT combination on newer hardware, no?

> Also, perhaps s/CFI_CLANG/KERNEL_CFI/ or somesuch, so that GCC might
> also implement this same scheme (in time)?

I'm fine with renaming the config.

> >   ; indirect call check
> >     cmpl    <id>, -6(%r11)
> >     je      .Ltmp1
> >     ud2
> >   .Ltmp1:
> >     call    __x86_indirect_thunk_r11
>
> The first one I try and find looks like:
>
> 26:       41 81 7b fa a6 96 9e 38         cmpl   $0x389e96a6,-0x6(%r11)
> 2e:       74 02                   je     32 <__traceiter_sched_kthread_stop+0x29>
> 30:       0f 0b                   ud2
> 32:       4c 89 f6                mov    %r14,%rsi
> 35:       e8 00 00 00 00          call   3a <__traceiter_sched_kthread_stop+0x31> 36: R_X86_64_PLT32      __x86_indirect_thunk_r11-0x4
>
> This must not be. If I'm to rewrite that lot to:
>
>   movl  $\hash, %r10d
>   sub   $9, %r11
>   call  *%r11
>   .nop  4
>
> Then there must not be spurious instruction in between the ud2 and the
> indirect call/retpoline thing.

With the current compiler patch, LLVM sets up function arguments after
the CFI check. if it's a problem, we can look into changing that.

Sami
