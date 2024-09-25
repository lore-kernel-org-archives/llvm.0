Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E957E574
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252830; cv=none; b=UsYlDEUQWR43AOI8RSg+x0jvAj1Br18D2+9DdyNl2nuA5mNBrQJtogb/hEOrkTAYLBlJDA8Y46PzRw0ivCF12PCyjMenFSy2XU6SMFP6P+G2EIIKNgbgxrDYWdoAaWzxJ8EXyxIVsNyVLQVtuNs1+pxcoT/6THtMOpQXayqR96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252830; c=relaxed/simple;
	bh=Y2BIvhjNyYJ+TFNTSOch+3U0Xe960Xy8jCwbowNsyFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIPm+h9eiFtpsmyyw+Q+qTdVUglAKBEnzK7X72upytHHZ//cFy45INY9ldjtb1gBjGXo7rL9+CC3ur/Ejaqc75dWYvYD0C4BLzre2Yl9jPIhRvetDotnzjKJbAjeoMZJ0pGc+N5/XzZCUv+Ili7ES0uGXdIxIbo1Dyb9iKWt6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D3aUXm5l; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D3aUXm5l"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71798661a52so507091b3a.0
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727252829; x=1727857629; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25jgtKw05cLljXTa9ioZMmKXC7JJSPXQkmgPPZPPAvI=;
        b=D3aUXm5lho7LcIJ85CUisjuWrwTM9J16ouFlGSTPeORvIFLtNnsipjbQdl6QaX4c4g
         +dh+SlUFo96tYvTjeaZLq6YwyVqdmvIarrVuFR91vxbO2WVM40FqcWnGQKiqdkGNiUAN
         mIGqrklJ4JqiOxc9rbKbLrdrgEM/smr/88qUekBf/vj7hfIzBU2Xc/Xlprqb+G1FtFZM
         glgVGsdhHI7WYuH5TfDeTVmmNuHYojIpo0FT+zqgccpZ/vh72CQdnoHS/5WlapUc9uTj
         Skx3nzeFw0+WHrhqNUMYhQlfEmu/pDgnJsMlS4+JcxTf8Ge+56CTAzK5YVI9wVriz4pN
         PhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252829; x=1727857629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25jgtKw05cLljXTa9ioZMmKXC7JJSPXQkmgPPZPPAvI=;
        b=EAvOhT64JD4o33ZUNmNHiBVQUvWSBYs1z3b3X2RIrNpf/xNSUKIP78gSgmPfbgdZTe
         8KjSUpvbLoRUy5SyIxKXAUEGg8+4DD1B98Tvf3jN07JV80PfFjVz+QsJLBkKnJ4TSvlL
         hDUMGjzbrWYv1XMzDLEyJH/C1Wa83SCA1K1JJMolyBdB8Gn3XMyYWYPH4l/gpL2TYwZd
         TLYB8wNnEB4EHFxtfR/7gyH25FfyInJaz1qSbrGVDb6YDpf10t+2XjkmdDK80BPTaC/M
         peUR8UrLRsPHawfMukciBI+0ULf+nWoXa1ZANsooXnpivZrcFMneIJEq3Pyg/slTFHsm
         pyfw==
X-Forwarded-Encrypted: i=1; AJvYcCVHL5Tq0fDMm00gtBSm5Qy8E1V9tYl2P8XtSx0FGXwt+kl9EOv7RRV62if40paB67KOcz+F@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2JH9/xtWUfL0Ik0oFuNSSoS3CKd7G0pbm1iUs+UVyOMLaPQWv
	sfDRcxyx4+Xl5B4dlRJyGJ9ZNbjI50TIvKswpImDOmmGZG4aH+/WC4ukuc1IbMW0THtljvm7AhL
	hgItqPa8cJ27PSngDLze4m7pOEDFQ6Q/Pi/iw
X-Google-Smtp-Source: AGHT+IFw8D9Y8iDl9QsdusH9uDD+9on1P4pZpj5dYIq2QFb7UqISOP9oyEzjwVQEFX4WwjN1p6C5EsUcCJSsDc+lbMs=
X-Received: by 2002:a05:6a00:17a1:b0:706:aa39:d5c1 with SMTP id
 d2e1a72fcca58-71b0b21dda5mr2945661b3a.8.1727252828232; Wed, 25 Sep 2024
 01:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com> <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
 <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com>
In-Reply-To: <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Sep 2024 10:26:54 +0200
Message-ID: <CAH5fLgheG47LdgJGX6grHXL6h08tsSM1DACRkkzQk_1U8VAOxQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 6:47=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Sep 16, 2024 at 6:15=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Applied to `rust-next` -- thanks everyone!
>
> Also, for KASAN + RETHUNK builds, I noticed objtool detects this:
>
>     samples/rust/rust_print.o: warning: objtool:
> asan.module_ctor+0x17: 'naked' return found in MITIGATION_RETHUNK
> build
>     samples/rust/rust_print.o: warning: objtool:
> asan.module_dtor+0x17: 'naked' return found in MITIGATION_RETHUNK
> build
>
> And indeed from a quick look the `ret` is there.
>
> Since KASAN support is important, I decided to take it nevertheless,
> but please let's make sure this is fixed during the cycle (or add a
> "depends on").

I figured out what the problem is. I will follow up with a fix soon.

Alice
