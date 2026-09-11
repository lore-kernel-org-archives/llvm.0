Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3DD415F36
	for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160469; cv=none; b=S/D8xOZJP3IBlSOU9+HnIhHTxq904/LAWUc+0eXkt1MoHgpBzY2zrCkGI+3Ohb7M3Jrr2U1dLXReVIUPnD9CXj1rlLgWA+x8j65rJgaRfKrlO+S/1+y/ta7hHb55fNqX1wc9KKEeSpiZBy47cTyXEl14Cjek1qWzwyVj0Xot5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160469; c=relaxed/simple;
	bh=/W6FCmv5ibQNEpHI4GROMvUWyoZn8nstXtz7Y5px5C8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZjVVoOQmtTmunJPqbI1BfYRyixJzaiZyTy1igFEZjq7LjRPbx51qU7YHxaRvvUAQ1A1h2mjDKgJpG8KF6FJWQILZwdbaF4BMzkh+QryJfledwBVBED6k83its0N3oND9fj1SekuC2qPwgOjxjgoPeIVgREl/BRDED5RhKl+F9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvSPi8IB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvSPi8IB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so133604f8f.3
        for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 14:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789160465; x=1789765265; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W18BjSa6bE823jCNrSo5QAggwLMczPlVTE3fEsKx2B8=;
        b=KvSPi8IBe2vgS5z7F/3iTF3DhQY6teukVRJ7vYCPqy+VA9edRHq+DWWLCkeB4jxU43
         G53eulpFueXkVMEAr8jQ5xJj7Td/0kI4MUm6ZNe3/aoMD8CsdA3gY3acipTvex7HGBAu
         QHyg1Nt77jQah0C+T/2N7nNo4xqJSDj57bzuFtfBTzdHwqVIXFcX5qxXqXaP1tnwbt0G
         z2pnpv6McWa1+zTTLoAf19x0hB0mIPaFNP10H2qwUDZli1IBGWqoxmxQgaeOab3+Jq5P
         ymFb4xYv3jV+MctSdUCQ94C9CSXbTSJQIp7DKRj87+RKC97MTvScwmjYZf77wdwZyMNo
         g/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160465; x=1789765265;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W18BjSa6bE823jCNrSo5QAggwLMczPlVTE3fEsKx2B8=;
        b=iNuGt+Qz9WWW3iDYnbDGz4tpNePjKfOu8mcBX8XJDW+aZ61kkFgUe1lPzaGZbFyUN/
         THnNWzi83voj+mJv0519yoLp9TQ1LhkzZwScUzT9sSW2rzBvssjO6HNQgnpcyQaaTdoq
         xlLP51392p8zwokI7SkQGcdbUnTpj4rhI5qtcmTZKpdiNGl9OuqKdnyH+lv6IxkRIqjA
         Tz7fIwmfYYPaF4MujHKWtLegRT+m6J/NBk+Ln1RXPxGtbIvgcK/fzO2ZCeu3fX/8VrW1
         w1y7XLKuAZ3WJADBfPn3ChMh5yTmfKJZpiW2xtk7JJGobdgNhriIdGFrxHTZqOuZ816P
         92OQ==
X-Forwarded-Encrypted: i=1; AKwUvByMEDHMRngKqvINzfj3WbGhMsv8olm12CNBvQGQqP9kxDl554tdcAIMf6nkbsoRdNTiJRm+@lists.linux.dev
X-Gm-Message-State: AFuF++lSN3wOdQVCLRI14vkgK7200P2d0XCKYBAeWodw7LSNi0JuDH4G
	Z1+Xe1e1m8qE18mrdfpGa8kfljudI/TxQwDrpZhcFhQowkuOs+4lHIk6
X-Gm-Gg: AYBFou3rTYhaGajImLm7QW+9n/10f1y0p2Y8Zr5wBfPk7WM0XZOuwJmtZUaE0O4IKxT
	GT5xZOXhgZPQOLHbP+2ceaj5l7GcD4R7pzp34om1IzCdgG55CcpbCFc18Mma78HyMIVl9DDYFmz
	VMBXnbq0GjzN1pBChkqOEDxVXCbJZDCYbFDn12fplCH6tVtFYwITglVyQfPQJiOvivCWcWQ083Y
	laYp4+RTHsF1ed29vK7TJ0SGeReq5j7bch4ltRJP09GhWxB8tgGSYwjfrGo7iNaggShKyaI3lP1
	hF45kMK3xb+M4Y1X8VNSSPpIs9Nkyb8XCvQErhnSK+Iui7EskhsdriRe4YEunwkFuHnkSO8slw8
	HOOQoeX1Cd7AqdLl1J12ZTBwivQeD5WdNguK5t0bY56JqRkebD9eguuMkJ7Luww6dRVR0APeOOn
	j73vVTKjSvsor0mrcZBoO9QGvgIosh1uLGiRkStOr8SWAjOeMrWxtNZaUPHJ89DN1HFRIQM5vMo
	NHK7kvOE+JY748dtduqGkbSHNdRjg/rNXKo
X-Received: by 2002:a05:6000:646:b0:485:8ca8:caa with SMTP id ffacd0b85a97d-486eb34c229mr5448307f8f.52.1789160465448;
        Fri, 11 Sep 2026 14:01:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm7798317f8f.30.2026.09.11.14.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:01:05 -0700 (PDT)
Date: Fri, 11 Sep 2026 22:01:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260911220102.1d3d696a@pumpkin>
In-Reply-To: <aqRGYXKDzXZMXmmp@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
	<20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
	<20260911183333.1df0f2e2@pumpkin>
	<20260911-invaluable-indigo-seal-e31aec@l-nschier-aarch64>
	<aqRGYXKDzXZMXmmp@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 19:24:50 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> On Fri, Sep 11, 2026 at 08:17:57PM +0200, Nicolas Schier wrote:
> > On Fri, Sep 11, 2026 at 06:33:33PM +0100, David Laight wrote:  
> > > On Thu, 10 Sep 2026 17:42:35 +0200
> > > Nicolas Schier <n.schier@fritz.com> wrote:
> > >
> > > ...  
> > > > Yes, skimming through the patch, I thought about that, too.  Moving more
> > > > cc option checks to Kconfig will make building out-of-tree kmods with a
> > > > different compiler more dangerous.  Maybe we will have to make the
> > > > warning in Makefile's prepare (external kmods) target a bit louder.  
> > >
> > > One problem is that distributions have a nasty habit of shipping kernels
> > > that are compiled with a different compiler version to they actually
> > > ship as a compiler.
> > > In some cases the versions are clearly the same - but the version
> > > strings differ.  
> >
> > yeah, I guess you hit the mark.  
> 
> I mean this is a problem that already exists for any flags already specified in
> Kconfig.
> 
> Out-of-tree modules are historically something that we don't go to great lengths
> to support and haven't historically worried about breaking, either.
> 
> I'm sure distros can find ways around this if a problem were to arise. But I
> don't think it's something to worry about all that much.
> 
> I expect a _lot_ of these, in any case, would only require the compilers to be
> within a fair few major versions of one another anyway.

That is true at the moment when the version of the compiler being used
is checked.
For instance it doesn't matter if modules are compiled without 'asm goto
with output'.
But if you putting the options in Kconfig the compiler being used better
not be older - or it might not support the options.
It isn't too bad if the compile fails, but some are silent.

IIRC it is Ubuntu that has different version strings for the same compiler
version, and Oracle that ships kernels compiled with much newer compilers
that they install by default.

David

> 
> >
> > --
> > Nicolas  
> 
> --
> Cheers, Lorenzo

