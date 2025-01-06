Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C2A1D63CF
	for <llvm@lists.linux.dev>; Mon,  6 Jan 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154177; cv=none; b=ZjUxtq55VC9dY0b1rIwtQ1VcnO1ei/2GPSzTrNSo7Viotc8cy4GJYONGiM4tQCqmLpYk99HZN6Zs9V+OyoCpQRM+WZ/tWz+8d884je8xxxr/02hp5w3xNDveXuykWUk0GKT/g0adh3cr+o3WgCzWMdrxk+FjclTdmlVh0e9UETo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154177; c=relaxed/simple;
	bh=ln+xipIWtR756VpfjRBcdsXgI7ozwANiQoTrmUHi5dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1o6Dh3iZJ/vc3BcmO9xBvNu0ivMY2mwYrZoEncHDJ1vAdepwIWosdbf941YsapzJwWrZisZ7LOSeTSEAjtksE24v/2Lh8SEO50Yh3/Kt7Nj8Swac3zQRAfW+8/z99EYc0LbzAjtbg9UIavP0wU3I7xBv1NLnwtTDXI+noPQP+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jQ3A2hjs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jQ3A2hjs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43624b2d453so145995465e9.2
        for <llvm@lists.linux.dev>; Mon, 06 Jan 2025 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736154173; x=1736758973; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNwuZVs/WFX1AlyLcnmThK24HPexmJnIk9uzVui8y2c=;
        b=jQ3A2hjsjHF9qJBtl9EVJPDpVl840LmHjYV8xgcCfBg2VmmiHvUK5tqUEWEnxaKoio
         1SYFPifx8P+1ZFjM97GfDiNRVdpXquha5Nl1HXZIz6iDh8EE7wIJwTxR2zgjqaHL67uw
         LAsns1Ogesh3aTnnO8Q9hWlaAUMeS4cIQpS+EzRmRm97xgiDxpyQ4yqwAN68uqzpy8Dq
         JT6YB7aq8exH4q45l6zuG0Y9+/u8HmP+XJPv1p7YLn03w1xqDZcvzxf7xVpuGnq/1IuB
         nQk1oaxcqjPnfxqVs2XEkNKcKQMajRz7XAZCobwXDRVUnVTwXvv836lZjUyWwChZM4hE
         J2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154173; x=1736758973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNwuZVs/WFX1AlyLcnmThK24HPexmJnIk9uzVui8y2c=;
        b=sIW6XHgbPLaD3zoGfcldnofDARIi6GQw11qE56kqE0BQbdKZ4ocyWA8nGGgJPrZTYA
         zyvATrmsglAgRSlf2HnOZJP/1CCoMh4QTYKzYGfskc7hokMIiD2hwq1VjxZR52ovE7/f
         jam4R/Ee+nN4meS0k/7bWvBMnFaf+svApid2oocQBkCgnfRNTkXiuY80yYSxgDZ7T1ki
         oq593DmExHEdwllrtFtAcyk1++65w96ZkuejI8nXg8qtG03jN/NsY+FGR8CjlaEr5daT
         RuSuaNK15l0Ev6BGIuqNCZ1b+SRhsdN1xG4yotG+o/iafmxznd2ljrE6hDSBg5KYe86C
         eTJA==
X-Forwarded-Encrypted: i=1; AJvYcCV9SU4cU8Tc2eEcLI29TlxLoUHqKvizuUm7mGPSpma5KHDqXkxFM70DgrYA4TJiRYoFORnq@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8GaTJiTdAYMiDCEaVmvW0Yj4CrHRPRWtMw0DaGG/roNCJFn+K
	sFq/eYxsH+7+qdgjqNsIeNMBhDBCFeMxMGO6OWg8eRIj2zoQxIWPm6VulHheRE9UusjD/F01TTu
	JwsTW84IGT2q4SMyCximgo3uIey+zdtMHinh6
X-Gm-Gg: ASbGncvSJdtFMVIucCBq93MmsfBOtL0BMPR6tov/wM6XKqFUrqkKPTMTkTV3ZzD2Bty
	Zv59ZtbcmQmsh7IkFOGlBUt7zHdzyQTQunLfLnlyCzMR6Akx91Mebw8qUSWWRM6j8BxG0
X-Google-Smtp-Source: AGHT+IGY5t3j7JLgOnK7GQ+pcy6E1PtQP3lWc94uYa/uhct4TgLrGv6fdtYVOO02HRihn6+eHc7Z3uPLO6tQyR2RxAc=
X-Received: by 2002:a05:6000:4028:b0:385:ded5:86ee with SMTP id
 ffacd0b85a97d-38a224069b1mr48733909f8f.57.1736154173480; Mon, 06 Jan 2025
 01:02:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250105194054.545201-1-gary@garyguo.net> <20250105194054.545201-2-gary@garyguo.net>
In-Reply-To: <20250105194054.545201-2-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Jan 2025 10:02:41 +0100
Message-ID: <CAH5fLgjjWW5Jrt+k76wJUhmLKTKUW5zThwUoxXuwBmk2-gyMxQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Tejun Heo <tj@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Jens Axboe <axboe@kernel.dk>, Chen Ridong <chenridong@huawei.com>, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 9:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This config detects if Rust and Clang have matching LLVM major version.
> All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
> matching, otherwise it may generate errors, or worse, miscompile silently
> due to change of IR semantics.
>
> It's usually suggested to use the exact same LLVM version, but this can
> be difficult to guarantee. Rust's suggestion [1] is also major-version on=
ly,
> so I think this check is sufficient for the kernel.
>
> Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  init/Kconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index a20e6efd3f0f..cbe4b2922ce2 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,6 +82,21 @@ config RUSTC_LLVM_VERSION
>         int
>         default $(rustc-llvm-version)
>
> +config RUSTC_LLVM_MAJOR_VERSION
> +       int
> +       default $(shell,expr $(rustc-llvm-version) / 10000)
> +
> +config RUSTC_CLANG_LLVM_COMPATIBLE
> +       bool
> +       default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION =3D $(shell,=
expr $(cc-version) / 10000)
> +       help
> +         This indicates whether Rust and Clang use LLVM of the same majo=
r
> +         version.
> +
> +         Operations involving handling LLVM IR or bitcode (e.g. cross-la=
nguage
> +         LTO) requires the same LLVM major version to work properly. For=
 best
> +         compatible it is recommended that the exact same LLVM is used.

typo: compatibility

Alice
