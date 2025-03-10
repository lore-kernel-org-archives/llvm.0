Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D64C1C5D7E
	for <llvm@lists.linux.dev>; Mon, 10 Mar 2025 19:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741633654; cv=none; b=f9uJP4kJni0fgJvoD/nkZcspla3ZLISCiGwWssia1jEgfsWEYBW/B5E6lToul+0z7k+XpbRw4Avmxi44UsOY3GFvEYfNV9tKdGSFXZIvK9BC5K/W4fp0+ZbPjwPBW0EFLX+214iEJOkKeSlbcX75rtEyTtWn8XfjinJKuG4ZsEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741633654; c=relaxed/simple;
	bh=4O7RI2phjDRsn8FWXVrl4wv75NJRPYmPPhIXHAxFi60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBmuXTld8DIbP+O7jSTZ/hLJekiePoopbXcIzlRyUh6o8/Qb3VG7VqUlZmr6bN/wkgPnZ/HdNvlX30bhzKHNOR53vPV5JyrF4xs20TFk+qXRX6WdgMbXVCbqkmCP+kXT53KDZoGqEuu2UlY+FF12UtfAYbxKQguHg4sM0oEemLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STVT8otQ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STVT8otQ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so53836a91.1
        for <llvm@lists.linux.dev>; Mon, 10 Mar 2025 12:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741633652; x=1742238452; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O7RI2phjDRsn8FWXVrl4wv75NJRPYmPPhIXHAxFi60=;
        b=STVT8otQMNqBtxuhptRnPb03xIqXVFKdn83kAWkhkEL8fS9rSbh2DfyQXIfUs/OqGq
         XhvpCfbh5zKfmbQi1oM2dmxeFAviqjdEeNaFrmwlYSfCc3T1if7XOLGQO0vA18uOJHtK
         5KZNfjY6faBvgndz+Lq1Qm7I24x4xeX7o2QjlKTbq8s/ia9NjFvtOfAuYpABdJbOUtCR
         b435JG+p3NTyOlF3Xo2xHsjqMpg7X6roJPnri31fbrSg+YEt4VDzCAyeul/AVkWVscBy
         m+MplFvbt+sNuFSoF7ZUrk6YPxFE4VEQKpeiHI1+nlIzH6DuGjIQRv2xO3egSsD4ODEw
         /nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741633652; x=1742238452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4O7RI2phjDRsn8FWXVrl4wv75NJRPYmPPhIXHAxFi60=;
        b=i8xQpFAgKRKwPv+ChD8StDSjE8Zz184B8yulfofBm6GJ8/C9vXj1If+bnMKD/htusX
         cDP6BniAVzGTgzeU7PDgmvtqHRFy4wlmSC3Qi2zIrrC4wLVcV6s0Qc9QrgKfhXSJb9tK
         QhMchaD/F4SLyK1uBuMmD7+pG4c/1+N676QBPOdRuuUmq9XjaFmvqm0Dc7+sADwPHQNY
         r6j4xVzYe5pYSkYvNQcmJd3eFsMKxkwTojVs33jMVXTGvv6yRZ4v//C6Veejy9aI3WE2
         pfdiz66YeTUHYz8QQgzrcwXIuYoG8AM6kb2Fp+duj89IJnQtfmN1WBVQnN3ecXcmxwpo
         vxmw==
X-Forwarded-Encrypted: i=1; AJvYcCXsYl/sBe9JEPH1aVovHhtq0ApayFV/SFhnYp7QoUkc0cPw3BZmDc5s5RZdjyhp4KJfCXnC@lists.linux.dev
X-Gm-Message-State: AOJu0YwRnfOzp/e8LC11CafS8ecFVq80AuUoYlpkoi0Qvs6TCxe5JiMQ
	jIAxo5706oBilqtXgnj0ZY/IATT/nybPW93lz6sdMnH1Y6X7NfHi3+LtoUQUGQtQphWJKMd8arz
	vfKPprheqjydNrbTUJ5+PL74FxeU=
X-Gm-Gg: ASbGncts/TadR/6J87AlmRWhVsKld0KJCVn+vfvsm9eG5MCmEbbT0f8gRTbZzHpkGMX
	jRIRTuui+wZyNz3GxI2eRug8XR2S9tLDNn7EctkSxmtHTKMZvNoZ/ilMyyZSn4B6e1/VOHvdPH6
	cSK4AU+qZfaPkx+4ADFHqmEyhbB0mFssb3cS/E
X-Google-Smtp-Source: AGHT+IHJrfv17sQOJJ9P0TqX5ao935JljgSaZ5TbRPET1gTsB6O+mnlwve4jFuQ/AwMkoNmgdytrU2jwZSfg1lEjpEY=
X-Received: by 2002:a17:90b:1a8f:b0:2ff:4b7a:f0a4 with SMTP id
 98e67ed59e1d1-300ff8b9c82mr409862a91.3.1741633652620; Mon, 10 Mar 2025
 12:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250309-faux-inline-v1-1-c1b692862433@ethancedwards.com> <2025031053-tribute-crudely-0e1d@gregkh>
In-Reply-To: <2025031053-tribute-crudely-0e1d@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Mar 2025 20:07:20 +0100
X-Gm-Features: AQ5f1Jot2K2MlkoOuWS9Zh97DrILv5SKcwgIrJeUYL677SkLRVqfje9kwFEeVp8
Message-ID: <CANiq72mEVFv+KtGLJKnkYdKtbUgbWDsjQNimd7+DGgYXCQdOmg@mail.gmail.com>
Subject: Re: [PATCH] rust/kernel/faux: mark Registration methods inline
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 7:24=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> What release/branch did you make this against?

That hash comes from `rust-next`.

Cheers,
Miguel
