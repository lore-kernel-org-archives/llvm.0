Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027737;
	b=2+jjx4jSRsuA1LWSWFNaTVXnMLtsFZOIYJIOsAMBhzFQ+q0jyUQc680yDUGEmTsVMnoq
	 UYL3R1/hsLkTBufna702QI4fZw2I0XnLUe9OgA2p7EHlx40kGD34eFkWAZnFq5n2x9K0+
	 +6wfZjsGVQVyDzzpt6BJorbs4xheb+8K43b8B0A5zOQF0YiyAk2KYn0Dt4M0K+rC4KaMv
	 lLZGJL4ZR6PFgY4PAFiXgtU6eV8C0hcqeErrII+7M+WgN7MF17LHpAtVhol0mqLxYLPy6
	 7CPBLQRx1RheYsyLhWi3hRx9p2uXEnevuNiFu+ryYK8kqadqL2T8x1FWuJm2S5PdwsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
	b=Jhrap4cni+tAyKGawxOKJHM15iv7svfRgcx5LHnoasQOKz5eF11RZKl32to2oCMVhEH1
	 VJWu+MWL6ThQwWYWpnP6TTZn8jC4HvKVdh2gm0V1QCYPPsq/5BAfWUHwiaCv9QXTNyu/r
	 SOzMjLYfWNbSGDNDGbxb8EuBxvW1n+CDL7AU02NNLY+Mvoa2OKSpr5Z8vNGeAXBZOhJeJ
	 o0baYyisktebm+D3tiV0Gt8GsSaJLWm1xKacFDSargUEPpQFw1ubbUK1dtwNqUDcZ4xts
	 EjgZDTcqktCG1icq0qrca6YUS9kNHIZrWr3NB2URR4lJ/ZDdWXIxs57Cf4dXObmr4hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dRN5RX0s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83FB606A331
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 18:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A83FB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dRN5RX0s
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso669449f8f.1
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 10:48:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027735; cv=none;
        d=google.com; s=arc-20260327;
        b=BaHsIElxXXECBI1Wigdx9iFvyw2f5PLTYheyPMlrdoBwSpuhVqklirnW/26clgQRc2
         5ETweIrRipXYNpKN4QGoaBJ5mvnB+b4JoDAAh7KiyTDttNMm0wMFErTp7cuRn1VlP+On
         W0Q7cFvzz7t467pH8FtU/QFimqsqTfBeodrJ0QoG7WZYyGxBLJlImJD2NCbL0el6Juro
         ClHPLJyWdbqiCBBevPUPUsuZBU09BewXJQzrZol1csS6gYyxZD7iDeguz7hOjvfkUK9q
         KIqLFWqmaw/wS35IZPO7IWMBZ7/VQrECtsqGocNseOn9MnT7X/UHnwcmQt4Z6dI5OYc0
         O0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        fh=RhvL1+r33ikXAH8LL+2EyXvBPVJTwH8QuSe4FPB1jOs=;
        b=owYoahVQ7sQxBgc9xgZP4theoEM2SAVG55GlujRcu9H7JxDRqYixOBp5MQBMkuiCp+
         bQryNCCErt/4MA5vbCmd5mSklKNszqcPNPp1BiGi90M0PU9bjrrLGc3SL3OPdhpKgTyi
         UbKyGlIrOJVVSHgKMtALJ3X//sgMoilrGkogVGLLSD1yRgPao4Yxdh02oh8kd20HvvuH
         by5Ka+KwKjghZoSB8Lcd1APp5xzD8YIXdhkat4Hk6wxQMPW/nhj0FJzcxjRHievjn8z+
         7lf1A7lr9/S0FO3O3EfCddHPLgyObqi3g9dbnCmX8iwVBRP/58+0iahySC7F7SVMqyWs
         ts+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795027735; x=1795632535; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        b=dRN5RX0s1tZ/bDtApxAIqn7sc0HHef2ePbTtbhqoi+vwwLb9upLpa0wxNT8S/pD4Jm
         nLgzaqTxyHzSiZY/GOc565A4JW8nDPRfUTddHF1ugdbxVkLGLOxiZebvPRfwkUxQ0XTg
         Y+EQeitH62S1L1h/7c1hEvsytB6AsHQNcBQPoWT9rlp1tYezMMcoIKgybtV+E0dWniKj
         Un7CLNEMifAW36f8VYWQOZkfvGgbqBy560d7F4QV2/DEUYTfv3x5WVdTDdi+8r7EaK7C
         vxTEYe5uenKgXdxwQU5A978ZXMBgvv8kPdvbykjio2z+TDZinJsxr1ZZ40yTpX+gofvx
         qD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027735; x=1795632535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        b=Zd//JK831ZwW5jGrzim+u2tD+RYgwFBVVGneRZ2AsU1PTrWDG0AbgUkZoSAaDgmjQW
         5ILx/scffWePmv3GIQsWidYDEd22hDZAJIL189groG0ZVwLwvxFNbY7cmevjXMYTiXwP
         yAUQhoNlkDS7QnlEJy8Hgae9JGW8EwQsE+m/LvjnNTr2ECn9DGyngS5xZO00RYrEUvAb
         C/ay+9uSi5gh8+ARcmvkDvVBRnlmP1bW7Gsu+r2Gcrj2jYOh0QRHyWEye7yu6OjV5Uy8
         nz2g5Jd7NcBojhpkcRNB0lhgxwg8G7S6wbIMl8/yYEa4xDl0NRPr/WzcDC1RldKOCFzW
         y3CA==
X-Forwarded-Encrypted: i=1; AL+hErERK1fuQWsavkUK71V2HcYX7dLyptWbII6Zz1OtZV1K83TE/xCN6o41ccO0+wT8wSBY07Ab@lists.linux.dev
X-Gm-Message-State: APuU4Z8z3Njva2xN+O2DzLPelX5uyo7ZWfu9EHwtbC+Ak/0dc2Cfp7MA
	/KLGXLGlY4i26U3LIpu9ja1urwRlPlM7ieI4T2mkj7BMpMPmDfwpygGt55uk2dhLdQ7TLl8UptU
	7/WDaMXubz23XTyLScqsz1b1fBmHrQ5kDmH9juMJ9
X-Gm-Gg: AZFdTZdcTUdQajzp+wJtus9IqeNPDlsyY7Q8d4FJ8Al2zBio2FQqxruM2mm45radImx
	lGUP5ot1JxqXJMBplNfmp37mTVLene55mVSFOpC0tsOspZZVgsqvINSojJ9Uoz/erADkQ+cuppV
	5WQgxrjrPitCNTL7ZuNRwWSB017JJqqh7PNYJnqYTlJYS1YhEtFSzTI2w5PFhilLQurasN3azmL
	cFa6oN4T44+GjEgReQvup4Smeq9VktxRtog3jDpqsmV7KYi+rXA4C2Rk3SBVQed72CeWGCi6nAZ
	zBSiSs/8TcqjWcCKHN6BaMylXAqC7yzSMSVeqGjhiSycvZP3eGn+e93YwxVfba++V8YdXFrx8Vt
	Wia/kncC4t3jMvZGtqSOtKj5fzyqxu5fUaICjRzP6lfTzTYGaNLxcwRhiCrAF0JiJ/pelHzy8qO
	ILwHU+jYiomuqgEEwJP8H76zcL67c6EuG27XUprzY21aHQJ+yGYr7Uj/Rp7N5wnxYNxi6Sa5w1x
	0msgyObBoE1mOQpylQHTcoIG8JUemWN2iliBA==
X-Received: by 2002:a05:6000:41c9:b0:4a3:777a:a964 with SMTP id
 ffacd0b85a97d-4a62d6d4875mr7842462f8f.0.1795027734320; Wed, 18 Nov 2026
 10:48:54 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Nov 2026 10:48:43 -0800
X-Gm-Features: Aa3M54qO-h-RtjaPnh7QVBF5Y0JJtJj8eYAtLacwVWO8_kUzOdD5vosJqDSsgHo
Message-ID: <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Function merging causes various different issues:
>
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.

Do you have a link to a bug filed against llvm?

> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,

I've never heard of function merging (in clang). I've heard of
-Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
default, implicitly?
https://github.com/ClangBuiltLinux/linux/issues/1598

> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5aac6f1b011e..17b7ac3afbc4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -622,6 +622,7 @@ KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
>                     -Csymbol-mangling-version=3Dv0 \
>                     -Crelocation-model=3Dstatic \
>                     -Zfunction-sections=3Dn \
> +                   -Zmerge-functions=3Ddisabled \
>                     -Wclippy::float_arithmetic
>  KBUILD_RUSTFLAGS_OPTION_CHKS :=3D
>
> @@ -1136,8 +1137,7 @@ endif
>  ifdef CONFIG_RUST
>         # Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST s=
elects
>         # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
> -       # Disable function merging as LLVM incorrectly merges functions w=
ith different KCFI types.
> -       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normali=
ze-integers -Zmerge-functions=3Ddisabled
> +       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normali=
ze-integers
>         KBUILD_RUSTFLAGS +=3D $(RUSTC_FLAGS_CFI)
>         export RUSTC_FLAGS_CFI
>  endif
>
> ---
> base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
> change-id: 20261117-rust-merge-functions-9ccbc0516df5
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>


--=20
Thanks,
~Nick Desaulniers
