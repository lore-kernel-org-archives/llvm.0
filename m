Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C473FC1
	for <llvm@lists.linux.dev>; Sat, 28 Aug 2021 20:29:41 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id y34so22114975lfa.8
        for <llvm@lists.linux.dev>; Sat, 28 Aug 2021 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i6qnYlAI6hZNF0EMhOq5iMfxRpQk+atB6ePpX8g/OPc=;
        b=Pj0wbr+XzNE5PKRIDUjTiTaV1s84TgVSf65WfZl/gAhDHHG0szHoMBrnY3rl6ExWiB
         bCaoIxNPY5sJjPkaQH77AvvIMurERVqB42ePtXv1fRVUJuRw21sqHbyY0wR6ntvmMiRU
         81GYEAqgKmT9qHMnu6JS/7uODUjoNk88ea8mwUkuKlHLu3Ipu93xa7iIfvL+7czLtdl4
         4xrbbyjEBz8XjQcjA1VjF98mGYlN168K234jacGPru1uRG9m8ocsoiHOlyF3Q8kpa+CW
         Ifbg2AY/Lh1c7gsfVJvLr9UN/JMWWCHLY8KbO9yxvLHF6g/wxOzx+nPcleaa9NAOM5At
         lMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i6qnYlAI6hZNF0EMhOq5iMfxRpQk+atB6ePpX8g/OPc=;
        b=DN9WUg9IVKDpGIJRWpuruVPXP8yHyUKbcjGu8qWFRMyzZYvOpIdOxKoqqNz0hT+pW9
         l1YHYPP1YOP2wkGY4rpnn6zYuYcZe0AcNFSeVaUqEEUurdaTcLZkkjj199/tB9sOu56y
         I0q0aGM/75MqBAu8fojiNg5S+3h/8npiOgvaMmT3bRU+E3oN4tUvi8kM46UdRuYwwyPd
         mossmPx9n+uBp9XL2hDdjaeiLU5i7iy7UUMgN4jtCRa8EQDM7a7S1mEntYDk3JZcyRib
         8GGePITpX7P7jCQpuN7Jk+f+72TSPm27K4e1zJrBsRjR37IXk3qVySQ+LnR8cxnQntX0
         oorA==
X-Gm-Message-State: AOAM531zad77uP4TSAP2kBqn3eXBCz3M6bkOBO+CX1eR5aWnTfFUqVSH
	vJsLXCIuJSiWpsP9sjnFP6/aRBSvAnUtcz0Z11AnIg==
X-Google-Smtp-Source: ABdhPJwMlBV2Foy4jdqEmBOkJXa/sHdtOJ28M8wIG94N5cXI4L1YVyTXY/2jUkCCYuQksG7RhVl1BEna1bdaeiVOaMs=
X-Received: by 2002:a05:6512:228a:: with SMTP id f10mr3715776lfu.547.1630182578641;
 Sat, 28 Aug 2021 13:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiNHx_GpjoWt9VMffKunZZy5MaTe3pM+cpBgE7OyyrX5Q@mail.gmail.com>
In-Reply-To: <CAHk-=wiNHx_GpjoWt9VMffKunZZy5MaTe3pM+cpBgE7OyyrX5Q@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Sat, 28 Aug 2021 13:29:27 -0700
Message-ID: <CAKwvOdnbiLk4N6Qqdz=RT9nsjYQv41XnXK71azYte7h0JqoohQ@mail.gmail.com>
Subject: Re: Nasty clang loop unrolling..
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	craig.topper@sifive.com, Philip Reames <philip@switchbackcompilers.com>
Content-Type: text/plain; charset="UTF-8"

(We're moving from clang-built-linux@googlegroups.com to
llvm@lists.linux.dev; sorry for the churn, but we think this will make
for more accessible archival and access from lore.kernel.org)

On Sat, Aug 28, 2021 at 11:29 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So it turns out that s390 had a bug due to its own private 'strncpy()'
> being broken and not doing the insane thing that strncpy() is defined
> to do.

Like continuing to zero the rest of the buffer up to n?

>
> Which is fine - I understand exactly how that happens, and strncpy()
> is one of my least favorite functions.
>
> Anyway, I suggested that s390 just use the generic function we have,
> instead of implementing its own version, because nobody really cares,
> and the generic function is small and simple and "good enough". See
>
>     https://lore.kernel.org/lkml/CAHk-=wjhKNB_1a6wjjPh2PvMrtjVs=DgGY5uM2jq3WBBaYMyGQ@mail.gmail.com/
>
> for details, although they don't really matter for this email.
>
> What matters for this email is that writing that thing made me go "ok,
> just how good does that generic version look, compared to the old
> legacy 32-bit historical version that uses the x86 string instructions
> just because it literally goes all the way back to my learning the
> i386 and learning gcc inline asm".
>
> Because yes, that routine *literally* exists in that exact form in
> linux-0.01 - it's moved, and it has lost a "cld" instruction since we
> now have the rule that DF is always clear in the kernel, but our old
> 32-bit x86 'strncpy()" is horrible slow garbage, but also a historical
> gem from 30 years ago.
>
> But x86-64 doesn't do that, so I just built lib/string,c with clang,
> to see what it could do.
>
> Can clang do better than complete garbage written by a clueless person
> from three decades ago?
>
> The end result is not good.
>
> Clang decides to unroll that loop four times, and in the process
> making the code 4x the size it should be, for absolutely zero gain.
>
> This is the whole function with #pragma nounroll (ie "sane"):
>
>    strncpy:
>            movq %rdi, %rax
>            testq        %rdx, %rdx
>            je   .LBB3_5
>            xorl %ecx, %ecx
>            jmp  .LBB3_2
>            .p2align     4, 0x90
>    .LBB3_4:
>            addq $1, %rcx
>            cmpq %rcx, %rdx
>            je   .LBB3_5
>    .LBB3_2:
>            movzbl       (%rsi), %edi
>            movb %dil, (%rax,%rcx)
>            testb        %dil, %dil
>            je   .LBB3_4
>            addq $1, %rsi
>            jmp  .LBB3_4
>    .LBB3_5:
>            retq
>
> and honestly, that's perfectly fine. It's very much what the code
> does. It's 44 bytes, it fits in one cacheline, it's not horrible. It's
> not what I would have done by hand, and clang seems a bit too eager to
> move the loop end test to the top of the loop, but whatever. I see
> nothing that makes me go "that's horrible".

For the loop test, I know that clang will "rotate" loops in an attempt
to have one canonical loop form. That way passes don't have to check
for multiple different forms of loops if they're all in one form.
This reduces compile time and complexity in the compiler.  Does it
always produce the most optimal loops?  Is that what is going on here?
I'm not sure.

>
> Now, admittedly it's not particularly *smart* either - you could turn
> the conditional "branch over a single constant add" into a computed
> add instead, so the
>
>            testb        %dil, %dil
>            je   .LBB3_4
>            addq $1, %rsi
>            jmp  .LBB3_4
>
> could - for example - have been done as
>
>            addb $255,%dil
>            adcq $0, %rsi
>            jmp  .LBB3_4
>
> which could avoid some branch mispredicts.  And honestly then the code

Perhaps a peephole optimization we can add? (Does the adcq - add with
carry - rely on whether the previous addb overflowed, ie. %dil was
non-zero, replacing the testb+je pair? Did I understand that
correctly?)  Though we'd have to know that %dil wasn't used after
taking the jump, since I think your transformed version modified %dil,
so perhaps that can't be a peephole opt. Hmm.

> that clang moved to the top should really have been at the bottom of
> the loop, but I don't know if it would matter. The above might look a
> bit more clever, but the data dependency might be worse if the branch
> predicts well. The branch behavior is bimodal - the loop starts out
> not taking that "je", and ends up taking it - so it has an almost
> guaranteed mispredict in the middle of the loop, but whatever. You win
> some, you lose some.
>
> ANYWAY.
>
> The above discussion is about *reasonable* code.
>
> What clang actually generates bears very little resemblance to either
> the above simple and short, or the "clever and one conditional branch
> shorter" version.
>
> What clang actually generates is this horror:
>
>    strncpy:
>            movq %rdi, %rax
>            testq        %rdx, %rdx
>            je   .LBB3_19
>            leaq -1(%rdx), %r8
>            movq %rdx, %r9
>            andq $3, %r9
>            je   .LBB3_2
>            xorl %edi, %edi
>            jmp  .LBB3_4
>            .p2align     4, 0x90
>    .LBB3_6:
>            addq $1, %rdi
>            cmpq %rdi, %r9
>            je   .LBB3_7
>    .LBB3_4:
>            movzbl       (%rsi), %ecx
>            movb %cl, (%rax,%rdi)
>            testb        %cl, %cl
>            je   .LBB3_6
>            addq $1, %rsi
>            jmp  .LBB3_6
>    .LBB3_7:
>            leaq (%rax,%rdi), %r9
>            subq %rdi, %rdx
>            cmpq $3, %r8
>            jb   .LBB3_19
>            jmp  .LBB3_9
>    .LBB3_2:
>            movq %rax, %r9
>            cmpq $3, %r8
>            jae  .LBB3_9
>    .LBB3_19:
>            retq
>    .LBB3_9:
>            xorl %edi, %edi
>            jmp  .LBB3_10
>            .p2align     4, 0x90
>    .LBB3_18:
>            addq $4, %rdi
>            cmpq %rdi, %rdx
>            je   .LBB3_19
>    .LBB3_10:
>            movzbl       (%rsi), %ecx
>            movb %cl, (%r9,%rdi)
>            testb        %cl, %cl
>            je   .LBB3_12
>            addq $1, %rsi
>    .LBB3_12:
>            movzbl       (%rsi), %ecx
>            movb %cl, 1(%r9,%rdi)
>            testb        %cl, %cl
>            je   .LBB3_14
>            addq $1, %rsi
>    .LBB3_14:
>            movzbl       (%rsi), %ecx
>            movb %cl, 2(%r9,%rdi)
>            testb        %cl, %cl
>            je   .LBB3_16
>            addq $1, %rsi
>    .LBB3_16:
>            movzbl       (%rsi), %ecx
>            movb %cl, 3(%r9,%rdi)
>            testb        %cl, %cl
>            je   .LBB3_18
>            addq $1, %rsi
>            jmp  .LBB3_18
>
> which is 170 bytes in size instead of the 44 bytes, so now it takes up
> three cachelines.
>
> Now, I don't know how common this is. Maybe this is the only place in
> the kernel where this unrolling case happens. But in general, loop
> unrolling in the kernel is a big mistake unless it's a very obvious
> case (ie small constant full unroll makes perfect sense: if you see
>
>         if (i = 0; i < 4; i++)
>                 *p++ = *q++;
>
> then you should most definitely unroll that to
>
>         *p++ = *q++;
>         *p++ = *q++;
>         *p++ = *q++;
>         *p++ = *q++;
>
> because it's simply smaller and simpler to not have any conditionals
> at all, and just do four iterations statically.
>
> But the 'strncpy()' kind of unrolling is a mistake when kernel loops
> tend to have very low loop counts.
>
> As far as I know, gcc doesn't do any unrolling at -O2.

For clang, we will do limited unrolling at -O2, and very aggressive
unrolling at -O3; if a loop can be fully unrolled, we're likely to do
so at -O3, with a much smaller or more conservative unroll at -O2.  I
think I demonstrated that in this talk, if you have the time or are
interested more in introspecting the compiler (yeah, yeah, ain't
nobody got time for that): https://youtu.be/bUTXhcf_aNc?t=1415

My hypothesis here is that LLVM may not be considering -mno-sse2 and
friends (ie. no floating at all, please) that the kernel uses when
doing its simpler unrolling.  If the monstrosity looks more compact
with none of the -mno-sse2 and friends flags set, then that would lend
itself to that hypothesis.  IIRC, the middle end does loop unrolling
in a non-machine agnostic manner; it has to know what's the basic
width of SIMD since we'd generally like to vectorize a loop after
we've unrolled it, so the pass is aware of specifics of the target
machine (this is exceptional to me; I understand why it's necessary,
but generally the middle end optimizations are machine agnostic).
Then later once we get to actual machine code generation for x86, we
discover the constraints that we can't actually use any of the SSE
registers and instead generate more verbose loop iterations using
GPRs.  Likely, the middle end unroller needs to check that -sse2
wasn't set BEFORE thinking it has the green light to unroll a loop x4.
But it's just a hypothesis; I haven't validated it yet, and I could be
wildly wrong.

>
> What is the magic to make clang not do stupid things like this? I
> obviously know about that
>
>     #pragma nounroll
>
> but I don't want to mark various unimportant functions. I'd much
> rather have the default be "don't do stupid things", and then if we
> see a case where loop unrolling really matters, and it's important, we
> can mark *that* specially.
>
> Hmm?
>
>                 Linus



-- 
Thanks,
~Nick Desaulniers
