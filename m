Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B200C27718
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029773; cv=none; b=r7Oqb6LkLtCs9/twAFTzKsoUpgCsSxj3MojNAwHAjBGOcnGlAHtCWiScQHx7a9FppwVtBwCX3qlpLpt5KnDuFlR8kibX9a0333Os/GlV57x2RhU+SNE7KuL5jmxOVJPocKd7VS6/8+Vr913AFWEUDoEswTviEgVhFyfYdxRZ0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029773; c=relaxed/simple;
	bh=k7I4v82gj5ha2wfX4LinxA1Yg1t64C5c1c7HVqM+iLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fspy27f2WvmKQIHyNBoTOt5G4yuD30zV2dnu2kRukc9Btz9k8Y6zOxsdhDN5zLxTG156QPFNZ9vg4VjVS3k75JADRW9/kSsS1u4rug+gXkE8yPDUuPuyALdGdWU/JYHZVRe9FkvR50h21Gm85bIV6XOm9IERvqvZrt5jTXhWflg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DrsVfLui; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DrsVfLui"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c08f9d0ef3so474145785a.2
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746029768; x=1746634568; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7I4v82gj5ha2wfX4LinxA1Yg1t64C5c1c7HVqM+iLw=;
        b=DrsVfLui+tJJa//uRtgCbZM903YPgAO6ajjac0fU2Be0j5yyYODWQ5FHfF+X6Jpb2n
         wnQGA5/PekoZ1sYJQNONEiYyMpvQlMBZ9qvILw83aSs2g3U/0sgXw9DoNOzltGdutKvp
         ppGBp7dGxhGq+Ot0yW/JK4m1nndKDH7m4Kt4ESFzlDEhoSrVeAqS6yVtYPJqHM2iL3jK
         WM3dLW3VAAwzOiev3ToXYhYcqz7Cg2VLcNx/nfcR9iIqaQ2inAQv9iTAU+716vpMSUGM
         neMRvB9ZuGX3JzyOqhussJJbqck3QnAHigpzrjAnvhdXvyk4tsvQOvgubTfyuT+5mij5
         RmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029768; x=1746634568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7I4v82gj5ha2wfX4LinxA1Yg1t64C5c1c7HVqM+iLw=;
        b=RRfGpC837WLjTPD9QOZ0OR/HjEUrPKtKVpdTZxicrpt1ghxDa2FUSa5lNIP1569N+D
         hU3n2ID8481Q63ZQokyPhBTrE5q9u1vBmuJnULrx4jD9vjEJqjndIFuKLRCNIRRyDM92
         YJkwug7N0x6y3fw3efUrjEKuZbjqGjuvEiynaYbzy5iMjrx6jqyVcfAogortR4VHkF5f
         LgofJpTshNnBu3fIJ27elPrjN8jgPOuWCVgytEJh296WxqcEvsvAVky9lB/fpHMEdE4/
         QFK0Fh1Z3kazRi5UFv/1AJ3G2s00FBue3GIZ7Qh9U9to/5isAp1yRF8MG0Zfn/UY92KO
         Ohsg==
X-Forwarded-Encrypted: i=1; AJvYcCWWKzfzO95Gi339uIysANHaS5R6vsXuOFEcMV/Z7YWD+ciAWj2EIBI5xwKO9aSwPQRtINVD@lists.linux.dev
X-Gm-Message-State: AOJu0YxCHlY003EFWkb4+6WdrzG8IQufW/ph1LCra2bhQzEtlbCglTLr
	bQ/VN7VkDnBSXOu7qkYRcQWAWsUa6bCq/XZy6flOgVwnXC4F25uE4TXNd+a9pnSxadKnG8X2VnA
	cmgQpkE9RTYgpukcFKbZoseZyCS6TSbVLo7Cl
X-Gm-Gg: ASbGncvuekyAIzOpxVumZhDmJRTKolljUws+4QuWNSwG88g094SckTjJxoq/WNvONvj
	nBOz/oaXMR016xaltMuVORIceT+rI4M4PVU9yRaI7Y+5UTviJKHJhOq/PBRb9sq0rn6B4YZQoQ9
	+EDrP0K2XjK1dYbNmEZRBdz046OGyZYSaATxH3+bNF9KApZLmaPoo=
X-Google-Smtp-Source: AGHT+IEjndaFBgLPklaVjaJmwIpe21xcoRJmCvEN8z9dGyswUD0gxgYhYsw0agRo8Eeel6INjc8vH0r0ZgmLyHZ3Knk=
X-Received: by 2002:ad4:5c62:0:b0:6f4:c8df:43d2 with SMTP id
 6a1803df08f44-6f4fcf75780mr63178966d6.35.1746029768272; Wed, 30 Apr 2025
 09:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
In-Reply-To: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 30 Apr 2025 18:15:31 +0200
X-Gm-Features: ATxdqUFTsrw87yiAkUoAh6if5K7wSAisaG3kMae-iYUZsldqIbdRSg1dOLfX6vw
Message-ID: <CAG_fn=VoGiRmeYZ=tN+e+R=6VU+piSkdzewwVGuVhfddSTzu3w@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Aleksandr Nogikh <nogikh@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:04=E2=80=AFAM 'Alice Ryhl' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> Rust code is currently not instrumented properly when KCOV is enabled.
> Thus, add the relevant flags to perform instrumentation correctly. This
> is necessary for efficient fuzzing of Rust code.
>
> The sanitizer-coverage features of LLVM have existed for long enough
> that they are available on any LLVM version supported by rustc, so we do
> not need any Kconfig feature detection.
>
> The coverage level is set to 3, as that is the level needed by trace-pc.
>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
