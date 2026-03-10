Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE33352C4F
	for <llvm@lists.linux.dev>; Tue, 10 Mar 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140999; cv=pass; b=Q0M0gjLgtgv8WTcOOwONEr354RbxSXiqIc1TgZoW/p8r4SbAzl/Y63owi8EkgBa7CEEA7iwJq0875coK+o2Bk1L3mH5VeDvP4IApCgnovMR9tpbOwz++fwC2gwCz9NtLC2Ee9Aal3L71ZxarCwyqpPQO7dy/ZOO+iThthLUGFwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140999; c=relaxed/simple;
	bh=Aem47PhvPdP/iyuqplBe3P+A+LjmiDgpbIH/qJLSI+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gH23DsKR2HAMNjj6ymVpXhug9/woyMGhtOkiITVKJK3rYYZU54n8RqqV1Vza/UfYp981LOjB70YA+LSmU9q7D3V4kPUl8CIXYdC2UAwaOpdvr2meKFe/lEQ8tN6w7ZnybqMKR7Wi1KMVdubQ1gB/e4NGMMrznZs8OtFyJ//8uaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBbQrH0Z; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBbQrH0Z"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bda3b4318dso61703eec.1
        for <llvm@lists.linux.dev>; Tue, 10 Mar 2026 04:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773140997; cv=none;
        d=google.com; s=arc-20240605;
        b=iNmmfUvAcHO95i0BTRkVQF8KMizuj7T+KpDt/Qdz7wCOvxcvM/qi2Ntsg8WzeNUuPP
         TgnNt7dGk1gxzipBLSr54Q6fEMDLVFMrIQmBmPf/4PjdfBkbRHUqkBX8PRxzfSw3dRvL
         dcwgDj+up+zF094UCtKzOMndQIEYW0wx6/xKKSel8r8ZyOro4D1bGUurolpJ15jXlk+E
         +zhai8zScKtKtdUhVTFYGLIjvM21nBjjlrkBC5+o4EfL3/H+nUvGYMiL//BuPKdlhoZ8
         ikEatd0trwkYG5Ss5REF95w0G7pxnVVaaTQIEKfY35qef5nZ6k1C/pxLxNZrKyzQyA8+
         4e8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aem47PhvPdP/iyuqplBe3P+A+LjmiDgpbIH/qJLSI+A=;
        fh=62nCO0WyxRSKJpLEboXowqoKwbyxlfKc6fcAP7fDWdk=;
        b=Jt3mZlQz9RDWKPukfNDPVi+foIOEIHa96sZfwixaYndVPKGtl/R3mx5XRtZa/mRWh4
         FR3btTfbev4WJdiFLV0nYyIkcPk/I4CdRcJ8qQKMZDHFTBv2qdST6i4iwz85HGWM3fSR
         d+anqHvh15ZzylijHVSaE8VSvA/FBbaHRDXStWU1NFFmSF/eefPGkC/jMrC/Lnsu7XHJ
         UK6MG49veLIRNPX4uguWxCK3ORNfYqc8P0wJIxu1cZWDAxvkcvdsL6aF2tw8mFMDrl5z
         7GMQkJwGb1KiJwlYNVmKX2b19w+mk7m2Q0IGAg0YSBTf6uK/GoXGSnkIrnD0SKtmdxtZ
         Snxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773140997; x=1773745797; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aem47PhvPdP/iyuqplBe3P+A+LjmiDgpbIH/qJLSI+A=;
        b=bBbQrH0ZprIJWw95ptHHYmqc4II+00ur2XZGoZThfUW3epB7P+E2cl5i0yK0Mk9MMA
         JojH6reTWkQlIniOY3iPDL/4NNqwd5n2+YpA2K6qK0y7CfGeHdx1snyvIlScguxYGOJn
         VyYXcuWwEvWDrd0I4a32zXL7uxgzsf9y2+GPL9cJjMbYjzCxzIOUjn3zcnMMNqfwcklh
         RtE8MJToE5WxCujNBLr/Qxp7XWpDF4brk63J/kF7hXiWJnyMkDjWCYE88ldgoTYvkGgI
         IXPaf6YHPqnzTDNrTm/D5X1XN6nnQUd8fEkT3hApA5gGABDySgbvvBltdkocu2HpIsZP
         0Aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773140997; x=1773745797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aem47PhvPdP/iyuqplBe3P+A+LjmiDgpbIH/qJLSI+A=;
        b=NGSWJHxXBBpP/C/dpw+13TmT7tGG9A+NWjCA8P7A12gN85wC/VFnmTw8WVz8dOymQI
         n6XkgiYFXIeUIZnanx29p1ssgNSU9biqoXUCLaK3tBvDxosprFBNw141zH9ImQBnF2Fx
         7dCJ1Baebdep/0v/OZUORF2bXXnlg41F2awCwBBQ4mhE/+JcZBGmBP2BhxXfUIZq+OU3
         slkqUDOUexZEjcBDpu6LyTl3DVjOlPvcTAZciu8qW6PdJKrhuslEfMAqXwYJ4oCeavxI
         G7GmUHQnyew5lPuzuFS40vCo0UwODwV4w7RyhGXHCir5Lv+Ns5rTj629g2Q8BUPadVJm
         vpCg==
X-Forwarded-Encrypted: i=1; AJvYcCUiWMRyzFizJccdbj6zFLRPaa3fUt5b7f6i4PRr/NqPgccF2gvrURqKk/KeXIQzmcpPnt2L@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+jjGcGzdDS0UV20aLPgxNEIs4tWhCTi3486Y48Vohl39EkSXN
	wBKccq65w1tHNsNVBVbMQgM4wCZS7sfjgoIRXufwvMBZyc8OgWtNJ/MK07xZZoezsIOt66q4OJL
	upVay8DzzWPcIUJwx40aXIe3tv/z7Ypk=
X-Gm-Gg: ATEYQzy4NrYcYomgid3lUXzpOB4AnxmzUYIMDXvH3pibxPK7gPmiuOmGMZQe7DnhVxP
	3VLk80f4ivHG7wTxjQU1mt9WhRKNyRLW74sFxA4TpeSL3nNKYaxitSXopru6jRwA9vyanLwO9Xf
	J9VM22vOB59JzwGv2dMISecFu6y3G6ghB87kG68RQgWHcUZPizZ+iNhFa2Z4V02voUsc56f7+/x
	y/kt5qKavUhgopx0AINIY5/891of0DVmKqsC4lXYJ41miWIAubGZcOA3TKhcnwGAGXyEVLKEdQL
	d8MGqhOEnVSxE+LnqMz9oxRDMxYjt4DZpBwN6Zi0T7rRQGjJhIlmTnp/im/h96EDaSMJtl9w1WI
	X9aUz1FG749cBzWHCvnsglZ0=
X-Received: by 2002:a05:7300:cd90:b0:2be:1544:5c34 with SMTP id
 5a478bee46e88-2be4e09a273mr2605685eec.8.1773140996803; Tue, 10 Mar 2026
 04:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241119185747.862544-1-ojeda@kernel.org> <202512092319.ECBB8613@keescook>
In-Reply-To: <202512092319.ECBB8613@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 12:09:43 +0100
X-Gm-Features: AaiRm52yrnYpKu_LCuEGwaXBkN9qVVDwx_oBsyi0FYUy2OUcPt08sBsrY2wvdKg
Message-ID: <CANiq72n=hgH4bqJjp8MsMHAaxaAo75GSBcHGTvFT3NTSaVPGWg@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: allow Clang-native `RANDSTRUCT` configs
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Aaron Ballman <aaron@aaronballman.com>, 
	Bill Wendling <isanbard@gmail.com>, Cole Nixon <nixontcole@gmail.com>, 
	Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>, James Foster <jafosterja@gmail.com>, 
	Jeff Takahashi <jeffrey.takahashi@gmail.com>, Jordan Cantrell <jordan.cantrell@mail.com>, 
	Matthew Maurer <mmaurer@google.com>, Nikk Forbus <nicholas.forbus@gmail.com>, 
	Qing Zhao <qing.zhao@oracle.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Tim Pugh <nwtpugh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 8:21=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> I played with this again, and yes it appears to be working. I think,
> however, I would like to make the anon struct universal. What do you
> think of this?

Revisiting this... If that is acceptable, even easier for the Rust side, ye=
ah.

Perhaps as a patch on top instead of doing both at once? (even if it
means cleaning up)

Thanks!

Cheers,
Miguel
