Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1078214F12D
	for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724484305; cv=none; b=LYcE7sPXlMP61f+WgRWDrUBAhfrHssL9n9RVnHAFb9P5Kqru2T0Yl48ww3oosraBLuPoEEoBDF0M/me8zAnPSftuqKqfTwDvqbo9FRpKsAqkI1md4gS3NsHWJh18XYD58uOb37o2SMITQA2qQt5tUJ2yVXSCEz2NXMGCeTCxBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724484305; c=relaxed/simple;
	bh=g6xKvcThqp7cNcb49IH7d8Zjo3rGrlE8E1s03ZsRXRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwfAx5WAHi+oJ3hBxoP0j3Z5fWNY+98DRliDsiEeYQ7o9ONF+xypRFKj4zACxBGR+WGi6gkLczEAoWNvQakdDB2RXfgihPtCA1QpYcDz16wZPf0W2uqFejMdCbem4qJdG5NwD4pjpVpSANgOB3bBnH2jKh7uN624knAi5opo5s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=OfylNslN; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="OfylNslN"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6c32daf0797so27734187b3.0
        for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724484302; x=1725089102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6+A2VuRa3vINzgOnqqBfzLTYjWfMi7SqqtjGQfCE/k=;
        b=OfylNslNKe1Fj06wDvTg+/aaDridtxGqnwQtYk6bWRHu6skut0lcd1SVyn/KBc4Q0V
         FbcSiFNbVob3PKuP2ksbre0ygebA8BC5Lyf22Q6BGsa6+ZrlMg3js5BJeax6qRZoNhm2
         Jija+vWZiIINzj1Ihfa8PHpLEa7Qam53bgdM3z2q8eZ1rREXC0ieA9nJbBcQt3IePyHg
         /IMWEkB3FJQPX4iKWUIV8+OQ3+NtCH7aAx6O8Dya9+5TvdzevEfThhJBF69AqEtoA9EG
         Li/HX0DVTwU9cuXyKpHkCBgdCIq/InVMsXcD+8/DC5PzFIkS94rOzgzvSQXzs2BCcPQM
         eMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724484302; x=1725089102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6+A2VuRa3vINzgOnqqBfzLTYjWfMi7SqqtjGQfCE/k=;
        b=j4KcfrjvJfkqA+ooXwM6ocNLblwjrMO33lEA9m+BMTE8dB1DVdSyUC7ZiOZ5r8mIqx
         H2UAwkUkssCixgRmWZWRunIY3UHIQg/XirrF+1CN7tapOE33G7xoDAqrfFJVpvKE5PJQ
         A3ofw8ricZyS0l8MtH3XXw8Ym/4PiWJwOpcN3RPH4gTrDFID5VqbwR2JIUlrK79rXNHM
         ILTYSU24ERYDxsQsY+21hoFEGKv4nuUeOGCrarjZ/2/dQOwnzUZH4sIvC3HXT/X1A9EL
         GHWuUdsLyWjbMQM+QGYycipkpyOpq+cyBAmpicird2rhbCLajr4nvuIrFVlmbja/N+y0
         odHg==
X-Forwarded-Encrypted: i=1; AJvYcCWA0DOEaFdgqZlkinzK688HSeuuPlrwgopg0EbbBj5mCJydiYqB7TY3CikGd7vyc6RveODf@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmg0lhUKhyPToHkx+DHGSu41MhI0J3PjWJyO5ZBbG9TrlQIbIR
	w5VLgBoQBKOMH9MzSdr6EFvwUb/zThTcipJ/JjJ752R++TdmXOLWPpwPCMUfSwK9cKxT2OvC2Ca
	vFMhaazKlR2LNnO/IEAK+HscAZanyCm3Oep4AGg==
X-Google-Smtp-Source: AGHT+IG1BlHDuekV5AcLsj47uYwHvnVdzGRFSDLUmEl/F7Nsu+5/w5qTxjhDCMbQGyjdd5802kibXL0vaoVv13Foy4o=
X-Received: by 2002:a05:690c:6606:b0:61b:1e81:4eb8 with SMTP id
 00721157ae682-6c62538d6f6mr67130637b3.9.1724484302011; Sat, 24 Aug 2024
 00:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819153656.28807-2-vadorovsky@protonmail.com> <36272d4a-eb95-4842-b171-ad6ec39a7631@gmail.com>
In-Reply-To: <36272d4a-eb95-4842-b171-ad6ec39a7631@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 24 Aug 2024 02:24:50 -0500
Message-ID: <CALNs47uKWTH9mUhEp1-f=zX8fgPpWExQWct0YYa2Q9H6yuaKJA@mail.gmail.com>
Subject: Re: [PATCH RESEND v5] rust: str: Use `core::CStr`, remove the custom
 `CStr` implementation
To: Michal Rostecki <vadorovsky@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Finn Behrens <me@kloenk.dev>, Manmohan Shukla <manmshuk@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Yutaro Ohno <yutaro.ono.418@gmail.com>, 
	Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@redhat.com>, Tiago Lam <tiagolam@gmail.com>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Tejun Heo <tj@kernel.org>, Roland Xu <mu001999@outlook.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 10:43=E2=80=AFAM Michal Rostecki <vadorovsky@gmail.=
com> wrote:
>
> On 8/19/24 17:36, Michal Rostecki wrote:
> > From: Michal Rostecki <vadorovsky@gmail.com>
> >
> > `CStr` became a part of `core` library in Rust 1.75. This change replac=
es
> > the custom `CStr` implementation with the one from `core`.

[ very long snip ]

> > @@ -180,7 +180,7 @@ macro_rules! assert {{
> >       #[allow(unused)]
> >       macro_rules! assert_eq {{
> >           ($left:expr, $right:expr $(,)?) =3D> {{{{
> > -            kernel::kunit_assert_eq!("{kunit_name}", "{real_path}", __=
DOCTEST_ANCHOR - {line}, $left, $right);
> > +            kernel::kunit_assert_eq!(c"{kunit_name}", c"{real_path}", =
__DOCTEST_ANCHOR - {line}, $left, $right);
> >           }}}}
> >       }}
> >
>
> I forgot to include the version history before sending the patch, sorry.

For future reference - when replying, you should delete irrelevant
bits of the message you are replying to, otherwise things get kind of
messy.

- Trevor
