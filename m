Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4713C918
	for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 20:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769372431; cv=none; b=nZMA5ybxlqNjgVmaQvO3u1af8Wwkd0Z4tZNkQigP+M1e9IQATiIhlBct9CFzwRVTGb14lcM6R2MmNbAodSoHcdZFNusoxBhkqm4d6Nan58TSdtYx1J+x3quYm0w9EUNfqGolnENjMjlTaDTH4VVE+iOEt/Zpwbkbz7MPahNhiy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769372431; c=relaxed/simple;
	bh=cuq0e8BHaeEWrUFZwxpmD/GiVpxG3w+3f0fBqxCMiFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kra0yX5Xft9aqKue7pdhalj2I45ViYQK65lcBTjddHC7XIecPnlzxUBavP0xWzRsezlF8ekEB4oSJ5vI4H0EdK3ctnIB8FuVwl/BfIUkpl/4N5e6LTrtrGbQNQn8Xa7arVoXuXg4zPdWOnat5Czb4vl7iDG3mkgC5D8oN4zEyCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJipjVKg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJipjVKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BE4C2BCB5
	for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769372430;
	bh=cuq0e8BHaeEWrUFZwxpmD/GiVpxG3w+3f0fBqxCMiFo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WJipjVKgXJN0Z5/f0kYzdyPg/jY6Q3adWEJIWEz9pXlS1wF2NPFl44PgAn5/6D/1p
	 ngADp5rpOodurKa37crWZWoym7gaCcNdFTl0Mkb07buTB+rV+E7P0DUE0LaQkgWD3A
	 cZ/TaKgD+ebaUh+7ahw3ASsrsVGWFbbbztWJB2K92ho856wFDAU7w9BV5wbi9jW0tF
	 fjb0BUikyLRqsN5uyQvRqXOw4fwEiHU6LKGk/a1CDapTou72GinU0Uso53BPjR+UjI
	 SCodRZYYubdqBhr9QAup9Xw1nveyVCNw6hTs3Tok+vdUwP+qJFzuE3HDcOZWRZoAR4
	 hU8VK93VGwCwg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-382fb275271so36214991fa.0
        for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 12:20:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCfOz0nrjjJrTetaK9Pm+/YkamSepxIUE1kzQHtnIswf4gZEnZerc37aP0d4oSiGpJdI1L@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7iXgHSQPQOIBX7JnC9wodwWKKeGd2Hq7+1+6dIRf2QwqYs0ps
	fbQ8bbh1CPcLIc2Pr5QjSueg7Y3gaosR6KDvNJBwkP/aNlz+doOb2R31PWtENOY6d3cXbbYJb9a
	fHoZ9etdhT6awYjr+PONAH+jN/6UZE5o=
X-Received: by 2002:a2e:a587:0:b0:37c:e28c:5bff with SMTP id
 38308e7fff4ca-385fa15276dmr8551861fa.23.1769372429288; Sun, 25 Jan 2026
 12:20:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260122144444.265412-1-gary@kernel.org> <202601250701.wXxtGd9z-lkp@intel.com>
In-Reply-To: <202601250701.wXxtGd9z-lkp@intel.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 25 Jan 2026 15:19:53 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=N6GViTH-7Ki1qpSfRdByBFxb9132et7J0OXTTcosLwg@mail.gmail.com>
X-Gm-Features: AZwV_QjoJoRjxYY7LPCWEsV4oVDQzxpbIlh3GhBeW30M0TDiAyjTlOxQVzK6MAs
Message-ID: <CAJ-ks9=N6GViTH-7Ki1qpSfRdByBFxb9132et7J0OXTTcosLwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of `as_ptr().cast()`
To: kernel test robot <lkp@intel.com>
Cc: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 6:34=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Gary,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 053966c344dbd346e71305f530e91ea77916189f]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-disa=
llow-use-of-CStr-as_ptr/20260122-224657
> base:   053966c344dbd346e71305f530e91ea77916189f
> patch link:    https://lore.kernel.org/r/20260122144444.265412-1-gary%40k=
ernel.org
> patch subject: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of `a=
s_ptr().cast()`
> config: x86_64-buildonly-randconfig-004-20260125 (https://download.01.org=
/0day-ci/archive/20260125/202601250701.wXxtGd9z-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260125/202601250701.wXxtGd9z-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601250701.wXxtGd9z-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> warning: unused import: `str::CStrExt`
>    --> rust/kernel/task.rs:12:5
>    |
>    12 |     str::CStrExt,
>    |     ^^^^^^^^^^^^
>    |
>    =3D note: `#[warn(unused_imports)]` on by default

Seems like the import needs to be conditional on
CONFIG_DEBUG_ATOMIC_SLEEP. Aside: it can also be `as _` since it isn't
named directly.

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
