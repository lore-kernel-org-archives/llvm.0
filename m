Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897477;
	b=H5bysd2/6MnHIqvC0F4/tiMGCQaG2YHQl3P7k799why8dT0eZj/utf7DQOI2YBl0l66r
	 /eW8YKF5HzoDmGduvdnAAQ5znRl2ieZhOFy+LwplvzDX5DqhtTe4+7IE4q1k45gfywG1L
	 JZbJs3YrkpcQ9XlZNDnMlv6YvbajgLL5zl3ERxy3gq1hTYAlJubQrw0CnvhYwSnbhTPSO
	 Vw/3SMSABSrN/JX1LJcUBiqmw1NrtDb2jAMP34DXmkZEQCuTvONz+cUhUsM26qHd2pYBN
	 lQ8T3XABivTPE908orNxRZmp9YzVAiWyvbvpdFuzKSxSxZkdnSKDiBJW4vyrGvEbDDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
	b=Gy5+1SCzv9m3Ri+rOVHRCCWWkSMs27Seux8YIsPfFJ+b103g7QaHNVH6nhAg50cYFud2
	 D4ncNhy7laR834dp9L2SYya6Icwn4cR5CO1eggquKMyy0C/wUmmdwbFFxXiKT2IpV9cxS
	 OyGBNRMRD9w16kW3eQelPvGx6HtFwS3C9aggvb6aVUDjMfA0kT3svMpFASM+J/2ACgVIY
	 CGlgG33pMfnpHCOKp75+XjlwvJUK3Qc17VhxRkjx/2vrYdR8K+VXyn10q8aQKMqdPc2Co
	 n5L9pckXax20BiS8Z5hIBxUtHV0TmGf+iU824ZNqHZYimJcTDLX5x+fEQCue0Vt7xyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAzB7WGL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11028606A323
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 06:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11028606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAzB7WGL
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso6093051fa.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 22:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897475; cv=none;
        d=google.com; s=arc-20260327;
        b=mxfx6OysmFPsgaj35Q1LFXart70uziRiE9RiXGFLuyNrT7i0Uaf07/bLb2paeAWxlF
         +RYOu1j76FBh2mN7I4WHgug4qa1K9tvhTmBa/K12Hgb1219Z0U6fl2VBEsVZPwFWz6Eu
         InDpeIJAUtBOnHOSRDcCxesmEqIJJISQoC5HfUY3X/Xx5dgpDkcy9ZHvJonnEv0ntf4Q
         0uPLEyFxPRKnmCEeASDmOsQ27PKQ98IVK7P3amoSocKKw1uhhbmqd3+44M2O3pbPT8hD
         iKn6DPFPIOcgVAVYEaj/xStyFK0zaHyqdlJubZDbIXLN37QnVpCXTi+HwmHulbtNshNM
         E4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        fh=wK9syqKQg8jq4fd7uFY5Y6o1dINsijr0MtO9TpF0PNU=;
        b=Ri7J738JS9gLiRj9ZV2x5NT0bosRzMKdyM7oCDGxdi5kae1KzG6g5fYqCieNhY/Xch
         bV3w56G2c052apSU89D9acGpFX5iBRAFW/rs4o04aLsjk4GsQ5Rq56i0tl2EwA7rez+Z
         uU8DqfrFQ3nzaUdir7Wb4B1ZwDONN0KoD2gFpUPkxzOOXY2AEH6BdKDyHCfDX6Z/oxXD
         J+6klF57nAXqKxnJp545uhD4g3fnFQ32C6jvSyEk94cy376OP1sFjOxcOUlckPzQbgMu
         Fz3ZzX9vYv8CdCilpWPQQWKtgTUwrY2FwPM9V1+XfxaZczXkjNwgWaSAYtN7T/eXc2MN
         VnXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897475; x=1795502275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        b=GAzB7WGLSD+ARXnsv1TA50R3CkrZ+rpqxQZzLOiPLd6UVX4gUhV2cJXnn0BBwxNl3T
         siwhely55+z8eIYR0dGBS4fPKV/LA0fBVO5sKv7pHGVZ8C/fh8FU351M4JhYXhfx2mHQ
         50f9cq+3/6u3N+v8NW8Q9Z4WSqvnLcWfs/MalRud8+RimNz3bETLtFmJJtKgQGi5yVgl
         YbclBgiBRq0VIc/a6CU2UO2Z/8BcwFwgILOLO909ApkO7Pyj0/MCwKbyn311r8GeXszH
         FAt68n5y4VQp9AUC13emZocI2uTMOcFEufGqUPXOtXmKIAugQue7GZzTdNCGu/r0bgvU
         /W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897475; x=1795502275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        b=GTx1tz3SrTKS3xzOZyhqAK2AYHpvNlqvTRElCu1jOfdTAERO9mWdU7RSGQMpqEtMv5
         feTGpPG/l4D2xWOTVw45+VF/CSYogF0H5FsmBxm0W0YVwgZy9bb1a8zK9R1urDW+ohvq
         x16JkXDMW+OU9n3XRGloOU94ZOhnR7ORb0+vLhW+G3ePle66Pcc43cX6ypHrf++rr6Bv
         CtUuwsUmLsxNfv0oosSC9jWaNhU7GbGA03qP1gya8e1oIDAqaqSyNdoDysjkmt4WcgWb
         fA3Etmiut+5qIBjlRYqu1mmYgnbIZvIro9EZOVXvVDhiVsC7c1WUcCvknwatvY2+cgd/
         lPHA==
X-Forwarded-Encrypted: i=1; AL+hErFWjnLmXtQwVcC9wmku6GscHshgtHf9QiW4lG3LCMvlZgfL7BB/9Sw6P1X7bYgKMsuCQoOm@lists.linux.dev
X-Gm-Message-State: APuU4Z/Dug+n/rJRgSZzwOegIsI//i31tqpAcQcSK6pW6g1lM0xfpR8h
	IvcWIPzqw7nGqllTFJ+WCbfoYHNw2IHnQOuZPASFn8Oa6X4E5DHB6AB33rEHGgdKagcvsHEKtam
	dWpiNGrI/IWBS9ZVCF5b9iGBUY/t21eo=
X-Gm-Gg: AYBFou104tuJoawaR4cBgpnoVOXzo2ZUXcv+owBck46JuJDotFqwIFcAqh+MzIzKwvc
	hZlsuU9b/N6f3pnBTU13mwZm/XpFMFreGi/c6ZxDsALHa0AgSfFrsahPEWpx2GRb6wBDncJ1siC
	OVQ4QevShf/27LvvRm71wyo43cLvIvD20sQaxmdvfE62ZOaL8Cei6LG/Ri9zEIe5PUEAzO9Dqh1
	OoiqsjYk7JbTXQb47NxpdulZJm4PNbY+VJj6aSXUpFrZYBSc79udRz+0hyRApnglVHpf3gRqhTc
	p9TH2EK+O4PO5PUCNjo5Em0wV8g164637rnBugGgNWXG8J0Fi9h60REniqsl1SS2aqvoYW23pV/
	lXEoxoHx3l4GROAvFbH2GuowQOQ1BxQ0Nzf6WZM2f0x1+yXcbwvUCdy+rUzxaxVyB1//hgjb5m7
	Q5hcY8lMoUjdO/xpzJyAL0cD1d44JePHfyOT7OEBRobu8FV23qyw7dm66WpPlL/nmeuVq8XN9Ou
	VhjnSRdwsgPoG0gBwz1wrDYs2E03MX8PPJsHL6i0bww+dtL7f4NHaxRoZkU246J9rkr6VhnSg==
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr5667796e87.0.1794897475024; Mon, 16 Nov 2026
 22:37:55 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Nov 2026 07:37:43 +0100
X-Gm-Features: Aa3M54p7eBlg9yL8nKjCRYF_cKn6fvAcKLXbakSS16n9mf6XS8H5ekFNr6S-Wr4
Message-ID: <CANiq72mrpgxyb4d9C5p1KS0n87GmYTXcyUX+dhZ39T2vRtOQwA@mail.gmail.com>
Subject: Re: [PATCH] x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The C compiler is asked to add a `cs` prefix to the `call` and `jmp`
> instructions that go through the indirect thunks for the `r8`-`r15`
> registers, which makes them 6 bytes long instead of 5. That gives
> `patch_retpoline()` enough room to inline them, e.g. as `lfence; call
> *%r11` for `spectre_v2=3Dretpoline,lfence`.
>
> However, Rust code does not get the prefix, e.g. for a
> `CONFIG_MITIGATION_RETPOLINE=3Dy` build:
>
>     $ objdump -dr rust/kernel.o
>     ...
>       e2b: e8 00 00 00 00        call   e30 <...>
>                 e2c: R_X86_64_PLT32  __x86_indirect_thunk_r11-0x4
>
> Moreover, since commit 4a1e02b15ac1 ("x86,retpoline: Optimize
> patch_retpoline()"), `emit_indirect()` assumes there is enough room
> for the inlined sequence -- e.g. with `spectre_v2=3Dretpoline,lfence`,
> the kernel warns and dies while patching a site inside `core`:
>
>     WARNING: arch/x86/kernel/alternative.c:736 at apply_retpolines+0x2ee/=
0x400, CPU#0: swapper/0/0
>     ...
>     Call Trace:
>      <TASK>
>      ? _RNvMs6_NtNtCshS2CUL9MEDn_4core3fmt8buildersNtB5_9DebugList21finis=
h_non_exhaustive+0x5b/0xd0
>      ...
>      alternative_instructions+0x1d/0x60
>      arch_cpu_finalize_init+0x5a/0xb0
>      start_kernel+0x1f4/0x280
>
> Similarly, paranoid FineIBT rewrites each kCFI call site into a fixed
> 20-byte sequence, i.e. the 14 bytes of the kCFI check plus a 6-byte
> call. For a 5-byte call, that overwrites the first byte of the next
> instruction, corrupting Rust code:
>
>     SMP alternatives: Using paranoid FineIBT CFI
>     ...
>     Oops: double fault: 0000 [#1]
>     ...
>     RIP: 0010:_RNvNtCsdVypMZsLRAh_4core3fmt5write+0x1e9/0x210
>     Code: ... b8 68 81 16 9f 41 3b 43 f5 2e 4d 8d 5b f0 75 fd 41 ff e3 <c=
c> c0 eb 02 b0 01 ...
>     ...
>     Kernel panic - not syncing: Fatal exception in interrupt
>
> Non-paranoid FineIBT is not affected, since it only rewrites the kCFI
> check and leaves the call itself to `apply_retpolines()`.
>
> We added support for `-Zindirect-branch-cs-prefix` [1][2] in Rust 1.91.0
> [3]. Thus pass it for `RETPOLINE` builds when possible, which makes all
> sites indeed get the prefix:
>
>       e3c: 2e e8 00 00 00 00     cs call e42 <...>
>                 e3e: R_X86_64_PLT32  __x86_indirect_thunk_r11-0x4
>
> The kernel above boots fine with `spectre_v2=3Dretpoline,lfence`, inlinin=
g
> the Rust sites as well.
>
> For older Rust compilers, set the LLVM module flag instead, which
> has the same code-generation effect. This means that every Rust version
> that the kernel supports gets the prefix, that the kernel boots fine with
> `spectre_v2=3Dretpoline,lfence`, and that paranoid FineIBT no longer
> corrupts.
>
> In addition, add it to our target modifier workaround for `rustdoc`.
>
> Cc: stable@vger.kernel.org # 6.18.y+
> Link: https://github.com/rust-lang/rust/issues/116852 [1]
> Link: https://github.com/rust-lang/compiler-team/issues/899 [2]
> Link: https://github.com/rust-lang/rust/pull/140740 [3]
> Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
