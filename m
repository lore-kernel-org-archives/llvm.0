Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BCF1F4FC7
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730299947; cv=none; b=Tf2ECKbdUuxdFK8DlYEfc/mcdvtsnPusrcPw24yniZX1ZUatSkLItj+sRv6Nhy47UaKHqjAT4uHvT9ueksSPfmX9t1G20lwLzCXAGO1y5SMz6auwdgAkzMpk2D5pm8DfSblIngyciC9X3Bb2Jd6QRn6FNT35/LgrLcCKhypgkcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730299947; c=relaxed/simple;
	bh=CnqspzQJDbcEt8CN7RzD+XIZAwYYdzUkf98BJ2/Pus0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0qv4cM41G92AaG4sN1Ef10/7oAw51kWM5G9s8R3MggqMiUwfFuIBRaE8v5qXDnU2XexzDXSe8C8tyaV3YZmc/LqkChVQyZncH6uFcJ2V/LcbcwOMS/0sKOb61SSBS2410O5/lNpJOSwyZkSEqJO2niPZekqudA+SeJdY/ndC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GFo954Oh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GFo954Oh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43150ea2db6so224195e9.0
        for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730299943; x=1730904743; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQVFTZ7PEDYj3PNRsJwqRC83zORWsozaW2gJdNeeReo=;
        b=GFo954OhjEM5ttvPU8h/sjFBF2qEO/OpI+taJ7c3jJOew9M6FuTV6uIb50A9keaIll
         I7Q4OSi49jVom/iWFbSEWW3koptWnj34QHMd2aljs5RRKyYxX/GD3Nrhxfv7U8CMfFSO
         RiXic0Rcp1FH/w53rIJczuSRySo3ZAGtSSonqz7ubFbbtGxdbvmIzwDoKzpDKscypQ87
         xFEXHbJVFpy6VBhEzTxBc6keaT2DwPNBMAWW2FA/nbDctGxCEqFPXw4znA1HM5cdrJcz
         4ETaVexC2HE+gZCbHLkMePFlXVa5O2Z/W8YvufYRlVxo2HIcLwLoZb3KreRcwTGceXym
         aVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730299943; x=1730904743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQVFTZ7PEDYj3PNRsJwqRC83zORWsozaW2gJdNeeReo=;
        b=sShE+X1TGNX/E35b3Y2YwAppMCMHOI6ExOfyPSJ5497Bqk6nH3YVVMnDTEXZDYqDbl
         7nMm9RKOuqpd4bDcPklx9Td88ZAN8s1zxpnOThOrZZXCLWNKwwZwwQP4FndP6CJBPtpb
         Oaa9lN7amNFxrSd+9tRA5/j/7GeBjczv/EmsxgQvOuALd6468Au8qIINhmqoZ+BqCimt
         VBl8gw6pLudS72aNmpbN+fqLs2R3U3JOS49mMmIXxYicifVLYnQ8w1al5LLBh3S4tv6f
         WGbXa+nXcNd6HEeM2/+m5+4/cBfSJk6F2MCk1UBKoZq07ONYf3lL3hR0vw1qn2WQU+ku
         35QA==
X-Forwarded-Encrypted: i=1; AJvYcCXh5lWPVqFI/nKSPjnMjwzYbM6nnEBKMoLOoTBVS1ELff17hJy+mbo6aeqq4c4Nc+ABnZld@lists.linux.dev
X-Gm-Message-State: AOJu0YzxvfDSelVatvQ2vm4xcjR5KG8RVC8c+tXLC/PNG77nkH+mq7KR
	h0EB4a/Sl7JY/elmnEb4k+rvUsmMAgdJUGLQolLV3JX8c10DLleuxXsqi/f/dmAoAQC/oVKYyaG
	KvAcYZdizTtfCAVAFhF8ocKPFAl2avo0qJIbp
X-Gm-Gg: ASbGncvoyHLTP/3x2K9+yL6n4RJSqyMiitap8LIhDud3mYCFUg1iaC39CfYG5Qp/wbW
	Q3TmZkWNFNZ93qkoKlyYUZJvdDSQh
X-Google-Smtp-Source: AGHT+IGL5BtkrvM8HTgS2rSp77gYVDKzQwCNJqBnp5ZX5IGgEF0dDY9UEHGCgoNirzA9uBYFvA5Z8gdr6YSS/UJaDso=
X-Received: by 2002:a05:600c:3aca:b0:426:66a0:6df6 with SMTP id
 5b1f17b1804b1-431b3c4c915mr10794795e9.0.1730299943257; Wed, 30 Oct 2024
 07:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030-cfi-icall-1913-v1-1-ab8a26e13733@google.com>
In-Reply-To: <20241030-cfi-icall-1913-v1-1-ab8a26e13733@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 30 Oct 2024 07:51:45 -0700
Message-ID: <CABCJKue6ZmqpkrMToF3B3_xTZDgkFKxh-CSZOJU9pt02aDd8bw@mail.gmail.com>
Subject: Re: [PATCH] cfi: tweak llvm version for HAVE_CFI_ICALL_NORMALIZE_INTEGERS
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 3:31=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The llvm fix [1] did not make it for 19.0.0, but ended up getting
> backported to llvm 19.1.3 [2]. Thus, fix the version requirement to
> correctly specify which versions have the bug.
>
> Link: https://github.com/llvm/llvm-project/pull/104826 [1]
> Link: https://github.com/llvm/llvm-project/pull/113938 [2]
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202410281414.c351044e-oliver.sang@=
intel.com
> Fixes: 8b8ca9c25fe6 ("cfi: fix conditions for HAVE_CFI_ICALL_NORMALIZE_IN=
TEGERS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  arch/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 00163e4a237c..bd9f095d69fa 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -855,14 +855,14 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
>         def_bool y
>         depends on $(cc-option,-fsanitize=3Dkcfi -fsanitize-cfi-icall-exp=
erimental-normalize-integers)
>         # With GCOV/KASAN we need this fix: https://github.com/llvm/llvm-=
project/pull/104826
> -       depends on CLANG_VERSION >=3D 190000 || (!GCOV_KERNEL && !KASAN_G=
ENERIC && !KASAN_SW_TAGS)
> +       depends on CLANG_VERSION >=3D 190103 || (!GCOV_KERNEL && !KASAN_G=
ENERIC && !KASAN_SW_TAGS)
>
>  config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
>         def_bool y
>         depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
>         depends on RUSTC_VERSION >=3D 107900
>         # With GCOV/KASAN we need this fix: https://github.com/rust-lang/=
rust/pull/129373
> -       depends on (RUSTC_LLVM_VERSION >=3D 190000 && RUSTC_VERSION >=3D =
108200) || \
> +       depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSION >=3D =
108200) || \
>                 (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
