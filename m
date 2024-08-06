Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40B74E26
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722969049; cv=none; b=goPXwTQFs96MonZi0pHAd7PTmAG4zo7bmOCtbQC8V1++PBOkiqEH8jBTcW5j0UgP7kqmGa6LGxNN2aWVb14fztYaCcRV+ZvSa0E7/1YjvK3DA8D1xAkOH+pZP66L3z5+6ZkbSFaPgRBpsCIuftLiJNpDND47wpFo93ZtBCZsuEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722969049; c=relaxed/simple;
	bh=oe38/BA3I3GPzGRZcA4tK3QobjJz3lxhxxE69sqobgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxtrWtmSCAKm3URQlTop17+F4D3P/f5qd+m9KQKAQf6m4/cZQzVIEkk/N6OE6jvCT4s8ANTN3ZLktlcNPZ1ZdZGhTp9EAcNep627xWQwDirglJqL+orxqBaDPUMiqtB6RbXymfXim0OntDJ6CmrQJdnJySLfMU0cexyLNRap+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=EBQZWnRO; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="EBQZWnRO"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6512866fa87so10195277b3.2
        for <llvm@lists.linux.dev>; Tue, 06 Aug 2024 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1722969045; x=1723573845; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJcjEsELElj17ftf1H3NNxeE2XuKAN8uQ1oS0Kp4OuE=;
        b=EBQZWnROFH2TmQ/C8W1LjjF33v0uHgmALblqwqjj9QVCKqyJiV6cMe7iIbtWkaNLHg
         GDiVHCFutPXCy1h7ZmBQE3h3lZyMkBOwaVPj0BIdmQYf1plbuOznnmgMgffpYRlVEUJP
         atbf+hUfBF8FhSAli8qhRsMFv/f9Hr04QkCdVsmWLwR8Xe0fjtTYyIdbxraoFlsvYDJf
         8PajRInYzYbcv5vMe0pP3qmugYWKcrZTpVFPjbR76RLyxZc8jJGVUbjr0UZPrnAEjmG9
         3gJH3ZovmNz8wPuK80lkheKKysiqr23C9R2wiDhEZR+k0sD76LNxxCMJIA28JL4IVtjW
         hKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722969045; x=1723573845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJcjEsELElj17ftf1H3NNxeE2XuKAN8uQ1oS0Kp4OuE=;
        b=XocDoMsYZO85e4+ZgqVRBQYV6P2EQCkd9UrrR5Yrb7O0SdZfORkoxOyD9qA3sFT4sT
         2BHp/bine3iGvnTwGcijh0XOPOVfdXhqKi3mnGBzgrvP2KDnYMhpXsm5ebMxduUnDKnd
         F6odN8ofLI/9vG4bZIzojFGqAU/8jLB9iymJ4dJKh9Z4ymx/WmdGw4Q6IiYplpbnb6iI
         WUHFonxo2CpBQBGbG933tcc7FwcOYEKuyXw1drbbZIdZI5BJO66bduV/CrIBMIxabiB1
         SFXj0NrghXlHXfckqXSfZchGMYJ2dmVr3t83Mlr5t50NGhs5Xn5Da0ya/i6Xuq7ntU6i
         FUoA==
X-Forwarded-Encrypted: i=1; AJvYcCXuxnvErejAHT6P8hLGkYcG9w/7rtrcgGKTc943hsIOpdSvpL58cMQ/XXNxYqGRXDkSOSBfmOF53+GorExxaR7XksixEg==
X-Gm-Message-State: AOJu0YyUdDLthjXFcEc2QiCeUq2xIR0Z4kznTF+aJ1yA2MfMuGNakMY0
	YDNvzL3HPUPq09rEGNXPcSrBDsGUCOluZoe+LZz3/+N7Ld2mlRZrPAwjaFBXL2uc2/7Mp/R4vUZ
	4LUyTN2m2Wepwi7OV6ivV532BqYuvphT3QO78IQ==
X-Google-Smtp-Source: AGHT+IEi5wEKcxYijrCG9lZ62HVarFC1N/dov62z2Vvk1px7mbW2C3yfR+rXHXlo0cHub/OfafmZkMejgkYcoEw+XE8=
X-Received: by 2002:a81:5b06:0:b0:65f:9e35:af1a with SMTP id
 00721157ae682-68964590c97mr153755347b3.41.1722969045434; Tue, 06 Aug 2024
 11:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240806150619.192882-1-ojeda@kernel.org>
In-Reply-To: <20240806150619.192882-1-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 6 Aug 2024 14:30:33 -0400
Message-ID: <CALNs47swnK6je1o+LOLUFCDEZJmQmZx8vZ+7MPvUbNKdFr_Q_Q@mail.gmail.com>
Subject: Re: [PATCH] rust: add intrinsics to fix `-Os` builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 11:06=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Alice reported [1] that an arm64 build failed with:
>
>     ld.lld: error: undefined symbol: __extendsfdf2
>     >>> referenced by core.a6f5fc5794e7b7b3-cgu.0
>     >>>               rust/core.o:(<f32>::midpoint) in archive vmlinux.a
>     >>> referenced by core.a6f5fc5794e7b7b3-cgu.0
>     >>>               rust/core.o:(<f32>::midpoint) in archive vmlinux.a
>
>     ld.lld: error: undefined symbol: __truncdfsf2
>     >>> referenced by core.a6f5fc5794e7b7b3-cgu.0
>     >>>               rust/core.o:(<f32>::midpoint) in archive vmlinux.a
>
> Rust 1.80.0 or later together with `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy`
> is what triggers it.
>
> In addition, x86_64 builds also fail the same way.
>
> Similarly, compiling with Rust 1.82.0 (currently in nightly) makes
> another one appear, possibly due to the LLVM 19 upgrade there:
>
>     ld.lld: error: undefined symbol: __eqdf2
>     >>> referenced by core.20495ea57a9f069d-cgu.0
>     >>>               rust/core.o:(<f64>::next_up) in archive vmlinux.a
>     >>> referenced by core.20495ea57a9f069d-cgu.0
>     >>>               rust/core.o:(<f64>::next_down) in archive vmlinux.a
>
> Gary adds [1]:
>
> > Usually the fix on rustc side is to mark those functions as `#[inline]`
> >
> > All of {midpoint,next_up,next_down} are indeed unstable functions not
> > marked as inline...
>
> Fix all those by adding those intrinsics to our usual workaround.
>
> Cc: Gary Guo <gary@garyguo.net>
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-Genera=
l/topic/v6.2E11-rc1.20doesn't.20build.20for.20arm64/near/455637364

Should this link have the `[1]`?

> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile             | 4 ++--
>  rust/compiler_builtins.rs | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>

Also submitted a fix upstream https://github.com/rust-lang/rust/pull/128749=
.

- Trevor
