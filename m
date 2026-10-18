Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8DC3B4E84
	for <llvm@lists.linux.dev>; Sun, 18 Oct 2026 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792346223; cv=pass; b=Bn4rZi7OE07yd4ZEcXtpQ7Fqh1dOffJXiPVJT4EF41jofHLYJoKSgz0ZNsST6GwxsdhV12t5wLT3rvObCA6ITiuQMas1oTfCnJfIOH4wzYaqYCr6pYs834BhUFdZay7C436j7ZIC/fkLdfydRq2HMAU9mcOW/wNPV3K3/8yTKzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792346223; c=relaxed/simple;
	bh=ein2Kxm/7ddUQW+oHSZ4NEDEcr868l3pq4onBaj8gos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOzkEZw673R4nYBHXkS1DsKy8n7kt57NWAn9EqW94/uGtS4V8hkdCAXWQ4HyXwCnOSAk0Jgx6Kzh70GQ0gC8psZeeQCfPuzENOIoVDWbL3Vt0G9+IJoKGJu+livPeOb2luXBTcvnWwLkgqcTiZSxMvmRWKIrLe2wvWHdRugIyao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBk4xI2z; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBk4xI2z"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-360236b6c3cso112018eec.2
        for <llvm@lists.linux.dev>; Sun, 18 Oct 2026 10:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792346221; cv=none;
        d=google.com; s=arc-20260327;
        b=jBsaRCiUfNpCX7TJFsP7beRF6CvQm23YxNCxga0iV3F2bdmLZ5mbu2u4W+hz15jH5c
         YgrZsVUu86XgsIxdOdKwav6cMlz2d5L1z/5kiiML4avrzsQztP5xRIAlSlynykdbkuKK
         4AZv9U1LdGnah2+jV/8DRYpHwRxYCSjVAeUsTHgwAd5Ne7U277yK4vc8f9WzeaJ8ztt2
         g+AAW45dbX9rEQLXjvZFlltyZrX9Heqtt9bdB2kXU/IZRb7/BYa5Y3+q6YDTNUG/wZZx
         pW2iLxSL2OFMKLkaCDY5IcLQInhmWoMCKhBjrEyEWxSgc0EpFzH0LyRHszvd1ImXuV7j
         SCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bKssVqS+1fUgzpvGYUPB7GmCd4wpzuePwRHvRr1rp2U=;
        fh=Y0jaKfdDZGW9iT72neuVr7cxAflHYu0MviLzuYLJ3xc=;
        b=f8P5z5U8AKU0u9B17MTZoAOs14HQZJAY9Qay9LKHGZp/Gv/2ru3taTgJgcBQQzFSPV
         rziGmzc+7phAcm8t6rA8c1WuNCRgmHc7oR+nHp3FYb+6LiafujiWzEQZ9/XF2TQyCaq/
         5U6VCgJhREPwtKOe9IB+kx8KYZciZTEg1ywXhZC8dFP1Mo4jLUH7OgT4DdqQO4m77BW+
         ol8p0XVVGbu/wDk4piJtSsOEVM64qYk+rq52ps5P68dIvmbMZFmMKnVpfrYkEA+CFIQF
         wS6TwCrdHCyNiPKF6Nz7wKdHzBxbxxSP0fE5TLNqlyozQFMSTO/vKIQ7Sgo0Oxv2AjxP
         chrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792346221; x=1792951021; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKssVqS+1fUgzpvGYUPB7GmCd4wpzuePwRHvRr1rp2U=;
        b=eBk4xI2zdn5wS6mO8QpIJ3wmvq+QqA+Pp2ZXF36U80o9FPkq0N9NXBwcDPw8gwRKgS
         bjc39xqs3C6lmuZEtTWULsW0sfFOwtBZFFW6c8SiPyfb80/EYrnLcHCe/ohLYeAa67lc
         Nswkkl8k79agtp3m0aaTU4dC9BKjQ85d08WAOs0GGyKfq9SOtDxUT36D8wFe26WMkWYh
         OeL41nCs9xjQ47gt8FqbChGS2KGs/BKx7XZAVvE97vnh1+EBO87WCCHTxZ+DENbejSYb
         BzPc3VyJv+xWDdnA+1f+vCK3fEDXZFPe/5qQ9FcjSCHkauxn4xnSRrzUQz4dyMBhY+2t
         AkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792346221; x=1792951021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKssVqS+1fUgzpvGYUPB7GmCd4wpzuePwRHvRr1rp2U=;
        b=eHT7iAMVt0wYQh7HPe6lC3alRaur5bpmmRtLsV7nEA87qRbpZtovuqbJorfJaZyfQo
         my/ht6lVKTQz4yuQZ1Ysaj7VWwsQsOtADbOvd1PIeHcH5HytlFOGh4YxK8BMAMo5xVkr
         ktaf2/R8+NCiMaiwzZdKlOPjatcijQ4mQa6YZz3UF58obLRqSCXgVRQrVDTm/aYjaa/V
         lik6QfmvG+/2+r8aqJMFRQOBhDu5Sjiqf2YW/Tkln3//maaZ5P9Oonb6CaBAlKCC2eNY
         RAm3GQxfHzGzneqnRhQZAlwKteT/I+BSOWLjUl7+5ZerH0WP2xyRLA0F1ABDDW/Jb9YU
         aedw==
X-Forwarded-Encrypted: i=1; AKwUvBz7U6HwYSAzchMUl6YJwFLfFKaHePR7fS8ER0D9OZKeljZWc+GIolFKQ+gjbfgy4oj9iYGc@lists.linux.dev
X-Gm-Message-State: AFq9FYL/5DtQJleDlv2MwLMeMrAtOoOvSjBkrRxVr4x5kgke2u2+aypE
	6EmMmYKqYBpcsSpDnOyUWmEIaosJw9MWfbawa1Y+nP0uP9cf2zlPFQweKuKESyfaZ4l2lKyiLAI
	G3ncLLLmVHbRXa4z24IwnnAdzHE2DYeI=
X-Gm-Gg: AYBFou3IkPWbc7fTpFjpZ2oUxGpNkRvB22rcC/HRJjD1aPyX8n877dFNAVM827bdePt
	VprnsG0R0g8yDb7Au7c6meZR43H1hN0WUikh7VKrg5JQVBRN/Skw9LMGfixLSS02NFsoAgyGyIf
	iStnvOMe47+oPV6FI392R9Wf04BWhhcwIn0X1vyeMPUAWqi8szgrVSHTKWMaYFg9pKepGlohi5b
	ky1kgPTNvQwvnTBWcUotTrzaVa12pGQ4AV6tOWQes3WOs4R0xfgachgUvdVGgPqORwinT5ep42+
	iYxQe0fYwunqNoRakGJsg8RytkJEcwYJQOuFUkYOOD+2QAHQOI1hKnsNKz8GcpSLJtvrYfbMk+0
	TD7BvZ3P/nwDIfXc9l0bO1ixECf/Xb2rD1nYEOuQfBC9Dld48Ato8Sxxx6FlKd9t/p4pNDIIW6U
	ASYsZV/exC1KXFHHdQ1nbaGI5thIzbdjFIxFldFWvT0938jEQJnTMa0l7mN+xuKA==
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3619b212ef3mr13057373eec.0.1792346221395; Sun, 18 Oct 2026
 10:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Oct 2026 19:56:48 +0200
X-Gm-Features: AclHuK_3ymV6Lp1a_ivM4oJdQMCp7Ooe_ysoxuTMLzooZXb3XPtxZZvpcBg_tIc
Message-ID: <CANiq72=zv6uDRu+x=BpSLWsZnB2XCnPduQ1PXPPQNzxDgtm54w@mail.gmail.com>
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

Not sure if `Fixes:` tags may be wanted here, since this was simply a
matter of not having added the support after we got it into the
upstream compiler, but two candidates are:

  Fixes: 97e59672a9d2 ("x86/ibt: Add paranoid FineIBT mode")
  Fixes: 4a1e02b15ac1 ("x86,retpoline: Optimize patch_retpoline()")

I hope this helps.

Cheers,
Miguel
