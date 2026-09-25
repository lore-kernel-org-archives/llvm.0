Received: from mail-ua2-f32.google.com (mail-ua2-f32.google.com [74.125.226.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745A72AE76
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 19:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.224
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363881; cv=pass; b=WNdE6kyBs8M9wG7BYkssYmBx6HDKG5CGfs09HS9BAT2fxO5vrcxX05T6qjA0La+0mqYgFhNTag0IaEhaoS70EqJOs3BV5H217Hcztm7GROg/xuVTXODa+jRjRWXY+PInFi+5sHrzSmKFeah71r0jWxs7eujesZLhf9KYY09EAIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363881; c=relaxed/simple;
	bh=0YXk1p2g+BspsukgpRLeUnT1mCwteMBiEo6KobR3WE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbDbI1NP15zmCm+mNXNSeu4+KprhJXnypbnLE7b6bS3fJgGUAiOEPAXj89lPTIDArChi/BMaXR2/OdD3YHHuDqjjftWhI1M4xtXW+Mb5UKhAsSW8alu/4mEXsiAhl+0dl7Ru5z4t3QxTk4AhGm29wGa5tnAKDft05ZjKmNsy1GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O57AplVK; arc=pass smtp.client-ip=74.125.226.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O57AplVK"
Received: by mail-ua2-f32.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so723211241.1
        for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 12:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790363878; cv=none;
        d=google.com; s=arc-20260327;
        b=YpkwETX049gHJu7QL1YVO53nWo2sWM+2ASHUQ9U6ZVWmdEqmUSFzEPhmDyd0CNKI4t
         8nqsJ20MpgzmY46Ha/Ow6/q0PUm7vETjkE9cI3LTRrjYFLFDJ7b5NRatALYXG6BwPWqb
         qJgBzFFuD1Qujt9MHUk3hR5AHSnu1PJYyvxsrANvlhX+/2gEg4rVXsL3FVWNX1VgAz2X
         SeamNWZCrfrapoMj8fbZTkyVonm7meqOMyvIiOPE8qE8JQ+OhQsZTtzbA9EUeLRzG10u
         w6Km0/9N8jmVDROrkECDnn3EpXWGObSO1VArB11+bqvxGU4y7L4y5KtohgDiZDwMU9Eg
         PClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=68/mkRd1a6DliLdoLvTqX92EpyDhdssnV15ZSAj23lc=;
        fh=HQOgI4Gi5fXNltgcPhaxQGh/w1mGaFJ1H6v+XYvnzPA=;
        b=TGYr9rWISpSg+dT2gON486MMZGk3jNm7ocGwPCuIUM89eErRNwfIT5hCZ3nrr5MSg7
         gD+KMv/Jf3QPFKvitHkSeD/qdSZTxncHH2IsAwLHLW1hkmuQqbUGxXr6PVv4HL7ykxq4
         UV7GVXv4RlEOfilMfw7VcV7qRDOZeqG1qL1fx0fB2vguP4HiWcZIgYGbCAROUHv52Gmf
         dKKrQdHTK/G5IyUdRhccrFYFq1x0Wf9tBwWHOjInXjLZ0VXuiAGwYYKL16piX3NGGb6z
         PMqCb52bcUxylGmHwjx9lu2XcvqGdGY1hpek0ltj46XUvIQ61XKM4RRKhj1n3686t9Pf
         DOQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790363878; x=1790968678; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=68/mkRd1a6DliLdoLvTqX92EpyDhdssnV15ZSAj23lc=;
        b=O57AplVKDhUEizHON2VT5gM2Cm41t5TReagp/FvTT3ylBHW4tWNkVSh534JBqzRosh
         zhW91Dv2fD8lYzlzgGR8tRCe7uoegh/21T5WAYqm7PPMgYXPMJsoIApFKqeqpyODMerm
         +WiBY1wsmeY/+CkD2sTsPcGxwHYrjdnxlwc63fa3w5vOmfo/nfES3pMM2EVxRs7XQQ9m
         InDVg0OvvBbnAo1YQWheDR7LQncj+TBT1+Whj3u+ebKVYOJoL24vSVR0M8iOFOccy33S
         EvHysbhoG6CzfkU9M8cNpPzr7HMPeSNwxDijumnMcb9OK3gWxXd6X0M8ozeTaXBwaR3u
         FRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363878; x=1790968678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68/mkRd1a6DliLdoLvTqX92EpyDhdssnV15ZSAj23lc=;
        b=0x6c80Rgz72xk4lq37Dt1579EkXCqeVy1OFhkPjIG83xxKdLp3zeCwZ5i9ddxKEI1P
         oE5TWLr9eNe7Nzz6PpsPw4LEKf+r2DRMZdpDFlktbu0WQ+a7Zf6zmjbSFV3RvWa7jlWi
         v4pv/3r5DONXZt1Q61XxK8zjNuHF5bVYLiF+elt+0eTDrO73NBaS5GninLlwrRxBgEnk
         9Cc4L7GQ9AVCPJ80WWJQcTmZvwvENRDmALqtub8zJgPriPpWjiNiA/oJHdwRFkwihj8m
         PX8tetJnRRXCUNGaLKFiBhp1tuVlbLC/hGk7xZggL7fm77mmR/a43B+b0vCnqWPiVbDV
         kOMg==
X-Forwarded-Encrypted: i=1; AKwUvBw0ucD5A6WgudVSvpRkHYTbfderdHoODZxqKIgGkj4YqLeL/QyiyJYfEN9VmTozNFNqXAXQ@lists.linux.dev
X-Gm-Message-State: AFuF++nRQXEr5Np466+06SOfJZZnV2z8AC5nXrS/Sl2QgbhezVFIrJRm
	BifAMDwhtOlDPHo65ClRWcS1SoRBLet2BjH5OrY3wVwi4RXv7U5HMh3blxtG5TIbaj+0877FPbl
	wSINgr1z3psPArdaSndLjTO1QNf04ufqiHmxkafc=
X-Gm-Gg: AYBFou2TBp3ceWT/UPsGrJBefmcZ7uhRcgw+xUdRzEFdRekDwR/yJjNU/i8SiNv9mOA
	msAoRlm5jIMmaBS+d1zrMhixBSTL5ZWhsAofceGuPeFFJwaU81M733cPMySsQrZw6d4WHk4HxR6
	yX2gyT9CL/GF1vt3ZQZSecjM3DFh+6FtD51rGhprU2gS9tc9MOjjtcuBW80IYschmZ3VMj2zuqw
	zLb6JNwYSQkRiWIuQm9iykcagAdIGOy8szP2o/GTOi96gi+Z9eyiEBsXoEAih4MDQy+i3T2bhkv
	PdIM6DSX7vNx73h5kwPzkp7kRavLIOqp089ty1ArjXPqRosbUYoYPEp5IV0Qx05eAAODBKAXx30
	MxMvNXnis1uZ3w9IZUEO4UJ7FE7mIle/mr7xGBy1S1xlwZpzAT2Un
X-Received: by 2002:a05:6102:3f06:b0:7a7:3485:33e4 with SMTP id
 ada2fe7eead31-7af1f2fce8cmr3602978137.33.1790363877295; Fri, 25 Sep 2026
 12:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924-b4-arm64-callops-kcfi-v2-0-587865b6d991@linux.dev> <20260924-b4-arm64-callops-kcfi-v2-6-587865b6d991@linux.dev>
In-Reply-To: <20260924-b4-arm64-callops-kcfi-v2-6-587865b6d991@linux.dev>
From: Bill Wendling <morbo@google.com>
Date: Fri, 25 Sep 2026 12:17:41 -0700
X-Gm-Features: AclHuK-u3uiT0pgSiQWlUPghLSJFY3GErd8b-v10N2yzXEaY6_RjJUbwQB3czv0
Message-ID: <CAGG=3QVs=e5JtAs-D98vDsj2ax9H0gH-_rPc0oKhx-vNpq_RyQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: cfi: Use CONFIG_ARM64_FUNCTION_PREFIX_NOPS
 for the type hash offset
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ben Cressey <ben@cressey.dev>, "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:37=E2=80=AFPM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> Make cfi_get_offset(), SYM_TYPED_FUNC_START and the BPF JIT use
> CONFIG_ARM64_FUNCTION_PREFIX_NOPS instead of hardcoding four bytes. kCFI
> kernels with CALL_OPS need three NOPs, or five with ThinLTO and BTI.
>
> CONFIG_ARM64_FUNCTION_PREFIX_NOPS is 0 on every CFI kernel today, so no
> functional change.
>
> Reviewed-by: Ben Cressey <ben@cressey.dev>
> Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
> ---
>  arch/arm64/include/asm/cfi.h     |  8 ++++++++
>  arch/arm64/include/asm/linkage.h | 11 +++++++++++
>  arch/arm64/net/bpf_jit_comp.c    |  8 ++++++--
>  3 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/cfi.h b/arch/arm64/include/asm/cfi.h
> index ab90f0351b7ae..03f02d4614c23 100644
> --- a/arch/arm64/include/asm/cfi.h
> +++ b/arch/arm64/include/asm/cfi.h
> @@ -4,4 +4,12 @@
>
>  #define __bpfcall
>
> +#ifdef CONFIG_CFI
> +static inline int cfi_get_offset(void)
> +{
> +       return 4 + 4 * CONFIG_ARM64_FUNCTION_PREFIX_NOPS;

*drive by review* Could you explain the two fours in this equation
with a comment? (Feel free to ignore this if it's obvious to
developers.)

-bw

> +}
> +#define cfi_get_offset cfi_get_offset
> +#endif /* CONFIG_CFI */
> +
>  #endif /* _ASM_ARM64_CFI_H */
> diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/li=
nkage.h
> index d1f7a16729d25..14bc3c67c38b3 100644
> --- a/arch/arm64/include/asm/linkage.h
> +++ b/arch/arm64/include/asm/linkage.h
> @@ -39,6 +39,17 @@
>         SYM_START(name, SYM_L_WEAK, SYM_A_NONE)         \
>         bti c ;
>
> +/*
> + * The compiler emits CONFIG_ARM64_FUNCTION_PREFIX_NOPS NOPs between a C
> + * function's kCFI type hash and its entry point. Callers check the hash
> + * at that offset.
> + */
> +#define __CFI_TYPE(name)                               \
> +       .4byte __kcfi_typeid_##name ASM_NL              \
> +       .rept CONFIG_ARM64_FUNCTION_PREFIX_NOPS ASM_NL  \
> +       nop ASM_NL                                      \
> +       .endr
> +
>  #define SYM_TYPED_FUNC_START(name)                             \
>         SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)        \
>         bti c ;
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index c18e005a41dbe..7ad14d9847138 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -185,8 +185,12 @@ static inline void emit_bti(u32 insn, struct jit_ctx=
 *ctx)
>
>  static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
>  {
> -       if (IS_ENABLED(CONFIG_CFI))
> -               emit_u32_data(hash, ctx);
> +       if (!IS_ENABLED(CONFIG_CFI))
> +               return;
> +
> +       emit_u32_data(hash, ctx);
> +       for (int i =3D 0; i < CONFIG_ARM64_FUNCTION_PREFIX_NOPS; i++)
> +               emit(A64_NOP, ctx);
>  }
>
>  /*
>
> --
> 2.52.0
>
