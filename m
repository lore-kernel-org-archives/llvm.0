Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4202DA758
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 23:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756941877; cv=none; b=u4V5Zzn/A6Yj/V8GC4rCVub1Bo3uUvsO26yv6oC4qABOW9HLnDvf3JX40JI+0i+ckyE4Ys2zD4cvTIeXWBp2vfQK5IDq+YvQ5MhjJNlnliYDjCDvVwil3Dj5RsA4WV59NhSiTLmeXcYc/MKxLSjWeKp+qFGVphPFMz5v43c6TVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756941877; c=relaxed/simple;
	bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WT+lOJU+EeeHGWe7dizqlV60Gk0jkqTrPinimJkWoCV2rFTavJf2Tl/Xc4WTp9SA3L48hwcbYcjM4DsSnWES7k8szEirrrtUHbT7OrAIfvQEgIWZf/1d+8z2fzK5Nat6hlX1P25lcCDiQuAig7RdVUOjJ8uNOxzskjYBtErZhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG4/74g8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG4/74g8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-248e01cd834so895835ad.0
        for <llvm@lists.linux.dev>; Wed, 03 Sep 2025 16:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756941875; x=1757546675; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
        b=XG4/74g85zJRzJWSTcNSbyjgi1Srj1GO7Y2cPNGEeNWv02BnvhDnm5n4gfIgYLaVTM
         S9whW/ABg/gvASQsf83VyufSKEnnmZtBGW9r0Krr1b0ofSs2+bFwD99jQCY9QDVKva4I
         63DwJACBxha4IAcs8J69ggc8qHpAyi7EO2+1pZGu3xAgjRCDueOVpqqvf3V3ispJcu07
         S0Ec/BZ49aQKnFbtSlUn0gB7bOyv8nq+qyEhjSDZh4mO33B/+eTd6uZNrWhI+RAeGZP6
         xkgpYqwrt8f9IgjIYBbsX2ThtFiYkdegfA2fuBOQ5oju7dCxiMUNk8Hq3qxAjXNsdQD0
         WTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756941875; x=1757546675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
        b=pfzg/tPl9eblISfntIaZKQDv7crWY4a6mUtsTZ9KdQ5ps32hr0yaLm6Q+aZQ4Xpsg8
         r9qK0XHPKJ7mLwkHUr+8//Vn/NPR8yB+9+RHCbQHSMo2UrBtjtcuVpAcM6rrylfIGtsl
         C3Adtf8uYdH9TifHHgx0QFFWnV9r8Vn9ITOkw6sTqV+KulANm21WcJPU9kmHywIcgWZc
         88+YP/ppIXfbWqegCG5zlAz6QV8MeZDM84NZWHFRtpXpksIZ9gg1Ykm+2f43a41w+9b6
         xo6Bbh5ZcScwmRHL+MLIeK4tNotOy9o1NhzqkqotQfGP7eiWef5iAC4di2jDF8+whH7u
         rMSA==
X-Forwarded-Encrypted: i=1; AJvYcCUAv/1KT2covd3muij6gYvEM+3/9b91Ngq201sqOXfZPie7Ibsv47kG3tii7e76eRj3b3tY@lists.linux.dev
X-Gm-Message-State: AOJu0YzXqjxfKsisWMwPX9pmwx6dyMixMefGpdjHDid8jyXFRP0Rq9rA
	uzBaV4QtJy0oBkHwunlefSeNVeA6jyZct95M5DX4SHfWrkHW2RFg3nWDCfvQS9IJ201kHoWYQIr
	X1J8FVOYr0xV+1TRHpzXnHa7E1O8TD7Y=
X-Gm-Gg: ASbGncsVCelrfC7RwvV8JHm9q1sdOvgntQOIpJS6TmiqUPgfxE2TPyt6GY0AK12Pei6
	RqWyLbyBqIr3DG/BywGWBgxR6Yrmn3AK5NPto5nEhTQqoy1IbzC5VLsU0KOp7uW8/A3iQssIGxJ
	cqctKbWiWybu7SgpZc1cXq/qSCyXrsc4yYyBI/Siu0mC/q97zUxzNjvuQ6CnT5VdyWGE6zU3nGO
	Vzgtn/q6GbTFpbMES38V7JOLeIPx933cRbvedgsDz5fWQ90DSw/6hoHsk5/JCze3yJf2/fXFEk4
	UTPQtbqblbWyhIPOKCnUkoSVq6NH1woZ1ldn
X-Google-Smtp-Source: AGHT+IEjlWFuPMxhtD/Mq7OZwOStvmczamQHMaG5FsSJXT9epadmoDRef8lNJ29rsmcfdJHBWLObAXkHao0s90DS5wU=
X-Received: by 2002:a17:903:1a70:b0:248:847b:8906 with SMTP id
 d9443c01a7336-2491098b4c3mr158698905ad.11.1756941875488; Wed, 03 Sep 2025
 16:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250830-cheesy-prone-ee5fae406c22@spud> <20250903190806.2604757-1-SpriteOvO@gmail.com>
In-Reply-To: <20250903190806.2604757-1-SpriteOvO@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Sep 2025 01:24:22 +0200
X-Gm-Features: Ac12FXx5iwHLbaJ0TZ88p_k42OqHbK3bT3Fq9WvwJC3yuhfgjLr0qE6Io-xqWpQ
Message-ID: <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: get the version of libclang used by bindgen in
 a separate script
To: Asuna Yang <spriteovo@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>, 
	Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Christian Brauner <brauner@kernel.org>, Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 9:08=E2=80=AFPM Asuna Yang <spriteovo@gmail.com> wro=
te:
>
> Decouple the code for getting the version of libclang used by Rust
> bindgen from rust_is_available.sh into a separate script so that we can
> define a symbol for the version in Kconfig that will be used for
> checking in subsequent patches.

Hmm... I am not sure it is a good idea to move that into another
script. Do we really need to intertwine these two scripts? The rename
isn't great either.

Cc'ing the rust-for-linux list too.

Thanks!

Cheers,
Miguel
