Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E564C1FA272;
	Tue, 19 Aug 2025 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755612061; cv=none; b=tmAFFIml02faULvFKrI+g5NoUhGthJNFcADCL3hkLN1xFHpg/ZYyAw+5F258PWEF0Wfrb1hjNS1XZOvt8gG3lSZdvb8Tq/z4qT6upOgN95bLPWkuoNijHrSCD0mV9e67RxKh11Mbw3RA6Nd+Pe91tcr33ZS4yyLqWA2WT3R1Sy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755612061; c=relaxed/simple;
	bh=ha4t6RRIk6XpkYKIpDFUbToR4GM8kq4XAbtG+yoAZGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1ydCru2uPQLgRynnuVcYcNhFVavP6tmLT+tMuqmfyiHIIqHTYUg2k5tXqEmK4NiE9lmHpoGKaRx2f1M1td3bXcNiiGWUKqDIrEDp2lJXuEXW2OmB+d9v6MLAlyMnSBoPCHP4vQII8FcxLUGDl/uqu7Gm9MfgqHvmtmZhjrso24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CriPKwcL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CriPKwcL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24457f57ed4so9743955ad.0;
        Tue, 19 Aug 2025 07:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755612059; x=1756216859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50WBtMPwvOw9oYEsHnoDkF8zoLwvDN0HfFQfOPg/bdE=;
        b=CriPKwcLu0eKJtTcr3a8I0cqQlBe+bYIH7xwFNGIPrz5BaRZ3y7BLhYmb1CcNmRCE+
         7p6tDlQxNKHW5XIxEbvgIrTCflaQZZfzu1smdXX8FGTLJdYrrYAaMyCR+8/qUavSHg50
         qWFMMGYWk67lhGiMaKi5U0qUx1jkjwlLLIIoKvJONoBVP7PuMp4FfzJhd9KIa6UvLZ0q
         7mluON59rfbC/o+EzoT8AdnmypHcTkUoEdrLn5KMPmmMsdHAVzqWpLkDgr2BBLZ9pN1m
         VUmazSomNgul01RbUTy9EwHPuWOrFNMdX1D/QW6bvu3cz4l7DiVlQfufHhPFzPvf7Czd
         ssMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755612059; x=1756216859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50WBtMPwvOw9oYEsHnoDkF8zoLwvDN0HfFQfOPg/bdE=;
        b=pX8+ubuj9k+n+OPsmkZwWnDW5vSSp6Kpr2AooxTLYXvtIw+5fi8ZFFHreG+crXxrrV
         9QHBB2+vNXFLRMoQVW8SN5BJimE7jBaBhZ4QhAOJDebdUdgibC/xN2HPjYLVgi7Y+oyH
         ml8AOFqvoH92ogCjC2Gt0JOhG4R9JWdUYJHWsO1GIJ9L25J8EcQGHWSuq/FG9+Lbr6rh
         ETzR/gRraMb2sM4YcmehbcG2C5yZ5B3XosLlVbHcmgajN/DhY/Mkz45QdRTdYL7uKacD
         sc/AWz0TboohRULlb7Wlep/3KFrLa5BkGkEUtgSsXILd8aODiiGOpiGA2ej039AhURzd
         dOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZmXBM7xg/rtDLWSbpEzzRFuJTawc+J9nas5s3LfCs5KD6jA8+zPif3Q19UAN2ElPYQ7LdhkG7uIThu1Y=@lists.linux.dev, AJvYcCXfw7yAEGQ9iirVlLgl5J6ZvKf7PYt1sfspd1IgdrqEikKm6wvtlbsrTFM4oWKxobdB+75M@lists.linux.dev
X-Gm-Message-State: AOJu0YwU4hx5lwlPg1yxztSf65Im1iFLE0QORoH2NdXr9krDcUaVGx1q
	xZqTZbITKFtKrdAAcEp0ptNGhxrqpybNnHOGMypS7HanEyruPNsV9rb9eEPLvGXoWJjeXyPUrLt
	EwOTLz8VakrqriZvdsCB4FbNoA6r0U1E=
X-Gm-Gg: ASbGnct283mRvj1B4PpXdO0R+f+oexo/eQFlt8x9QUKHLT2Xcn14z4BRl4bXCVGC3Ls
	Aq4Pa0b938Osb9YMrWRTzY5vQhichj58KNuIjQggH4fDZcHFTFsPoxnS/HvsSsWMIie4Aid5HI8
	Vfp2TewK52BeFh2XWZZqZNhOTHjm1kT0T+bEjGHRfBvd4pr5KwmzFu7+9sSYQVf4S+jDortrUsK
	LfGB1p4
X-Google-Smtp-Source: AGHT+IFGLtNsuaHcZ9bLDDqN7J8ChtiAW1fZ0dZtuV570UBvC/PTJYsyK7ZfZ8g0ZH1WGMch8OcgtZ3J7WCfv1Mzp/4=
X-Received: by 2002:a17:902:f547:b0:240:1879:c2fd with SMTP id
 d9443c01a7336-245e02ba0ecmr19746985ad.2.1755612057723; Tue, 19 Aug 2025
 07:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv+gELzgcL4y8rOQbTxv2Y2JQTFhNkgUcLbzPJ_yDTziA@mail.gmail.com>
In-Reply-To: <CA+G9fYv+gELzgcL4y8rOQbTxv2Y2JQTFhNkgUcLbzPJ_yDTziA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 Aug 2025 16:00:44 +0200
X-Gm-Features: Ac12FXxTFIhGwb8CqneZObiwy9IEE8bW5R6jDoBMnubJoMsWPuCWTeTncYkgRXU
Message-ID: <CANiq72k-Z9=EVVXgJp1OuKwSbQ3qq723B0F2PaPzRD4P+QEQ=A@mail.gmail.com>
Subject: Re: next-20250818: rust: `ARCH_KMALLOC_MINALIGN` is defined multiple times
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Miguel Ojeda <ojeda@kernel.org>, wedsonaf@gmail.com, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <benno.lossin@proton.me>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 10:40=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Build regressions were detected on multiple architectures (arm, arm64,
> riscv) with the Linux next-20250818 tag when building with Rust-enabled
> configurations (rust-gcc and rust-clang) from selftests/rust/config.
>
> Duplicate definition of ARCH_KMALLOC_MINALIGN in Rust bindings is
> causing build failures across affected toolchains.

Thanks a lot Naresh, this was reported already by Thorsten and me yesterday=
:

    https://lore.kernel.org/rust-for-linux/8aa05f08-ef6e-4dfe-9453-beaab7b3=
cb98@leemhuis.info/

A patch from Danilo is in flight to fix it:

    https://lore.kernel.org/rust-for-linux/20250818180923.192042-1-dakr@ker=
nel.org/

If you could test it, that would be great. I assume Danilo will apply
the patch on top of alloc-next, since the issue is just inside that
branch that goes into linux-next.

Thanks!

Cheers,
Miguel
