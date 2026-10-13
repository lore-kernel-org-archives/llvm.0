Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C553F3815E1
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884209; cv=pass; b=einCgIEABUDf0SIBpxkn7f+Fg+wp6R8Gi8dRdJYHxL0K21ICbAgOzU6MiEgiezG5gvCE0K56W32plMKiib/FBTtQolzhUgVY+04/f1op04W63LMXBn20q9I4fDdLFX6YbhEVivWO6snf1RzaAubDz/B8hF8F3QRHbhm8K3C+9XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884209; c=relaxed/simple;
	bh=I2RdC5E/xdt6kf39B4bXuZ6oTCgSZu3FzLdqV73aXEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHlqQjdtHsJfckNX3FWAF4/Y9GqWCE/RZ5FS8kLHgN+QmZAtVNzETQ9pWD8g8UcwIy3fgX2pXSJVtaFd4KORmU8E5WUpve2ZY5L5NtQYdPiOGvQDTaq5IRAE0q/zJt/2vN4IcjL9/HMXydfwYTyVmE8tsJ3LwWz7ofzgZsNw8bU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l27x3CgI; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l27x3CgI"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15168a20b47so1762491c88.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 02:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791884206; cv=none;
        d=google.com; s=arc-20260327;
        b=W3pSID/YUq5ZTdbIbNrjhtBJgKK25GpmbGl7O1sjX0or4Nx+w3VJ111g/+5BY73OZ5
         SKMA60UnKvSH7UwlkBRi6d+eSLyPOUCVZ0XSGClnJ3plnrait8IK24QwNDgSMxtcfo9W
         0renFKuEFPVZLMn9UVDkpV8NtBPvmd1i8KqZYPI5GXTtFK+ZWBvg73sEIiyArzw0nebX
         ZWq8QxKeyVfsTBkV0jLeIdR/AQqsRAI4jgr679uEECkVcCfITjgDDGYagMILVke7bk4f
         bWCFHwlutDTXBUyrYYGOug/Wc8qUsPpQ/DQMH4InhZW1Xb2ZeLz+IHOGhj9vsMYGM35+
         W/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        fh=GEZGg7CGm2BCgFsNx7kAsOXobE9J8ciaXPPFRK4YtWw=;
        b=HMitqyRKbpJb5gUbu/wYkIWRWzzDLXsHpYjKhwkfbMXt8nIsS3Qs/lL+XYBGbSV711
         nLYelv8VYypL3V0sdOdS7S1KMw3h8JnqW1xeyOfOSryWt4ECb4c+CJOAjqFRkg/4Eg6C
         MMFlA0mx5rySw5cxN++jBTno08BwsslLkC8JLn8bvo9GneO7EvT2P/BARFFCKk2bCIgR
         inLiBmxw5Zg5mFXgedKsF6vFkK/GYnltFXKW5JPIttg9uPb3db6U278/B0THh1rLvAoY
         u9lbGsdwwHMlPslHhAtfMurPPtI6kWS7bIVpYrTj14l/nveAPX66R9p85iFACQr4s/gi
         IJrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791884206; x=1792489006; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        b=l27x3CgIe8QB3x7C4pc5clVMZKTdMAG2MRBW7eHja+sFjx2xYNiO3eR6U07FvdESRy
         BNYL5hFTRzzCi/4VhPNPXepheT9Qd0Km9+dWiWpH7hQo7hg/q9tCVyDe9rn+FcnkdVG8
         8HMWc5ptQbBPsqPlH8un7weDC+j8VZKapbi4hTlllkJpTRh+iX4ET12XT6f+CQey9C/d
         8HK1wFER0ka3r3IVqURkcxnOEboB87zVgWs8RwJrKkIXnHbIEDh4B8446GB14k7Jx7EP
         +Ybd7LkJ6iAaTcNGuLsO5G7gIT+ySBqPnfVo0C4C4ah0pidfSLfJVU2tRr+em7xyotUV
         abKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884206; x=1792489006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        b=ZnPIxc5/nGtJaMkkKuR4Ux+xhE8ZRuW2ADS8H288GSaE6IzwceBFgCBfKBaXTpXcko
         hYNGi59561jXdyhx5B+GivS6izQ5N2TWlvROMb7IWX3FQ9MasJtAAN8jaFtf77QQNkxH
         usLLMbU9Pl9Mv0ygip5Y1D9zoVxr8U80XHx6iAmaqOPvrHZsVfRIYEy9JrZ2JNQdchEi
         0lO92WJokW1ZSoQPpad0qaB2HR1odFxUQEjcNwero6wNcq/E79eptemXRhy5qjI0KwLS
         62AfQIj3/S0FNlQLKbG+TxSJ7Wnv++j3D40nucNCOzjvw1aPdnQqVuUmwQZZf5kqwnSD
         dB9w==
X-Forwarded-Encrypted: i=1; AKwUvBy1LEM2nG/tKipNjUSQz9O5wWXcFYmI+Fu/o5kNnx+o0CTizvm/ayOSN0/gk+GVCTIQaK0S@lists.linux.dev
X-Gm-Message-State: AFq9FYIf3CHK3gHX/Si3OsG4RfvukG88jwzNR/VaPmUq4GqO24UGx089
	t7BH7O4bWuVBrkIBEInCf7Rexf/oZCEvsn5rOABzS80HO688sfzgozjqQos6VznYk62hkgbfT6m
	NNI19eyH8dFqoKSZv97tz1v0a7QTUq3WGn1UuLvEw
X-Gm-Gg: AYBFou0J9ZFocSqPouSbLGe8Z2G+KOx0BUQv3SfdE6DI2hTq+UfbtfIAuUQWCMjhpWF
	MN/sXt9OuUiSqwy0K9A7n8M39ZC0BxMeVMBIFGtCcMamtRYEP+leu1Oo/xp8NFWFR9bX59aJcfZ
	H1NWxU/kAGA4xrx0wwH/Zlb/vByQHEH80OxgussrsTHEIsqerWFn1WaBuzCSy97/4mFdCw3o1s/
	CHzonCASR75E6eowkCsx8fR2RmnnsRHOeW9YVVece1josL3OxhVJ7XNfDaDH7gFAr/ATpBswXzy
	jZ4J7iDFiHgOolREMQNPkgyQAl6tr2B3sh2LC2zujKpES5g2iMxasVb+RH80tp2aKg2RvtyWyV6
	VSO6s3EGp2w==
X-Received: by 2002:a05:701b:260c:b0:14e:8d1:1012 with SMTP id
 a92af1059eb24-16a5eb5248bmr15061808c88.19.1791884204773; Tue, 13 Oct 2026
 02:36:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 13 Oct 2026 11:36:07 +0200
X-Gm-Features: AclHuK_Q4zmkgXJ_aRet6tsAebmNwBt0xYiVjRfJ2laZogHRXSQmQgE1FE155EE
Message-ID: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> +ifdef CONFIG_HAVE_KCSAN_RUSTC
> +# The minimum supported rustc's LLVM supports all of these options.
> +rustc-param =3D -Cllvm-args=3D-$(1)
> +kcsan-rustflags :=3D -Zsanitizer=3Dthread \
> +       $(call rustc-param,tsan-compound-read-before-write=3D1) \
> +       $(call rustc-param,tsan-distinguish-volatile=3D1)

Do we also need -fno-optimize-sibling-calls here?


> +ifndef CONFIG_KCSAN_WEAK_MEMORY
> +kcsan-rustflags +=3D $(call rustc-param,tsan-instrument-func-entry-exit=
=3D0)
> +endif
> +endif
> +
> +export RUSTFLAGS_KCSAN :=3D $(kcsan-rustflags)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0a4fdd8bd975..78f1c23e54be 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -98,6 +98,9 @@ ifeq ($(CONFIG_KCSAN),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>         $(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-ob=
ject)), \
>         $(CFLAGS_KCSAN))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +       $(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-ob=
ject)), \
> +       $(RUSTFLAGS_KCSAN))
>  # Some uninstrumented files provide implied barriers required to avoid f=
alse
>  # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation o=
nly.
>  _c_flags +=3D $(if $(patsubst n%,, \
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index 7687b0dd5474..4b02bffa6b46 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -231,7 +231,7 @@ fn main() {
>          }
>          ts.push("features", features);
>          ts.push("llvm-target", "x86_64-linux-gnu");
> -        ts.push("supported-sanitizers", ["kcfi", "kernel-address"]);
> +        ts.push("supported-sanitizers", ["kcfi", "kernel-address", "thre=
ad"]);
>          if cfg.rustc_version_atleast(1, 91, 0) {
>              ts.push("target-pointer-width", 64);
>          } else {
> --
> 2.56.0.385.gd3acb90ef8-goog
>


--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
