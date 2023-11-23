Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E81115
	for <llvm@lists.linux.dev>; Thu, 23 Nov 2023 00:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjnSSN0I"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33139ecdca7so215319f8f.0
        for <llvm@lists.linux.dev>; Wed, 22 Nov 2023 16:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700700197; x=1701304997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4mDM3fOhLxMKv9Qsj/stPbdPgmQsMFznGIuQOD753M=;
        b=AjnSSN0IJ5t5owSBWVtNoRmjBNA4bJIKDR7cInzBETHurZ92MBtX7W9698hovKFnZd
         PC8wT0kheDD1XCokY4Zhs3dAtEx0+IU8ePaQKGPt02QnexoCXNQIr/xtYYrsJgdZtB6y
         m4zlQb8rS73hWzxsldzApiMZpbFGH7REFZtQyKpI3pw08DKGrzOYbntXm4J9ONvhlT2n
         gJ0PGrrWKin1tcLFT9yRT59+N2Uirou2SA4FoXp6ItqFfB7tjUJeuh2v4kkk1svsYqYr
         c3qMFYqvkUu5cVegcI8AX4gWL5RYFZ4u71FMdhMm3MyW7+qEWwy5HkDxijFct1RhfaNG
         yb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700700197; x=1701304997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4mDM3fOhLxMKv9Qsj/stPbdPgmQsMFznGIuQOD753M=;
        b=HywIYu+290TFR5/r4BRN00q1fNXbOAfmGdM3Hg+z1TnAfd+9N7Ws6zPe2NEGmW9oCO
         nI4cnbMtzTWJBB+fq29Xhkiztb/PVOzsPsAjeeqstLqZ6nQgLZFY2XDXQtkev6fhwuWx
         Oxw1srrV8wcihazuQt18CtPHarvJBZ2441EQA4MU9s1h/fL+9/Z5qJfxIztwl2El6bIf
         qxAC2j0dEJX4eS1sKcbWZ5OBoM/7rs7ouHRYWfjcyBSzRc4kROvksC0iHxdalrZdLThi
         hjq0Uw76KFRLe8TwIA+U6pf/q68ZekIM4jS31uJ4iphBjj/rQ4LHMvlm6Nw9BNCpZAb3
         xbOg==
X-Gm-Message-State: AOJu0YwXnGhox9hAGvqCB/rlCF855PFFbmivDTlMUZANnb6t97L6E/e9
	OYqO+rcSZoKO8E/iRwF3KOOpHpOCUZHROTr4Hfo=
X-Google-Smtp-Source: AGHT+IFaGuLwN1xpFTtgde8hjR8udeumSPNXj31L06f21NbuevuO4pwK/eQWIUQlq/PJPmsAyg32Y1iA4ZTIjeNqURg=
X-Received: by 2002:a05:6000:128d:b0:332:cc15:6bae with SMTP id
 f13-20020a056000128d00b00332cc156baemr2454118wrx.20.1700700196781; Wed, 22
 Nov 2023 16:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231120144642.591358648@infradead.org> <20231120154948.708762225@infradead.org>
 <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com> <20231122111517.GR8262@noisy.programming.kicks-ass.net>
In-Reply-To: <20231122111517.GR8262@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 22 Nov 2023 16:43:05 -0800
Message-ID: <CAADnVQLhWFKcxno53zqGtuiWwUcw+TU8gB2eCBRPQC=2y5vrFw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Joao Moreira <joao@overdrivepizza.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 3:15=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
>
> To be very explicit, let me list all the various forms of function
> calls:
>
> Traditional:
>
> foo:
>   ... code here ...
>   ret
>
> direct caller:
>
>   call foo
>
> indirect caller:
>
>   lea foo(%rip), %r11
>   call *%r11
>
> IBT:
>
> foo:
>   endbr64
>   ... code here ...
>   ret
>
> direct caller:
>
>   call foo / call foo+4
>
> indirect caller:
>
>   lea foo(%rip), %r11
>   ...
>   call *%r11
>
>
> kCFI:
>
> __cfi_foo:
>   movl $0x12345678, %rax
>   (11 nops when CALL_PADDING)
> foo:
>   endbr64 (when also IBT)
>   ... code here ...
>   ret
>
> direct caller:
>
>   call foo / call foo+4
>
> indirect caller:
>
>   lea foo(%rip), %r11
>   ...
>   movl $(-0x12345678), %r10d
>   addl -15(%r11), %r10d (or -4 without CALL_PADDING)
>   je 1f
>   ud2
> 1:call *%r11
>
>
> FineIBT (builds as kCFI + CALL_PADDING + IBT + RETPOLINE and runtime
> patches things to look like):
>
> __cfi_foo:
>   endbr64
>   subl $0x12345678, %r10d
>   jz foo
>   ud2
>   nop
> foo:
>   osp nop3 (was endbr64)
>   ... code here ...
>   ret
>
> direct caller:
>
>   call foo / call foo+4
>
> indirect caller:
>
>   lea foo(%rip), %r11
>   ...
>   movl $0x12345678, %r10d
>   subl $16, %r11
>   nop4
>   call *%r11

Got it. That helps a lot!
You kind of have this comment scattered through arch/x86/kernel/alternative=
.c
but having it in one place like above would go a long way.
Could you please add it to arch/x86/net/bpf_jit_comp.c
or arch/x86/include/asm/cfi.h next to enum cfi_mode ?

> > I'm not sure doing cfi_bpf_hash check in JITed code is completely solvi=
ng the problem.
> > From bpf_dispatcher_*_func() calling into JITed will work,
> > but this emit_prologue() is doing the same job for all bpf progs.
> > Some bpf progs call each other directly and indirectly.
> > bpf_dispatcher_*_func() -> JITed_BPF_A -> JITed_BPF_B.
> > A into B can be a direct call (which cfi doesn't care about) and
> > indirect via emit_bpf_tail_call_indirect()->emit_indirect_jump().
> > Should we care about fineibt/kcfi there too?
>
> The way I understood the tail-call thing to work is that it jumps to
> bpf_prog + X86_TAIL_CALL_OFFSET, we already emit an extra ENDBR there to
> make this work.
>
> So the A -> B indirect call is otherwise unadornen and only needs ENDBR.
>
> Ideally that would use kCFI/FineIBT but since it also skips some of the
> setup, this gets to be non-trivial, so I've let this be as is.

I see. yeah. The setup is not trivial indeed. Keep as-is is fine.

> So the kCFI thing is 'new' but readily inspected by objdump or godbolt:
>
>   https://godbolt.org/z/sGe18z3ca
>
> (@Sami, that .Ltmp15 thing, I don't see that in the kernel, what
> compiler flag makes that go away?)

I also noticed this discrepancy. It doesn't seem to be used.
Looks weird to spend 8 bytes to store -sizeof(ud2)

> As to FineIBT, that has a big comment in arch/x86/kernel/alternative.c
> where I rewrite the kCFI thing into FineIBT. I can refer there to avoid
> duplicating comments, would that work?

Just the above comment somewhere would work.
I wouldn't worry about duplication. This is tricky stuff.
When gcc folks get around implementing kcfi they will find it useful too.
