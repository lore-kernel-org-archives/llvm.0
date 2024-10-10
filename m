Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB81C0DCC
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557739; cv=none; b=G5eIG3uyBe9n38MGVXaUJmXAEb6sbfObS4GDabMK1zatk1kHBLxhJCzjUvT/fgvVCWaYOtn0r9y/epJJU+74rEDPN6Ie892LlddSPJ0EbqLVKkAyLGEUl7pBQAP5GwwGKH1zaEjida6CxHU0LyTu9RG9Rd7HanY7IPWAykYQLqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557739; c=relaxed/simple;
	bh=LxY7kWckS0SuvYaF2yrTWIemSOOZus+yEuXxUicIZnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5em9BvuvTH2RgNDiAYf9MF9ovUHPmvYdtscu+6/bnNQxNXcQQJYmmxfFAc028skfcgCtM6FM8KguE2dd33eRXnmVPuyc2yqIYCFu7OR+4vL9jo8B9Tn9eRh+s9O0+E7PRTueYwGlL8gaIuX6ka6e8DziWCeOSpwLPC4dz+m7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqoU7p/W; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqoU7p/W"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7db3e962c2aso49707a12.0
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 03:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728557737; x=1729162537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7prhNlBf0rjgrPFlAZtBHJ4o24kuE9bb4AC/MN06Po=;
        b=QqoU7p/W8sFGDQ6Wotb9O6rBr/A3L3faB8HVwejKhUqLjhENZjH/PTwAy2SNCOXgck
         V5WF8c+d8VW8QcBgKM8YfAGLCFZwSpz+p9NBOG9NKaKRjkqyBN/sDk9IfiiM7eYONeEt
         SxGdtVsBrmkmynkFecjgin12hrUfIz7MSJ4k0/6j5uwE/7ufjCiBNJuzoyXvVlO4m4jG
         aB5yC30u/xH6Hijag80RToosCVb5Yvs9Jrzqb0mPyGmyTOT3nGoA27EoGx6pbJ8JzkWp
         QPEebSw+WKQRQDBQIf8iJGZmws7A5EYXFljGpiNN1YBi9wI3D1laWhQleRGpmiUEw4jP
         B5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557737; x=1729162537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7prhNlBf0rjgrPFlAZtBHJ4o24kuE9bb4AC/MN06Po=;
        b=uxbEIQqFdr5L5kwpGQJRR1jGn/AfEfqxrJQoUzYrqel+vlebahW5g6/yc1vBZGAW6c
         BkK8e+yGtO1za8RnQw5Tmz2keV5nMhIF8wUA3ZHHQM2/VvM3SwVsHZvZ0g3S4KALCERb
         Hr/oRQ+1UKY4LswXS2vx2sjzszmEvU60tfcy9z/qTYEvXKvO+Y/bKdBh3fXf2hoLS9kO
         Ylo6JZoyKTClIOvAZa4lDSCVgzrU1hZ0NBZyA8pBUa2l8WAjueKtdYJZGA8CJKzWMXJY
         R8CtIJvuZQ+9Cebt65pRIQ0CelQgSDEmMbvAOfJFh3mJ7dY/41yoVP8tO7dVvxUizK7T
         hqsw==
X-Forwarded-Encrypted: i=1; AJvYcCWavVNk0UfjUmcQArRlNQixo9nXtr0F1cSenoFr0EURc4AIpDkWaWzZZtk03lZXZfc+SH1Q@lists.linux.dev
X-Gm-Message-State: AOJu0YxXM+nCeyU7cDvF9X6PGMNIN39psjLkDW6KF6fSUh8ptCbU7fqq
	h3utbKGIceM38MbridTuAe54Gz9VVshki1/kaV57dv4ol/bS8zmD/h+GYAqT6HCsdHTl5Jc+rdZ
	gQoe8BgqYwcyWQkv19d1W0NBuWn4=
X-Google-Smtp-Source: AGHT+IHAJPvWSarPUcHM5fTP1XOvft1y95dzd2SSxjokwM/tDrb6430mBqh0ufFkL+MZrSQjwaTb5z7red4s3fH34oc=
X-Received: by 2002:a05:6a00:3e28:b0:714:2051:89ea with SMTP id
 d2e1a72fcca58-71e1db6491amr3947192b3a.1.1728557737046; Thu, 10 Oct 2024
 03:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com> <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com>
In-Reply-To: <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Oct 2024 12:55:24 +0200
Message-ID: <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Alice Ryhl <aliceryhl@google.com>
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

On Thu, Oct 10, 2024 at 11:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Each version of Rust supports a range of LLVM versions. There are cases w=
here
> we want to gate a config on the LLVM version instead of the Rust version.
> Normalized cfi integer tags are one example [1].
>
> For consistency with cc-version and ld-version, the new version number is=
 added
> to the existing rustc-version script, rather than being added to a new sc=
ript.
>
> The invocation of rustc-version is being moved from init/Kconfig to
> scripts/Kconfig.include to avoid invoking rustc-version.sh twice and for
> consistency with cc-version.
>
> Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-032898=
5cdf33@google.com/ [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Alice: when I apply this, I will need to add your Signed-off-by here
(i.e. when handling patches from others, you need to add your SoB
too).

> +if output=3D$("$@" --version --verbose 2>/dev/null | grep LLVM); then
> +       set -- $output
> +       rustc_llvm_version=3D$(get_llvm_canonical_version $3)
> +else
> +       echo 0 0
> +       exit 1
> +fi

I guess if we don't find "LLVM" in the output, something weird is
going on, so I guess it is reasonable not printing either here.
Although, in principle, we could preserve information and print at
least the `$rustc` one.

Anyway, we may need to rethink this when we start supporting e.g. the
GCC backend, so I think it is fine as it is.

Thanks!

Cheers,
Miguel
