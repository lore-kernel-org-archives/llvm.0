Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C853C942F
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034818; cv=pass; b=W0GSBs4S53ZEFudjb1rnuLnSu/Ic5u0ovKEDm69+3uMTKRr1N55HxCSBiIVYxA8SHksr2w1m99hsmG2cKDMmVXZA/NYyqlxf0WQnfj9ZO8KN149c/v40i4ebkWPRAkfDjEFJ7OKQBUClaMK9unaSDC95UUdAw1rZM47Bv8zQpvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034818; c=relaxed/simple;
	bh=QFYF7XZi4JO1uWyMujqTYJc6fNoJQQoTSICnhUPxTgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/akxyXXtVhWJ/gItJKR0U7eqIJ5YuAhbS24FvnxrU05XXxMDBZUwRS+cWS958kfD/rdIDTWDYr5fwK3Rx7vpQNq8P9ugOOUWrX2fD33zkVSVaCx3NaiWEp3N3P5BRDxEuWaxHmZFlu4MXM4qNIH0YGcjRUTXdC5+W4lIWy75jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HK+VTPHA; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HK+VTPHA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so1986666f8f.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 02:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775034815; cv=none;
        d=google.com; s=arc-20240605;
        b=DIKYrmJs1ProFUpRg0mUAOqUqg23zhaCyZ+C/7ZNFfHe6oo2QyBw61KcP0xaisSg2O
         n5tqKaAt/J+rBWz4u2q/zlGU9PPKLZu2l2Eq3KdxveS9fKcmV3M8pCGegXZYJt293nO4
         XWYg+Tu2EzigC08JiS73l5VnT/b76C+N0tNG6Qh3yrOksAjlPy6luyP0WuikvYItCfGj
         F68CjIIe7/8ttu1Npnxqsvbmx46TcaW7n1L8HK0tAk6fLaSAE1sHoRHmagAa7d2NrcS5
         Zp3h0dpDwifuwY4v7HGxzPQAwGUVmGGhsMp6HZ2JmP3c3WM2lkpCo7sSixJX3VgxSwuW
         2t2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0z9rCSZjhzgqsDij4dO9eDyirD7l3D3m+OFxXCVSvB0=;
        fh=rJGm8nyePWaWN0Ht1FeuYayWsd1A8/l+MH/IotVY180=;
        b=DHjWOJEhpoIe9OdzsfuctpJ39nIkgJLL8YaWKEMc8u6LXjvfnOxZ+rpzJ1mQ4wetEg
         94whbwkmXikzLGskbevYbuQC44TP9PWCNY9lqovSYpAa38mo/MLOMENODk5+eQmXAaAN
         xJ47PauVBMWNGkWPgffkkNoeibXGLRHC7OfTM9VDakUBC/4uhIIHmqareF+qBERFaksZ
         3a2/tObplyvZ8H1RIcRU3jCdkUr7B6EVu/DrHMoCRbHLqeiqTWb0KCG/QsNLGNqIXdFF
         NdsvM3arW3ZNIubqjG4LvOoMrFc54vcGaH3yvPTHBPdUM/IqdLTH+UwbXwOAhA0VGyKb
         o/cw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775034815; x=1775639615; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z9rCSZjhzgqsDij4dO9eDyirD7l3D3m+OFxXCVSvB0=;
        b=HK+VTPHAT7nq2edC6NRFJv4D71ItGyny46BMxZvvOZrAlRBmmMrUsUXtEv2rvv2qgr
         JMTmXegsBioHe3xOcAi0fM2dBQlJ45AaiLmcCs1OSrEljkYN9DP5L3kSNbsO1Gv3M6XU
         Vp+exClZ0i9+fP96CvGRNrgcOwoEBIRHfSvcfveSNPaaJXuCSvfPYGMygeryxD+Muns0
         /vvpbujh0ZJDy22PuKiMnQ5a6ouQl6IxvLwEkuoXD7s6xHw/xUeKHvMUNert9cdQFwyf
         8KZc+FwMv/zdIdeAsM3gBYKqRFgqxN84EXtvJyt+0VESOb99uZj2cor7AIrglP90OEqz
         mOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034815; x=1775639615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0z9rCSZjhzgqsDij4dO9eDyirD7l3D3m+OFxXCVSvB0=;
        b=gDX3u1hFYW6gn6Py4H13WkfrN5hvidFEFlJ/Gz8oWBzSiVmZWb4RK4KpXrQdMEkI0V
         /H+VjIDbViZgV3NWd3QUzv8J4wYA/IlgRRybvPonFvShg8rjcgA1qqxMk6Kp2TU6R2CP
         0r/di9vutMdgFV+1lC236L/y0pIwlZcWTHbQ/QM+ikQB+i/vX6oMjTRJZKLFH2mJg6q8
         G3aYltjwKYv3MxPLfNSRFN96JMQd6u3454vuDvso7CbTlTxDtYsD5VkKHeN/3s219leM
         DKFcnM1DAaJugn/HCup00Pipcbsn8sSWZGEex25GHYt/oM8ra0WF8d4H2uY4iQg6neuD
         IU+w==
X-Forwarded-Encrypted: i=1; AJvYcCXthEFBvI+83fpMQ5W/NPgQ9VuBDvpJPMyY+CXmZvoHTe6mHg2MvFTu+NR/ZyLApZyK1zHB@lists.linux.dev
X-Gm-Message-State: AOJu0YzHM1LZqFQeHCnZB/+O166sFRsN1RRcPt4CLGbyJuycwAFc1tpt
	8dRPxEDTpxo4DBaBYjn5Yt13abwIU5dlp90nUZZ3ThtRwSnfDyUGI21wM/icVp1Ix1FTPBnbUeK
	vukckTBKprxLJWW5YAec5bFCdhuuQWJ3n/Ok/rT+7
X-Gm-Gg: ATEYQzw5L1k95XQJ4bRW25QpD4bUC4ytVuFG1Tkap9nN3Fqd05/w6tcDrFZVR8NBYID
	gYUwIMqCIdVFx5u9YcTspuNp3sre5YD46fjBmA21Ghq86GC+eviuZAkETyxsqeHMGnX3WO00Fi+
	XeO3Y9qqe9V7oWJGKy6SkepjoIulBZP4vYCxmIRWzeK5h+k8hgdTF/uDKLUfq3M/5c5geWqcgn+
	M/0ynD5XlsQ6Sy7C2/0MkIUBJu2h6F6DhYkvarqLoWn7p0T4IBFjw1hsrOB5jngz61Ccm0yEksr
	MX9xKZfoTq8V7vSZDv3x7fpSJJasZDqlz6OjyUG8c5sdhLlF
X-Received: by 2002:a05:6000:2909:b0:43d:29a:e42a with SMTP id
 ffacd0b85a97d-43d150c211dmr5076261f8f.29.1775034814196; Wed, 01 Apr 2026
 02:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com>
In-Reply-To: <20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Apr 2026 11:13:20 +0200
X-Gm-Features: AQROBzB-8BzV3gKkJjU-4FV5-TqIn6Zpz4iTvD2IP9jhw3sFZ4zvgCLsfrZ52lM
Message-ID: <CAH5fLgjbrFsJxikTe-94x4a9Q3K6V5rCJBK=0pmZ2_qjfreBBg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kasan: add support for Software Tag-Based KASAN
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 2:09=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This adds support for Software Tag-Based KASAN (KASAN_SW_TAGS) when
> CONFIG_RUST is enabled. This requires that rustc includes support for
> the kernel-hwaddress sanitizer, which is available since 1.96.0 [1].
>
> Unlike with clang, we need to pass -Zsanitizer-recover in addition to
> -Zsanitizer because the option is not implied automatically.
>
> Link: https://github.com/rust-lang/rust/pull/153049 [1]
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Drop the first patch for -Zsanitizer-recover, and mention why in
>   commit message for remaining patch.
> - Pick up tags.
> - Link to v1: https://lore.kernel.org/r/20260325-kasan-rust-sw-tags-v1-0-=
7d3a765a72aa@google.com
> ---
>  init/Kconfig           | 2 +-
>  scripts/Makefile.kasan | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 444ce811ea67..545cbe889a52 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2179,7 +2179,7 @@ config RUST
>         depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
>         select CFI_ICALL_NORMALIZE_INTEGERS if CFI
>         depends on !CALL_PADDING || RUSTC_VERSION >=3D 108100
> -       depends on !KASAN_SW_TAGS
> +       depends on !KASAN_SW_TAGS || RUSTC_VERSION >=3D 109600
>         depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >=3D 1=
08300
>         help
>           Enables Rust support in the kernel.
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 0ba2aac3b8dc..91504e81247a 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -71,8 +71,6 @@ ifdef CONFIG_KASAN_SW_TAGS
>
>  CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
>
> -# This sets flags that will enable SW_TAGS KASAN once enabled in Rust. T=
hese
> -# will not work today, and is guarded against in dependencies for CONFIG=
_RUST.
>  RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
>                    -Zsanitizer-recover=3Dkernel-hwaddress

Sashiko is asking what happens when GCC is enabled. I think we just
don't want this enabled together with GCC. Miguel how do we usually
handle such cases? I imagine we have quite a few options that are
probably not compatible with gcc, but I'm not sure we explicitly list
all those cases in Kconfig.

Alice
