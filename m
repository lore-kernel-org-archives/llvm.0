Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767725763
	for <llvm@lists.linux.dev>; Mon, 16 Sep 2024 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726505226; cv=none; b=J39X2lsKtApOa1rKatPOk5AUgK326way9J7UCVditmyVFuHtboMnM+dh4sFagxItKzcomsqRpN4PLhtxJzatLZhrP8SNoueBrGEtyl5EiKJd2NaGbm8eoP0RAzj3TxUDL+SFVfnPFCgRVLbjKCBZElvi1eqVLgyzwSf3iq/533s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726505226; c=relaxed/simple;
	bh=JTMsUH/Kl9aapsZQ8rDpX0KFdNRiW1382f+ZrUXpxq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXZNYatYWlQUe1kjmRmwonqxpqOl/5fCGznf11GZVOrr35VJizsbQ2aBH7sejbmOWiJG9sPHdHXquNmu/d6W6HI1hSaAlhM7IEfJteRf9OLGlE8+NrkNIPZAh8Qdt6CgNAH9PwyOH00B3kzfoycNBZmNPKMHNtbxYBHef+AWlUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKXsvMM+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKXsvMM+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-718e25d8b67so819151b3a.3
        for <llvm@lists.linux.dev>; Mon, 16 Sep 2024 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726505224; x=1727110024; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzAN0xAvRZHTYmrnU/A3fZSEHEklGK3Vjb/1gDLdIyc=;
        b=OKXsvMM+2Dc0nWaTrVOAJU8ppTa6mLV82l2lK2iDANWEwPwBx/5qvaSmDj7WfdwBfJ
         zHDoQ3DxbGCeMrqH7oeVbbK6VvsC6bQbVBR8xB5FGRrCl9IL9eneQAPKX7C7X2xO1MVs
         GkKka1ueH/oIzJtOTGUIXM4TwGzV0pm8exmJaae+r0GIE/myxeKF/OTEtd7/VCgjzvas
         hinZyMZLWesHYagl7KhfYANilk1lvdXWk1aE073hh+MdH24mDovdECuTOMoNmhZoGjTi
         9w57WHfw5MRtlyMYxJffeGE/d7FkVFM3hMal/By+StfS1BCfZlZmZDAzuFv2YKz4OT2l
         rZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726505224; x=1727110024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzAN0xAvRZHTYmrnU/A3fZSEHEklGK3Vjb/1gDLdIyc=;
        b=rnB+JDTHT72CZRAvBr7wFXHBWgYDCHialOxFnFzQXIPibJv7uqsh23jT8DJJNjFtpU
         OXp+wJTHfdGaDUyk9ldSWTNlSghgenYVBd9MIzVTAl4udB1d6Y49ZEjVATWmkifxnmW6
         A8l8AZS8l4g9GSzEOYBTOtvJrY4nq3yoYOoZoBE9qHcfdbmqIODY8db20ccNxPX44slQ
         P7dhIf5w/l0GEHW9sEIBRXzq1BMuKt0bbILPTSXmJrXEzqAfNbQzYliFHLipbka7+TUY
         fAQlGLJXhe+BgikwuWR2EbpPquJE8ttTmmbqTDVN1hG38/vU/ZWdah/k0bLZH1DOf4KD
         JM+A==
X-Forwarded-Encrypted: i=1; AJvYcCVXIAnkq2vYb5EpkXyCTHGhut2jpHPt9y4BDIjvhId0nx1/y/zzton8jRmMu+qoRkaa9z8X@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc2dsuqRFzOQBYO9OYuns8+1h9TuVsK1vGz3c8c+1niMlpMzvv
	RhGADYOGcwppyH49iTRtQiC/olqf6TxEo+lYsE1n7FdSmi7f5wr7BkhidIRSSqLYPph9/s4KQF4
	s5KuQDtHXmJ+k5CHV0A7XUspnUK8=
X-Google-Smtp-Source: AGHT+IGzwvwl4zOI2Siv79HgsewAOMw+JHEgLSjbi/II4ExH83X8+4dRk9iJZKlRCXDrLhPpknwmQEBcqu9MXQQxgVg=
X-Received: by 2002:a05:6a00:9163:b0:710:5243:4161 with SMTP id
 d2e1a72fcca58-7192620609fmr9753938b3a.5.1726505224337; Mon, 16 Sep 2024
 09:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com> <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
In-Reply-To: <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Sep 2024 18:46:51 +0200
Message-ID: <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Matthew Maurer <mmaurer@google.com>
Cc: andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, aliceryhl@google.com, 
	samitolvanen@google.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	glider@google.com, ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 6:15=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Applied to `rust-next` -- thanks everyone!

Also, for KASAN + RETHUNK builds, I noticed objtool detects this:

    samples/rust/rust_print.o: warning: objtool:
asan.module_ctor+0x17: 'naked' return found in MITIGATION_RETHUNK
build
    samples/rust/rust_print.o: warning: objtool:
asan.module_dtor+0x17: 'naked' return found in MITIGATION_RETHUNK
build

And indeed from a quick look the `ret` is there.

Since KASAN support is important, I decided to take it nevertheless,
but please let's make sure this is fixed during the cycle (or add a
"depends on").

Thanks!

Cheers,
Miguel
