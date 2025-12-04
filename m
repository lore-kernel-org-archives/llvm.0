Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E273330B35
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843803; cv=none; b=FiFz4rfdWZpQ4onwW1OJcoefKT7El1xZcyegxMxmz7YsVVUTUEckc3Az3Y0mzq8V8YGhQnQ1aTXLtmvLlQXE2wh7gZm3nf2M0jIQQtFHmOjZ3mfi9VpcCWkyEF5Sq7xo9alpQ1gOWsAluJoh6u48/8CK0juMKK+rVLQpRxpdng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843803; c=relaxed/simple;
	bh=DIRoBJqJh2nL4dnaCjqurXyJhedDrunp5jDtmaUt9MM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kHK7lkqXjMeGuIPMeXRJ8kNOR+Kq6haWFH4Nxmu37pL4EYED/OA2YDR5syTEPIhsjatYNeAEMtNDIwhbPif4+ZtrhWDn1f4+avBGo5wHG0aYafMjE2TCmOVqiCsoUrsSRl7p1/ZYlu+rNvKntB9wzO/3G9b2k5ssvwAmhpN671w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=upchR43a; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="upchR43a"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42e1e1ca008so1027810f8f.0
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 02:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764843798; x=1765448598; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EF1MlHpf4n5Q1St5clq56+r8fU1ZS9gsCdCeRZ6mpDg=;
        b=upchR43aoK5qPrrjTLaTHehXqc9qbER+jMV9urBDMXDxeDpKFyjQVxa4K3qeSa+vOr
         tB9YwMVCnj3vmvHqzGUqnQo7druJDy7AzLeJLRN/oQZsVVQmBhrcZN6uOgK+z8CloGeV
         1Ha2axVfVSyXe9jFLuUqZo3Ih5ii/bA5Q8YrkOuohWHQHVfKJJWCTHcvXwFrgjSZD+gV
         mhbvpBldkdYuxeqwvXIQGAwec2XFoNJ6HoEIxP8w2S2qs0JrgnRJ3O1sFd+3S6bHNp48
         +RsxGfmgzOaEMYl9Jh+bbPzr6ZND9HGSnVC1tyzPc1ydKxC5rkGIniQy5XLUagGDF6v5
         3ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764843798; x=1765448598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EF1MlHpf4n5Q1St5clq56+r8fU1ZS9gsCdCeRZ6mpDg=;
        b=PX25I/Sn80nfLQ8CEMnOyvbuX12yfJ2QSSQzwMhoto1GhY/57RTxZhLPMxuU7WW2Fe
         IKBLHw387+mZI2FhqbZV0hEb2kgZqpHvi7vdMOtCmgzT9ErUPPlDm9ylfxYskDoA0WLI
         r6BXcKYtdeto+XwR+zANe71hrLnj7YScZ8MCiV66KGmJC7foFtU43P6RG/KjafM3k70/
         OObqMPulSnVNO3qDHFEbRsOYjSW2CuBlQR+hhMV83crfldhhe2+YUftbzQaxCMd4b0R9
         5KUycr13jTCz5R3w2jgApVVGUsFrS9IAAyt0OqWtclStq+kCcBKk1jGAC4iQZXAXkC+K
         +spg==
X-Forwarded-Encrypted: i=1; AJvYcCV6DTcJMEYN+hnB8Q6KCnrCJ5jyl6FprM44LtJ0jeV34woqS+iWACWJXfq20uDUFEFpVH0E@lists.linux.dev
X-Gm-Message-State: AOJu0YwufhqFhPh+9ve2P9qQoDLorlY91O8E6C1bU7SNJamsxxCTn05+
	sXnHkm6eQ0+lrPkWgMcIvPnRG1hfsdR8NJo8BWUipzPQE0kZmMBJSoLwgOh5NwGr3OWg2+62wps
	5PuH6wOSLay5r4INCGA==
X-Google-Smtp-Source: AGHT+IGiPJgDCk6zUebYl8jptLh9N24hkpO6kzd49VGJaKt6mNBrX4BGA0A2hAQXhvOeEcEPmbx50VOSkvAylEw=
X-Received: from wrmg8.prod.google.com ([2002:adf:e408:0:b0:42c:c2d6:28e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2f97:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-4792eb1a02emr19061445e9.8.1764843798611;
 Thu, 04 Dec 2025 02:23:18 -0800 (PST)
Date: Thu, 4 Dec 2025 10:23:17 +0000
In-Reply-To: <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
Message-ID: <aTFhFXCqvy7nmDOp@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Josh Triplett <josh@joshtriplett.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Dec 04, 2025 at 11:07:25AM +0100, Peter Zijlstra wrote:
> On Tue, Dec 02, 2025 at 08:27:59PM +0000, Alice Ryhl wrote:
> > From: Gary Guo <gary@garyguo.net>
> > 
> > A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
> > allow C helpers (which were created to allow Rust to call into
> > inline/macro C functions without having to re-implement the logic in
> > Rust) to be inlined into Rust crates without performing global LTO.
> > 
> > If the option is enabled, the following is performed:
> > * For helpers, instead of compiling them to an object file to be linked
> >   into vmlinux, they're compiled to LLVM IR.
> > * The LLVM IR is compiled to bitcode (This is step is not necessary, but
> >   is a performance optimisation to prevent LLVM from always have to
> >   reparse the same IR).
> > * When a Rust crate is compiled, instead of generating an object file, we
> >   ask LLVM bitcode to be generated.
> > * llvm-link is invoked with --internalize to combine the helper bitcode
> >   with the crate bitcode. This step is similar to LTO, but this is much
> >   faster since it only needs to inline the helpers.
> > * clang is invoked to turn the combined bitcode into a final object file.
> > 
> > The --internalize flag tells llvm-link to treat all symbols in
> > helpers.bc using `internal` linkage. This matches the behavior of
> > `clang` on `static inline` functions, and avoids exporting the symbol
> > from the object file.
> > 
> > To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
> > the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
> > Disallow BTF generation with Rust + LTO") for details.
> > 
> > We have an intended triple mismatch of `aarch64-unknown-none` vs
> > `aarch64-unknown-linux-gnu`, so we suppress the warning.
> 
> So if I understand this correctly, it will consume the helpers twice,
> once for bindgen to generate the rust ffi glue, and then a second time
> to 'compile' to IR.
> 
> Then the IR is 'linked' into the rust translation units allowing the
> actual inlining to take place once 'LTO' runs.
> 
> And while this works, this still has the downside of requiring those
> rust helper files and using bindgen.

That's right.

> The other day [*] I proposed extending Rust such that it would be able
> to consume a clang precompiled header directly, this would allow doing
> away with most of all this. No more helpers and no more bindgen.
> 
> Would that not be a much saner approach to all this?
> 
> [*] https://lkml.kernel.org/r/20251124163315.GL4068168@noisy.programming.kicks-ass.net

I have actually discussed similar ideas in the past with Josh Triplett,
so you are not the only one who thinks it is a good idea. Unfortunately,
the road to get there is long.

Another option to get rid of the helpers is that bindgen is working on a
--wrap-static-fns flag, which would generate the helpers for us.
However, that route would still require this patch for them to be
inlined.

One detail that makes the precompiled clang header really tricky is
that IMO we should not require RUSTC_CLANG_LLVM_COMPATIBLE for the
build. With bindgen, you just need bindgen and clang to match LLVMs.
That's easy since bindgen loads a dylib from your clang install. But if
you build this logic into rustc, then you need to be really careful to
get rustc and clang from the same source, and that same source must use
the same LLVM to build both.

Alice
