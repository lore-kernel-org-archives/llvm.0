Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B17D098;
	Thu, 22 May 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918367; cv=none; b=uKv93zde5f0mKI6Y5I+wA2yN5LV1HtVMIMFabZSKVHOIrMdoreyKCRPVXzsvxgqH5na0Sfe3UzIDHO0GOlCG6okAlkoMU+c2XSXqvnSjoeVOkPYkRPCyUadf46rCOZZgJYc6MWGePf61VNE2gNzA0SAhiAY7tHa06UBTu/Fu+AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918367; c=relaxed/simple;
	bh=tJv4QNjBKtokHjJxeh7G67BZfnogRDLdbuB/31QUnks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3Y7CPg2cSs0Ii7nVOMhntLy86g/zPHyYCpQDPrGXDx46XZJ6aJD8zUnF9U6GvmxIFIp016Ye+z+H4IjkXTGAemyLDOrgyekX5lJjNlsiyFRNqNrXSGTLxqkFx0IgmGw70Zium/RmnNQK/5u3pfkHKOAuspPqgxr3QHLADIM0/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX3YGIeG; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX3YGIeG"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2700de85d0so551841a12.2;
        Thu, 22 May 2025 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747918365; x=1748523165; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ1dqFNlHXFf99EeiB4N9E7VkmnO2BZbDxwhgOO2l9U=;
        b=PX3YGIeGiy5J+oYjMbkmy6+5qHaFcABBXWnNUOhKaZfkBq6ctXxC3oqkBqBmTbcYpI
         DhnXIjZrZpNVnWAx8slUe2jqbKa8a+bQ19iK6JBFT3/0vq/tggGpAV3OGszy95FZ8uLZ
         dLkyGtXaZQwm9mSu274lA1qu+JLGxGwf/vPOVPSB9Z2p49zYZco4sVyVPV8aR2GBTnIn
         dHIYPsfipHb6wt60BG0QOJQA8nNEDELXDzqR343v+YhqazwEj8RQ/npMiCdxN0H8gcrm
         6XXzuzu+QTdfV4vD4IjT/fufLareQVZALzDYh8egLytpj/CZIVgiO1aMKgWeiK1wBmyL
         2Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918365; x=1748523165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJ1dqFNlHXFf99EeiB4N9E7VkmnO2BZbDxwhgOO2l9U=;
        b=qN4G7QGPrvRLGJtT6di/MFLZTyoh5qW04UIkxM0m+LhrAt85j98zZbiKby2eiRzfkH
         25R6UMcBVX0pg9GIJvxvCbJelRzLe32xoht6uUkvqWAYUooSRWerhgWylPLxJfPQiOHx
         yyN6R7p4D4fXhdkaj7+QxKX/RM1a6pSRqP2+T9Bpb3jNL8OHP7AMMryUiakQA53VFH1u
         /dn5zADxXD9a77PsMRMz1WpZY7w5cor4lAJBFQ5z1KIGaJIqHlBAZGXw/Wozfdip1lAR
         zb8UrodRStX/7V5lfTGb897pmjp8r9xaQIiRsIlDKzZMTWC/84xqOV0VZhSDIPE7wb4o
         gTZA==
X-Forwarded-Encrypted: i=1; AJvYcCU400IhNlKVzgTJK/3FgWmFpA+ReI3jufgJGYvpnEvqWZuMWzs+f0fZpqaQdgrH4Bj3EVpI6QC/I7cH/g8=@lists.linux.dev, AJvYcCUZWeXMTJfTkB6O0EQPLKgwg5GGBWo3hjr0AiSMMKMdROtAA3calSsr1W14H0R1OtyHl/Kp@lists.linux.dev
X-Gm-Message-State: AOJu0YxvqQSYIDZrL7fNcetG18J2xwDY0LIBGm1gmwY+UylU1A8xu7yv
	lS0HwoqttSGGl8xB4Qjk0e16FgpV2LHXtzcDFlaILWuxKGynuiJDXcyCSOvHdohcY24t+McbAkp
	/NBi2w0/A/392p0j/dLGry47iduZfJMY=
X-Gm-Gg: ASbGncukxpKKmG0yMzse99zvxYHsWN6sxNzlAMZuTtOUkDq4z/Aekszs+KUabw1yBOv
	FaYBDl4z5QeSuyUyEBLzWvay6rScD6nYUt8wvDHMVt0u9m7V9Sey5i/Nrzae90if6yJZNzx4FW1
	syBvHcIj2FoFbSDEX5tue9/4cwJZMCaZEo
X-Google-Smtp-Source: AGHT+IGQab83uIDU/GDVEexZuM5wwTP4lC86/RT9iNGRKxL/kDU1nqV9xYvUEmkaYpYKc/nYSDo/XA0Hp3rhrP5TbQ4=
X-Received: by 2002:a17:902:c951:b0:21f:356:758f with SMTP id
 d9443c01a7336-231d438823amr134924235ad.3.1747918364882; Thu, 22 May 2025
 05:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
In-Reply-To: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 14:52:32 +0200
X-Gm-Features: AX0GCFtFzPcuH3SiIlAcuYu5MJfjb9QDePgyNRa2KtJcWu-QNzrT_t3oGCGwMkk
Message-ID: <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com>
Subject: Re: [PATCH v2] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	torvalds@linux-foundation.org, Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 2:02=E2=80=AFPM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> Currently rust on arm fails to compile due to '-mno-fdpic'. This flag
> disables a GCC feature that we don't want for kernel builds, so let's
> skip it as it doesn't apply to Clang.
>
>     UPD     include/generated/asm-offsets.h
>     CALL    scripts/checksyscalls.sh
>     RUSTC L rust/core.o
>     BINDGEN rust/bindings/bindings_generated.rs
>     BINDGEN rust/bindings/bindings_helpers_generated.rs
>     CC      rust/helpers/helpers.o
>     Unable to generate bindings: clang diagnosed error: error: unknown ar=
gument: '-mno-fdpic'
>     make[2]: *** [rust/Makefile:369: rust/bindings/bindings_helpers_gener=
ated.rs] Error 1
>     make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.=
rs'
>     make[2]: *** Waiting for unfinished jobs....
>     Unable to generate bindings: clang diagnosed error: error: unknown ar=
gument: '-mno-fdpic'
>     make[2]: *** [rust/Makefile:349: rust/bindings/bindings_generated.rs]=
 Error 1
>     make[2]: *** Deleting file 'rust/bindings/bindings_generated.rs'
>     make[1]: *** [/home/pmos/build/src/linux-next-next-20250521/Makefile:=
1285: prepare] Error 2
>     make: *** [Makefile:248: __sub-make] Error 2
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJX=
Yu7wWK51w38QUQ@mail.gmail.com/
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Acked-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Thanks for sending a v2! I was going to fix it myself, but this is
even better :)

By the way, submitting a patch typically requires / generally implies
that you actually tested it, so your own Tested-by is usually not
provided.

Cheers,
Miguel
