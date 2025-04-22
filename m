Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B827CCF3
	for <llvm@lists.linux.dev>; Tue, 22 Apr 2025 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329592; cv=none; b=RNdAlbDYdIdmDnU37RImID5unUkMaULey5PIaqkpAaPb4JFVctX5KbWz4Md+9QvevcvsR7I7eM/avJvUGjbbl/aQQ+knLFHs8kAbvdY7MQakWHmzRJ6oi9FzU+CuJ1pW8jzLdA9MeuO3TFGsNfEvzIvIHEr69RecY9Flh3Nb0ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329592; c=relaxed/simple;
	bh=dMecEbaMU5nXf1Rjydxt+TbhsUOIhNDz3YslKq53vwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgLZzyJBCAdVbzZj1WuOxe+g57KgGLOGVw9yW68dHTpuMPgvvM7lU6Gs33e7Gi402z2n9DJeFMU0MCymJabxh/9aGW5iZl6/to93llbATTEI9shuwe/ibrNAD744bqiq9X83LrvbRWh5s7tMtMZF0VQzI3xdUbI7m5M/RegJ57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhjsF9OO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhjsF9OO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so574020a91.2
        for <llvm@lists.linux.dev>; Tue, 22 Apr 2025 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745329590; x=1745934390; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awwFbDm7jflKQEqDpnbX53KjJNqGVg4jeRSb+a5lprA=;
        b=lhjsF9OOoHHkwAMhcPq+MroFJfyaxSmrz0BtepnTL8NKYr6ek+W4Y2Q2EuCVJXg/D8
         NsLi1FYIZKPbyTAEapCCQChGu40dMXf7a3YMjMLAA6ZjiH/FfXeZsbILWe5F1QxrfB0P
         nZjGifvvEudZN/lVmBL97kQRnXK/iLZsQ7Wkrsrim7dC28sBmCKfEiEwBzXrgXIas/sr
         Tic6R0vmTcpwVwMySIV1wgjOmmVdfddiTAqkfx7i79XPSTi14eapETE5OhPrC9RgI4Zi
         xDSBLCwim9PMOb0IcCSrCT8/qCqtVtwioXkM6Pli5XoNbOMmdR4RaJ1nZDiLH0aB3+DN
         Eymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329590; x=1745934390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awwFbDm7jflKQEqDpnbX53KjJNqGVg4jeRSb+a5lprA=;
        b=i/dXL6bSy0PMI0VAiH56xSong5kKbJ0QkB3Qn1yynjO+qs6K9G4LFP33Cjr9xBJSMK
         6/BeocDmxiaHphZQFJHT/Qupw9ec8lfP2QMgp5+YeNlPWKOwWWyliqnP36wwOAA3icam
         lRKbJKfYBh+OADC6JGZESEeuYkbzkhb/ygaoy5juSwQ/z7HOhusousSSEdOwPd0adEZr
         C/sJtdXt7O6RzdIcQ5dokXVmGRj42UMYd8osLd4N3/w2gkMHhW8Mofy40PJYGU6E4dej
         urjoHfW9ugwC2aGGC4tRLEq6QCXS2ClIaW+Usd/4MVG5pEDAs5TBGmHYBfI73OdeF0Z8
         Dv5g==
X-Forwarded-Encrypted: i=1; AJvYcCXipgvvazyONUAz21zC+R3HDhVtf2tHD9zkB1jcqaA3qdo2qLnh6a1lFrQBX4u4O/4CZlYi@lists.linux.dev
X-Gm-Message-State: AOJu0YyPLHkK1O2g28LTeapTatkzpjYmf+pYp8xcBjSCuHfCkMgjKjOt
	zTNW6OSx/4y1kvZ4Cw0WJZteHwb7ry0M/Nnp2EWiiaxW9mCHDxfBHsdyUAHyGPDTAzi84FlIG7L
	FQ2MumKqNAw+gvvVROycoPt8DGok=
X-Gm-Gg: ASbGncu2Ne4QmUPbN/jGRoqw6OOPAGaLtdrXH372pITTY016Y2hy4qdBTT+/g7SPSE9
	dJHipd33CzGd5HaeWre/WQAV4NNvBV/ibxl7XweO4hPlLgWK1N4tmeXzKxsYguPl5+66JoaPzt5
	JWZKaqpO+ds9xoF7Zf/PL2nA==
X-Google-Smtp-Source: AGHT+IEvD/7Oi1OXNnSpSvib9zBGTiZYtSa6KmXETml5Sc3wcLno9P6YnLmXGVY+d+60He3bpYpfTe9GXBlxik21cGA=
X-Received: by 2002:a17:90b:1c91:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-3087ba5ccbamr8017716a91.0.1745329589855; Tue, 22 Apr 2025
 06:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250422125633.30413-1-contact@arnaud-lcm.com> <20250422125824.30525-1-contact@arnaud-lcm.com>
In-Reply-To: <20250422125824.30525-1-contact@arnaud-lcm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 22 Apr 2025 15:46:16 +0200
X-Gm-Features: ATxdqUFOX-8ZK9wTG68OV2QHGuhfwdNTtWKDYoDi6eyZlmEfBl_bLh2iur-YQGs
Message-ID: <CANiq72n41Oj4K-yZCWbNXJQEEjTqjXHYgrkffAg_mUg8dKLWQg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] checkpatch.pl: warn about // comments on private
 Rust items
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 2:58=E2=80=AFPM Arnaud Lecomte <contact@arnaud-lcm.=
com> wrote:
>
> The detection uses multiple heuristics to identify likely doc comments:
>   - Comments containing markdown

Markdown is required in both documentation and comments, so I don't
think we can use some of those, e.g. inline code spans (i.e.
backticks) are common (and actually expected) in comments. Something
like a title (i.e. `#`) or intra-doc links are uncommon, though.

>   - Comments starting with an imperative tone

Some people document using the third-person, e.g. some functions say
"Returns ..." like you have below. (It is not easy to enforce
kernel-wide a single style here, thus so far we don't.)

(Looking briefly at the code) Ah, I think you are covering both, good.

>   - Comments with references: @see, @link, ...

Do you mean Markdown references? Or javadoc-like ones?

(Looking again at the code...) I think you are referring to actually
strings like `@see`. Hmm... I don't think we have those -- the only
`@` I would expect in a comment are thinks like emails or the
`rustdoc` syntax to disambiguate the "kind" of item, e.g.
`type@NotThreadSafe`. I do see a `@maxlen` somewhere, but that should
have been an inline code span, and anyway it is not a `@see` or
`@link`. But I may be confused here?

> Comments are only flagged if they:
>  - Appear above private items
>  - Don't contain obvious non-doc patterns (TODO, FIXME)
>  - Score sufficiently on heuristics

Nice work! I wasn't expecting something with actual weighted scoring,
but if the maintainers are OK with something as involved as that, then
I guess it is fine. We may need to tweak the scoring in the future,
but it may be a good experiment.

Thanks!

Cheers,
Miguel
