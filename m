Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AD92D3731
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841568; cv=none; b=IYgy4tbZHlgyIMa+eMknWOTfYswcfAoFBRfd9wuAoTTrHZoW5u6Lkiv7HhBYyicyftwYVXt6jXxRNBkhVkJvrKR/DF06WRlyph5qQjIPvgVHtkRexbef9gOkaO1J9/DBdh3ubk9ri/bj37LyNA+lDbGfDwbrsys4x1qt7KauFcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841568; c=relaxed/simple;
	bh=EzgpGjg1QwWDfYIOOESLFG/yLw37B0pgIc7/2w/E3vA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MNg1Nh8Uftw/H7Z8GAwEFjNYjjgP+T1Y96wNXtYQ0DB5E+ErfHFrY7H6xeYGAw3RRaqWeu7u3xgoGSEanD0fZsV0ZllZxiPaIMZX5iGUDNryFa0h2V+Xx0mMAMNyagZekeBTzHYCw/JzP0W8y+TlQ/QfdMUDiUzkJTcB7PNGbCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fqJDv7Ev; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fqJDv7Ev"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64095177aedso972032a12.2
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 01:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764841564; x=1765446364; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Y+LEByl2j3nWQKuuz9R99dq4dapViIO+66bH6orc1c=;
        b=fqJDv7EvFZ+egoCuk7H42+FMl4mY7W70qr2qQtnFMdd7Xs8VXplVhbhakZycP12GHD
         9KhKaUXHBmO+8KLNrEumKYQo1lf9kGR0E+YQb4cEKc1+HIEOaZv/MdQSvydjYP90fziM
         s3M+6EfJYg9CZfs41pWykC9xT1qykvqkeXQAjbQAQjTtfG1P8F2zxyaaghlHkTtF2BS9
         oKpH7zsz0MxT9GDTa0txvlm3h0+lZzmZVUqTOox8uO2RMjkkZn7qa60E//Cb1XkF197U
         fFaKoSQawj+XpuKbvMVJMUSFKZ1aK89uXlx8pjnoKjKpKIJw45JmSj4U+gkwwCf4PW36
         SdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764841564; x=1765446364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Y+LEByl2j3nWQKuuz9R99dq4dapViIO+66bH6orc1c=;
        b=PWRrVWr/xx27ac330p1jemclV1dn6qfqIMpMOFG4cvDNumTp6xQMHrVGF/Hy/5ub3m
         aQfQgdwKffiHvfDvBZZFQ+igfzfBROLWStRhnLIoXe+SStCqx5nRbEvdIzOj1N/uqFiM
         8H8lYQKmliYlYdtoPt2RLF53uI1IFGeCbMZRL5ChRu5jaC9QWopIm8Yu0yxWrRw/0bth
         oLICOl4NIlmq2nuPihHq+zBpqg+7EOqgVPjVt4LlG/3Lwkio0JJ7MYe/kMcBKLg92CzX
         k6BXFk2tPruR8v/PJwGh/roULYwhGEFqrzlNrPiBT2POscwB0Y6pjgb/bYEw5EzecQQW
         rigg==
X-Forwarded-Encrypted: i=1; AJvYcCVIWIjGfhzfApuAuyMMmF8ATaBkdkWaVixP6Q9T7JsLpSgwkvJBzr2PE9q30/6kaTiZBbcy@lists.linux.dev
X-Gm-Message-State: AOJu0YxrE8YqVJvVvvKrGKRsfdnBSN+GzJeAojy/hdcmLmNH5AXv4wLW
	poV/U29lznw0J3sfAzpLVtH5t/+a5w9JdRnS3QGXqiBobZpfZTj7a4bv/qbJwAfkTx22pinViUQ
	kDzP6HaUD4Re0Txsl+g==
X-Google-Smtp-Source: AGHT+IH+B9WzKRmSWzOuHrGLt1JUxDjhE9BQol+oE79eSw4Io68p4o5P8fUOkglayWG/HVrXi6i/Vno1TKnYch4=
X-Received: from edbig1.prod.google.com ([2002:a05:6402:4581:b0:62f:24aa:896a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1e94:b0:640:c640:98c5 with SMTP id 4fb4d7f45d1cf-6479c4c441bmr5333397a12.34.1764841564163;
 Thu, 04 Dec 2025 01:46:04 -0800 (PST)
Date: Thu, 4 Dec 2025 09:46:03 +0000
In-Reply-To: <20251203212558.GB3060476@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251203212558.GB3060476@ax162>
Message-ID: <aTFYWyUE-ln5KrsX@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Dec 03, 2025 at 02:25:58PM -0700, Nathan Chancellor wrote:
> Hi Alice,
> 
> On Tue, Dec 02, 2025 at 08:27:59PM +0000, Alice Ryhl wrote:
> ...
> > diff --git a/Makefile b/Makefile
> > index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328dccce5d60f85526f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -517,6 +517,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
> >  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
> >  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
> >  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> > +LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> > +LLVM_AS		= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
> 
> Please keep the binutils alphabetized (i.e, put LLVM_LINK between AR and
> NM).
> 
> Other than that, this seems fine from a Kbuild perspective (but I did
> not look too hard).

Sure will reorder.

> >  else
> >  CC		= $(CROSS_COMPILE)gcc
> >  LD		= $(CROSS_COMPILE)ld
> > @@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP := 1
> >  export CLIPPY_CONF_DIR := $(srctree)
> >  
> >  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
> > -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
> > +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK LLVM_AS
> >  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
> >  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> >  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 3034e294d50df55c4003c5fa5df442f59e711bd8..e63c5eb57b049aff988419ccd12dfd99d59f5080 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -3427,6 +3427,21 @@ config RUST_KERNEL_DOCTESTS
> >  
> >  	  If unsure, say N.
> >  
> > +config RUST_INLINE_HELPERS
> > +    bool "Inline C helpers into Rust crates (EXPERIMENTAL)"
> > +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> > +    depends on EXPERT
> > +    help
> > +        Links C helpers into Rust crates through LLVM IR.
> > +
> > +        If this option is enabled, instead of generating object files directly,
> > +        rustc is asked to produce LLVM IR, which is then linked together with
> > +        the LLVM IR of C helpers, before object file is generated.
> > +
> > +        This requires a matching LLVM version for Clang and rustc.
> > +
> > +        If unsure, say N.
> > +
> 
> I am just curious, why would someone want (or not) to do this? This help
> text does not really indicate the point of the option, just what it
> does. Is it just the standard tradeoffs with inlining (potential
> improvements in performance due to better optimization opportunities
> versus text size increase and icache pressure) or something else?

Basically you probably want this on if you can enable it, but
RUSTC_CLANG_LLVM_COMPATIBLE is actually a pretty harsh requirement. If
you just install rustc and clang, it's likely they wont be sufficiently
compatible for LTO to take place.

I'll expand on this in the help text.

Alice
