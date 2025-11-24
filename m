Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE242566E9
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763947285; cv=none; b=gVi10DHO16Ql3C9LcCYRbN9gk1tQ+KP54f1K0P1Dh7faGj4vBQ7A2kZMmDxfgafz9dxpD1mDETXWm7YkkSSv4pHzW7IZ40WNjLza7vvjtlzB/yZElsyxUJXmPfcrdBAcuV2QMKhWxgTx3F/sk4utW7kDayB6njHEAF5YPYxMQhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763947285; c=relaxed/simple;
	bh=KCvg+ikTpFCXv53G51DcHrbuLvPBIVU9eusIF5PQAc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4nL5F5EAHX6xAX2OAxGbPyzIarFgYr1VIM3lTH2HUF7v7TafioXa3WSqPRFD2RY2NuF1si7ojWPG5A8QFpo7HjZEbErjxCRXv0I4Fa+L4FHcmAeH5jUD5h6d9LZwgCNYZWa64aAuisT8VTEApelQPp3+cKERYlFqsYIwOQiOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8BT3Qt8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8BT3Qt8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7bac5b906bcso411641b3a.3
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 17:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947281; x=1764552081; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=T8BT3Qt8DGSyT5Px5Fsg3cXUqa+0zhnadlEaCytl8hZuZA0sZ7EAktSRfEGNiYVJfL
         ZQfPqEp757FuGU4D/y3JKniMcmsvXtxJWB3sBjrXGLFejc59YugEPSy6wiAbY8xouSyG
         gDIsVyWyJeuTTBavHoDw45k+h6W7zWSZA+EMoLZ/jsh2axwKkl3c5AgUvgcprd1nnyvJ
         ne2OD2yWCeacM4jLcl/pMv+/+z5PlEG0EsV66xX0WofCMVc2QoUpN8oZTf2iOX1ZOjwc
         NaAVrYbKe4lQo/4dfPP2OzELR1kQIMMk5iA2vT4th3AI6m47ijM0/8pu6lMGwEkEwFd1
         k6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947281; x=1764552081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=MLluYjE80KIqNJ7g9UEpb2m3guu0NpuLQwdp4ykIlJuSNnENz69z+cBGCsrydQ5W5x
         cXNWKthXZf9Y5YceG1uMGNIOb07tC6WE8lwGyhr84m4usWFTBHVJfyAfnxzfUN6fxGW+
         q7LN/uhJKsAUzdPCiA4j5q1TVZ1Ix4v81OoLJmzto2AJZu8iatD46JQI+2HUwFlOHReA
         CPLb1qD9bb8lQie9iy5A4jx5NM9zh14LPADnuxXBqJxVaGCQkX9zBRtqimoJJSYQRUYM
         5/K8IfFSm2JF3IbxtF+D4xKPdnb7HwnGODYXqXuikazU7pTeJ+4s607jhlF62GT3M5Ff
         2rng==
X-Forwarded-Encrypted: i=1; AJvYcCVr3UFTcq5AzCB8IptPuiBh+erMTwS8JdicF9vLlcm53b8lPvbHDNz8ApVtx76Smzg3z1CY@lists.linux.dev
X-Gm-Message-State: AOJu0Yysld3jMb1OYLINGnKp1t2Fy6vp6H28OThWHPbdTwiSDdLOOCeW
	fENPysWDJwOoCF4R45f7nIPMtG0Unr+uKEezeV+Nh+We/3cYCsIQpOIZ6rWQTFF1N0lUjLv9I6+
	yILdFu0Hc9UISDEaAuHKiF8KHKrshcUc=
X-Gm-Gg: ASbGncsvxxN7QBHFsLherpR3XFpKiNShcfvJPTNpQ+80BGV7DcCqibex5mBknRRwLB+
	AaUg38Rj6X4VxsOupNL4gTdlSZDYr90hX+6BjmQCJlIrq1B9UEq3bAbzeqsu6og+roxmG7Psmxi
	whl4fPF4J5PbBsMqli9Gex5wcgGGhsS/Z1fgNkavdf8wAWjuxms+U7fxowagXDTOndHq4MrTzto
	fv7prEp6hZID5TnF16K5KdVCHbN5z2ldd5rlLtk2t1u5yvFChC1LEA8mXkc7sTHB2H09TkH5vFa
	dcz6iMlRQhXeTmG8DBCtHfZ6uS/ZtEvvGIgQFlkEw4OrMXvKletVgOeN0VyifY7ZK5AHMHlixYU
	Jl6Msy1o3wxawoQ==
X-Google-Smtp-Source: AGHT+IF7uCgR8D7JuSAXIkPZpUGPSLX7RZ4rQ8XZiWkfQ1rTA8eM7wEtMX1LZxU2dGsl6gS27smUFSiUHNUF0PYkbLY=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr5716030eec.3.1763947281135; Sun, 23 Nov 2025
 17:21:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:21:08 +0100
X-Gm-Features: AWmQ_bnEyQjjwkSgNtuZsnn9EWb0bwxCuBV5MLpaTWl4ay19-nMkjpn6O6IgwyE
Message-ID: <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
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

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> + Rust builds for RISC-V due to differences in extension handling
> compared to LLVM.

This should mention what we are doing, i.e. re-enabling the GCC + Rust
support again.

Also, I would recommend avoiding to say "fix" in the title, unless it
is actually a fix, but perhaps the RISC-V maintainers consider it a
fix.

> Add `rust-bindgen-option` conditions for the availability of libclang to
> the RISC-V extension Kconfig symbols that depend on the `cc-option`
> function.

This is now in a different commit, right?

> Update the documentation, GCC + Rust builds for RISC-V are now
> supported.

"are now maintained" may be better to avoid confusing it with the
"Level of Support" in the table.

> Documentation/rust/arch-support.rst |  2 +-
> rust/Makefile                       |  3 ++-
> scripts/Makefile.rust               |  1 +

In any case, for the Rust bits, this seems OK (I didn't test it, though), s=
o:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

(By the way, I wouldn't mind if we started adding `MAINTAINERS`
entries on who is maintaining particular architectures for Rust,
especially if there is someone in particular involved with it etc.).

Thanks!

Cheers,
Miguel
