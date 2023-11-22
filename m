Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5D74401
	for <llvm@lists.linux.dev>; Wed, 22 Nov 2023 02:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgtJFjDy"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5c194b111d6so4809613a12.0
        for <llvm@lists.linux.dev>; Tue, 21 Nov 2023 18:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700619504; x=1701224304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2JtVvzSXcsMJHs5Fa1LRlSKTAhVxx38CLFocbX7yRI=;
        b=UgtJFjDyz/3MZs6PwVTW3QF9J3+EhyW9UE+ifBYuYxUsFZlwXPfIgxdQoeYoNBMFJa
         AVQcM5eT7Rc7sePIVn/2HBhwZHnDwbhg8NuRQrZ5yvA3Sm5HbSYo4qBbGh6umjg/IwqA
         ZikWcBCsgGsdUMf8rPIByNBmbKyVHZlp2NlQ7eUdzUX0EugjmrholXaqCSNNnhRhwDBV
         rX7FrEmkyK3hulLZWsU1/obiaqz7ol5NPDX96IQoPAn/xJ3Jc5MkKPmxB1DddxjMVPYK
         G4aDd75Z07aYo0BUKrqoAcgxtlOYf5Gylwhq7Z2DOJmTZj52iviYTVU0Dy1QLfGgN3zr
         pCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700619504; x=1701224304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2JtVvzSXcsMJHs5Fa1LRlSKTAhVxx38CLFocbX7yRI=;
        b=Y5HRdSmoJD/KF3nAOtC9fqevKSUzS1FlyEOHN7+eqkhh3zdr5nz0pH1dzzM2U8aZ/z
         UXWt3+qaxHVVOnmkYp4LoO1JHlHZG7Qje8ldXurM0O4n9MmPDyE3DrE/thP+3ZXub/+p
         jE3cjQFdye4nPRisp0QPFluXe9fNK2PGSdaOqJ5Zr1e2au0z+kjXJ01/h7h+HshyiP3c
         d6eZZK+3cHaU9/96rQbnROZn/+vzbH1ufIyvIwOTwU7/bL5SEAc0bMKM6iO+q8EhJlA0
         HLAf/3bYnxutrCGilUhjZXJKm+8FQffI8TsBkQZd6ON8ZYY2tjp9KkwOxVtkdCsDK2HZ
         Dmpg==
X-Gm-Message-State: AOJu0YxlSrAOQQsOn5OABcpjY6i9H7fbMq8U59zREdPpNa7OuJjHPoBp
	SVcTxhDiO+1sJ9EjPVo+e7A=
X-Google-Smtp-Source: AGHT+IHULoe6pvKvjGIj978pG/KK+sCwsp4P07vJ0QP8owy3lQgUNgmTBcg4tQiLtn7mpUJHV9y5Cg==
X-Received: by 2002:a17:90a:1e:b0:283:2932:e90c with SMTP id 30-20020a17090a001e00b002832932e90cmr1280050pja.12.1700619503724;
        Tue, 21 Nov 2023 18:18:23 -0800 (PST)
Received: from macbook-pro-49.dhcp.thefacebook.com ([2620:10d:c090:400::4:da69])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001cf5c99a62esm4863700ple.117.2023.11.21.18.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:18:23 -0800 (PST)
Date: Tue, 21 Nov 2023 18:18:17 -0800
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	davem@davemloft.net, dsahern@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	samitolvanen@google.com, keescook@chromium.org, nathan@kernel.org,
	ndesaulniers@google.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, jpoimboe@kernel.org, joao@overdrivepizza.com,
	mark.rutland@arm.com
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
Message-ID: <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com>
References: <20231120144642.591358648@infradead.org>
 <20231120154948.708762225@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120154948.708762225@infradead.org>

On Mon, Nov 20, 2023 at 03:46:44PM +0100, Peter Zijlstra wrote:
> +
> +#ifdef CONFIG_CFI_CLANG
> +struct bpf_insn;
> +
> +extern unsigned int bpf_func_proto(const void *ctx,
> +				   const struct bpf_insn *insn);

To make it more obvious what is going on could you rename it to
__bpf_prog_runX()
and add a comment that its prototype should match exactly
bpf interpreters created by DEFINE_BPF_PROG_RUN() macro,
otherwise cfi will explode.

> +
> +__ADDRESSABLE(bpf_func_proto);
> +
> +asm (
> +"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"
> +"	.type	cfi_bpf_hash,@object				\n"
> +"	.globl	cfi_bpf_hash					\n"
> +"	.p2align	2, 0x0					\n"
> +"cfi_bpf_hash:							\n"
> +"	.long	__kcfi_typeid_bpf_func_proto			\n"

Took me some time to grok this.
Cannot you use __CFI_TYPE() macro here ?

> +"	.size	cfi_bpf_hash, 4					\n"
> +"	.popsection						\n"
> +);
> +#endif
...
> +static int emit_fineibt(u8 **pprog)
> +{
> +	u8 *prog = *pprog;
> +
> +	EMIT_ENDBR();
> +	EMIT3_off32(0x41, 0x81, 0xea, cfi_bpf_hash);
> +	EMIT2(0x74, 0x07);
> +	EMIT2(0x0f, 0x0b);
> +	EMIT1(0x90);
> +	EMIT_ENDBR_POISON();

Please add comments what this asm does. No one can read hex.

> +
> +	*pprog = prog;
> +	return 16;

16 means "the caller of this code will jump to endbr_poison", right?

> +}
> +
> +static int emit_kcfi(u8 **pprog)
> +{
> +	u8 *prog = *pprog;
> +	int offset = 5;
> +
> +	EMIT1_off32(0xb8, cfi_bpf_hash);

and here too.

> +#ifdef CONFIG_CALL_PADDING
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	EMIT1(0x90);
> +	offset += 11;
> +#endif
> +	EMIT_ENDBR();
> +
> +	*pprog = prog;
> +	return offset;

5 or 16 would mean "jump to endbr" ?

> +}
> +
> +static int emit_cfi(u8 **pprog)
> +{
> +	u8 *prog = *pprog;
> +	int offset = 0;
> +
> +	switch (cfi_mode) {
> +	case CFI_FINEIBT:
> +		offset = emit_fineibt(&prog);
> +		break;
> +
> +	case CFI_KCFI:
> +		offset = emit_kcfi(&prog);
> +		break;
> +
> +	default:
> +		EMIT_ENDBR();
> +		break;
> +	}
> +
> +	*pprog = prog;
> +	return offset;
> +}
> +
>  /*
>   * Emit x86-64 prologue code for BPF program.
>   * bpf_tail_call helper will skip the first X86_TAIL_CALL_OFFSET bytes
>   * while jumping to another program
>   */
> -static void emit_prologue(u8 **pprog, u32 stack_depth, bool ebpf_from_cbpf,
> -			  bool tail_call_reachable, bool is_subprog,
> -			  bool is_exception_cb)
> +static int emit_prologue(u8 **pprog, u32 stack_depth, bool ebpf_from_cbpf,
> +			 bool tail_call_reachable, bool is_subprog,
> +			 bool is_exception_cb)
>  {
>  	u8 *prog = *pprog;
> +	int offset;
>  
> +	offset = emit_cfi(&prog);

I'm not sure doing cfi_bpf_hash check in JITed code is completely solving the problem.
From bpf_dispatcher_*_func() calling into JITed will work,
but this emit_prologue() is doing the same job for all bpf progs.
Some bpf progs call each other directly and indirectly.
bpf_dispatcher_*_func() -> JITed_BPF_A -> JITed_BPF_B.
A into B can be a direct call (which cfi doesn't care about) and
indirect via emit_bpf_tail_call_indirect()->emit_indirect_jump().
Should we care about fineibt/kcfi there too?

>  	/* BPF trampoline can be made to work without these nops,
>  	 * but let's waste 5 bytes for now and optimize later
>  	 */
> -	EMIT_ENDBR();
>  	memcpy(prog, x86_nops[5], X86_PATCH_SIZE);
>  	prog += X86_PATCH_SIZE;
>  	if (!ebpf_from_cbpf) {
> @@ -357,6 +426,8 @@ static void emit_prologue(u8 **pprog, u3
>  	if (tail_call_reachable)
>  		EMIT1(0x50);         /* push rax */
>  	*pprog = prog;
> +
> +	return offset;
>  }
>  
>  static int emit_patch(u8 **pprog, void *func, void *ip, u8 opcode)
> @@ -1083,8 +1154,8 @@ static int do_jit(struct bpf_prog *bpf_p
>  	bool tail_call_seen = false;
>  	bool seen_exit = false;
>  	u8 temp[BPF_MAX_INSN_SIZE + BPF_INSN_SAFETY];
> -	int i, excnt = 0;
>  	int ilen, proglen = 0;
> +	int i, excnt = 0;
>  	u8 *prog = temp;
>  	int err;
>  
> @@ -1094,9 +1165,12 @@ static int do_jit(struct bpf_prog *bpf_p
>  	/* tail call's presence in current prog implies it is reachable */
>  	tail_call_reachable |= tail_call_seen;
>  
> -	emit_prologue(&prog, bpf_prog->aux->stack_depth,
> -		      bpf_prog_was_classic(bpf_prog), tail_call_reachable,
> -		      bpf_is_subprog(bpf_prog), bpf_prog->aux->exception_cb);
> +	ctx->prog_offset = emit_prologue(&prog, bpf_prog->aux->stack_depth,
> +					 bpf_prog_was_classic(bpf_prog),
> +					 tail_call_reachable,
> +					 bpf_is_subprog(bpf_prog),
> +					 bpf_prog->aux->exception_cb);
> +
>  	/* Exception callback will clobber callee regs for its own use, and
>  	 * restore the original callee regs from main prog's stack frame.
>  	 */
> @@ -2935,9 +3009,9 @@ struct bpf_prog *bpf_int_jit_compile(str
>  			jit_data->header = header;
>  			jit_data->rw_header = rw_header;
>  		}
> -		prog->bpf_func = (void *)image;
> +		prog->bpf_func = (void *)image + ctx.prog_offset;

I don't understand this.
prog->bpf_func is the main entry point. Everything jumps there.
Are you trying to skip all of cfi code in the prologue and let
xdp_dispatcher jump to endbr or endbr_poison (depending on fineibt vs kcfi) ?
Then what is the point of earlier asm bits?
Is it a some clang thing that knows to offset indirect jump by
exactly that many hard coded bytes ?
Something in the clang does ptr -= 16 in case of fineibt and just
jumps there ? and ptr -= 5 for kcfi ?

If so, please add a giant comment explaining that.
No one should be reverse engineering such intricate details.

>  		prog->jited = 1;
> -		prog->jited_len = proglen;
> +		prog->jited_len = proglen - ctx.prog_offset; // XXX?

jited_len is used later to cover the whole generated code.
See bpf_prog_ksym_set_addr():
        prog->aux->ksym.start = (unsigned long) prog->bpf_func;
        prog->aux->ksym.end   = prog->aux->ksym.start + prog->jited_len;
we definitely want ksym [start, end] to cover every useful byte
of JITed code in case IRQ happens on that byte.
Without covering cfi prologue the stack dump will be wrong for that frame.
I guess if xdp_dispatcher with fineibt=on jumps into prog->bpf_func - 16
and IRQ fires we don't care that much about accurate stack of last frame ?
I guess it's acceptable, but a comment is necessary.
