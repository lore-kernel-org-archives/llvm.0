Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD79273811
	for <llvm@lists.linux.dev>; Sun,  7 Sep 2025 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757272980; cv=none; b=Xsd8BIaSdQWZgeYpkI+helnZ9a0Rz7/iBMvEyZOMTJDoQ+KN/uwCeLaIbXl6jk0hPcUp7YKjmuMiPl5twaxz2/QGsYjoEjxeiYDj8N8mgesql2ppP/UGlaRhcMlSuk2+RiXPrxRWszHjPJ6QWfNTpPO+auCBF3YGg5jaKturV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757272980; c=relaxed/simple;
	bh=O9qppLhJrFdjnO0BDVGG4qFudKZIpEcz9G6sqj99YGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxBen5kMinapE/jpvaGaOhIXZ1HSOukQAM9E8nuKyeL9IJCuIyvyBbGWs9shZWE5ZXeWdfbnLxv82aESCf0ltQG+uif19XkZMXADx99MjDgwMfUAVrJaC70JT/WJbNFm53t6/x/TK+Bz1Bkkz9aTGolIc6vzpavgnHIo0lE5d2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqUZgimk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqUZgimk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-248f2da72edso7368285ad.2
        for <llvm@lists.linux.dev>; Sun, 07 Sep 2025 12:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757272978; x=1757877778; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9qppLhJrFdjnO0BDVGG4qFudKZIpEcz9G6sqj99YGA=;
        b=TqUZgimk7b9e8Vo3/paJtqW6L6a6/eGFxGA9u0OybXlXnXStARIbp1wbZlCQBHDyUO
         PYjDd7fBoCvBgkFFMwlz8aKryOjzYym7Py0cJkLiN+gKML6FBMz2LlZZVsdKCp53KSGn
         yn0a8nFHDa90gwXnVYn3Ah6pJulFsOYABo69gMZiKzM43/3khS1JWB6pQtHPTXAYMCLI
         xw2tUoUKMcgheCwyUS0XknCAH6YSEVNLcr2PJDwlJy4zbI8x+id6idXuMjCss5319eoA
         /yu+oPbjwgqpHYa5Ep+2qwhpioNNbmtHgHGstsej2uv08qfXNLgn/JlLgpXf1z/jZJzY
         stjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757272978; x=1757877778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9qppLhJrFdjnO0BDVGG4qFudKZIpEcz9G6sqj99YGA=;
        b=GeAiL7UvNMsGwod+tTjngXYXQ/DPTPi46sqdgSGxOCpwsfhaRss5IaFl+N3RdZIpAX
         1KaL94WHB09fJnBlYCgQ69YAnX4gczELaTWz+Gc6bgQfbnI34UUQl8MdyoDGbE4WHSSG
         qFgmOwpKQdfTlB/H7+2aeUtuE8OkgmOekBx1eN8nySYN9lCsxYR0mh9I2XMhgBXVeR6q
         V/jtpD4/pP/s/lGxM3sUg2WJ2xhTSnm74Jy3xD7S7QD9qRhh4VJzgtO5Wk0S1g//p3mZ
         DQqGWEGChvUYeRSyMCC/T+J/sHms+xdKtQIrP7XZkYBhsdeIa6PlIki8njpchbzQo4md
         iPCA==
X-Forwarded-Encrypted: i=1; AJvYcCVynsSexeGBRHLDa5/f5vuK1b/XkP5hzlI8qBJVru9rb7ZhMXL+2zvyqLf5VcubkYvkNBds@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxs2Stdk3EOqqXT8rYHG0Jg4GJyyoCUqi2ASTekbF5/72PTAxJ
	pwbhPCVkbijxK5MsDI/Kg25tTLlH2CbnahhKgny5HTUvaJSRe1yaHgENXKTb6KJO8YPuE3Kgs/h
	voa7KcIOci5LOwG3sJl4ctMECWG5G1gw=
X-Gm-Gg: ASbGnctZoWwDd/imFLNAuXIDvtQTh/WuG2TmQ6noNMCwSWfAyZhYE+wlAm2zI67bzRb
	THA83ezH8Yty95Uzcm/kDJsFRD38avLCrQ2aEfwLAJIDVgDFEk1va70ycDXxb9W7Pkq1BIGzyoM
	cZoOJwFdzYqs7WCceeX/58B4SpBMdvg7nraOwzSf5qc3I8yK8h79O1mhh52oNviOmNY8VsVEZbO
	W9KyJVIH72vAwD6DfBTuJ40aWzvi1GJeSzdH19nkiyX6Nq2ZF8fvAb00KLyUzTyqyvaCwXpBbC6
	Iq3P+jtwZjX5fzVv26D3O45vZUiPat9MBvij
X-Google-Smtp-Source: AGHT+IG9yX7YTrisqI7Rxo8QTbikLjcKwRoWujERfLUMkae2pI2D0+hLhPSBxYgvPobhme1gsnfwfLZW89Q7xm2tV34=
X-Received: by 2002:a17:902:c949:b0:24b:2310:9824 with SMTP id
 d9443c01a7336-25175f6eb11mr46298535ad.9.1757272978324; Sun, 07 Sep 2025
 12:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811012000.444173-1-ritvikfoss@gmail.com>
In-Reply-To: <20250811012000.444173-1-ritvikfoss@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Sep 2025 21:22:45 +0200
X-Gm-Features: AS18NWAo30zVGsfP74LBLri6JUJ0z8lNv4k0MaRzoeIUSkg5OaYFBZAtzPELSSY
Message-ID: <CANiq72=7dQ1msy6Xqy+yfAFuzkz8XGnnTsFLb6t5CUFzsoSCfg@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: cpu: mark `CpuId::current()` inline
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, skhan@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 3:19=E2=80=AFAM Ritvik Gupta <ritvikfoss@gmail.com>=
 wrote:
>
> When building the kernel using llvm-20.1.7-rust-1.89.0-x86_64,
> this symbol is generated:
>
> $ llvm-nm --demangle vmlinux | grep CpuId
> ffffffff84c77450 T <kernel::cpu::CpuId>::current
>
> However, this Rust symbol is a trivial wrapper around
> `raw_smp_processor_id` function. It doesn't make sense
> to go through a trivial wrapper for such functions,
> so mark it inline.
>
> After applying this patch, the above command will produce no output.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>

If no one is planning to pick this one, I will -- thanks!

Cheers,
Miguel
