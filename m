Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9F52773FA
	for <llvm@lists.linux.dev>; Tue,  2 Sep 2025 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756854560; cv=none; b=Dkdz6P/Q0oGlyKlT/MV6xCYM4+shsM32RB0RaFNdlEtB3lN1ooGrP5ha3l+T1gRCUjhAfDs5jeOODvmiD15Pq8u6n40eqDAUBLCB0Bx/yvC4Lp8mYoyxdvcOoTDAQmCLXp4PM8diQDjrjuFcjlLSxR9/KAA9OADCs3rT9+N87VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756854560; c=relaxed/simple;
	bh=/Hfq1zGj3CUwWD00dGRfGcAZbooxiSw2BfRusJshfIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSoZz4acn437R8Pb2cV1Wm+X+9HBH1j+w4Zsun07kQPujSMjJxuzCE3eUcOL6LJcFDufkrPkXsHWhKJJFQEmUwI5bcX8L92dAUhbgHgQoLEMp0Hd/5hKryN1q0nXknHnpapMCN/X6aSkZw1YcfH+hDtfHrAd6Kg2BLA2rxD5MaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WIZtuL4G; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WIZtuL4G"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-530cf611a7eso453634137.1
        for <llvm@lists.linux.dev>; Tue, 02 Sep 2025 16:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756854555; x=1757459355; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok/LzY68t77UKOxDiwSjWGMeBPTcLr/jFtZLJbmSzEE=;
        b=WIZtuL4G8E+gz/hkig7nDq8J/I19jBid+csW8J0d8y9+A4aEMkc32+CzTXpkmVIj9s
         ZfplxhiqfX2sT4l42aMI18mrcmp4bNYEHXnqrtX4i9pyP3F8PxiEHLugL1EbZjVxlJZd
         cVw92gJ4V2RKgqbjHX6S88gmHwU2E+sSznK3anXbzVhNiHf3cnd/DcdCVZZRiw4NtAdF
         oiSIoI7n7ioyAHvoAiodaNZps3Ajr4F7xZ27PShSKf2oNG39t3qzSK4meQ3W2V623fw+
         dqPPQEr0uE+nyQ8YoR0DV9xYj1ZEwhp4WkvFQ5W3z8MKssRkKowJSfa3yyPRRrQMb94a
         Z0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756854555; x=1757459355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok/LzY68t77UKOxDiwSjWGMeBPTcLr/jFtZLJbmSzEE=;
        b=WpZrm2LekhLpVEBmde0Y1vLP0pVF98TQHr7H4gUS7vlIvFxJeEY1ZF58BwaOIj+/pE
         ghAY8yBVCCspsuIvAAAlvl/bTjme/msnpAexP7Mpr+X85RhZKKkDuxhUCO6qW55He0A6
         hc+mPGLE8YKqsDPyHp/vZOCPCVgacm8F1mNEhfViOroN/P85HUHvf94EtzVHpoMSg6im
         n3B8cAnmfe8yS2cFL+2u31EPsCOVd+mpkdUs86Lm2Qi6SmEAHWX3OtYLxIUZfMqpWKmx
         QWY7LTVJRXBG2aPz7LMCeHlbOci+F84pUzQnwZrkSOvikS2p/RJg2XgkMp9WcYLXi8Fp
         BmXg==
X-Forwarded-Encrypted: i=1; AJvYcCV6RHo7bpFpHUNL0ei0l6xm+Ghi0g0Tj5kYH9FRnFBBlW2pQE+QgwG362xYEeLNXoBNVzsy@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk8DKPXPTq+nxv6G7LTyDIflUk/UyB/8muwQqveUpoDLd3rzoi
	UCNgT3/zO3mv61AUXGhX/kpOCklz5/y+urkgv90Gaf2eJWzj+m09kZgC+1PyUoKK61m/FJBZ2Ip
	4v1IhQtQj7J9TBprCDcWRhaexa8nNk1DJww53B5fz
X-Gm-Gg: ASbGncuKTGxmm+OsYsXQKDZoNv/KyE4OpZl/dBs8mUpxu0YFCMHstaKSYkYLn0xt2il
	B89dtCSEGzNLc+h9o1GcfbcxxvihDhkMHntNlWQwD5TgfDnX+Crel+f3AOHcjGYiuVTFW0VV1zH
	9+DJaOJqzT9fI4ewilK/cMIAjf663KT40jzNJIIUWMRurIq7BYO3x3TCht3hw1VP5ZrinGYYzVr
	Xmt3Fq6Idun90c3Fnl89J06zFBDhhBg5kV/FwUc4PI=
X-Google-Smtp-Source: AGHT+IFhdKhg4nEAeTuWh9UpE13dsM2opfmDBOIVuHeu39wqwcvL97R0YcUTOoAodJqlRurDkGUAODCGGTs6GPLWBMk=
X-Received: by 2002:a05:6102:3053:b0:4fd:35ca:6df5 with SMTP id
 ada2fe7eead31-52b1974e50amr4309938137.7.1756854554786; Tue, 02 Sep 2025
 16:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-clang-update-sanitize-defines-v1-1-cf3702ca3d92@kernel.org>
In-Reply-To: <20250902-clang-update-sanitize-defines-v1-1-cf3702ca3d92@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 2 Sep 2025 16:09:04 -0700
X-Gm-Features: Ac12FXywF_5PF4EJJMAvgc55AUTlDfNYbymSWMWfPLD0aBiRhuuGXQUjDtVsZ0g
Message-ID: <CAFhGd8qku6wkpqNCq+KpM4TMh-djVQW4UEdXON1Tk1BRtN8V6g@mail.gmail.com>
Subject: Re: [PATCH] compiler-clang.h: Define __SANITIZE_*__ macros only when undefined
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:49=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Clang 22 recently added support for defining __SANITIZE__ macros similar
> to GCC [1], which causes warnings (or errors with CONFIG_WERROR=3Dy or
> W=3De) with the existing defines that the kernel creates to emulate this
> behavior with existing clang versions.
>
>   In file included from <built-in>:3:
>   In file included from include/linux/compiler_types.h:171:
>   include/linux/compiler-clang.h:37:9: error: '__SANITIZE_THREAD__' macro=
 redefined [-Werror,-Wmacro-redefined]
>      37 | #define __SANITIZE_THREAD__
>         |         ^
>   <built-in>:352:9: note: previous definition is here
>     352 | #define __SANITIZE_THREAD__ 1
>         |         ^
>
> Refactor compiler-clang.h to only define the sanitizer macros when they
> are undefined and adjust the rest of the code to use these macros for
> checking if the sanitizers are enabled, clearing up the warnings and
> allowing the kernel to easily drop these defines when the minimum
> supported version of LLVM for building the kernel becomes 22.0.0 or
> newer.
>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/commit/568c23bbd3303518c5056d7=
f03444dae4fdc8a9c [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
> Andrew, would it be possible to take this via mm-hotfixes?
> ---
>  include/linux/compiler-clang.h | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clan=
g.h
> index fa4ffe037bc7..8720a0705900 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -18,23 +18,42 @@
>  #define KASAN_ABI_VERSION 5
>
>  /*
> + * Clang 22 added preprocessor macros to match GCC, in hopes of eventual=
ly
> + * dropping __has_feature support for sanitizers:
> + * https://github.com/llvm/llvm-project/commit/568c23bbd3303518c5056d7f0=
3444dae4fdc8a9c
> + * Create these macros for older versions of clang so that it is easy to=
 clean
> + * up once the minimum supported version of LLVM for building the kernel=
 always
> + * creates these macros.
> + *
>   * Note: Checking __has_feature(*_sanitizer) is only true if the feature=
 is
>   * enabled. Therefore it is not required to additionally check defined(C=
ONFIG_*)
>   * to avoid adding redundant attributes in other configurations.
>   */
> +#if __has_feature(address_sanitizer) && !defined(__SANITIZE_ADDRESS__)
> +#define __SANITIZE_ADDRESS__
> +#endif
> +#if __has_feature(hwaddress_sanitizer) && !defined(__SANITIZE_HWADDRESS_=
_)
> +#define __SANITIZE_HWADDRESS__
> +#endif
> +#if __has_feature(thread_sanitizer) && !defined(__SANITIZE_THREAD__)
> +#define __SANITIZE_THREAD__
> +#endif
>
> -#if __has_feature(address_sanitizer) || __has_feature(hwaddress_sanitize=
r)
> -/* Emulate GCC's __SANITIZE_ADDRESS__ flag */
> +/*
> + * Treat __SANITIZE_HWADDRESS__ the same as __SANITIZE_ADDRESS__ in the =
kernel.
> + */
> +#ifdef __SANITIZE_HWADDRESS__
>  #define __SANITIZE_ADDRESS__
> +#endif
> +
> +#ifdef __SANITIZE_ADDRESS__
>  #define __no_sanitize_address \
>                 __attribute__((no_sanitize("address", "hwaddress")))
>  #else
>  #define __no_sanitize_address
>  #endif
>
> -#if __has_feature(thread_sanitizer)
> -/* emulate gcc's __SANITIZE_THREAD__ flag */
> -#define __SANITIZE_THREAD__
> +#ifdef __SANITIZE_THREAD__
>  #define __no_sanitize_thread \
>                 __attribute__((no_sanitize("thread")))
>  #else
>
> ---
> base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
> change-id: 20250902-clang-update-sanitize-defines-845000c29d2c
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
