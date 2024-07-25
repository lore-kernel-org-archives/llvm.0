Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1EF3BBC2
	for <llvm@lists.linux.dev>; Thu, 25 Jul 2024 23:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721951835; cv=none; b=h3BB88uf7ElO83FcgNpKBPJAkP1qGCe5OIe0nah2t+Qa6pHWEjxC46m2TwY4Ag3LpfVQizQ/NHHshLkhlkOz5M9sSj92X+Ar6L6DyRc0mrJwW5+0tW021ApkbGC8rc4uDeNFY6TBOHMHe49ZLXA0dkCTcuJdx6nw0X17VF7A9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721951835; c=relaxed/simple;
	bh=7ZO8NY+MhR6rlisLZKfuIdLGQ9cl4ofCndl4wcFacHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ekzs+EEP9WpelDDS/8o1f4Zw7xnOJFgC3aREABHZSLWf5CuzWsjxv3k1pcu3fqLG2HGxwvvMNRS2PTaAIMEbF/HOf1HTZbKsxsREnf+ndXEGjsln92m8+F0yGqgC1ch/Qay8/OPLn9OQHnmAdRPsk57A3bHbqjg3OvUt+rBg/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciVzIMYD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciVzIMYD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-368663d7f80so815115f8f.3
        for <llvm@lists.linux.dev>; Thu, 25 Jul 2024 16:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721951832; x=1722556632; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi/pzfQRC02iIIyUSX4FZkWNmHAKRwkz4IYJvMytXBE=;
        b=ciVzIMYDQk2Tkwn3BdUY3m1pge4/pXPos9tWk0deOGxmXs/I+XIy23nlx5nCKB1NWn
         lbk6r6xPErpM49acbbS2XBeiHaVMCn8l0cafgPTa2c7nJB//HSmy1qAoQHAm5xiuLxio
         U0j6U2A8J+FI5g+goSFBpSCRphtBlHG8miXi0rViJW+2RNB58kz3K71YuDCCJ1c5hJey
         6hGbNMdzVyHxirrg7C7b+XH7Hkj/0sIxaGcYluiqcAXlMRuIN/zN7/pnwLhw1LS72kiL
         /po44cV3g8B7opSQ6MjTZaVa9i+Vz9xUXCbTmwh65cGlWlkuIVjmum3a/BjrZXTATQ4f
         9/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721951832; x=1722556632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi/pzfQRC02iIIyUSX4FZkWNmHAKRwkz4IYJvMytXBE=;
        b=lrQAfioIpvYuDbAeyfTkEMprwaNh2BO1CEUbpgdli8Q5zydwTU2glf7OuW9/3G7BlM
         UCc3q5JCRDxuAst1NVqhoTZoSqBxi8ydiLLPx31at6uCCHKkna1DOvR4nQaI/HV9Ts3g
         TzPi5P+oj1l7fKUjSOCBwlk2JmiPF1Wgm4gqakAGZPjz+16MIA5SD2ehUxovmpGX9GE0
         BDvnLjmfcjvRQUZ76xH67qbLURGLpUuNeqYZQQKS/jnbafgp0WhsIEq3XPBY8ltlz7Zl
         eezY8ltGA6QFo1nwyKRV2q95sIMgS6BIF53MpI6iI45dNYEgzNGHjodGLzzhR4YORHnq
         /QWg==
X-Forwarded-Encrypted: i=1; AJvYcCXArnY0GhC1V4ABYsg7vTPP8AoxKH4OJyvG5HZ/lD0QnQ5D4VclDs2EUs8iW+mEye6fNQOuI3g1NLXf0TN6REAWIo18hA==
X-Gm-Message-State: AOJu0YxNg0HYcr/KB+YFzzBkNDjBXkJkVyiBN86/P/7WAstKvrBMGT3T
	h1HF0On7FlohsVhIgpu4lVFRgrjXtu8YHWkuZESyEsr9TD5x8+3tTEZC531W1UQylHBinhv/nXe
	J+lHnElqFEYYikidQP4jNYs4CL9o=
X-Google-Smtp-Source: AGHT+IHEiEFy2jtQABp1d1D/wmBs9P94Ex6cZf4lZuU+kycE288rckbaIZIu3a7sf4AvrClqQxuG7J4mtIPtRTn5ujg=
X-Received: by 2002:a5d:5043:0:b0:368:4e86:14cc with SMTP id
 ffacd0b85a97d-36b319da8e3mr3167018f8f.10.1721951832106; Thu, 25 Jul 2024
 16:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240725232126.1996981-1-mmaurer@google.com> <20240725232126.1996981-3-mmaurer@google.com>
In-Reply-To: <20240725232126.1996981-3-mmaurer@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 26 Jul 2024 01:57:01 +0200
Message-ID: <CA+fCnZdwRcdOig0u-D0vnFz937hRufTQOpCqGiMeo5B+-1iRVA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rust: Enable KASAN support
To: Matthew Maurer <mmaurer@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 1:21=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
> set properly.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Hi Matthew,

>  CFLAGS_KASAN_MINIMAL :=3D -fsanitize=3Dkernel-address
> +RUSTFLAGS_KASAN_MINIMAL :=3D -Zsanitizer=3Dkernel-address -Zsanitizer-re=
cover=3Dkernel-address

If I recall correctly, the reason we need CFLAGS_KASAN_MINIMAL is
because older compilers don't support some of the additional options.
With Rust, this shouldn't be needed, as it requires a modern compiler
that does support all needed options. E.g., for CONFIG_KASAN_SW_TAGS,
we also don't have the MINIMAL thing for the same reason. (Possibly,
we also already don't need this for GENERIC KASAN, as the GCC version
requirement was raised a few times since KASAN was introduced.)

>         # Now add all the compiler specific options that are valid standa=
lone
>         CFLAGS_KASAN :=3D $(CFLAGS_KASAN_SHADOW) \
>          $(call cc-param,asan-globals=3D1) \
>          $(call cc-param,asan-instrumentation-with-call-threshold=3D$(cal=
l_threshold)) \
>          $(call cc-param,asan-instrument-allocas=3D1)
> +       ifdef CONFIG_RUST
> +               RUSTFLAGS_KASAN :=3D $(RUSTFLAGS_KASAN_SHADOW) \
> +                $(call rustc-param,asan-globals=3D1) \
> +                $(call rustc-param,asan-instrumentation-with-call-thresh=
old=3D$(call_threshold)) \
> +                $(call rustc-param,asan-instrument-allocas=3D1)

I'm wondering if there's a way to avoid duplicating all options for
Rust. Perhaps, some kind of macro?

Thanks!
