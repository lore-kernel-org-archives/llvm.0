Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1C5B1E2
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709057492; cv=none; b=SLBj/g2ItWXi3e8dVmJ+GO+R+MR5vXNAozszq5vRNxqTYSBZjj+EvqJBwkYugNAZzzU+U5UmaCVb2Y+Ja8hqJ2Hj1v6cqCyLW7KVFyuCo4do+80xk8OeOMARDzyOD8M4Ab0Y0HIygxvfmji9X/dvRsLH6lfkzW0KiwR150dn7lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709057492; c=relaxed/simple;
	bh=MMz4gkSGSqX8KBz3u9sPg+H10dtSow275aT+2BTX1/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZA2cncIhRwzMdun554eMnjoeacTX72HxOjpD9YQz3flz4dMDIMKT2Y26FsvQW/SVjrbPVW0m68boXeA2COszfgp3uA6/a+g5kvxhcTOWfh8PBV6s02+MAsddV7ABee92YXHSa2UZoSuntYzYrWCYmctzj18SQ/Q+bo3EiVmaas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1hPZUhW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1hPZUhW"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d944e8f367so33397545ad.0
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709057491; x=1709662291; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMz4gkSGSqX8KBz3u9sPg+H10dtSow275aT+2BTX1/c=;
        b=Z1hPZUhWwDEGJM8gD26DAsrdTpdTJNwWSJeDL9955/IUDoIafj5urRs+m4Tp3rpQf5
         m1VK9+TfaiGq/Vt/j8OhmgxVlWuhr4V4KKLR/zcttQ9JMBN3YP2532YBK7WgFfQi1hLH
         itgOcMxN+KxwJqgDyU8TFsiTSbhdByfNY7PGViQXA5QQp6TS/5piXWisKeqL9RCTl6KX
         gbfLNBxM5mIZih99d0UaX3lwe77O7s6wO/jaDEIDfQkXepghn3oyLSR3zs/CJs2LeKLR
         0+MllTfWmOkVL9XeC01M0hVy8fvs5TvH6/EuVWAdbsI4SQLVBV3brX/xi9it9MKjg0xs
         IwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709057491; x=1709662291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMz4gkSGSqX8KBz3u9sPg+H10dtSow275aT+2BTX1/c=;
        b=h8INalwPm5LUx9Ol+CKfkAv4Z+gYiC/ICYeaLZp3gNLhly8XyHDSLLgfKqlHLcWfmF
         JmksQfrW+T08QBtNiEVSRFOyQFWKi2It4YR75xiJ2f9GsDQqJ0ak+XYG4BfsSPbDP+Rq
         +Sss2zG/ryT4svRwVdBxTbipGw20LvPvCmDYuySJtcIa6dSXO7xdDrXtWPeZNFZ9v+62
         hGEURK+7ZnBt8G5FxSgUn8JTamqq9xvqIyv2sNczyflu2dK2pRLNb1cL5kpPSZ4P3Rxx
         f4nBsrKCpcN1GJLbpoNxJWwaT1vOGB4MlK/co/KyH4FF3awipc51IrwBjoNROekb+RTf
         /x5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrhf/JoPsN05EINU2RDMRtimrKQ4KnUk0Wuw3Lano0PAHwrZhQmtYaiAgmISpk2Eq1WHwgwuMzbTFCcxqz37JIrugzow==
X-Gm-Message-State: AOJu0YxObzLcPocJ2O5+GPwHXauMEE95QIymwmpNZnvnMf0NF85oXFlY
	HJMH6dmmIZ8IdrQ8Ux9Zs7b1V+k4aYX0nWbU7trK+orQPcF3t1vX+7o2FdRWct7qMtYt3ZJmhNQ
	FHdE9HVwTNW11KcVy0ToSx0xEZQQ=
X-Google-Smtp-Source: AGHT+IEsUCrkq/OPRo37hLxEJi/HVswFjqS4zKGwkwKwXanq1jXthlIIw0jzgDza4ht+oCgXlPGyJKryUUW06LAmzOk=
X-Received: by 2002:a17:903:2309:b0:1dc:b4ef:b199 with SMTP id
 d9-20020a170903230900b001dcb4efb199mr3828629plh.36.1709057490589; Tue, 27 Feb
 2024 10:11:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
 <20240227-resolved-deceit-4a59a6af5b71@wendy> <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
 <20240227-glove-underwire-f562a56cf2c7@wendy> <CANiq72=f03_bw9B8ww8UxHkVyP2F7ZPyvC+KWCyhO3Nk1yqdaw@mail.gmail.com>
 <20240227-swarm-serpent-2010b255f68a@wendy> <CANiq72=69uBBhKMrw5P8K6eDHPiwAw_Oj8g1aYcywEYhhUG8OA@mail.gmail.com>
 <20240227-timothy-jailbreak-01a9c29f3607@spud>
In-Reply-To: <20240227-timothy-jailbreak-01a9c29f3607@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 19:11:17 +0100
Message-ID: <CANiq72kQ8===wFLQNCR-XAo9KdtPr44UKvyi2074J88vh3kvyg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 6:48=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> No, I didn't actually try anything. Between trying to test the kcfi
> stuff on arm64 and the other work I was doing today I did not have a
> chance to actually play with that yet.

Apologies, I didn't mean it that way -- I was just wondering if it
didn't work. No rush on my side (in fact, I thought this was for 6.10
anyway).

> It comes down to you though I
> suppose - would you rather have generate_rust_target enable the
> compressed instructions depending on the config option or have the
> Makefile disable it if compressed instructions are not enabled and use
> a builtin target?

So the custom target support is there for flexibility purposes: we
were told is that since the target spec is too tied to LLVM, it is
unlikely to get stabilized (at least as it is), and thus they
preferred that we ask for whatever flags in `rustc` would be needed to
tweak things in an existing builtin target (or add new built-in
targets if needed).

Thus, when a new architecture is added, the question is whether one
can already use the flags approach or not.

For instance, to disable the compressed instructions, from what I can
tell, the flag I mentioned seems to work, so that is fine. However,
for something like tweaking the data layout for `n64` instead of
`n32:64`, I am not aware of a way to do so via a flag (but I see newer
LLVM uses `n32:64`, so that may be the better one anyway:
https://godbolt.org/z/Eh4cfdeMr).

So it all depends on whether you are happy with what the flags
approach already give you.

I hope that clarifies a bit!

Cheers,
Miguel
