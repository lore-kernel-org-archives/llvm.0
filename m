Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4A2F9C9
	for <llvm@lists.linux.dev>; Sun, 14 Jul 2024 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720978230; cv=none; b=J93M9Fjeq9TZ+K1AfwMixVnarjuR9PG8WTjP11r/snrl8ZU7/rzNurc0Cygz/bPAcvmJHkvH2mE0LD5vQWZsl0Fr7jcmr2vYSW1jc9cdPsltE9oHpdriItP1Ep7nUnwJFvUfDIvghO8sydi39TZJbtUw+JF/oMvdhdfpJ7SowrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720978230; c=relaxed/simple;
	bh=eoz4ISS7d2sH2hTa7QRiAuGG1rWHxXjixXnT2ssYqnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AO3Fj0XMJKh90T00COq5XQ16IqaOB66SioCeLGAnkpqzmySy2je2+ttMsFf35wmO89Wu5QQtaXKKxnZbLHguo/VA+DIYjEzL9EiS9qx1UrU2c4RvjFp1K/yAkHqFAR7mU3sApNpOTx1syAqYeRTwgaS4sSKRVeAsSWWHV04YVHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0gA+Iw3; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0gA+Iw3"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5c697fc4aa2so2555061eaf.2
        for <llvm@lists.linux.dev>; Sun, 14 Jul 2024 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720978228; x=1721583028; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cLW4DNVGNshBrBTsdLmOTS96GV7TP/xD70TwT5VJ2s=;
        b=X0gA+Iw3fS54itkR4dp0KP9Ne1nmTty4awRLFYJL2xsuxCNV1HKCGYSZGyNrnJWHDR
         L6bkGPY6u0Vr2MM6fLCefBf1IiCS8IvU5pAYFGidFkumm7e72KI+beMr8UHmRwtA4NLU
         FKrwHlZjYeMlkm30h93h1B1Wihfo1ujFtrOhUtfJtEBpVt86WkB6vKZ5r0qNWELMc4Qd
         Ogbwi4bmBSuK0uhb1PeUbu2RNlZJkrbey/ZeelAcksUfn/LQLQ8VzQMHW5P8f/TbBdsz
         g9Xyu3Gdu3OmNh5pRYBfNJ2h6SbeuVo4noCgXpbwvRVPfPg3r1c/QM6Ot0f+Ujvfs8Jw
         krBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720978228; x=1721583028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cLW4DNVGNshBrBTsdLmOTS96GV7TP/xD70TwT5VJ2s=;
        b=g0JrJmImJ67vbW3sdYR2+v0/5yy1OxBH8vFmROfvjkjF2fKjXL8d3vZXevmAWmF5+l
         d6qzToBINJQ1bxVSOhftyJuOe0CZyP7GSK/7aijRyC6A7Cs2bRyTCm/QsVfgwxSroUrQ
         4i++FgPlPOcQL+rbrhcutJI7K9HNinZ4JNegihOxNrMSxbiPShNQryVqI4brNUkgwC7d
         xUs7u0CXww8yNvsPBzoG5uSn51HL3iAjN47DGfSOnnGB12HfmwJkrZ2PnXAYVBL1tlug
         0N3H7KgFXECmshyS6iuSi+LnOy/WqJmITBETqFbhrdch9FCDYYoFEEYG7kJpSSEZtDuY
         f4kw==
X-Forwarded-Encrypted: i=1; AJvYcCXRg8gUvR4MRUmGS9zbSyoFBfYmJ3lJN4epzKDBahfBP5925Om9JcfIoxY2bz9I6g/55ucDmxaCTFcog5XlL9MOE1DtiA==
X-Gm-Message-State: AOJu0YwhRZqt3uxMo1YJd69MbgH1zE3P5iIJWD76NKjdP8guXm6jc5pI
	VAgUrDnYp3sOtI2BuA0JH+N+ifuWr6iY8h70ekJboW1d82J95nCrt5BtFPG2e9gx3PtjhfNDyms
	OAGfKjPzlAJwa/ykebKEP4b0tDVA=
X-Google-Smtp-Source: AGHT+IEl8QKe4NvFcBM4q9JGhb2MwGeuTO3IyYzcItTz+lIQYAUJkOIhJojhagfWcGc8DwiST3dj+mLBvjJ/MoDWQBw=
X-Received: by 2002:a05:6358:70b:b0:1ac:6234:faaf with SMTP id
 e5c5f4694b2df-1ac6234fdc4mr496748155d.17.1720978227984; Sun, 14 Jul 2024
 10:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240714160238.238708-1-vadorovsky@gmail.com>
In-Reply-To: <20240714160238.238708-1-vadorovsky@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 14 Jul 2024 19:30:15 +0200
Message-ID: <CANiq72=kchSt5XjAJRVgNWG-iNXbc2E64ojwsQYnB2pshULK1Q@mail.gmail.com>
Subject: Re: [PATCH] rust: str: Use `core::CStr`, remove the custom `CStr` implementation
To: Michal Rostecki <vadorovsky@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Finn Behrens <me@kloenk.dev>, Manmohan Shukla <manmshuk@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Laine Taffin Altman <alexanderaltman@me.com>, 
	Danilo Krummrich <dakr@redhat.com>, Yutaro Ohno <yutaro.ono.418@gmail.com>, 
	Tiago Lam <tiagolam@gmail.com>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Ben Gooding <ben.gooding.dev@gmail.com>, Roland Xu <mu001999@outlook.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Thanks for the patch! Some notes below...

On Sun, Jul 14, 2024 at 6:02=E2=80=AFPM Michal Rostecki <vadorovsky@gmail.c=
om> wrote:
>
> `CStr` became a part of `core` library in Rust 1.75, therefore there is
> no need to keep the custom implementation.

It would depend on the differences, right? i.e. for a reader, is this
meant to imply there is no meaningful difference in what you point out
below?

> - It does not implement `Display` (but implements `Debug`).

One question that comes up when reading this is: are we losing
`Display`'s output form?

Also, for clarity, please mention if there is a difference in the
output of the `Debug` ones.

>   - Otherwise, having such a method is not really desirable. `CStr` is
>     a reference type
>     or `str` are usually not supposed to be modified.

The sentence seems to be cut, and it should probably try to explain
better why it is undesirable, i.e. if it is needed for something like
`DerefMut`, then it seems better to have a method.

> -            static CONDITION: &'static $crate::str::CStr =3D $crate::c_s=
tr!(stringify!($condition));
> +            static CONDITION: &'static core::ffi::CStr =3D unsafe {
> +                core::ffi::CStr::from_bytes_with_nul_unchecked(
> +                    core::concat!(stringify!($condition), "\0").as_bytes=
()
> +                )
> +            };

This looks worse after the change and requires `unsafe`. Can we do
something to improve it?

> +        // SAFETY: Casting to CStr is safe because its internal represen=
tation
> +        // is a [u8] too.
> +        unsafe { &mut *(self.buf.as_mut_slice() as *mut [u8] as *mut CSt=
r) }

I see Bj=C3=B6rn commented on this already -- `CStr`'s layout is not
guaranteed (and is a `[c_char]` instead).

Also, the casting is not what is unsafe, so perhaps it may be clearer
to reword the comment.

In addition, please format comments as Markdown.

> -//!             work <- new_work!("MyStruct::work"),
> +//!             work <- new_work!(c"MyStruct::work"),

I agree as well that it may make sense to simplify the callers as much
as possible, unless there is a need to have that flexibility.

Cheers,
Miguel
