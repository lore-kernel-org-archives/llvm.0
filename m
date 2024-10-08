Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FDC20CCCE
	for <llvm@lists.linux.dev>; Tue,  8 Oct 2024 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728409605; cv=none; b=GldEHEZA76nliUHy0dbyJ+lrl25EJpnOA5GnvM9pX6euweK2UPELpuedPN8Y0P8Wu4FmateyTUVKVjIyC5+IeF3C30TrC8truWEJ2Fe/fraIb/ZKm7gWjh4xhJYaEaCfgMMeLDwhi/pjTqCxHc7ZF5AEMA173nPpm2H4jMpprf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728409605; c=relaxed/simple;
	bh=4X3HDuD2VnWtaf+tW+I5S2mqufTmgR/niQRbWK6L8T4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPlDBkcJrPI6sNHA7MCOgz6iSRO0FdGE+t3Vv7PTVvpp+VYWmA6oZQIGnErWCGNF0bP1TM3XQgMi5dT5TWMzbcmku79tBuV6t1BOVl7jkw8JADuDGD/qL0IK7e/pENHSXhkLpnEpOjyeWhrDhNWo2LqAp2OTvtjhZIklTiB79Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cBjmQaLh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cBjmQaLh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbe8ec7dbso23675e9.1
        for <llvm@lists.linux.dev>; Tue, 08 Oct 2024 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728409602; x=1729014402; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvhMia/mJ061vWokn+L348+3EuZws0Igoktfqv3fLi0=;
        b=cBjmQaLhWoeF7Q+EKbpRkPU++2fl6/278eD0BxnKxRnj5yQYKJmZ2Ncij9Z2xLALUe
         NU3Gcz//0QRK3mTjDvnKJEJ4uDnw3anoDMS9G5iY7UaoA1iNqenr5L0+80mOoXTd/RJc
         BvWbZDEgIzT2ggo1prxSmGKwogbZ+Ip89vGyM7Qbw8WwnFlcr/kzE4u9h2WCY1Mp415L
         6b0lFXEWYzBAPbsiliEMsRZrBL5UHZwlW2UTUOI5/usBB3ES6hihydD3zqXE//z15Cvq
         ICwLIfacy7Npal9//rM1hbOLAXpEemqRWuIf+4lFb4NroEMhduCLcXp60M7WSJ51dqPQ
         B6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728409602; x=1729014402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvhMia/mJ061vWokn+L348+3EuZws0Igoktfqv3fLi0=;
        b=Sop/g8+ikM3bBa3yrHwLTZEj2cj2LfGaDqqZRwByJBRsdGrk8BrD85Lp949FHxFqO7
         5v587JYRZjesg1AUNrxgo/PJlt49OMOQf1Rlb+JCzA9ax7IL9ftsWD4TM+eIgkV5HB7G
         SaLddYkvUHc3aS3uAERpDNSDrte1pkgfwOhz988fesLuCeL+jtB6hOI4aG8Xh+tb4J16
         cYUJxqY35v4NI0SrjIWNG97TssZptwiuq00SXTYlsqmdP2YONEXSK/Pku/nIdzk/BCui
         wQDGmh1FRyjT08ht1a4+3cm+tVf1yErcFqdYT9c/4QrYwyI6EGw+pCzu3naessybNRMZ
         CnYw==
X-Forwarded-Encrypted: i=1; AJvYcCVfK/x2vtGlJklUzYimQX1wrg4XIGk5N9/hiGRFR+xZ1ndrt6Goi4kvP6azWQVhDd/T+1gb@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8HiKLnZEevSNRZW5F98auQ/mQPMrZrHVYYCXtiuBFYAPhUMtT
	KlayPYGbIeJkqUnGwRjLHyJh/TgJvAjDA73lX5HIFcwVgsuTvFhcrp6gZKKngKP0OlnFrlleFsn
	eBMJpzdVh1ex2szBnp2JQM4xy7jJIe0Jp+oMN
X-Google-Smtp-Source: AGHT+IGQnxUu7S8sNprAY4+irLZJ3ENfCBPUtxKDr44Y0O32/q5eFiDbTpcEReOVOk7pxJi5i1xxWZIhi8Fss/s7Cvw=
X-Received: by 2002:a05:600c:34cb:b0:42f:808e:52e6 with SMTP id
 5b1f17b1804b1-43058d748a2mr104025e9.6.1728409601402; Tue, 08 Oct 2024
 10:46:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008-cfi-fix-llvm-gate-v1-1-32d47459eee4@google.com>
In-Reply-To: <20241008-cfi-fix-llvm-gate-v1-1-32d47459eee4@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 8 Oct 2024 10:46:29 -0700
Message-ID: <CAGSQo03ZOppScZT_1DuWYsnveKvYHdc-K_djHi=AB4CKjAbgyQ@mail.gmail.com>
Subject: Re: [PATCH] cfi: fix conditions in HAVE_CFI_ICALL_NORMALIZE_INTEGERS
To: Alice Ryhl <aliceryhl@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This makes sense, as some folks have a Rust compiler they know has the
fix, but build system detection for it isn't there yet. This lets them
override availability if needed.

That said, we should definitely be sure to get this back to a
non-configurable toggle once the LLVM version detection is in.

Reviewed-By: Matthew Maurer <mmaurer@google.com>

On Tue, Oct 8, 2024 at 10:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The CFI_ICALL_NORMALIZE_INTEGERS option is incompatible with KASAN
> because LLVM will emit some constructors when using KASAN that are
> assigned incorrect CFI tags. These constructors are emitted due to use
> of -fsanitize=3Dkernel-address or -fsanitize=3Dkernel-hwaddress that are
> respectively passed when KASAN_GENERIC or KASAN_SW_TAGS are enabled.
> However, the KASAN_HW_TAGS option relies on hardware support for MTE
> instead and does not pass either flag. (Note also that KASAN_HW_TAGS
> does not `select CONSTRUCTORS`.)
>
> Additionally, the option is configured to have a prompt and gated behind
> EXPERT. The previous method for a user override of the option did not
> actually work. This is expected to be temporary, as I intend to add a
> precise detection check for 6.13 - I did not included that here to avoid
> adding a RUSTC_LLVM_VERSION config in a fix.
>
> Fixes: 4c66f8307ac0 ("cfi: encode cfi normalized integers + kasan/gcov bu=
g in Kconfig")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  arch/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 8af374ea1adc..2632de28c05a 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -852,8 +852,9 @@ config CFI_ICALL_NORMALIZE_INTEGERS
>           This option is necessary for using CFI with Rust. If unsure, sa=
y N.
>
>  config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
> -       def_bool !GCOV_KERNEL && !KASAN
> -       depends on CFI_CLANG
> +       bool "Are normalized CFI tags for integers available?"
> +       default !GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS
> +       depends on EXPERT || (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW=
_TAGS)
>         depends on $(cc-option,-fsanitize=3Dkcfi -fsanitize-cfi-icall-exp=
erimental-normalize-integers)
>         help
>           Is CFI_ICALL_NORMALIZE_INTEGERS supported with the set of compi=
lers
>
> ---
> base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
> change-id: 20241008-cfi-fix-llvm-gate-115e48d6acc9
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
