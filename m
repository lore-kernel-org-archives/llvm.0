Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F83015CD64
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 19:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183865; cv=none; b=n08f6XQwzfDE5fRUzdq2w6JSyJepLJm8JFtAj9af6TmuAdDf2CEUr3h38CQKgTG079MtCRiPk8Ex/vv8fb02gR4FcHbggw+7eL+sBSD+7hbu7vi4wBq0AJMztFKoXigFth+38/wGeAB0MABS5urCRC613doSRzfHBgCTAfmHMVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183865; c=relaxed/simple;
	bh=gYtGpgv6WrPH8c3CiYf0hVAGgsEyBUaSZhsVYkRtZOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daZ4hqgU3egDU8gxvVFHe4ya3vWTdnPzvI9O2vxA3TjU/zA1H4EOjURzVbZQ4B9w3jMa1JCrgKtqQHc/2ZXjIQ1ORcpDvAzfMXrWEAjkJDDxZKIs5XkXbRNhUjGamQy3mrHF2QiNHASUepuOtris3naAsqlpA+/Hwj1BGIOSO/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBqj/Se0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBqj/Se0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42816ca782dso50008085e9.2
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 12:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724183862; x=1724788662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I04d+UCyEJKSGzYujs6lGhbuTD9A1sKvAATpdsPOPRs=;
        b=lBqj/Se0RkpvfDBqJriLbBr8KPQKINu41Hz1u4j+ACwGPGmBLnMzHguni1dj6Jop/z
         Mcsi11IOOU9BOBiEKkddrIyZAeZhh5eyzj+raegJ94MB3pVtquhxzWm4KBRthe3dNQ8z
         9wCff5rHQsYE5BgEplKvQUCXhxXD8Gj/YiJdMnuGm92nt23iHdB3yqqnfCNV+1al076Y
         WibvjZsh3f641rFlhuemqRuQa1IDsd4WoWbYjfHP44u4I395HsQDEUzkCcis3IPZHDjN
         QofAki8z28/dIKwQNoFNYa3NKl759BiQ4U8FeDjyuHsOqekQiUPoygAzAAx2MMhTJ1LO
         xjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724183862; x=1724788662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I04d+UCyEJKSGzYujs6lGhbuTD9A1sKvAATpdsPOPRs=;
        b=iTUKzRpLhLCVhP+fAGqcuQhNJOjfvu7Ux059cIqAay3SC/jdLGdmb1jJFnJr73rvKD
         IPKxoMm+w9bTOBkRx+iUiHhyePRMX5s1JVQcK1XhqAgTOq2iYE0W80jgrpT9fKomPMK9
         sydLw5zgSC/4x12vOOSWl6QBMFf9RhSfN8PxXR50PJIWzj/dq4WTAJNM5K7Yc2qphSFd
         HSDSCoLLxPMOVdAwryul6kyvv4fY9jVObiwZh4stcTqENFRBLPrz9RyPtm3Mh3K1YaEK
         sfrWZbxsevtFKE6Yubzq5kxdl2eKoianAkRkyptJw/KzkZwE+/kt/Z23bQvRfgt3iupi
         gqFg==
X-Forwarded-Encrypted: i=1; AJvYcCUYmxw/1wiTrB+UvRMtlcupCbGiKfZbONnKR3dpIGiEGBKHnLK6ovCq1IYF+rOMwVIAzhOP@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0pcxxpUEEFK51zK82lGprRHjDPL37CzMROQAd4ODFjlHZRFLS
	jFbYMMK/FzPYX1oUbzLt/qYXBWaXZQ+5Y3DQMTQGGjYlWSo9+eFDuKoSC64sjrKfepUBI+iGJEo
	5LGlTKcyKQerLgx0wXfdFtBpzPg4=
X-Google-Smtp-Source: AGHT+IElLP3U6GC5jiblsqfmTGvnchVDzLv7QwlAycsREo1k3dgNT3ZyETsIYu2PzzvOhij5top8TkrmV+tZLhPVzvY=
X-Received: by 2002:a05:600c:3b83:b0:426:5ee3:728b with SMTP id
 5b1f17b1804b1-42abd2300d2mr2526935e9.13.1724183861809; Tue, 20 Aug 2024
 12:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com>
In-Reply-To: <20240820194910.187826-1-mmaurer@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Aug 2024 21:57:31 +0200
Message-ID: <CA+fCnZcowB4=AQO=mEDNgKb8ES5unewQdHkPMLXYwvcxaDMthg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Matthew Maurer <mmaurer@google.com>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, 
	aliceryhl@google.com, samitolvanen@google.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, glider@google.com, ryabinin.a.a@gmail.com, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 9:49=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Right now, if we turn on KASAN, Rust code will cause violations because
> it's not enabled properly.
>
> This series:
> 1. Adds flag probe macros for Rust - now that we're setting a minimum rus=
tc
>    version instead of an exact one, these could be useful in general. We =
need
>    them in this patch because we don't set a restriction on which LLVM ru=
stc
>    is using, which is what KASAN actually cares about.
> 2. Makes `rustc` enable the relevant KASAN sanitizer flags when C does.
> 3. Adds a smoke test to the `kasan_test` KUnit suite to check basic
>    integration.
>
> This patch series requires the target.json array support patch [1] as
> the x86_64 target.json file currently produced does not mark itself as KA=
SAN
> capable, and is rebased on top of the KASAN Makefile rewrite [2].
>
> Differences from v3 [3]:
> * Probing macro comments made more accurate
> * Probing macros now set --out-dir to avoid potential read-only fs
>   issues
> * Reordered KHWASAN explicit disablement patch to come before KASAN
>   enablement
> * Comment/ordering cleanup in KASAN makefile
> * Ensured KASAN tests work with and without CONFIG_RUST enabled
>
> [1] https://lore.kernel.org/lkml/20240730-target-json-arrays-v1-1-2b376fd=
0ecf4@google.com/
> [2] https://lore.kernel.org/all/20240813224027.84503-1-andrey.konovalov@l=
inux.dev
> [3] https://lore.kernel.org/all/20240819213534.4080408-1-mmaurer@google.c=
om/
>
> Matthew Maurer (4):
>   kbuild: rust: Define probing macros for rustc
>   rust: kasan: Rust does not support KHWASAN
>   kbuild: rust: Enable KASAN support
>   kasan: rust: Add KASAN smoke test via UAF
>
>  init/Kconfig                              |  1 +
>  mm/kasan/Makefile                         |  7 ++-
>  mm/kasan/kasan.h                          |  6 +++
>  mm/kasan/{kasan_test.c =3D> kasan_test_c.c} | 12 +++++
>  mm/kasan/kasan_test_rust.rs               | 19 ++++++++
>  scripts/Kconfig.include                   |  8 ++++
>  scripts/Makefile.compiler                 | 15 ++++++
>  scripts/Makefile.kasan                    | 57 ++++++++++++++++-------
>  scripts/Makefile.lib                      |  3 ++
>  scripts/generate_rust_target.rs           |  1 +
>  10 files changed, 112 insertions(+), 17 deletions(-)
>  rename mm/kasan/{kasan_test.c =3D> kasan_test_c.c} (99%)
>  create mode 100644 mm/kasan/kasan_test_rust.rs
>
> --
> 2.46.0.184.g6999bdac58-goog
>

Left a couple of nit comments - feel free to ignore if you don't end
up sending v5.

Otherwise, for patches 2-4:

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
