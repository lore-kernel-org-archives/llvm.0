Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D7E18E036
	for <llvm@lists.linux.dev>; Tue,  3 Sep 2024 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385414; cv=none; b=SQXB8fZv1aI56Ib65ZKemGXmIyOaR09Dng3wKsnnmgFLRoah/Oxj4uR04yAld425SQLBkFxIrosW7W/sW7bKTIOHpm3BsqpccIm74pRPM/GszTrLFHgnTij964rs8uVpcq1Png0s+7OZ0vTsugkodcTfj8WNJlbVC+0/nfilZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385414; c=relaxed/simple;
	bh=W2NvEDiPMdCRkIQi/U2zn9qbgZ8I+Gm2PHbpakhn09U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKXtO+qA+hG3e0rLHZFwk6XtjB025IEbEmd7uzvVN6geYMAx6M9HH0S4iArUTWAJUOTUlxadvwwbeNQ/AC8x5O6+i3BDjBKPDKpJiaCCgvzZE5ac8ubr1ODM4+qMlF6Or6Z3dWYx+vaBEUoKkMGEkI1KX+Slg59tRFwdLOKR/0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1hzNdZx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1hzNdZx"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d8a1a58d5aso113776a91.2
        for <llvm@lists.linux.dev>; Tue, 03 Sep 2024 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725385412; x=1725990212; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fy49/AVvXvkuJP3eSVDqTTRc5F7gppOTJPxMN+eltxo=;
        b=B1hzNdZxsdEd9GIMA03w01U+yjhlxKz6c1yEQzHmUakYE881aI9n1Hd4HaI89k5oHX
         j23WhPBJ8Q6gCLaBSstEd7bnKDLoTwyRPM7QMTMwZqAIUmPOZJWWP7bDnWFunTfFWONy
         G7HzeAtzTu0t6X9j+iOze6QHqPsOpWVFP7kXPDkPOaFNmUMB9TteV/IDSVF6FpfdJCla
         bqR1kjBgRgW17/qQwPJ0KdTtwq2Cy4W2CBzJ8tBHxLsAvESZESjyFTLWd7pVni/fpwL+
         2EMRHYjERuJCwMqF6loG6IHtIv1co2jA1ky8WxUCCavTwCeCRUjOMAMEhRb0bx6NoE/P
         cPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385412; x=1725990212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy49/AVvXvkuJP3eSVDqTTRc5F7gppOTJPxMN+eltxo=;
        b=UL5MY3ybjiKCrM7HwXbOHciyFuzmCqsuolIn1q6RmSDhauUxASdHuPcumwSvN70Wo7
         ziX1f727xILOWNl+qoQj3sbzs7JCnXuVjrFjJO5HqE5DmZlfvmAO8SQHJ3LZYdztT8Jb
         iS8/sosGLPmj0JqOqUgX7XAOboUWLDEQYS6tdsbWixxFO1Ottvax96J9rwS4iKuQHcAV
         O0IvlRKHTvMJhtsVm1YRGBVb7xutrTs+urezuKEWm5Erih4i2N3QA+/JJYSnHzKn7eot
         5J2BX1ax5+FRQf7VI23QOEecUA15K9fj9r/VOjNk/RbVEC4RTKJ8x5M3qVrOwn8wXLA3
         OWow==
X-Forwarded-Encrypted: i=1; AJvYcCUVbFCcXJAMkmqAfoShimPdi/FYTzazHWAbTjuJ+KlQZgO0GqO5ZoL5cX+e1j7uYx2hByzI@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc4BoWz/HbUihswHfNCgOINDJluDuJwV9UQQXnaDCJVqGLsB7R
	twBLySmKbVTkRGQI/V4PRQoI28xi77W+OmAeAMHtZNFOKUjgD8Dz19Cn8Dg6QuYxnppW436DVoK
	xFFuN26mTYksRP5/j8aXAbyLsUbk=
X-Google-Smtp-Source: AGHT+IEqKH0OWriiC8wInpcf2ZECoytsMPUwBDofLFkYfPN9ogN181tpD7iUm1gfTEwa1l2o3VI73EHRfYV1D0wWJPU=
X-Received: by 2002:a17:90a:ba93:b0:2d8:ca39:5972 with SMTP id
 98e67ed59e1d1-2d8ca3991a8mr4648735a91.1.1725385412437; Tue, 03 Sep 2024
 10:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com> <20240903-mips-rust-v1-1-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-1-0fdf0b2fd58f@flygoat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 19:43:19 +0200
Message-ID: <CANiq72kx+aJXJCGPv6PazCQ7BnSDN56WyVFj=6e0FNRYqunSfw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGET config option
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:15=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> +

Spurious line?

> +config HAVE_GENERATE_RUST_TARGET
> +       bool
> +       depends on HAVE_RUST
> +       help
> +         This symbol should be selected by an architecture if it
> +         supports generating Rust target files with
> +         scripts/generate_rust_target.rs.

It should be more like "if it needs" rather than "if it supports",
i.e. the `target.json` is something that should be avoided if
possible, since the goal is to avoid depending on it in the future.

Cheers,
Miguel
