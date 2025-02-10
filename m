Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3CA1DF251
	for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184958; cv=none; b=aCBjInXNRJtIaN+wFiKzC2TcuSsUxGD9w+9zeeJg1G40RHpelmTh868dm58pMby9NbFU0kKHaV8xAixhnQx0i4c1p/C+ZMDYSOlhdK/xTY66XM0kpSe+5gM4k7IKJwf8YSq45i5e2L26ZM+fXzFyrCSDQUEr5hJBIni/0rSy0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184958; c=relaxed/simple;
	bh=//LYQuCFG3v94faeXTCT1MGaKMbd2T9XtcvmvzC9Omo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYhX5A79YzINfCKEbcQ95V+1f/qiuoiBeBIPy01h7GRdzw+ocaH+UdS6Fy4Vai+iK4BcVO9+e8fJJhUgU1vGndf1l0hGo7FNqGHibUSPtbxxPF43p7FMA9GD8QZavKzO5p7Y7xnev1lPxeiPfq24GSdx/ZBz1WmAXCXFRJofuB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y7ReAcGS; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y7ReAcGS"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e4565be0e0so17560656d6.3
        for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 02:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739184955; x=1739789755; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PP3w+vTVYydNJ1RlabO4o815qYqNgmeRSTRCNdNosM=;
        b=Y7ReAcGSGcrafEeF0eW00pyshgSJz5LA/lo5NNu6RHp+yojHD+BAHVwMD9pzJ1DQaf
         n5amoJc5r8Mlc8TEur2vUW3VJiatzleRFITY8UOP3RBT0x9sBADR5Aj+mEm25nWuOMn8
         RLwRy80DMHnRrWDlLe5Q/er2CsHPyVbWqH0kqzukmajEwuKpBxj5HMtZ6WVD9yw7oo7I
         GgHsdBiInj+LjLLIz4plBQIILGE10DIUxopIH1+XKXGAaGoe2rVnqc0D68BRUYyTHo79
         9zzqzLcwszm//L+4TP8fc0qYpnBo/mAc2ujDbKjXL7p98cYHht0Lx8CeCa6iXoBb5QkK
         2Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184955; x=1739789755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PP3w+vTVYydNJ1RlabO4o815qYqNgmeRSTRCNdNosM=;
        b=Hu1pgJ5X5jXYn0JUZG0Du9J4KN/EbEl7c35k05pVWtpWlsGyXBDf2mXb/biw0vsI0c
         2Iy70wYgxn4p59gc3mPLiLEJGmo916C9JysXxo1iAzYtERLVmMsbMgMGxadgimUPpU5e
         ROCW4nKQrFIwndBUtSf5bqNNv9kx3gTlKCjkZoG1cBW6sh/UBdAJTHhJyru/LS9zJpEq
         LwYBQTa5bAVBZNE13IrCPyQERYOcwzWC9eqMEKKJqHo+KBAOKfmfKdMDUgUxW5SU5mHy
         ZmZhXh2E9md8AVMPK3ySsEUusLwUutSNUBECZclSq/ZprXBi8ZXurkQ5xQxtwh8GAH8K
         n4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4H3lQjcoGs1sZoQtm+3wb5M32+NSzx+1ueJGzasRDNfcTTk1RHGuBCCn08FH5Za9ViKBR@lists.linux.dev
X-Gm-Message-State: AOJu0YxgeMeKVWQ6nLSHKVUvKbH6wHafRgLK7TAegwC+wJQ6mFTDnI5o
	XC7julgrNpXJvglChhIQN4QnV68QEDImWOsEFGzk3CC4LFV8mohtli5dMS0RPjbUCe5lVGrncT+
	/G3ISm1uYzLIPR9I2JAq99FpZathJDJpH4wxE
X-Gm-Gg: ASbGncujCFTb8A25CVQTPn/wuGniWaTDD7zKmSyI6Zn3nPEwMC+J/AbzMkeMIQlBbJn
	baiskgE4oSV7625416CwhcXwxb+blx09BO7UIgJNtgDLySiW51+PYehDoDIdOaH7fJbmPXTJbOg
	==
X-Google-Smtp-Source: AGHT+IGbyeQ6k7fTxoDJJzi7UjIgV6Ed+wDw9pNMs0X4k3lIOqkog+znGoY1veJl/t7QLUdG1EyukBv6t6QGtJ4uJ3I=
X-Received: by 2002:a05:6214:240b:b0:6d8:890c:1f08 with SMTP id
 6a1803df08f44-6e44569d333mr178824946d6.26.1739184955157; Mon, 10 Feb 2025
 02:55:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net> <20250208-rust-kunit-v1-1-94a026be6d72@weissschuh.net>
In-Reply-To: <20250208-rust-kunit-v1-1-94a026be6d72@weissschuh.net>
From: David Gow <davidgow@google.com>
Date: Mon, 10 Feb 2025 18:55:42 +0800
X-Gm-Features: AWEUYZnLrdE820e1YCxGYIPmD7_zxAEMVcFxHPATm37BvJ0XwCqWLuIDtdgVRBk
Message-ID: <CABVgOSmZEowbLCJepA0bkTHMnt5xhXE5sHoQz2kNhmMo3N9vwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pass correct target to bindgen on Usermode Linux
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-um <linux-um@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 8 Feb 2025 at 21:32, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> w=
rote:
>
> Usermode Linux uses "um" as primary architecture name and the underlying
> physical architecture is provided in "SUBARCH".
> Resolve the target architecture flags through that underlying architectur=
e.
> This is the same pattern as used by scripts/Makefile.clang from which
> the bindgen flags are derived.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---

(+cc linux-um, but I assume this will probably go in via the Rust tree, any=
way.)

Thanks very much: this is enough to get Rust-for-Linux working with
gcc under 64-bit UML on my system.

However, this is actually a bit of a coincidence -- and there are
still some issues with 32-bit UML -- as the UML Rust flags are
currently conditionally set if CC_IS_CLANG. This is my fault (it was
to work around some bugs with older gcc), and I've sent a patch[1] to
fix it. (Though note that 32-bit UML/Rust still hits issues with
atomics in the block driver, so you'll need to disable that for now.)

Regardless, this is a significant improvement, thanks!

Reviewed-by: David Gow <davidgow@googl.ecom>

Thanks,
-- David

[1]: https://lore.kernel.org/rust-for-linux/20250210105353.2238769-2-davidg=
ow@google.com/


>  rust/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 8fcfd60447bc89ba2c66a4f341288db2387b0956..a94fafb91d7d743c6c1b22484=
79c0d723964e5c4 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -245,6 +245,7 @@ bindgen_skip_c_flags :=3D -mno-fp-ret-in-387 -mprefer=
red-stack-boundary=3D% \
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86     :=3D x86_64-linux-gnu
>  BINDGEN_TARGET_arm64   :=3D aarch64-linux-gnu
> +BINDGEN_TARGET_um      :=3D $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET         :=3D $(BINDGEN_TARGET_$(SRCARCH))
>
>  # All warnings are inhibited since GCC builds are very experimental,
>
> --
> 2.48.1
>
>
