Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9C013FEE
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204168; cv=none; b=NcY/Nemzq1wYxesqRZ0V+3LGzbQI11FxSkC6XU2izYosfe40ZOaG6/nRmdz5CS6nFSrX4nFnjhqrVTO9XCPDUlURG8E3T7p/3QHGIeHRyBC8YOkvtYB2xYJ9zBy2+Oqh3ccQCFiuJvs4R8gGVnKDZwnOg3ymThacWCV4S2gUeWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204168; c=relaxed/simple;
	bh=GNZpCzGDWuDUH14EPmJKeguyyF3cSxK15eb+d2NOo2U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eqQ2e7xfmOSYpxg64x31586Dm9IqFRkIdH7IPOdJ4zJDKfdZWXbaNdz7AKaNLaUL+mt1lxoyqyBNKx0Mw4AZmc0WlfqEhpuJTPbLRxfxE9hIzaXkvcX1extJ1IkoAN8nq6ZVdQ9nB/L9UHdSvDQtwMCcji0LIntHVTHa4JrW6Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LreGPtFe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LreGPtFe"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488d2079582so108918025e9.2
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204164; x=1777808964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IywXIO5DH2wY+7oMRMtv2QIoyGhfedV6T5nXUSTMOdE=;
        b=LreGPtFeIERMYRLwkTXr4zSzNmnejMXlQSrSCEFxHDiHo4it0bd6CaL76eu7Uuqovu
         3wks5fM8j22aCx/7Ba5jg6yKbUsOE7aIpVbaLHxXAviypcarCNTnJ/qYMAh0PCQMSPNB
         KKbMUETpvBA93DBACS6XzHKXRAuiDgAVX5DfhNJz48Qtq4Bb/xJxMRPxe2G8g93g702e
         IGMG/4oa3rZiE50Y12BZ08OYxgkf/QfFtgv7CdsmnwqJlPLCOpmMtBxSvmkrGbeSE3ua
         LWFEyeteDkHRsaUYjQFiesUCuG/YmCNAX1fX0BQid3ADQfcPIdFn7Ms7zz99v0Q1efrQ
         6qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204164; x=1777808964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IywXIO5DH2wY+7oMRMtv2QIoyGhfedV6T5nXUSTMOdE=;
        b=fOstYgJplDZFt5Acq6C9hOq3tvahDsTSSMT/1VuiPNCnehvHpAlL+5n9oEagHZnmf8
         J7iAIz9MfTfhwy21EWZRI2YgbHE70kVpQCVuhHf4rbyhzY7VyOZnbF1HBjsOhshZRb+w
         DWUEqT5vMK/PTB1YNRAhYbjq23eY+eY9G4XBZZhnRGFn6Ejxoss83kPaX9HWHtMS9nYb
         HNKXN+NUR+KU3Js5LcGB4CgTV1vlB8SmMH+rGs1x/8sBft+VFT8ihSCLinTZJiMpzWmc
         v0OBZW+nFGaoUsduuCZYevuhMJ/yY9BNpFit6GW8DROnviA9VErDj+vq2mjiwOkS23n8
         x1VA==
X-Forwarded-Encrypted: i=1; AFNElJ+0/N7kz8BHZqhcUI5G/senhPtjRHsWh75nFw7NUhBdwxqxcuvfqMGkEJ/OlZRulNeALqRh@lists.linux.dev
X-Gm-Message-State: AOJu0YxufYVhrFI0iW/3kbcNdpsKQQXX6N8ypsncZglPCIFaucSo1q8p
	iQ6VIZSRUHJ/k8MB7GkH/z0WAHMYY3VHVvssvELlsz/5djMEpB9oUT6x
X-Gm-Gg: AeBDies8U0ZttWGgNvYKXLBr+EU0MzzpggMoQtea6BE0K+PtyJdkQAKtXRRuMGc27Tb
	sJOxkwF8aO2Zd3TL3wi+gIZdCWPMmC53e1L6rF9fGUnT050IgEZ/obRq3ox7YuZ0+vN6BRZCbrD
	69yqUcvs6kFuV8PZdLae03KQiJjdcnPZPoCbHmZ03Lua9PMWFLWucBdLEy8lVAsZNK3ro2E2zXu
	Q01DwaeVuuiun64Rd6C14kqBYG+DFHt3SjkKR5Z653WCqIMKmTtiZ3VgR4vATL/QofgfYVi8Rvx
	ZzR7QW/AdkyV6ZBWih5M7V6/RpJ0Sts0FMGyHa3/9snst4koxzN3mXfGDMLcnMbCWbL2EnzV844
	EbfW5FJ/YrR/wsRTIGBpJeoEOdFXQW1U9hYsSliCbAZV/wh9KpNgkWLGkZEtcFSbo8B8Vh6lmkn
	zWjf+FvXa2lr0Rsh93QN9Vuem5eOnInJW97pw8vR0FDubWNj+gHgAdbrYakgAdbbjSE0+UWJhgm
	j4=
X-Received: by 2002:a05:600c:64c7:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488fb73aa3bmr565343015e9.3.1777204163630;
        Sun, 26 Apr 2026 04:49:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb754842sm222683295e9.8.2026.04.26.04.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:49:23 -0700 (PDT)
Date: Sun, 26 Apr 2026 12:49:21 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
 ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 daniel.almeida@collabora.com, fujita.tomonori@gmail.com,
 viresh.kumar@linaro.org, prafulrai522@gmail.com,
 gregkh@linuxfoundation.org, arnd@arndb.de, tamird@kernel.org,
 lyude@redhat.com, airlied@gmail.com, j@jannau.net,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, Link Mauve
 <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V14 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260426124921.28eb433f@pumpkin>
In-Reply-To: <20260426085725.2090827-6-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
	<20260426085725.2090827-6-mkchauras@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 26 Apr 2026 14:27:23 +0530
"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:

> From: Link Mauve <linkmauve@linkmauve.fr>
>=20
> The core crate currently depends on these two functions for i64/u64/
> i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t use t=
hat in
> the kernel so let=E2=80=99s panic if they are ever called.
>=20
> This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udivdi3 w=
hen
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the kernel
> build on PPC32.

This needs resolving properly.

>=20
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
>  rust/Makefile             | 4 ++++
>  rust/compiler_builtins.rs | 6 ++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/rust/Makefile b/rust/Makefile
> index f6369d121c50..9aa18cff2fae 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -615,6 +615,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(=
CONFIG_64BIT))),)
>  		__ashrti3 \
>  		__ashlti3 __lshrti3
>  endif
> +ifdef CONFIG_PPC32
> +	redirect-intrinsics +=3D \
> +		__udivdi3 __umoddi3
> +endif
> =20
>  ifdef CONFIG_MODVERSIONS
>  cmd_gendwarfksyms =3D $(if $(skip_gendwarfksyms),, \
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> index dd16c1dc899c..fc6b54636dd5 100644
> --- a/rust/compiler_builtins.rs
> +++ b/rust/compiler_builtins.rs
> @@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
>      __aeabi_uldivmod,
>  });
> =20
> +#[cfg(target_arch =3D "powerpc")]
> +define_panicking_intrinsics!("`u64` division/modulo should not be used",=
 {
> +    __udivdi3,
> +    __umoddi3,
> +});
> +
>  // NOTE: if you are adding a new intrinsic here, you should also add it =
to
>  // `redirect-intrinsics` in `rust/Makefile`.

