Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088851BD50C
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558153; cv=none; b=c64mhMb3N9vcNoWWGhe9E+ePgE3cNZ0OKTUjjO1SeHFu4m8sfyaWlxPgQUwKP8gounli08It3z7EGx+13XoodWHa1CaaArLPhoJDLRgiIDeP3iRkLJiUSUe4uiO1umlz5PFGmj+Y/6stWSBW0nUpzWJ9vmdIdJPez4z77/i3sGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558153; c=relaxed/simple;
	bh=VUZtMlFmU9aktV9oOImu+gMtJQ/WQw06C2hUBzcUsec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndX1fZUx8XdvYV3cQqnqMGF0Ulh+GG2EP6GJfP8Z+my8Jaqm5LUZ1IGIkPCmQ+vCQdrRi4y5D4F2MyTKmn5B4xoUYd/1RdyoPkwnMIxJYy2gQEX+kjnl/aFZ0mONl2HLcvdjMKNYgW0DRv+IpNZwep7fyYj6XcW00L+pM278IDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GyyUmn4u; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GyyUmn4u"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4311420b675so6590065e9.2
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728558149; x=1729162949; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vm7iH+80LuUknHyKz8yii4nAbEM+GkBJz008+GYeeIk=;
        b=GyyUmn4ugnvIiDIInRifJ6ihj2UjJX9cZlv3UsEWPiQyX6JZ5OMADDYYwUg9EQLmdy
         2WyueKBTAtk5nj/4//y1OdUSpBbovg/Oix7KYv9xVCoaR2WBufZ4fpymGcuOlyaRrSD+
         VokJux5IzFPtAa38NxsnTyaoSZy7VB/LBA7Q5Dx9PUzaDYMw23lgAdJygtqjHRZHnTvF
         N1awvWYYd4H0b5Ck0Z8wG8nCsddUNm+FmJeIngQFaoENMxuO79VurLJJ86F/BvlA2rI+
         4hRfBDX3IRyVNCi/VWPQyeSyPHi98JtsDxwgQrqeqkCAoDi/v1dIrOu4kUeot88kRl7o
         /zhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728558149; x=1729162949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vm7iH+80LuUknHyKz8yii4nAbEM+GkBJz008+GYeeIk=;
        b=BTxGBILtb3xX5HfM3BoBBwLJziDkfWR5UOu5ZGnuW72bKVrmBV6IiLQxuAEateAX7b
         j87ru8sQGgFJb1+tnBE/vPWpp1pevd/Wn341zF5CiJfPoBrDryKldJzE6r3nLYN3n4xM
         ZEq+TAwvCZVkbKrTalEthgnGSBzhABY2kwPMhsRLE92OhAJGk33eEhIMCIwjUCaaRexf
         Hf47cnUDl7jRFfgUkPCG31JsmYusuU+4uwhGpXd8s6vNRuBOz1dSjqINkECGAgwU6LW4
         oteBtBbk1LzT13GUi6bzLYxoo/HFw37JKFdKMKaztrjLfdatx7hWQ9zIPpNYQVboRCU8
         AR2g==
X-Forwarded-Encrypted: i=1; AJvYcCXdAe01LZSylerKdH0UZ5mwSUJJN+UApjcEhehpdwqeqj3IGof6pfkEVSPKsIZo9qIhk2/g@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3QMGPpSIwsfJ73Ti6P9GrmGjPWri/6/sZlJTCtco16YtU7U+B
	oTUmJmXmGR3IT4rHvQg8xsgEuHs6a4uG1dhHfl6SnaD8AfkA6AkkY9dVv7BbwlIiDIvTwZKmDrH
	n8/fEOjdQx2LgUhqkFfTp4jW7P36NPCPXn9oy
X-Google-Smtp-Source: AGHT+IEhkXYyqV/bhuHZm74JThr/Q/zz0AYwVohM06m/aYfA2ou2oQr9f16G0HxUpPy5+6rG27v0LxANOflRiXXU8PU=
X-Received: by 2002:a05:600c:45c6:b0:42c:b1ee:4b04 with SMTP id
 5b1f17b1804b1-430d70b3d24mr51844575e9.28.1728558149119; Thu, 10 Oct 2024
 04:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com> <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
In-Reply-To: <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 13:02:17 +0200
Message-ID: <CAH5fLgj5rPgV1wBbYJy=T0kjCdECYnDvbim0pEk5y6fp7BVx3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 12:55=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Oct 10, 2024 at 11:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > Each version of Rust supports a range of LLVM versions. There are cases=
 where
> > we want to gate a config on the LLVM version instead of the Rust versio=
n.
> > Normalized cfi integer tags are one example [1].
> >
> > For consistency with cc-version and ld-version, the new version number =
is added
> > to the existing rustc-version script, rather than being added to a new =
script.
> >
> > The invocation of rustc-version is being moved from init/Kconfig to
> > scripts/Kconfig.include to avoid invoking rustc-version.sh twice and fo=
r
> > consistency with cc-version.
> >
> > Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-0328=
985cdf33@google.com/ [1]
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Alice: when I apply this, I will need to add your Signed-off-by here
> (i.e. when handling patches from others, you need to add your SoB
> too).
>
> > +if output=3D$("$@" --version --verbose 2>/dev/null | grep LLVM); then
> > +       set -- $output
> > +       rustc_llvm_version=3D$(get_llvm_canonical_version $3)
> > +else
> > +       echo 0 0
> > +       exit 1
> > +fi
>
> I guess if we don't find "LLVM" in the output, something weird is
> going on, so I guess it is reasonable not printing either here.
> Although, in principle, we could preserve information and print at
> least the `$rustc` one.
>
> Anyway, we may need to rethink this when we start supporting e.g. the
> GCC backend, so I think it is fine as it is.

I guess we can just do

rustc_llvm_version=3D0

in that case?
