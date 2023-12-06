Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F15470960
	for <llvm@lists.linux.dev>; Wed,  6 Dec 2023 21:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6wE/wKA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d0ccda19eeso2039175ad.1
        for <llvm@lists.linux.dev>; Wed, 06 Dec 2023 13:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701898788; x=1702503588; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QjTiKTTNoFwqsK54uc+2vEdGntF3HRgfWaG2KiC6D/8=;
        b=J6wE/wKA11EIF5BffKoGFeKvAlG/Wt3KiaiE+5uk0m7Bn+3iUiMz7kkPB6nE/YKdAr
         5PwR9nl/ZmtGepgBMFGMRa+fMnGpfL/AhV8cR0G67NgwJWKes2xb4OrP0luhrI35Lw1+
         Iuz3HGpp3gRI71brzVEEEqbH0fUaSAXSJ/8GL73mSVe6t73J47wHN6eURBEGPVL9zz6Q
         vJvZu0+jsuOwdBJNnIKhvKenexgcwJf6TjE0lFrWhxmL//zhpsltuUn9Q8cdAfzTIV8C
         60fd9UNsK6lSuDimfgRo02o4Pev5XOZm5vTPwvYkrVyRJQG1hJur9Tai+qFQxkg1vC1q
         eEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701898788; x=1702503588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjTiKTTNoFwqsK54uc+2vEdGntF3HRgfWaG2KiC6D/8=;
        b=T8Ay3HBKrAzW9q/1MJoz50X+zA/y2r+zkYSSo7G+jyzruMLYj9gcuQDUYTa5BeI8wl
         K987xsrbcu/yxegLmg5pf3PhEuj+st2vLAk0ok5mnMIoEhYLYBFqIBT+zt+TAS6YIbbi
         b6TB7i1Qkxl4zYUAUyDK/ei/jKZ1QpCuiwpPq5AzNsDSTWhZX+y8piafqCA94xFxSIvZ
         J5h2oCV3QYWnFVl6AIIeHlQoa2uiaXvbsb9Jf0NS56c8iLAaQB/79yKadmzO/RkInb4k
         0J93yZNpJEWaSwGd/LB5iPc49kiHhi9avdGCoPF9J8SVyomN/BxHOgXim/c0VzEe0Q9k
         N9Dw==
X-Gm-Message-State: AOJu0YxcKAEqZ/mWQDp4NxiCf/m+T74daYkf+i2Pr4rg3Y03URMN+ct5
	Y0Ku+GK6oovDQH+4wCdKo3c=
X-Google-Smtp-Source: AGHT+IHM/gFxzc1tQXIr8ABWFmygLF1QVxfyQEtQjPFTvK42C40xPbStQ4FZyczTf3oRq2kwBC+QNg==
X-Received: by 2002:a17:902:b90c:b0:1d0:b926:bbcd with SMTP id bf12-20020a170902b90c00b001d0b926bbcdmr1379659plb.54.1701898788518;
        Wed, 06 Dec 2023 13:39:48 -0800 (PST)
Received: from MacBook-Pro-49.local ([2620:10d:c090:500::4:8a5f])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709028c8c00b001d077c9a9acsm268249plo.185.2023.12.06.13.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 13:39:48 -0800 (PST)
Date: Wed, 6 Dec 2023 13:39:43 -0800
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>, 
	Song Liu <songliubraving@meta.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
Message-ID: <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
References: <CAADnVQJqE=aE7mHVS54pnwwnDS0b67iJbr+t4j5F4HRyJSTOHw@mail.gmail.com>
 <20231204091334.GM3818@noisy.programming.kicks-ass.net>
 <20231204111128.GV8262@noisy.programming.kicks-ass.net>
 <20231204125239.GA1319@noisy.programming.kicks-ass.net>
 <ZW4LjmUKj1q6RWdL@krava>
 <20231204181614.GA7299@noisy.programming.kicks-ass.net>
 <20231204183354.GC7299@noisy.programming.kicks-ass.net>
 <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net>
 <20231206183713.GA35897@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206183713.GA35897@noisy.programming.kicks-ass.net>

On Wed, Dec 06, 2023 at 07:37:13PM +0100, Peter Zijlstra wrote:
> On Wed, Dec 06, 2023 at 05:38:14PM +0100, Peter Zijlstra wrote:
> > On Mon, Dec 04, 2023 at 05:18:31PM -0800, Alexei Starovoitov wrote:
> > 
> > > [   13.978497]  ? asm_exc_invalid_op+0x1a/0x20
> > > [   13.978798]  ? tcp_set_ca_state+0x51/0xd0
> > > [   13.979087]  tcp_v6_syn_recv_sock+0x45c/0x6c0
> > > [   13.979401]  tcp_check_req+0x497/0x590
> > 
> > > The stack trace doesn't have any bpf, but it's a bpf issue too.
> > > Here tcp_set_ca_state() calls
> > > icsk->icsk_ca_ops->set_state(sk, ca_state);
> > > which calls bpf prog via bpf trampoline.
> > 
> > 
> > 
> > Specifically, I think this is
> > tools/testing/selftests/bpf/progs/bpf_cubic.c, which has:
> > 
> >         .set_state      = (void *)bpf_cubic_state,
> > 
> > which comes from:
> > 
> > BPF_STRUCT_OPS(bpf_cubic_state, struct sock *sk, __u8 *new_state)
> > 
> > which then wraps:
> > 
> > BPF_PROG()
> > 
> > which ends up generating:
> > 
> > static __always_inline ___bpf_cubic_state(unsigned long long *ctx, struct sock *sk, __u8 *new_state)
> > {
> > 	...
> > }
> > 
> > void bpf_cubic_state(unsigned long long *ctx)
> > {
> > 	return ____bpf_cubic_state(ctx, ctx[0], ctx[1]);
> > }

Yep. That's correct.

> > I think this then uses arch_prepare_bpf_trampoline(), but I'm entirely
> > lost how this all comes together, because the way I understand it the
> > whole bpf_trampoline is used to hook into an ftrace __fentry hook.
> > 
> > And a __fentry hook is very much not a function pointer. Help!?!?
> 
> kernel/bpf/bpf_struct_ops.c:bpf_struct_ops_prepare_trampoline()
> 
> And yeah, it seems to use the ftrace trampoline for indirect calls here,
> *sigh*.

Not quite.
bpf_struct_ops_prepare_trampoline() prepares a trampoline that does conversion
from native calling convention to bpf calling convention.
We could have optimized it for the case of x86-64 and num_args <= 5 and it would
be a nop trampoline, but so far it's generic and works on x86-64, arm64, etc.
There were patches posted to make it work on 32-bit archs too (not landed yet).
All native args are stored one by one into u64 ctx[0], u64 ctx[1], on stack
and then bpf prog is called with a single ctx pointer.
For example for the case of
struct tcp_congestion_ops {
  void (*set_state)(struct sock *sk, u8 new_state);
}
The translation of 'sk' into ctx[0] is based on 'struct btf_func_model' which
is discovered from 'set_state' func prototype as stored in BTF.
So the trampoline for set_state, copies %rdi into ctx[0] and %rsi into ctx[1]
and _directly_ calls bpf_cubic_state().
Note arch_prepare_bpf_trampoline() emits ENDBR as the first insn,
because the pointer to this trampoline is directly stored in 'struct tcp_congestion_ops'.
Later from TCP stack point of view 'icsk_ca_ops' are exactly the same for
built-in cong controls (CCs), kernel module's CCs and bpf-based CCs.
All calls to struct tcp_congestion_ops callbacks are normal indirect calls.
Different CCs have different struct tcp_congestion_ops with their own
pointers to functions, of course.
There is no ftrace here at all. No .text live patching either.

All is ok until kCFI comes into picture.
Here we probably need to teach arch_prepare_bpf_trampoline() to emit
different __kcfi_typeid depending on kernel function proto,
so that caller hash checking logic won't be tripped.
I suspect that requires to reverse engineer an algorithm of computing kcfi from clang.
other ideas?

> > The other case:
> > 
> > For tools/testing/selftests/bpf/progs/bloom_filter_bench.c we have:
> > 
> >         bpf_for_each_map_elem(&array_map, bloom_callback, &data, 0);
> > 
> > and here bloom callback appears like a normal function:
> > 
> > static __u64
> > bloom_callback(struct bpf_map *map, __u32 *key, void *val,
> >                struct callback_ctx *data)
> > 
> > 
> > But what do functions looks like in the JIT? What's the actual address
> > that's then passed into the helper function. Given this seems to work
> > without kCFI, it should at least have an ENDBR, but there's only 3 of
> > those afaict:

Right. That is very different from struct_ops/trampoline.
There is no trampoline here at all.
A bpf prog is JITed as normal, but its prototype is technically bpf_callback_t.
We do the same JITing for all progs. Both main entry prog and subprograms.
They all are treated as accepting 5 u64 args and returning single u64.
For the main prog the prototype:
bpf_prog_runX(u64 *regs, const struct bpf_insn *insn)
is partially true, since 2nd arg is never used and the 1st arg is 'ctx'.
So from x86-64 JIT pov there is no difference whether it's single 8-byte arg
or five 8-byte args.

In the case of bpf_for_each_map_elem() the 'bloom_callback' is a subprog
of bpf_callback_t type.
So the kernel is doing:
                ret = callback_fn((u64)(long)map, (u64)(long)&key,
                                  (u64)(long)val, (u64)(long)callback_ctx, 0);
and that works on all archs including 32-bit.
The kernel is doing conversion from native calling convention to bpf calling convention
and for lucky archs like x86-64 the conversion is a true nop.
It's a plain indirect call to JITed bpf prog.
Note there is no interpreter support here. This works on archs with JITs only.
No ftrace and no trampoline.

This case is easier to make work with kCFI.
The JIT will use:
cfi_bpf_hash:
      .long   __kcfi_typeid___bpf_prog_runX  
like your patch already does.
And will use
extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
cfi_bpf_subprog_hash:
      .long   __kcfi_typeid___bpf_callback_fn
to JIT all subprogs. See bpf_is_subprog().
Which shouldn't be too difficult to add.
We'd need to tweak the verifier to make sure bpf_for_each_map_elem and friends
never callback the main subprog which is technically the case today.
Just need to add more guardrails.
I can work on this.

btw there are two patchsets in progress that will touch core bits of JITs.
This one:
https://patchwork.kernel.org/project/netdevbpf/cover/20231201190654.1233153-1-song@kernel.org/
and this one:
https://patchwork.kernel.org/project/netdevbpf/cover/20231011152725.95895-1-hffilwlqm@gmail.com/

so do you mind resending your current set with get_cfi_offset() change and
I can land it into bpf-next, so we can fix one bug at a time,
build on top, and avoid conflicts?
The more we dig the more it looks like that the follow up you planned to do
on top of this set isn't going to happen soon.
So should be ok going through bpf-next and then you can follow up with x86 things
after merge window?
