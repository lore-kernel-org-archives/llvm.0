Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1838399348
	for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 06:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453938; cv=pass; b=FHWjVY6N0CChAuUSM8THKp8UyrJltS0giTzHc/3WeXAwnI+QnIKnu2z0RjHoHskPAPnuZ0rKP9Ramd4quAKyS7fZzK6Exeb2vv1+nCR28qpZIxMHPu7fpEELoszvSyePRv+RgLpiJXeVglTkL1rp2hi2RBdYtrgg9BniS2EfisA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453938; c=relaxed/simple;
	bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hixPeLJxXhCslZwtWLeiv1zJRtLxmOxTv5cPG3SUXM4LK4hDDDpICWGQZW6Jg88na4huwjTxYkVWWHPz0Y2uLEx14Ap6EOz9tA32iGhTcOaqhKPCnfcgViakzyCUX3PJ9yw+ZFUPdD6lFHZVGp0FfJfttBj0P5s3fQ7LiuCYt6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Itt5TOlU; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Itt5TOlU"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d67a9ae5bso538837a91.0
        for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 23:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789453936; cv=none;
        d=google.com; s=arc-20260327;
        b=U6xpjDtqZ4oEQ8saKRDW5Cnann3y/stT/zYBfsBuqfc2WxWTlszYpPcP3l+FkN+a8N
         norreUf76cb0D+ldJwz6LHmZdjafQiWmaLqpknovveQUFkRbNw+c5tgj8BPDsg90ajSg
         aBn2uxzH/6ePy6V/DBKVJ7zuyHaQhbCDrZZOA7b55ocAVZ4eMMqyAlkePOVVG3WhZYRQ
         eDnCd/NbP0ca1A0M7siKCcDTwL1bRBxsMOBDutjNe0moGDCSf9eOf0uzR44bC6LrEXDR
         YBCSf7tRp4KBKSS5W9w/lpyYGsumSqEfQFb0m0b+J0dfuHzzICy+xnuH9m6gAgyxZq4x
         D1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        fh=b3+D5N6TDOSn5qbIhChsj2GAVu373x95wdnmtX4+KH4=;
        b=EVACTEbYPXA2sIRHBjI8HOk6lU7duqx32nEePXWgtXLHQs7jwExCPiLFQfw/qT5PpN
         Lg2elqxW7mqHdlkhqRqhWSg3iKmmU6coMjpjWMDI+jlY66Fv7/xbQtgAvvWcBie6XSoX
         I3RyIGk3epuhSMHvaqi4WLSpSOT/RKVgj20o9DQAIzka/L1e1SNLXK/xJs1P61EBBImM
         tyodo/fXXq93BQuz4U1YzKNeI69kZ9Q4wbBuZ6ns2zquXUyNa2Tfg8QvOGKumVKwZYH1
         opgtkqU3Q/Ce571F9XlnAvKvyQsVBg8vLZOzECfBYzw8GYP5z5Tu0OB9dBfqsxNoJLzy
         qhnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453936; x=1790058736; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        b=Itt5TOlU9H4T3rL7ISf1NgEwjmxvkj5EkvdCUoM2XUx0r2LNMoF9fDrwQCa5UQ7Yws
         vW85je4UQVaDbyu9Vd/pUJnlZnO+af3grrHNNkrqV1OU9/d6KJQWGQjLkV5Nk39QkGB5
         USDknnQhQZgSr8N9gQBuPw919v8MRkysq6hQEcc8W6P937tJYiR1n3RC/gpQ1F4YMqmJ
         3Obq5vBeyhTaNRQQwoLnkUINGEj5Qpch3+n3dcRBaoz6OalFXheBXBtvecidYdjhv2tP
         IgttNp4raqNd5nWnVyc/vje4xsbOvOvuNmo+hGT0sKOLvkFwlBysPabn2KcPCtbWiQ2U
         wW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453936; x=1790058736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        b=XWvW4jtTwAuho5nk/KN7mnZYlb8nV5c15eJvw5Tt1eFSAW6NDZlVSgDiiTaZGSm9Qo
         atcSZf0KJvmSMCfyFMJNz8DKsG6mxT6s+TNZ1Dr2jwuE/7ysVn0xytriU3Cwi0Yc8pw1
         QzWVBjyYBCLCGaNHQ+r/aV3rkzygWSQM0RN8oqWCHnpAye1oei8URoOTguDTFqkVqW6d
         cXDRQZSMyPnj4qJww5EQdGwTMMgF9zdGzniFczT9Sebh+CI9qXilmYkBzFpFcb/M7F9M
         b+8+w8kLhs/Dpnt0U3Z4Smb9NozEVBIA57cMSFI8KNuuI6Vy4gfy35MEdwnDQu8N492x
         xnng==
X-Forwarded-Encrypted: i=1; AKwUvBxsachF1Czlo6nzOJElqA1e5YTovHN3Nw0KDX1rcMHLch0pOoUYXpXWcjUlh/O0qZoVdKud@lists.linux.dev
X-Gm-Message-State: AFuF++klit3WIDDJn5IKP+BnKrOUQYU6bfwKOByM1FPORzw8CMkwrgzW
	rNuivs2xT1KVDPtoZScQoAROAATbRKfcrS6EvCzZR3sJQTpcCzcSiLblY8eWOa+WQLMtcNn39aK
	ygGe0wnEKR0OPYluGF/BpEQ8tFQPxV+w=
X-Gm-Gg: AYBFou2YLn2QJ1iSdIlNnx37XkDVqEhTbA1ACWPlzI8NgEDZnWm7ROiIY36qzKKJO7r
	VlwfvI9OgkfuLlGXWlMjuaYeBWhhHBAYE4AQURN26A8Hd23tpHcFe1y06gTkB8xuFeWWhOGuDd0
	uXZKKApXm3YC8J0/VAwLnnrEAnehDwNVOzdoGsVrLUwCQGTBnbifhcPFCYYoqZm4WXitWUYhcZe
	OqG3hsdofGG8xZ1p6WOLnMhbDHao2idtz8502pYGapl1Sa0pdvZb3YlcD+oKf7BG/ToLOS/rRD9
	fnllzRMFH0Wd3ulj5tClGGTIUc2izUDlPhHTRz/45flX9Hqn8K9lIJTn3qIlNT/2ddex2wVTaY3
	k2kLJoAiUCe6/XkzkBXdme6ZMcaLZBBTS+eiiLU5FCRvr0F2ttCEQw08eQ53WHxlRiayUzK1jsF
	CLNdcsCinW1nPL0zn99iQJdABVqliHtJBsQ4mQG3Wo8eqk+VM1Ug==
X-Received: by 2002:a17:90b:390d:b0:396:d27b:86a4 with SMTP id
 98e67ed59e1d1-39dec02ca06mr8212249a91.2.1789453935885; Mon, 14 Sep 2026
 23:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
In-Reply-To: <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Sep 2026 07:32:02 +0100
X-Gm-Features: AcwNN1XuX4yn0GdoJd77RsJx70W4snllWWAl7hBlEl0V9VQzhH3zC86aEhQjx38
Message-ID: <CANiq72naY0=iBaxfbWQaPv_06X4SjFSix4NybDQdht33+Tcs0g@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] kbuild: rust: optionally parallelise rustc front end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:24=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> Rust crates are compiled in a serial chain on the critical path - core,
> bindings, kernel crates and then the drivers - each a rustc invocation.

This confused the LWN article... :)

There is a critical path in the graph, indeed, and doing it in
`prepare` is painful, but to clarify: each crate is already built in
parallel with others where possible, and the fact that each crate is
built by one `rustc` is unrelated, plus the flag this patch proposes
is also unrelated to that.

I guess the LLM was trying to add context to the numbers below, but it
looks like it will easily confuse readers.

> Each time a change is made to any of the bindings, it triggers a rebuild.

This seems oddly focused (i.e. not sure why `bindings` is mentioned in
particular). It is also at least independent of this patch, i.e. it
will remain true regardless of the patch.

> rustc has a parallel front end, enabled with -Zthreads, available since
> rust 1.84 [0] and therefore on every rustc the kernel supports.
>
> It is not yet stable and its output is not reproducible, so it cannot be
> used by default - stabilisation is being worked on [1].

Not sure what it means by "by default". In any case, the main issue
with the flag is that it has had issues recently, not so much the fact
that it is unstable.

> Add optional build parameter KBUILD_RUST_THREADS, which when set passes
> that many threads to rustc.
>
> Observed build time changes with KBUILD_RUST_THREADS=3D8 (rustc 1.98, cla=
ng):

I assume the improvements are most notable due to the work being on
`prepare`, i.e. there is no other work available. When that is
relaxed, this should be way less needed. Though it will be still very
nice to have for full Rust rebuilds, like when changing the compiler
versions often, due to `core` mainly (e.g. I have to do that often, so
I would like it :).

In any case, I am not sure about adding a Kbuild variable already for
this at the moment, especially with that name, i.e. it is not really
"threads" but "frontend jobs" and the flag will not be called that in
the future anyway.

And if someone wants to risk their kernel builds, then they can
already pass the flag today...

(We probably also want to know what the flag will finally do before
committing to particular names, e.g. whether it affects
codegen/reproducibility in any way. But perhaps Kbuild doesn't mind
having new variables that may be replaced soon.)

Thanks!

Cheers,
Miguel
