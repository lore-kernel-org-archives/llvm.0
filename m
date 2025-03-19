Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025191A072A
	for <llvm@lists.linux.dev>; Wed, 19 Mar 2025 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742418833; cv=none; b=NodQGxrhAIFaHXtstBqnyffubddb1XYnRfRVGk1As1osTfWWpxl7ZgRbAyC9A6SoBP8i1hReUzLE2IE9S2ZewQSnKbLH/A2Ojm3btARSumZuqDE3/7zXMC5kK4gM01udEubxUY+xeWPCwX9der1Y99ceP0DAdGXrSh8WtRcup+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742418833; c=relaxed/simple;
	bh=u22YrI3wDIN67H8Rc1sY/RyRCBmr/rxXDx1R10cNsb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEO2cOnlHhkd4dIFw+yivhYl0dYLohBZ9tSTfDjLg5KPUVvvdHo8KzA+hMAll6YHVGSpnQ0V1sLSGSextyP8UKOJ2/mS+ZhdBQpcTlTjcwDnEK038c90R4OA7WUGAlN6l8xJlcbFk1X1HXaBreisQwhbBGpBE5SRfvTR7dwH3/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0OJ9zmv; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0OJ9zmv"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-307c13298eeso1481001fa.0
        for <llvm@lists.linux.dev>; Wed, 19 Mar 2025 14:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742418830; x=1743023630; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwre+p1Cuz7MakhAwW9QXu4qCw/Dvm9xIblX0IITzkI=;
        b=U0OJ9zmvSZZ9lv1JgmPCeyvZjCqYBMzCqbIJodFji/qYokKawnbhOAZsl7qOoDGZ3G
         ajjSNbl/r0hTkpr4KkVYGSRJ1XuYC8nZvGARvFDYVtc1hnaY4ENiXXVzFFWz2EUfbJ1U
         GjSQsaEO2oqh+ZFwq91UIWc3GEavUfR4+3gGI0jbTI5Ysglj+KJRWltQNV9V8rGTB5Gy
         PKWe8ISX5H1/rqCD1UqdNLXB6KtJK42hcEAb9hA3O88bKLIhu2E5t6TJjtf4gDHOBFG0
         d+6tfQt87Jcjol6XZ3uAUeDBeYIyUyu3YrMO3UC3qbWl/zu4KIXQ7RGqh60szEzVfa8P
         T5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742418830; x=1743023630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwre+p1Cuz7MakhAwW9QXu4qCw/Dvm9xIblX0IITzkI=;
        b=EVKj5BTbWUONk0Hd3VF9QqcfrNuEKylcASF5z19ZjESQE8Doci9BRn1D2rrYVWCoqq
         U59tjKyeYLCYNH/NrGUwRenZVrg6ODLL0PDq3z4xAs9u1+3K3vl0jNIUEW9XbP/dnHaj
         CaH6tEIs8LZXz7B5lmd/SGw4XqkcNAYRguRHoIiR34gdWpLUlO/H1bYQcv/2EVyF1mzg
         HZoeNkSclWxcuAT4Ygwg9zk6zmko37z13O4L+S1hxG4RtaqxpW4mM2miJI2q9x5fovse
         YK/krV59J14zhvtjMOkRMomQ1Sp9B/JCPHOSOreThFBHSj12v/d3XhlFu2bDlFayEV92
         V91A==
X-Forwarded-Encrypted: i=1; AJvYcCWNPZK7hPcgBwibytpGZqpimhPkmcNOO5jnD0ASz8qWhaqSUYJAxqYyxWDF90BhV51MxPG8@lists.linux.dev
X-Gm-Message-State: AOJu0YxNE8ysVYg5Mbs0PhrDnNGLwM1PunN5Yzqdj77da73L/CUfnJL2
	e0p7oNelCObMkpyWcs/ukUOX4xD9OYOCJzCfhcUMIXuf4ZrlTIAWJa40yhkt9D808MfjpoqNxsI
	bUHG8L4Sp8NbnFwb6LN1kc7Zd9FE=
X-Gm-Gg: ASbGncvs+fshh6h3vPWZ5rfI/jdiFLHiQKSI1eFt+We2XaH4Gh1lU6ZDvy1xT/iE6iA
	FFJsMyrqwHZCwRy4eYb/EwdobdEuk4oJ5V17+HitEwoOPnTLT9cjJkdVZHeb92jaIAp8Cxcs875
	yPczHFSfaq7TPJp8FjJFFlqLCG5BZ5apixPDiHuCiMHg==
X-Google-Smtp-Source: AGHT+IEIpHhcTfgCnXntBU5dI1dSLip4dqnBCw4wFxOsxAIS0T1WCzaUvi+xRNri6ZHovmrbeT/y26fI2YnAMji3BKI=
X-Received: by 2002:a2e:890d:0:b0:30b:c9cb:47eb with SMTP id
 38308e7fff4ca-30d727a8910mr2737671fa.13.1742418829905; Wed, 19 Mar 2025
 14:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-2-gary@garyguo.net>
In-Reply-To: <20250319205141.3528424-2-gary@garyguo.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 19 Mar 2025 17:13:13 -0400
X-Gm-Features: AQ5f1JodwFL8t8zD_cENaeprUkF6zEI3cefWQGRoAC8X8IN1resnADU3ZvX9Fvw
Message-ID: <CAJ-ks9kCTZZ-kq+VL3-4hxxz-q07vc4k6A6L9c6b6UYc5b5f3w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Yoann Congal <yoann.congal@smile.fr>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Jens Axboe <axboe@kernel.dk>, 
	Chen Ridong <chenridong@huawei.com>, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 4:57=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
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
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  init/Kconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index d0d021b3fa3b..e76e4ad7d4b9 100644
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

s/requires/require/

> +         compatibility it is recommended that the exact same LLVM is use=
d.

nit: s/LLVM/LLVM version/ unless you literally mean the same dylib.

> +
>  config CC_CAN_LINK
>         bool
>         default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG=
_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
> --
> 2.47.2
>
>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
