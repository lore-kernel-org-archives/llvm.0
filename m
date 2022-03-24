Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253DF23A8
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 18:44:00 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id a26so9565076lfg.10
        for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 11:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SznxYBgLW8a9K7icQkkxQQQmB0jHpEaS7kU5FK71pvk=;
        b=o1CBG1mV9f11VgVz8ncx5nABm/hLQ3k8i/0qeF0Uo54MRY/r3LgqhW0aB1kPPBLT93
         NHuxranzAV3snmi0zRL6EODctyu1eX8FR7Bs3vozkJ68YqknD0ynKjIv0U6hP3WzigrA
         UcYcxgzpqAAXsQMzLCKhbOWq8b81lA5AvsBzBSLnuaf2YfpiTN3/Z9ZH9zo3QvwnzWzd
         0rZAndMjtXG2gP2Vd03Lc19VxyCedjyPLmwP+JRePcOCZ/3fiS6lqAfzaL5mg7y/sVwq
         xOhdwXUjYroWCkN3jxlKokj/lnrpwg4ikYyqc6YYQpolPdCUbiQ1KSvyImkCKv2J0nLD
         oZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SznxYBgLW8a9K7icQkkxQQQmB0jHpEaS7kU5FK71pvk=;
        b=txQ0ybZg3V2mikozjnpzfjc7B8eqXREF8UuxMxw+k3kRqdmZ2Wf3/1wd25/kLemSaT
         5Ljds0jNLp7zSi9qC20qxyb2yk5Hhr5o2iLrPqMcfxl/j2fEjjJy2fS/WmqVyBg+NboW
         5bja6Tuj8UijtKVPYd9CMnB83DOWTLVtDGPsJ20uXhfnSm9PNkW5l3Sf/liYYmd2ApAc
         XQSQ+2skKe0ppg/HFOpZsMEqgCPYVjCnv4F0vs2C1kxHTqSyf26ooLfkIrRlQEpNohea
         HkuMyE6Q8SWO68wZq1p1S2gOoKigIJBwdF3aXhUxaixlZclzbuuCpucav0vlgkjmv1gi
         KW+g==
X-Gm-Message-State: AOAM532Wb2Af5alYypw1FoK8xeWpd8XPkikhjmRzIhS7e6veIaPK5ay4
	azwEi2akZiUg/mzX+75KtZLUBFblPqhuQ2HwPhyYmQ==
X-Google-Smtp-Source: ABdhPJwl3FHsimV0j/FRMLTa7TeQyLJcX+GDFnUBHAD06jNi3NvA8VGj1za3NlGgQUwdcOY+DkcOQpXusFJ+tjIVSJc=
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr4747266lfd.190.1648147437941; Thu, 24
 Mar 2022 11:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YjxTt3pFIcV3lt8I@zn.tnic>
In-Reply-To: <YjxTt3pFIcV3lt8I@zn.tnic>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 24 Mar 2022 11:43:46 -0700
Message-ID: <CAKwvOdkw0Bbm+=ZyViXQhBE1L6uSbvkstHJuHpQ21tzJRftgAw@mail.gmail.com>
Subject: Re: clang memcpy calls
To: Borislav Petkov <bp@alien8.de>
Cc: Nathan Chancellor <nathan@kernel.org>, x86-ml <x86@kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 24, 2022 at 4:19 AM Borislav Petkov <bp@alien8.de> wrote:
>
> Hi folks,
>
> so I've been looking at a recent objtool noinstr warning from clang
> builds:
>
> vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves .noinstr.text section
>
> The issue is that clang generates a memcpy() call when a struct copy
> happens:
>
>         if (regs != eregs)
>                 *regs = *eregs;

Specifically, this is copying one struct pt_regs to another. It looks
like the sizeof struct pt_regs is just large enough to have clang emit
the libcall.
https://godbolt.org/z/scx6aa8jq
Otherwise clang will also use rep; movsq; when -mno-sse -O2 is set and
the structs are below ARBITRARY_THRESHOLD.  Should ARBITRARY_THRESHOLD
be raised so that we continue to inline the memcpy? *shrug*

Though, looking at the compiled memcpy (`llvm-objdump -D
--disassemble-symbols=memcpy vmlinux`), maybe we *should* try harder.
Filed
https://github.com/llvm/llvm-project/issues/54535.

>
> see below for asm output.
>
> While gcc does simply generate an actual "rep; movsq".
>
> So, how hard would it be to make clang do that too pls?

As Mark said in the sibling reply; I don't know of general ways to
inhibit libcall optimizations on the level you're looking for, short
of heavy handy methods of disabling optimizations entirely.  There's
games that can be played with -fno-builtin-*, but they're not super
portable, and I think there's a handful of *blessed* functions that
must exist in any env, freestanding or not: memcpy, memmove, memset,
and memcmp for which you cannot yet express "these do not exist."

>
> Oh, and another thing while we're comparing asm: I'd love for clang's
> -fverbose-asm to issue interleaved C source lines too, like gcc does.
>
> That's it - no pink pony - just "normal" wishes. :-)

Looks like someone had started work on this in 2017, but it stalled out:
https://github.com/llvm/llvm-project/issues/17839#issuecomment-980923994
Linus has asked for this in the past, too. So it's something we'll add
to the TODO list to revisit.  I highly suspect that clang has
discarded the AST by the time LLVM gets to asm emission, but I could
be wrong.  https://github.com/llvm/llvm-project/issues/17839#issuecomment-1077933948

>
> GCC:
> ====
>
> sync_regs:
> .LASANPC4246:
> # arch/x86/kernel/traps.c:770: {
>         movq    %rdi, %rsi      # tmp91, eregs
> # arch/x86/kernel/traps.c:771:  struct pt_regs *regs = (struct pt_regs *)this_cpu_read(cpu_current_top_of_stack) - 1;
> #APP
> # 771 "arch/x86/kernel/traps.c" 1
>         movq %gs:cpu_current_top_of_stack(%rip), %rax   # cpu_current_top_of_stack, pfo_val__
> # 0 "" 2
> # arch/x86/kernel/traps.c:771:  struct pt_regs *regs = (struct pt_regs *)this_cpu_read(cpu_current_top_of_stack) - 1;
> #NO_APP
>         subq    $168, %rax      #, <retval>
> # arch/x86/kernel/traps.c:772:  if (regs != eregs)
>         cmpq    %rdi, %rax      # eregs, <retval>
>         je      .L387   #,
> # arch/x86/kernel/traps.c:773:          *regs = *eregs;
>         movl    $21, %ecx       #, tmp89
>         movq    %rax, %rdi      # <retval>, <retval>
>         rep movsq
> .L387:
> # arch/x86/kernel/traps.c:775: }
>         ret
>
> CLANG:
> ======
>
>         .section        .noinstr.text,"ax",@progbits
>         .globl  sync_regs                       # -- Begin function sync_regs
>         .p2align        6, 0x90
>         .type   sync_regs,@function
> sync_regs:                              # @sync_regs
> # %bb.0:                                # %entry
>         pushq   %rbx
>         #APP
>         movq    %gs:cpu_current_top_of_stack(%rip), %rbx
>         #NO_APP
>         addq    $-168, %rbx
>         cmpq    %rdi, %rbx
>         je      .LBB19_2
> # %bb.1:                                # %if.then
>         movq    %rdi, %rsi
>         movl    $168, %edx
>         movq    %rbx, %rdi
>         callq   memcpy@PLT
> .LBB19_2:                               # %if.end
>         movq    %rbx, %rax
>         popq    %rbx
>         retq
>
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette



-- 
Thanks,
~Nick Desaulniers
