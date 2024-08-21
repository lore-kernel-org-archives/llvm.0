Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDE91D12F4
	for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724242141; cv=none; b=JyljgBtsKss0StLuYFZI4MBF8Fv2Y2dIxi7cCWFtXHlsvMCF7dJKZTSz+S+P5Zs2UmE8DFex6hPGWIrPIlPAIyT5bmz1VDulKRtXza8vFknMshDhtz6wDM4tSQEKm8kArl2ECDaDuj9yNxSQX+O5MIiruYR9glK5YHmAbP3plk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724242141; c=relaxed/simple;
	bh=DA1X9Ve0Vn6diqrYfPjFkkduWMPJiWV9pT4xIJEPvqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7l+a6nWBATCZoEy6CPcWbRXG8zMw51w/i/KbEvLC34I3fLcBhyu1iRvO//xR+Zsz/4Ludakq7Xbl8dZo1nBW7Xke00MFAw49Aap1LPk7mFTYu1puAJWSVedoCWdRtYHTuusDYk+kmK2RClKFqpVc+ky2gjXwMAiE4REPNL/40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fM19IPoT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fM19IPoT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428f5c0833bso3936255e9.0
        for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724242137; x=1724846937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDwqhRHhMBQJ/+TLyoRpyJFlfsxxIUrIdKu8FSn6JKQ=;
        b=fM19IPoTxgUDQo/XeBh9rzEki8T1If/bfB+CGOZ7ka1ZUibOvRa2HlUjHzNcxfCFom
         MyvJ+mWkBj+FgiP1oup9PtJFs6nRcOYM66JHnwHxpLhFGtIsVWGRVY5NAsOY8zlblypi
         wdgnIBQRk99asK9dNXBK2i44UEh6LfiF7as7ZjLYNHKWvjS06tt8gujXL7/Ug8tFjor7
         2cF5Smavn/IqHICF214vMJ2RSX2I1u+ooEH4sroXEf1Dw6y3eYEhxdZBrvgnVkkvz99M
         pwtT/lTDng0UWvGXgjYVpASmasQdohDtkngryJiJoELL5Mt5NDQM4GgDJ4j+FSxmivSN
         wy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724242137; x=1724846937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDwqhRHhMBQJ/+TLyoRpyJFlfsxxIUrIdKu8FSn6JKQ=;
        b=ZNvoGG0Pydn0BubilJJAf/nKgtO+hDfK30eJiQM5BskcI5NTY2f1aOHs3jc9V8M1l7
         /AHaO/YNxBUdKXumsx2twMc9o82rTdiIACmHcFBr1IlxPESbMUFV/o91VdbLgTA9+6bl
         eoAnfc0VABODEzbyJz75fpgJimW24SIpsoaWQK92L7SxYXJU+whkgLGcYm5ZFOoCT3LK
         wXvpdXwhEsMIAa1BWkn5McM2e0AJRL965iw/xSh3Lct6OHPtFT/y1h9e73HdCvoUlLjT
         voUQ4hQX0qOYmLBfF6qEfiXS4u6fJ6AwIPfbbHnIesssl5Pl5/hBnTnb4tJ+6sE0Sb+N
         kexw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ26NXqg85f/BNpc6p09boeTNqeAbvsEL1Hj3BYCP9xx52/RRFnpqzVT0m4ne8I1msCJ+w@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7w49OZ3wILNAkJPileQdtEIxw60PtFFBrHEBPlKkxfi1/cSUr
	Uxnj9Eqb1Pqd95QMSDFbYw4+KsduLVUNWeCaB3dW2pg4OrBC/yYTILnsbhkvVILGOZ0i5skVZqh
	Hwp7FsqkdvCMPASIPXmAvPTZiMj0NeJc1w5r+
X-Google-Smtp-Source: AGHT+IF/+B4e2rOwDucRvS4kWT6EeKo58j00U+Ub/62J14Eex9C5zjjnxt5zAjMaLCrIZo2JrYvwnhV20MJ6wjBJhW4=
X-Received: by 2002:a05:6000:b01:b0:366:dfc4:3790 with SMTP id
 ffacd0b85a97d-372fd98d681mr1189198f8f.0.1724242136775; Wed, 21 Aug 2024
 05:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819153656.28807-2-vadorovsky@protonmail.com>
In-Reply-To: <20240819153656.28807-2-vadorovsky@protonmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 21 Aug 2024 14:08:44 +0200
Message-ID: <CAH5fLghOFYxwCOGrk8NYX0V9rgrJJ70YOa+dY1O0pbNB-CoK=w@mail.gmail.com>
Subject: Re: [PATCH RESEND v5] rust: str: Use `core::CStr`, remove the custom
 `CStr` implementation
To: Michal Rostecki <vadorovsky@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
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

On Mon, Aug 19, 2024 at 5:39=E2=80=AFPM Michal Rostecki <vadorovsky@gmail.c=
om> wrote:
>
> From: Michal Rostecki <vadorovsky@gmail.com>
>
> `CStr` became a part of `core` library in Rust 1.75. This change replaces
> the custom `CStr` implementation with the one from `core`.
>
> `core::CStr` behaves generally the same as the removed implementation,
> with the following differences:
>
> - It does not implement `Display`.
> - It does not provide `from_bytes_with_nul_unchecked_mut` method.
> - It has `as_ptr()` method instead of `as_char_ptr()`, which also returns
>   `*const c_char`.
>
> The first two differences are handled by providing the `CStrExt` trait,
> with `display()` and `from_bytes_with_nul_unchecked_mut()` methods.
> `display()` returns a `CStrDisplay` wrapper, with a custom `Display`
> implementation.
>
> `DerefMut` implementation for `CString` is removed here, as it's not
> being used anywhere.
>
> Signed-off-by: Michal Rostecki <vadorovsky@gmail.com>

A few comments:

* I would probably add CStrExt to the kernel prelude.
* I would probably remove `from_bytes_with_nul_unchecked_mut` and keep
`DerefMut for CString` instead of the other way around.
* Perhaps we should remove the `c_str!` macro and use c"" instead?

Alice
