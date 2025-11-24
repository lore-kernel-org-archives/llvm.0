Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19E274B2B
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 02:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763950373; cv=none; b=T34NgF0i/2yWuynhDumE9yji3cLR0B7jV0jcrKqy9RJNZ7aVfDVfIo9nUZREfP4gHD4IPfCQzZkcVO4EjeOB8rc1/ZldmB8reJ1vUI4hmv4BRqVLA7zTUdy4BTfRAgM/zrm+9AF7m1mrm6e7vS2bpTzjml08LqydTV86cCyKqXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763950373; c=relaxed/simple;
	bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sy3jjDi+PZH7ZEAdcFugCIS4NMQomVB5n7EJ8KwiqsIcMa+5VeMedWpo1vKIXrPzNF91RSPdo2idsBShrw6fsFRSUoPSTgsdSyPuRrivX/SPixhCVwrmJGT/Jg4nZ0UhiWymAU3Q/dFqnlayMKhCDRiAkCasv8FDgXNhBe+lCWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL2P9m16; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL2P9m16"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bc0d28903c9so415667a12.1
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 18:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763950371; x=1764555171; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
        b=IL2P9m165LyQ9EytYTstdrS42mWCopimZpivnTM3LkAVL5UENQK39RoIORgnfxB0Gp
         CTYRqTX6luN6wDhd2iqcOm3YRHbG6r5yVKIaTSTnF8QB/61n96JfdOU/d4rk8BZ/+0IV
         uHkcj9+5IM1hPmhmUqubPiEieB/KwonY+dncEezPP3Sl4+92Vdz2D1pnDe900KOUt+IF
         h0OcbD1C3nukpppmi3b6p9OHRFaZf7FY59XNvW91RvVJP9LZwY2ePt5BdCYN7BU+le/+
         3PJhZDKuhNeoUZ5Sgf0U1BTl7pnfmZ+rKTx7ZKoev3wYWp7qghAywO5hJ0rDOE5g90CG
         5dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763950371; x=1764555171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
        b=OgnbVXWuZgGs+jsU+IH472Iwtw2gP2JYkwukKiECpls1DIjAhDW8hJfVEL78wJAQ51
         ks9ZOwEqELBzyRZxp4Ye3jSr58+hDwVz6yIM8EEZkPmcVnt8EehRMGGFtXmzfS0YQy9K
         vTvX3Iu00klTTWRx5LExlztv7H3/3SVyVgBSnWj4+wnX0mOAY1A1ia5/BJpQNJyhQV3c
         39qaEsevWOQGgCiWHF0s9hCcZkl/21RHgvnT5rV3yK+OEqveAfb+TzMgOpIdyw8fKPul
         A54Pc0web5wvA67GdaztiTRT3EORsIoy4bDH5s5tBXz2OB+R6mf6x6IbQsqMTNbf7Xb8
         6k0g==
X-Forwarded-Encrypted: i=1; AJvYcCVd2EoibwJkMG5WfybC5F61W2jTKPSNI2//y/Gxj+T4HwTNdkV+I7gXsS98W6u8pBoOWQZa@lists.linux.dev
X-Gm-Message-State: AOJu0YzeJwCU0hYztKTx9pqPpSlgQjaEpyAnw1gIWr+wPLWFnYMzUZgH
	LdZgEapLRQJTWNi4FEronqH6O6F1SbsRR6EWbvT3FH20UUmSBllAygRWNWrS9bfQF36sW2OXoNG
	Df2mJ+xMj25/2kiBbDg6NYaf4AQKceyw=
X-Gm-Gg: ASbGncu3MiXWPWwifd+muUGjAHLlxQBUHLtmOnNIgfRvWd5Kzmo2ON/iQ88nRl89lU8
	7+PZMWc0Jcawfliy3fMBcWmOb26TjbNkTjlCgYU936u8lLb+weiz2oENtQzoFUVK9O5GkcNAX9g
	YJfiYyg+oEGhJ0mrlvWTD8/tR3K0Q1BNolfnekHTPIsbGBJ1yMS5yICE6/CtRXEFNpxGnqURpEY
	zGNpjJIltw2yXaTNIwDyBgfGrn+b/fO1IEFcIaiAcNFpvLVnrgChENL3jTPl+ZwV5iirqqL7nwd
	cqqoxXL2pDOk+Qs4AJf/JMxQ47q01YW2n9X7W0wUQI1S3CtCkRXyOBEWTswk6EdIrnJ95RhEThx
	741R/dZwM2IORBw==
X-Google-Smtp-Source: AGHT+IHMCycU2281yPoFBzJFehZlNjB/ZN9Hjei9e72GKfP8tgd3hQzDk2CQxnkWDDEZel2Cwvh5/pcBmY7xnByerRc=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr5187728eec.2.1763950370685; Sun, 23 Nov 2025
 18:12:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com> <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
 <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
In-Reply-To: <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 03:12:38 +0100
X-Gm-Features: AWmQ_bk9WXKruglIV497fNSKDmodqmzo_KTty7zsHwpLGLPWQoinN8LfqHHSZnM
Message-ID: <CANiq72mZ4uLqSe=WvoCtUR8cEiVpXBg2yB-7oFPf9jyu=QxS6g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 3:05=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Sorry, I may not have made it clear. I mean all these changes.

Ah, sorry, I missed the "conditions" word by reading too quickly and
misinterpreted it, my bad.

> I had some contributions in rust-lang/rust repo for riscv64 (PR #131955,
> FWIW), and I'd like to be added as a Rust + RISC-V Linux maintainer if
> that's okay for you guys.

I think having people explicitly listed like that would be great (e.g.
in an `... [RUST]` sub-entry to the ARCH one or similar, like we do in
other places), and it is a good way to contribute to Linux. I was
thinking about it for other architectures too. But let's see what
RISC-V maintainers think about it.

Thanks!

Cheers,
Miguel
