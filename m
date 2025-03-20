Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390C879C4
	for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742469720; cv=none; b=QrwxsB2eTaaHvqv0UorxCPO4vXf6/thdjU7YSNGwwWQxwCYSSB91pu8b4OYHUqfElegjTvcu2bhEBkVVZ1jEeYYE66X1OFSZqBOQUx1F8SnFgIQzHj7wGe47+0Fvhs8yJeOJ6Y29GVCA8Bnc5RpMy9dbOnG0bqXY/u99FX5Yqw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742469720; c=relaxed/simple;
	bh=k3mrXD+OZ3IUnCcb5OnLyDwzPqKGoZTi9oVugUiEAVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFuieRW42u8aAokMIT60s5AxG3Gc7mw73Q6Ezhanuy3YmZzQdf5VJYni5bA+gZLDJWPEpgsQR6gzMhyqgQPD7K98qrgWIQTqiJjrFH4Vq3Pz/rlmcAiON20XljbQ9r42kzu9Ywz1VNrWtNhriPRXzBsMTHRmfJ45JL/zNHoSW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhDUcHpO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhDUcHpO"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2260202c2a1so1095395ad.3
        for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742469717; x=1743074517; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFB3BqXH2e8TxvxT6l759Ym4N0OaYQbHqoLpgW4lhNg=;
        b=dhDUcHpOAAD1Evmdui6kbcbCOVAxJdhL6iBuvftPrWwFGXM6BxIquBL2S1ZYLxn+k9
         mZSGhgPsB0X7mMK5XUrPhhJpPiuR7tm0GseXmwsnMLhsoeEoLCxxVjUhCZRTEYoYEVS+
         gS+66yyIDlo01Z8ipAa3tltX2vyxthmXh1jzrNYr++fS7O7Q9n8vcEWL/ehP3ORmWBzp
         wIk1Qe6FSH4xghmi85Ka9rOQ3vVaPnGGTpdbZ02zoagG1C4BJfd4B9dduQVQJO1eef5/
         GJXFIXwgw0eaVBXFPbNiAFAwwyuoQrmu5ZGbJByTKjoGluRoJ55zdElc8J8Xlh2wLaq6
         yaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742469717; x=1743074517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFB3BqXH2e8TxvxT6l759Ym4N0OaYQbHqoLpgW4lhNg=;
        b=fRo5oOd+7sisN4LpzGDij9bj/1/uqniirAlsedFtCTVVK2yQEiaGtt/tzbOarE/uC3
         7uAi3eZDdwTHlJ48t2u7kQd5wnEqKQvPkRyVf2aBzXFYV49ll5PPebKxz6mjSYiy/yS+
         I7GYqb7rvAl/nqh79MoUKWd4n0pbHzIc95FAZLPsFoMpq9jYuV2nskvlMlwmAKKvS7Vr
         rjrKGAZ0zybpGjomCSY0HyydVWa3uRFiOVeP9o3kxGRqyhM4Kyy/66ngPsS17LkzwC+S
         rB4rT6Ha28miHT4vNhVNY2z2y1PJwZYA6ZRsy35D4jPHF4CFHhSD2nHEpIO0KFHgMK/4
         wO4w==
X-Forwarded-Encrypted: i=1; AJvYcCXYGmKzEbDHN5lOCiZaWCvwchW0u2UVjvrm1byewH6AvpqrgS4d2SL8JVS2QcHUCYkaTaYh@lists.linux.dev
X-Gm-Message-State: AOJu0Ywyo1FGGznkSXg8J7gn6KVY9fM7595BVLUZHRCtRRUYssVYpSev
	SvLFfhYLNd44eCsvU7gwgDNWTJ7hQli5cBYbLMgNDOLvBcjRkN9i2xPf3W9SMcQilCcWglRxtLU
	pgNXmbdyePYzUboWLRI5nJEdsXX4=
X-Gm-Gg: ASbGncvLR8B77s+NnrmQmfCLihkPVJR5u7R+BGThdaZSDEH4dApii/0DoG3Uj2COC39
	CMnHfZqIt/Rybc1SasqEOBWc2XXR/nDGdSSIEwsYXZPhrkpD2nnVhhsdlgjvluWaxiz0xGQQRl7
	WFm/b8Nb21dRD0eEU63u5xXiY9uQ==
X-Google-Smtp-Source: AGHT+IGASnHt9kNdq4d2lMO0TzafwSvDobso+TMwUI77RRq+dwIZX0mnFiZmhKy1QI2Pzn9arbywzIffrQpEHdWmdiU=
X-Received: by 2002:a17:903:8c7:b0:221:7854:7618 with SMTP id
 d9443c01a7336-2264c6053e1mr35338755ad.8.1742469717435; Thu, 20 Mar 2025
 04:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net>
In-Reply-To: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Mar 2025 12:21:44 +0100
X-Gm-Features: AQ5f1JpS94wTwKsmexWFYTQXZEkTRXemKuXOU31dkuRuFGtc1-F5e7wOCbLzIPk
Message-ID: <CANiq72=UKxv9EeV1Ozg5bcOtuoaFwCkm=7Yi+kBihoR7XzqHpQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: two small improvements for kunit
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 2:32=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> Two quality of live improvements for running kunit tests for rust/.
> While today there are only the doctests, more are coming [0].
>
>         $ ./tools/testing/kunit/kunit.py run --kunitconfig rust/
>         [14:25:48] Configuring KUnit Kernel ...
>         [14:25:48] Building KUnit Kernel ...
>         Populating config with:
>         $ make ARCH=3Dum O=3D.kunit olddefconfig
>         Building with:
>         $ make all compile_commands.json ARCH=3Dum O=3D.kunit --jobs=3D16
>         [14:25:53] Starting KUnit Kernel (1/1)...
>         [14:25:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         Running tests with:
>         $ .kunit/linux kunit.enable=3D1 mem=3D1G console=3Dtty kunit_shut=
down=3Dhalt
>         [14:25:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D rust_doctests_kernel=
 (135 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         [14:25:53] [PASSED] rust_doctest_kernel_alloc_kbox_rs_0
>
>         ...
>
>         [14:25:53] [PASSED] rust_doctest_kernel_workqueue_rs_3
>         [14:25:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] ru=
st_doctests_kernel =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         [14:25:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         [14:25:53] Testing complete. Ran 135 tests: passed: 135
>         [14:25:53] Elapsed time: 5.431s total, 0.001s configuring, 5.314s=
 building, 0.086s running
>
> [0] https://lore.kernel.org/rust-for-linux/20241213081035.2069066-1-david=
gow@google.com/
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Applied to `rust-next` -- thanks everyone!

    [ David says:

          (...) this is enough to get Rust-for-Linux working with gcc under
          64-bit UML on my system.

        - Miguel ]

Cheers,
Miguel
