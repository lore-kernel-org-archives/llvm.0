Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6CF44C68
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727259666; cv=none; b=aFf1oml7xz/BWeGwDG2T2X9E69ApyPXeUfRt8rUyt2T3R/GqpLj7/I2tjdNpbsPwhuzJF+UdUNhpqj5gPIZfxbloex5LiIlFmMp6F0ZpfzhPv+zgeb61j5qGqGr+mt7R9aL55vtsXmRyONofzX5jvY7eApLNUh0Ar6OqvkexCEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727259666; c=relaxed/simple;
	bh=TCDnE5O1Qj4Sx4FFyUqVkcdfYPO8wvEkGDEg/b8x6RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qItglTk8DPatppgsreKsTEW1OKOrPyNDyndSpgH/2ckhyel4VdZxvHLOxIzyTaVmFBfMnumoUxTseChnbI3mDHgTMkALnc5KfTR0dv4+Vlvaf1WC2sWsI8CJi1czYpKGezaPsJdEaQNBX8UyKQXF5FYHiPnreg38vhpMWGEcebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1/JqvMr; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1/JqvMr"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7c3d8105646so535732a12.2
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727259664; x=1727864464; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCDnE5O1Qj4Sx4FFyUqVkcdfYPO8wvEkGDEg/b8x6RM=;
        b=Q1/JqvMrqTqQojqEQvcJdUqKdwuBb2UmL/F1h1dS8ntXP7vmAkPm3Qyzr1z1PzdBHp
         broKQaqxza2apPr3ClpR6KyV1e303cy3mYjMgRVjvbrG23/yexAErSJ8N3oFLCeajQEq
         xq7N3Ze+OpGdk9fe2Z/C0mZgSQWG4nYkvue81rX6nPaSyxFkN2TWY3ocT9r49+jV8fgl
         ux+dpwk6HxeTsexTfMYotZzvZ7y3SbnpHRc+GumDPh4a2r5tCHelYf4WJnugRj9tITkL
         THr408dCWa6kQSWQMd9k4Cf5sO60HxPcld3HbhjU+d7FH88rdznLoF0pLTk72zfjaA0e
         aDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727259664; x=1727864464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCDnE5O1Qj4Sx4FFyUqVkcdfYPO8wvEkGDEg/b8x6RM=;
        b=vJ4dH1SJhTRAAHjsBy8zETnbXHcV6hGhpUlnm5X6tqtOYZjTG6UjbPKvY3PC8C/6ck
         APps5kZaOySvtf2pLWdAlucTxyiCSNwqX2hiLSTBnLNjGpGuK3uUvhwG34ApR9sN9jym
         V+bGoL5/FJ2++8AtnBnjNvyZII0PVSIwUOrLO8NY8+Wfs3Lu5MouJeKElTerRbO/OIlK
         zDhbSrdbTud9u2es57G9tvdO11ihsYtTksZsvyLC9CbDnf8U1YaVyyA9//vUBwyXWktO
         d74UOMNQxpgR3oiuXmKQPcS0V3kjoHru5vLkYFoA61WmBXkXvkkmPp3qAifS1gFJ3Od1
         3l9g==
X-Forwarded-Encrypted: i=1; AJvYcCUrZLi0YkjMZqthntbEAg6O8dr2gUyUB/J/pKH6wb/ViNg5YwaMj1y0hu0FFKA/x/xyAUNq@lists.linux.dev
X-Gm-Message-State: AOJu0YwMXLbHsUSbxx4JQVqR1qjMQTQd3BK++5qdIckjrv+VhlyiS+Dh
	u2FlfmPrBHcAnPg6xqWK3orQrvbhZHu3H6XV9DKnwzGDA7BLz1MZ/br9ZcDsFdEV4I3CO1Zn4bY
	1ReKkxj8nDRPoiKFR/vUrky9XMGw=
X-Google-Smtp-Source: AGHT+IHrc4qeLncDvmI5by0PktN7ToaZFg+oGS0r8KUPyktOQT8smdBpXd4RQ/kBZQLt1sN+Zznoq/2KTkDYdaikT8c=
X-Received: by 2002:a05:6a00:1149:b0:70d:140c:7369 with SMTP id
 d2e1a72fcca58-71b0ac5a8c4mr1439818b3a.3.1727259664158; Wed, 25 Sep 2024
 03:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com> <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
 <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com>
 <CAH5fLgheG47LdgJGX6grHXL6h08tsSM1DACRkkzQk_1U8VAOxQ@mail.gmail.com> <CAH5fLgj7E03DKBcptgmZ8SLgco=Qs4puO=O6=v9=-3SSuqJyUQ@mail.gmail.com>
In-Reply-To: <CAH5fLgj7E03DKBcptgmZ8SLgco=Qs4puO=O6=v9=-3SSuqJyUQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Sep 2024 12:20:50 +0200
Message-ID: <CANiq72mFKE4tLp1bgr+c0-Hi+dmReFT4m5RcV6MigjyiAiuwmg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 12:00=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I posted a fix:
> https://github.com/rust-lang/rust/pull/130824

Reviewed, tagged and added to the lists -- thanks!

> We'll need a check on RUSTC_VERSION in Kconfig for this. If the PR
> gets merged within the next 22 days, this will land in 1.83.0. Would
> you like me to send a fix with that version number now or wait for it
> to get merged before I send that fix?

Perhaps it could also go into 1.82.0 since it is a fix? (there are
still a couple weeks for that)

In any case, I think we can put 1.83 in the fix already and modify
later if needed. Even then, I am not sure if the requirement is a big
deal, i.e. I guess we could keep the warning and avoid adding the
restriction. But since this is for KASAN-enabled, I guess it is fine
adding the restriction and being safe & proper.

Cheers,
Miguel
