Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A435CEA3
	for <llvm@lists.linux.dev>; Tue,  9 Sep 2025 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437941; cv=none; b=ubL1M/bwBW8lDlcHQEIqDN+UBS2q98Uk8IFNtpWvHRpjfw81gA0hdVHGwr/N4H1rx6Bg2qKkFLCULTIHzsTEgK9DsYfMop5k8RtUWhXn945FMPP36lzIXyZIV/Rvu9a0TVu4l548Ur4aZMisuSjRkuWfAbYCi+qNwDwF6USGFBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437941; c=relaxed/simple;
	bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQWcaFZq49KiyeBJ7buwNkGcZaeAXYLASdLpSXB2/GucfX59e78Z/mqoFG64wL5Sfjg7dtvlvwO5KMbvp5f/q6szTwWVxea3GeItSV9gaxtfv8TMuQeBHdxipqApj5vtggabufp+fyuB8brhGCafDu6FCscftpWZWT4WMenjoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtOhorse; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtOhorse"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24cb267c50eso8817685ad.0
        for <llvm@lists.linux.dev>; Tue, 09 Sep 2025 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757437939; x=1758042739; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
        b=MtOhorsew6eAwDGiQCScCsBy5beq3yqlbnnJe8aA1/FrTuucYhfWWoiB47OfPbUwsB
         R2ipg7H9Cm6LYCcZCbbqrOqXOcf8aDMzdwTA0ifdJlPzz3mmMTfTEqNX3d7D4U5XcW/c
         TS9Lc9jWDrQ8OYqJrH5MsXrx/ah2Vi5NxxODiIhG0TnmKmLjG9E34B4xi6a2IiL5j8md
         xb9/sQRgLcdrWyo4ISmQ3GVXrzLIsC+sPOLwEEHqbRl32UERszL1ZAc9oQyrdwjbnsFS
         VEsUXuL+KbuD54vUkBE3N1htW/8alGZEH+Y11HWckRDGijLvOv4tNj61Tai4RlHEegyG
         yEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757437939; x=1758042739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
        b=Rnw0nnu+kCiwOgNmTDIFt7ZAXx8wx3kQ91sBD15IzyKq5Lrrrz+GxuJrH3wdhxbgQN
         jFGcxEI99fyD+scDIluK845a6psi7nYx6zYC7/rK+qkbpn77QS4fi2K681L2pRH6H46f
         DcJoTtWmUPZDlgh5xyOx3HZK0c5wnLifDGdqhmTvshDVKfI26rlmtoqfaEefKKMqoAjF
         Ey8H/xtv79bwN5Eb2jNLLW+hTSpmDzWmXgOfLiwld9bR8MNjoLw8WHm+daUxsPn0LN90
         31BDU1a5LqgQE1xcG9XD1Id9wGxcAMhGBebnpOORvvj7psX0XEktfAUzZyjiex1kiCKG
         Iqzg==
X-Forwarded-Encrypted: i=1; AJvYcCVuXg5FEQE0jf27WgnUwxs6RK0CQ5MHTVbHQaH7HX4omOdoQw8Z5IGLTKlDorNoAUQlmtLI@lists.linux.dev
X-Gm-Message-State: AOJu0YxfurmJVU704VnnbcdBArRPeufS7LRy6M9MJyMyW8uvebXHuX1n
	QcJp1Ky5hrtbp1GCG0U6dMaWEUa3JT6BkwQh6n9aJ6xwuRkrLtJZjvwSbjNYqVELUMk0sD8wNRC
	6OmWXuHemlIg6V98yHd2gRlt7I9nVH+w=
X-Gm-Gg: ASbGncuz9GI2jqhrWFFCCDsYNhTyYBp4Q41xwB69Lyws3LplPg5xlMN4rFAMrDjubvO
	wi9oud3pN2QObf0Vdp5e6SgHEpvHi3G02jQrgR7P+BtGLOJZCKfDxw3fC2BPXqzXTARkRY03MnN
	pweQkD45eD0k5ImzJ5tK4XFzxEz2ua61xr9PbwlfKFlwzqHMRwq03veEAsly0NlIWHLR0A0PUsG
	OQVsqV6d/FWWgbwHPObyUabgFCatosnCfbzzZ7Cg97ny1aXNXD4MfJuvdpUfOskz3WOCfjHCnQw
	LxrbwzG6khfo60ahs+cMAv3tmQ==
X-Google-Smtp-Source: AGHT+IHd4zHzKJHiSaDYt+fas3wn4v2M9LloxztcReggEbdZvs7nvGHlisZ6Va1BAVyt7RDoMvRIKgyRryjYrTxDWWk=
X-Received: by 2002:a17:903:1cc:b0:248:a01f:a549 with SMTP id
 d9443c01a7336-251771d5b61mr95742675ad.11.1757437939384; Tue, 09 Sep 2025
 10:12:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
In-Reply-To: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 19:12:06 +0200
X-Gm-Features: AS18NWAUC9KOXLRVuptzGWpY6jU98Yraxc-lyvHQvj-0Ea4KpP1HNw-UevG-aP8
Message-ID: <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 6:55=E2=80=AFPM Asuna Yang <spriteovo@gmail.com> wro=
te:
>
> The separation of get-rust-bindgen-libclang script is reverted based on t=
he
> concerns raised by Miguel. However, it's worth noting that we now have 3
> different places rust/Makefile scripts/{Kconfig.include,rust_is_avilable.=
sh}
> where manually calling bindgen rust_is_available_bindgen_libclang.h + sed=
 to get
> the version of libclang, and in particular, for our newly added Kconfig s=
ymbol,
> we now use awk to canonicalize the version to an integer. I would still l=
ike to
> do the script separation later for better maintainability and readability=
 if
> possible, which can be discussed further later when Miguel has time.

To clarify, since this probably targets the next cycle, there is time
to discuss and get feedback to do whatever we feel it is best
(personally, I can take a look after Kangrejos at some point). Is
there a particular rush for this?

Having said that, this v2 looks substantially simpler than v1, which
is nice, and perhaps RISC-V wants to land it already. Up to them in
that case.

(I see the `ifeq ($(BINDGEN_TARGET),)` is still there -- in general I
would suggest splitting things if they don't depend on each other, but
it is not a huge deal. I would also probably have split the
`rustc-bindgen-libclang-version` into its own, but at least that is a
dependency).

Thanks!

Cheers,
Miguel
