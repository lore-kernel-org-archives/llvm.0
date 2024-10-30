Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB791E47DE
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730297661; cv=none; b=thhnwAVMWRB7OAVMxrbJaWIQghkjWUvCyINzHLqLZc06FzV0FFyceYH6W1RYn8plDCZAcBMrpK1e+p/ysiX8TPdfWmxrNbNhDheF1ZDh8Edd0uZ/hbVcEGFEn+H52l772D4G7lLKz3QJ7qHrei1ReuEVtlEviVONiA+RSw7bFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730297661; c=relaxed/simple;
	bh=lm82dG4gEMFUUwjiq5PdNc9pfTbs1IPJ2CYyR+z76lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8SBs6xuWC3MapGzk5WZCA+ir0rRCZCIFNRvyVBZuDGMNfLU/Vi8nVkRi/dGQxFoGNYpZatzTHKOORu6lqqnNzmeLIKNzo6/aTXMNDpuBTKM7tE0WrEVfsRQ/Wi27WnqiVqOMz8MgDdsYnxx0tgWvkfmfZVf+9Hlm04zgoDmpXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAwywhLr; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAwywhLr"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb3110b964so53589001fa.1
        for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730297657; x=1730902457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjEYIiKosyIkwaGCSTQKyunT1Lv7dxar/a+ft9/60k0=;
        b=YAwywhLrDmyJZ5L91jidtPgW9TsfbglymwWfa3S56ktI/H1VlZsuOz0/W+USA16Mp2
         TNDcPTFr8DUaoHs8UEkLnMDapq6IvYTW3VASXhEcni5BfSuBHv8mKthEuO/Rc5S+6+tC
         dudY4otOay8bYUdSaPI9VP26gljVAFRP09IZC/yDFjhW6l9EKmu820/m7P6dm2vQtkuh
         uAekBEaHQ4um6r+WvDaEvAFIWFend2X9O+Zewl6bTxYCzP+Xjkc7iqhrkKambRBjljT0
         0B66gT/5rVpPCoFVRIJtuj2zmwu5C5+MpBU06+3Y6Bcje1+ZDmq2bOvAVMVm1K0+D0eQ
         xjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730297657; x=1730902457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjEYIiKosyIkwaGCSTQKyunT1Lv7dxar/a+ft9/60k0=;
        b=K/GwkxzFE4adkA9jNll8DFAUHELbk3m13aSZhSRwd579wAqvMcJPodcq6NNRDsEY4t
         suDUozru58ju9/u7H+/oCACEvvsGvPLpXY55ktbI0y0q9UPfASrty9MwwmqNqciDVwbu
         Vzn9NUzJP5s7FpWfDs9WKEGjdWVmFBvk8fVKUiWlNXoWHDWVeho7MYpJc+JIXdz5gWOD
         I1gaqxhpMIH/Vcwf1WCg680iVD6oVVNYdKpN0L2oxMj6unO5w3cGimy1b3Qp+Y15OcMy
         ZAuwcPgN8vt5G464fQ5v0+I1ALnUPOaDfQqnd8mkp4NYiwP2+l2siVIVz6rma5K/O3ak
         i5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXedDsDc0URvJjr5rRNw9a8EBXvqQu0SnHEGPCACeVHwnmoQIbBVnLxRDWiR9CJ/pVtnHFS@lists.linux.dev
X-Gm-Message-State: AOJu0YzwV90VARLZRCOe1i5V8cTE+xMVEvl9166hi08UQAQuvGbc/SNr
	bgK/eporY0xJEeOUSnBgZ2e7FT+AF5nyCR6ezwzvn1SeAyC9gw12R47HcrOPCtFE2BwoWgQjZ5R
	voiBvyAL9UGtNX2YLvlIMcRp5ZBs=
X-Google-Smtp-Source: AGHT+IGdMnV/z71AQCWEOuBcJ9BI2pfv9dIvw2BJ2X9O2ZlhjIti22LPzo+oXDns9q2mEY122Yj6P6Hohr1Ta1EbEzs=
X-Received: by 2002:a2e:a543:0:b0:2fb:61c0:103 with SMTP id
 38308e7fff4ca-2fcbdf63825mr81608301fa.4.1730297656743; Wed, 30 Oct 2024
 07:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030-bindgen-libclang-warn-v1-1-3a7ba9fedcfe@google.com>
In-Reply-To: <20241030-bindgen-libclang-warn-v1-1-3a7ba9fedcfe@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 30 Oct 2024 10:13:40 -0400
Message-ID: <CAJ-ks9=8Bo94Fg_By956ce8X0r-6xBWGO_Ka+rCQ2h3tF2nkRA@mail.gmail.com>
Subject: Re: [PATCH] rust: warn when using libclang >=19.1 with bindgen <0.70
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 9:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When testing a clang upgrade with Rust Binder, I encountered a build
> failure caused by bindgen not translating some symbols related to
> tracepoints. This was caused by commit 2e770edd8ce1 ("[libclang] Compute
> the right spelling location") changing the behavior of a function
> exposed by libclang. Bindgen fixed the regression in commit 600f63895f73
> ("Use clang_getFileLocation instead of clang_getSpellingLocation").
>
> However, the regression fix is only available in bindgen versions 0.70.0
> or later. This means that when older bindgen versions are used with new
> versions of libclang, bindgen may do the wrong thing, which could lead
> to a build failure.
>
> I encountered the bug with some header files related to tracepoints, but
> it could also cause build failures in other circumstances. Thus, always
> emit a warning when using an old bindgen with a new libclang so that
> other people do not have to spend time chasing down the same bug as me.
>
> If you encounter this warning, it is recommended that you upgrade
> bindgen to 0.70 or later.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  scripts/rust_is_available.sh | 12 ++++++++++++

Might be time to rename this script - in another patch of course.

>  1 file changed, 12 insertions(+)
>
> diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
> index 5262c56dd674..30695612a0d7 100755
> --- a/scripts/rust_is_available.sh
> +++ b/scripts/rust_is_available.sh
> @@ -225,6 +225,18 @@ if [ "$bindgen_libclang_cversion" -lt "$bindgen_libc=
lang_min_cversion" ]; then
>         exit 1
>  fi
>
> +if [ "$bindgen_libclang_cversion" -ge 190100 ] && [ "$rust_bindings_gene=
rator_cversion" -lt 7000 ]; then
> +       echo >&2 "***"
> +       echo >&2 "*** You're using libclang version 19.1+ together with a=
 version of the"
> +       echo >&2 "*** Rust bindings generator '$BINDGEN' from before vers=
ion 0.70. This"

Maybe `version >=3D 19.1` and `version < 0.70` would be clearer than
`version 19.1+` and `before version 0.70` respectively.

> +       echo >&2 "*** combination has a known bug that may lead to build =
failures."
> +       echo >&2 "*** (https://github.com/rust-lang/rust-bindgen/pull/282=
4)"
> +       echo >&2 "***   Your bindgen version:  $rust_bindings_generator_v=
ersion"
> +       echo >&2 "***   Your libclang version: $bindgen_libclang_version"
> +       echo >&2 "***"
> +       warning=3D1
> +fi
> +
>  # If the C compiler is Clang, then we can also check whether its version
>  # matches the `libclang` version used by the Rust bindings generator.
>  #
>
> ---
> base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> change-id: 20241030-bindgen-libclang-warn-cebf97ea3506
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
