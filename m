Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF84D34028D
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764853421; cv=none; b=dayZeaaW2DKAHkfK7hs3ITAWBqwXP1J/nZUtEqkHpWeIKATv+VCKj/dnqcu7BeaKOsORgce5Xy0cxXGaZ5aZwxoq63PWl8lIgF6/1Xn659ak2np3j3kcri+hMc0CTiN4GEy5R1CF2j1cRnYVT+2UmOehDtF01MVmGQIOcM2UZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764853421; c=relaxed/simple;
	bh=DZKv42qa7v+jlPt/J58c7v92f0tQGg3ENDSxzC+0QxU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nITfjGnsjeG4msfPxIikovxWLvPqMDJd7ZoDJqSpyjXcfPr4NuI08zG8RO6calyVPJT6jSB7sWpBLGBIWDinonxswhLO+eklVYK58km8SC8Y7gPpj95mj+DqHWbMh7y9y3plKLQXw+Ft4Hiw+iTddCQu4YfJTPTnWeC5mVDeHrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XaxpOws+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XaxpOws+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477939321e6so6247095e9.0
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 05:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764853416; x=1765458216; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHv3hl5kxLsYbFyLkQO+405gPeY3rXV12cSRgU/67FU=;
        b=XaxpOws+MmuHQmrW9cdif2FOQgkcSJOTLDGqpoaYDxTOy3NAk/wDtikk4vvsFIJ/Na
         2tfx1d9aPnNQSUYRhOc/tyDHZJcEZGHwgB/aLtCMaCwM8OK81JmfTIR2tEneupT9CopS
         /eaxU1UQ7QWyT+mBj1flapoU5ZhAHIRpdO8522ImgRrMwF6ld3K9UvUocZenFidqwtzT
         izUDYoDdX2KFnq7m/Aphl/f6qEO6izf8W6lavPMbHxJSVV5tR2K60bbac/a+Uw+982kf
         jeuJc8i4GNfMAI3FX6McS7N5WjTq1Dej2pc1fKhKjni/vw8jbIm6uSdw1P6YESy9/3YB
         ZsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764853416; x=1765458216;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XHv3hl5kxLsYbFyLkQO+405gPeY3rXV12cSRgU/67FU=;
        b=JQYUSJYv5HPBVrqV5pnZ9/C2wL4naSr+gbqZzg21vOrB5XYGnsetMTGHZqjzTOYUFT
         XoCDPp/59ho9ZY87QNy1+DlIPagYaxNBbBq8f+RkFReWWoAljgjL9QMcf/q44yK0hwZ0
         YXcSy/9cAhMtWmO+jizX5PjEFqzoYtbnXOHl6SMCLeas+x0DywD2qCw/2ag1+++uzcko
         8tV1Hpyk4zN9F1T9cgyXh9Gfek5ONWR/dfckiUfpt3MfUABl0rzeK2oQR+21f8yP8qrv
         2k5F9AKhkVhdOIcvwtvvmEi4BDRPq2TFUrCCEPxAqlIxAjXUoaV0JQ/1VlJUO4z/p07H
         KXRA==
X-Forwarded-Encrypted: i=1; AJvYcCXHyNgj19xRZ1vF4seU+YIpKTOSldCCn1zgJoOFg5Dj+ZyodZO6ZLZzS4JGJltYJhYF4Kka@lists.linux.dev
X-Gm-Message-State: AOJu0Yym7ci29AbST361WrHciockJs94jCqXS2ctcYYIe8PS4z/KlLtq
	6ITpJI3ozLzRSiTodTfOPQu6/Npix/ZSqmB9Gk8AFzndIyBH+ZbTVKtGsyF+vaWK0SkogbEYh5T
	k//KzJzEnlG+NAaFWRQ==
X-Google-Smtp-Source: AGHT+IHesTuadwDk2buktyr5KdT759hnUgQEo1wC+McdN7/pwalBTRVnkgrSBeIn+Q+0wMXJFuvSYefcIW+twrM=
X-Received: from wmlu6.prod.google.com ([2002:a05:600c:2106:b0:477:5c35:1b95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5246:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-4792f244c5fmr28025045e9.4.1764853415686;
 Thu, 04 Dec 2025 05:03:35 -0800 (PST)
Date: Thu, 4 Dec 2025 13:03:34 +0000
In-Reply-To: <20251204123906.GL2528459@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com> <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com> <20251204123906.GL2528459@noisy.programming.kicks-ass.net>
Message-ID: <aTGGpsbIYm1tXMDY@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Antoni Boucher <bouanto@zoho.com>, 
	"Emilio Cobos =?utf-8?Q?=C3=81lvarez?=" <emilio@crisal.io>, Arthur Cohen <arthur.cohen@embecosm.com>, 
	Gary Guo <gary@garyguo.net>, Josh Triplett <josh@joshtriplett.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2025 at 01:39:06PM +0100, Peter Zijlstra wrote:
> On Thu, Dec 04, 2025 at 12:57:31PM +0100, Miguel Ojeda wrote:
> > On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > Right. Earlier I also proposed using libclang to parse the C header a=
nd
> > > inject that. This might be a little simpler, in that..
> >=20
> > Yeah, that would be closer to the `bindgen` route in that `libclang`
> > gets already involved.
> >=20
> > > ... if you build rustc against libclang they are necessarily from the
> > > same LLVM build.
> >=20
> > So currently there are 3 "LLVMs" that get involved:
> >=20
> >   - The one Clang uses (in LLVM=3D1 builds).
>=20
> Well, being on Debian, I'm more likely to be using LLVM=3D-22 (or whateve=
r
> actual version is required, 22 just being the latest shipped by Debian
> at this point in time).
>=20
> >   - The one `rustc` uses (the LLVM backend).
> >   - The one `bindgen` uses (via libclang).
>=20
> These are not necessarily the same? That is, is not bindgen part of the
> rustc project and so would be built against the same LLVM?

Rustc and bindgen are both part of the Rust project, but they're two
different repos:
https://github.com/rust-lang/rust
https://github.com/rust-lang/rust-bindgen

Generally you need to ensure that bindgen matches clang. This ensures
that bindgen and clang agree on the interpretation of C headers.

> > If that is all done within `rustc` (so no `bindgen`), then there may
> > still be `rustc` vs. Clang mismatches, which are harder to resolve in
> > the Rust side at least (it is easier to pick another Clang version to
> > match).
> >=20
> > For those using builds from distros, that shouldn't be a problem.
> > Others using external `rustc` builds, e.g. from `rustup` (e.g. for
> > testing different Rust versions) it would be harder.
>=20
> Make rust part of LLVM and get them all built and distributed
> together... such that LLVM=3D-23 will get me a coherent set of tools.
>=20
> /me runs like crazeh ;-)

Maybe clang itself should have an option to emit Rust headers, taking
over the role of bindgen?

/me runs like crazeh ;-)

Alice
