Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFA5178CFA
	for <llvm@lists.linux.dev>; Fri, 26 Jul 2024 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721997404; cv=none; b=ppb03fUgZShHX+9/WGPsNcGj4OP1Cp8r3CrMGH41WBgMwR1F8YP6FjOY9YPj9GI1XCfwojo1tlH/+69OUIVHHCr1m35XM5egew2masTa9I6QwRQkuPV9IcGZFcNkyOyDY4V8BOHZmhYrukzHcpu+5zGUtMrAW3up8obvViYIq4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721997404; c=relaxed/simple;
	bh=1zWDRWp+paDjK/r/9N7qgoFAesuhA/2QMW3EwgwYqcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6dLn8+VvpIE6AB+DRvcJGhKAtQm4pW0StpxkwPxuIk3D2F/Ic/Q0fhSVBoSYrCdQT4Zuabv1w6WLPmt4H62H1E2r8RhAkg1YsPlIuf6uiJxEvVKEk+qTwq7/B/RxxGswo8n266XKMDABxbs/a4T0g0caAkxT4DowTsvsAN2Lag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMCndPZo; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMCndPZo"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cb576db1c5so635042a91.1
        for <llvm@lists.linux.dev>; Fri, 26 Jul 2024 05:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721997402; x=1722602202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zWDRWp+paDjK/r/9N7qgoFAesuhA/2QMW3EwgwYqcg=;
        b=GMCndPZoaQIB07ydMV0IRjS+L9+xDsL9j0tzSo13B9w/nUwApMbTSS3Gbc5DmRcbJM
         pax0e0cRpcOmLuPi40363xTPJCmQxNzd/KRd0WBsZG2x+Czf2BJt8SwwPABTvuVn0PV0
         JymU+WscD55mjtA8gmpWU6LGpbekdC5g6tU4sU7QmuCTiray6qHTn3KPvvhqwg9lIHTu
         IVahbr4/ZdRvtLC4TsYM+yCmI3HClW6bkKFv8B2cx+FYjbXv5d7a/CfoqlQBUBfSO3/Q
         z7cofAjmc7kYVVOMKVxHq3eLxfpHDSkl6/cE6EnxIOydrZ5+dyVHkbCchC9uvNfBpKls
         I6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721997402; x=1722602202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zWDRWp+paDjK/r/9N7qgoFAesuhA/2QMW3EwgwYqcg=;
        b=Q7F8nX3vLlwv1rF+8cT/OhRC/FyaK2Fxeuu6RXmLv6/GLcLx5gzdrwRPT/qtxn0VTQ
         koQeTiINt7ATW/OKFeMb2Tje/KafjjusUNpbzwKY7+hDdqNQxK5EG4lt+sPQ56Y7L45G
         fUcWH63V5igXAppp9g7J/x49JnRbh4V32hS1fxQ5cYr5uvW3TYBa32PuK2XSAa5H86fN
         yvgMSlOMo7RISpi9J1TmsivKbSmfuNRLJtur6kYkovuowF+JQsVxusP0+4I/Z4Lb/SYX
         eqRVBq4NgBmX4GnFGaHVtgIKAPFScn9URvoAKb1uLcw7YhBTA/zI0hd3TI91moFZiZ9F
         7n/A==
X-Forwarded-Encrypted: i=1; AJvYcCVyvuOG0Nii8KhBz+eyQvHTy55pPzXPFoKeEOFW3WdPhgy+1jrxj4jDseHc/EyRXsz9e6b2ZGhAWbXdsec2x1uASa6Ogw==
X-Gm-Message-State: AOJu0Yyp/dX3DNKPifsm5xBKu1uWsUIVs1gsFbA5iVBuHQbDx9N0VAKm
	hT156NYD7bHR8APPam5lJdjuCMroeX40e82pk9vnAKJMHwMT/rWabYUNcDRbifitlawaz1PAO1Z
	y1ipE1vk6r8olUpGAcyq398U5qUQ=
X-Google-Smtp-Source: AGHT+IHt4VEqTzpVq8r5CzvzfWANcuIs631ikOmdea7VFGcamFNux9yi9tHxpM7rdXBU4AZ90s8oyeHEh8iuSzasv6Q=
X-Received: by 2002:a17:90a:1fc8:b0:2c9:57a4:a8c4 with SMTP id
 98e67ed59e1d1-2cf2ebb9251mr5312268a91.42.1721997402182; Fri, 26 Jul 2024
 05:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240725232126.1996981-1-mmaurer@google.com> <20240725232126.1996981-3-mmaurer@google.com>
 <CA+fCnZdwRcdOig0u-D0vnFz937hRufTQOpCqGiMeo5B+-1iRVA@mail.gmail.com> <CACT4Y+Y+XmdNervhF5WAEyVwprJ32m7Pd8FF2fKy3K9FiTpJtQ@mail.gmail.com>
In-Reply-To: <CACT4Y+Y+XmdNervhF5WAEyVwprJ32m7Pd8FF2fKy3K9FiTpJtQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Jul 2024 14:36:30 +0200
Message-ID: <CANiq72kb0df5k-8njjNgfFFVj7Cfx-uiTSEtMt5Cbb8f3DkjWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rust: Enable KASAN support
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Matthew Maurer <mmaurer@google.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 12:23=E2=80=AFPM Dmitry Vyukov <dvyukov@google.com>=
 wrote:
>
> This is great, thanks, Matthew!
>
> Does Rust support KUnit tests?
> It would be good to add at least a simple positive test similar to the
> existing ones so that the support does not get rotten soon.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/m=
m/kasan/kasan_test.c

Yeah, we have Rust doctests converted into KUnit tests, as well as
upcoming `#[test]`s support (also handled as KUnit tests). For this, I
assume the latter would make more sense, but we have to merge it.

Cheers,
Miguel
