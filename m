Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C393112AD
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022070; cv=none; b=U98q63VKdcYi1lPbHdh8z89E+gIRxVzdVaJyIv/fmSW9EGrI4xl0/IhFG0kQ/sCTG4sFXEObIvQ2iKxlpzj4VJ//e5ENh8Q8RihMlBIJyf1FllBwVuuf9l3BdyDD4h8biEm0xT/yAazee13yInJdpSlnaenU3Aahf89MJwCPtBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022070; c=relaxed/simple;
	bh=hLKUufOKq2/TL+pONPnhEwc3yGdP/dz3A/DBg3KQZ/k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ft7UNwaTuRDM22RrnC4XqgL+wiEvl3EBP63La3hQjF2kRJ9Xt8SM70gpwS7Mf4DD/uHxEDy5BqyVK8wmjkFIDjLLFKDftNski6s45lAe7RlrseC2hJlTj21JI5YHaUH7TjVUeRW2rnncUnTPeCe/48wZte3bq8zM5J6lz+Ef6Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=am36xntA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="am36xntA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf7683a28so5158999f8f.2
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777022068; x=1777626868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSmDvRkfSjghcrtIGnXq0grda+xm9HI4mnGbjcUNF0k=;
        b=am36xntALQCTqCgq4M+BbIQLUBzVTe+ZtCtOE8S9lA5CYTeC6LSCYu+wPya2WM3yyG
         ciqLzD8/ZpikYivivxSdo+LJSXo3aZEIYRM84G/8Ih/m2r2ueM2xjj1e3kuRjJsm2Uo1
         3JpwEHfoEaf3Wx2JV7FepCy3xedhEsB3vExZpTgWJ0rr4oT8mEiWWCCQum/CtZeCsMR5
         FDOM9mi/QJovtJS00ly+kT83lg41MPIt5pqtmD4+0v1hwwCXR7Mqz6GQv4n2hlFj1yQ3
         H6uvWE6NwiRxdT4KnaC4BOCE16IUuh8BQ0vlG7fIag0ah5r2/j7oEFJSYBGvofIOHGuS
         tcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022068; x=1777626868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nSmDvRkfSjghcrtIGnXq0grda+xm9HI4mnGbjcUNF0k=;
        b=d9/S/MMOaOjlnYRXmIvSiQCUc1gpx3ednhfVp+lFhaMeAH/wTfQv4NHMqxKaZY3gA2
         h+waQD+9ebAD21WZmFWrngTdLiupUR+aEfg9seyDrBESXu7vVMF3KezzznxNVZcRPQRQ
         5W8yh9aNasjSJy2JVl/rI6QfaYwpBbhphDSiWLNBgVB07q1R96lno+cp+xFbaHqdrB9Q
         PG/WNuA8GrTTTgho/hpVwUERORuZlgVUd4TVkyKEB1Hjvkx6uGiDurIfcOdgGLbLEQgq
         tepr5Goz+0OnjaJQ5u6h+RZNHyJkoeygi+53MU1cGsHPwjfXsi6yiGFHVX2zbZhiox3m
         vMVw==
X-Forwarded-Encrypted: i=1; AFNElJ+yLWqmUVzce/O0PKdQQU23hVDKDbIFpajc6i9N8PiuDym1BQ8Hg9ON7GVmo7wRKxw2Nl/d@lists.linux.dev
X-Gm-Message-State: AOJu0YzCD92xmV2YO7knoRuriAN/cr4G1pjoVexuBuEz4K6Q+8GczvBQ
	GBsSOTUi0l2u1wo4/FkMxFPjLij6QC2e7rHDFUfR9h5irb3kyoacptbA
X-Gm-Gg: AeBDiev5WLJbc2V3VBTer8E13C7fEHD5KGqBQTO3UejeisYRqWesucojdYtnXRWMziP
	bzLnTxUsaDytpc7pmut7+HrYPS264ctQ3Y6QhffEH3cb92fQ7bsgqLvYekaa23yyzR5xpbrkqlY
	wvuvE4Cnes0s4bDbh6VayxocY86dQZwf39Hjt6vmoqQZImDCmwF+m/PfN958my27wXvD7vfr37i
	r9nfww/SGtNgTawpLXaUvOgVeAHIM2EZetWZWIf5VbGrnipn7gcNCwtbdjJ9+7b4J4VxBT7SdQK
	iPEH4w54ObUsyP6ucI+KrvZiqzQy7aXpiwYVIrM/aAXcw/doXgg5uS3Ug085kgXCiBVJ/5AUmKr
	vUq6igFVuqBmtQ0mhX6/x+Eb4SaQVs5YS6Wtcoc1RG9q/Dztz8dXCBLjVGY77ZUFNXrKmQk2IB0
	s4fhnSKvJiGfmWfH4vEMtZM1pESk4gFKp0DnsshRF23ip6Y5GDraaSHFDKHFAdqom5bQZXVvA8I
	o8=
X-Received: by 2002:a5d:5f84:0:b0:43d:7783:c684 with SMTP id ffacd0b85a97d-43fe3e1e092mr49352860f8f.43.1777022067498;
        Fri, 24 Apr 2026 02:14:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a092sm23750898f8f.23.2026.04.24.02.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:14:27 -0700 (PDT)
Date: Fri, 24 Apr 2026 10:14:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
 ardb@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, simona.vetter@ffwll.ch,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260424101425.6bde0e17@pumpkin>
In-Reply-To: <20260424054742.45832-6-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
	<20260424054742.45832-6-mkchauras@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Apr 2026 11:17:40 +0530
"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:

> From: Link Mauve <linkmauve@linkmauve.fr>
>=20
> The core crate currently depends on these two functions for i64/u64/
> i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t use t=
hat in
> the kernel so let=E2=80=99s panic if they are ever called.

Ugg.
Surely you can make it a link-time failure?
Or change the underlying code to avoid the divide.

	David

>=20
> This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udivdi3 w=
hen
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the kernel
> build on PPC32.
>=20
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
>  rust/Makefile             | 4 ++++
>  rust/compiler_builtins.rs | 6 ++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/rust/Makefile b/rust/Makefile
> index 2a5428a5503d..ee11fba7a03d 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(=
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

