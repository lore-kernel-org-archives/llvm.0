Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036350;
	b=069Grg9n74RneLItRLSVJvFXy6P2ngBUr7+u0XrRRdB4zlOclOYh2jKUsNMsxQtSvppY
	 pzDu0U6ritbl8kOqrSFNyj8hGTOSmB1QHdTO2NnKfABSfZW/keyfCbFlp7Damx4HJDh2k
	 rdA62Vfh9U+NiMGlaUu1Vdnen7qJZvOS+BBYHxhVAnPT03HAcHgtAQBUD4FurzzXjgAXB
	 PwjoST3YbyEWJio0fa8vOgwxDBWWpN5afxPcanWi7N5fbyhNCR86/tKRXDKAJoh4VBUlH
	 4VE8wSKGN6nSdqlX6nNa1WyPbx0Cc/Twf1UrI3WKWm1KSGDhUTFaUPV/G8JSjOFzDfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
	b=tNVmA92RWk4sR+Wad2QNN6omRhAJVldi/8eAKfMiT8OnfHBeDHA3B/pJYnJKvBECqj37
	 XslGOFT5LShgAvbtttG96hxxy1dAkSbBFsZ2Q5tvNU7RU36ZQuWYlFnvEXwn2YZztsLoa
	 Eniosd4WTiC+OjZHivuuuRMejh0v+xOkjg/lUhEG9cs+G2n00U8p7KeqGf2HFm3RBtJH2
	 hnuMDigVxO7f7Gpau6R1I2r1rSo82U9/EsiPyO8tSXVi4eBpZ0Wjx3XSb3BG6LHpOCQb8
	 Sdgm8dPEte+YjRSvkNXI03bAzidA0Ev4a+BV9D+d15Kj2KauEZvYXCHGqdDI7eq9wzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EXxKrDsn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D5606A339
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 21:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583D5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EXxKrDsn
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11180485e9.1
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 13:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036348; cv=none;
        d=google.com; s=arc-20260327;
        b=n2Uk5LARlL+902N3OzCC6izLKWnETsP1j3nnS8tDqTTNJam+iFR/hiYeIO3lr5hvwc
         rZUAVM6w0LZJsE1K7LFwCeq+XKSCRVBd1XQuZxw1op3te3XikGiXwJmfQp/5ksIPrShF
         rQaSLbNrWrWQ+xGGhNmPUYZo6v8b7J62XfFNRRrFexzKqLTszzyrVEagqcQdjzd9vZDL
         bAD3Abeleoj8So98R//NUVgN3vMiRSVOQxm3W9rnDqvXkAkCosCZlbNyQxr30Xp36kRW
         SniQyBSq9JvC+LeHmKYMOdEGILCRSZDwWfFbVic6VyDO5uBeDmf9EzbGKWaI5DfRZd/t
         3nPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        fh=rAX1dTjwrEOfpmP0/M6j17S06Az6rvIa7JAaTTkvbJE=;
        b=U7Vc1Bjt6TsAYrl7jbYDDfXGocVfeMd4jUbhqUPypGHN3415hmhc9rOuC7fHBgIJHw
         crFZ++6sKrTHrT9cBtCmb4bt1p3rMxbCqGq1Q3FC0gghTaYr68RGleGVFTu0RgXRopda
         m2oFpLeunuXEdhJeUcqTXEY5gYTLk8oBSyt57noSaLYMJbdezPv30fMJWMO1w2eg6b21
         nRXVSHQ+Wt/8L+N4YuSd3UotmGQcJImJhLcv14UUpHYEOci57YNXgQD9vlt1pHyBx80U
         D3WIMR0qJ+N/7MtLHWD5+KbT7sU+WY6p6Xyr6FOKhk7jJoCWKSW9+KZtogmjPYR2Chpj
         O0Kw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795036348; x=1795641148; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        b=EXxKrDsnPvdbkrKU3AJdbqapg2LUvE85mx3rKXnoqn55Sid2sY9nSddtQcCvguC4JN
         wAMajfoTD9Ifg5eNCbOIcpa5vfZzJsfZtCvsCiJy1Gw5xPW9pC4eAdDjmrlKCPGEulIL
         NvhH9ahY5bNE70thPV4a+6Qhxqn5H/18l8tOxgTWQYvm/Q40/J1TbYsDszZ2WISsLVG7
         kUajYx60oEqpZMNFUdNtXwRHAdSeXp4pthCdLCAVHuiCjxHxkQ4G0Y10kiWC75pbuFM+
         BujzppD4L6sX0wL+MDFI0vDOdQ5Y751AbwCcjf9app7kEktchOkwrclYWB36geFPdyZv
         K8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036348; x=1795641148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        b=kGuIHJiL7l7iGsViMyckTS4dj4MnfpXVWOkBESxbAUbxxV/9GDMxE7Nbq1vmSJXx66
         lcyfW8jnV8CBCpywD9DkzUQH/pEjlsL/0VdN9X98SO1cMwxK6IaHgjtbBHCtr12dGuiB
         b3ctKA4wN6Fg5bOMMEkkaEaSb44tic4JQgdmPNPQbhabIkTTvzcENM/R+xdb57B2l3Bm
         Ggemi8QLfWv7+yvCR6R/UYlsdGv1fRLnhg8vFO15fA16/Kq0R8PNEL477G6v6ruYxg31
         iPViG/ElH+UyCDF6YMIMPaMdlSPAEDImc1LFvoryYosLw1NIdzGGN9Z0aeKJ+XieJrOd
         zvjQ==
X-Forwarded-Encrypted: i=1; AL+hErHbOFibByFkyfpzXHzi+RmwLiXaMbEXw4/MlK8Y2eXN0JTLN7nahXv4jrlzijbdLeusuRjf@lists.linux.dev
X-Gm-Message-State: APuU4Z80D0XSxM/Ik06c1F36aU0fo+eVafpHUvT7RsS31dZ77kuIUwxu
	/E8XyzGkiZjnp1Crt7DKzlfD+dmDWQ2C/HA0tdTGN5UkmwgRlRHvohXJZwc5exmpKN1pzc+TXcb
	ONVB0XjbKHOqQzuJJKgYTFuHh1t1+uvrKKCe3ih5/
X-Gm-Gg: AYBFou0QMivhbcrbTFALpi9gsoNhHU+kXVXocvtq+p7VSUJJ/kGrhormd0KlIgWDr+m
	5diiBo6FLQCo7Xr5N7iPnkKpJ3bo7PcNUvqhFgvzOTjEQBGT0pFlL6tQW4EzPVoqE00JBy5nxJF
	GkZUeksZRePCDQdDIWDTyDiHCXZw+Y+otMlh1piPz5aFjDqjHY6Nxa40q0xPqey6Vh8gTlfpfqJ
	ZgQp/NH3dFX75VcVpzDRK1q2oC08y6d9VdCUFXvporFS6N872LwDWlLvO6b16hVgfGSqfXRvFvd
	T7by70h57R8vnmmXMzvbB4gN3JsnjVyU8eV8Lyrf1lx0LEVut92ltqG7iPdz5qbJCBUEr3iphni
	FeaxQ7kq2nT3iG3r5MTPwIbrusk/XseauhdOH1/KI6zO8awFjVaax1cwq+Y2byp9Zt2ETquW133
	c58NOQLOaC9ynAihaOsikyFcbNN5hlqTS+EvOL7Nuw9w9MXyisaUKbvpqiwLCnmQuBU1Hy1QxG6
	HCgermygPSgxgh9Ht749eb6KTfJ1mggu7g2Ww==
X-Received: by 2002:a05:600c:c8f:b0:4bb:69b2:d3b3 with SMTP id
 5b1f17b1804b1-4bb7da3f50amr85274465e9.27.1795036347018; Wed, 18 Nov 2026
 13:12:27 -0800 (PST)
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
 <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com> <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
In-Reply-To: <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Nov 2026 13:12:15 -0800
X-Gm-Features: Aa3M54rwqBnTNo9s7KzOH39H6ui7-iQszvNlrDcPs70i2RE6J983km-iNd7m9tM
Message-ID: <CAKwvOdkNWp4us-zNPw8Pp3J6TVev3nTRsjPrjd9w9M66w2Qbzg@mail.gmail.com>
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

On Wed, Nov 18, 2026 at 12:11=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Wed, Nov 18, 2026 at 7:48=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > Function merging causes various different issues:
> > >
> > > * For CONFIG_CFI there's an LLVM bug causing functions with different
> > >   CFI hashes to get merged. This can lead to crashes at runtime.
> >
> > Do you have a link to a bug filed against llvm?
>
> https://github.com/llvm/llvm-project/issues/217629
>
> > > * For gendwarfksyms it causes functions with different CRCs to get
> > >   merged. This leads to broken MODVERSIONS information if the functio=
n
> > >   changes in the future so that it can no longer be merged.
> > > * Wrong backtraces when a crash occurs in a merged function.
> > > * Possibly also issues with pahole/BTF as the merged function's debug
> > >   info is lost.
> > >
> > > These issues are new to Rust because in clang, function merging is of=
f
> > > by default, so these things have never come up before. Because of thi=
s,
> >
> > I've never heard of function merging (in clang). I've heard of
> > -Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
> > default, implicitly?
> > https://github.com/ClangBuiltLinux/linux/issues/1598
>
> No, this isn't linker ICF. rustc doesn't pass --icf, and in any case
> kbuild invokes rustc with --emit=3Dobj and does the final link itself, so
> rustc's linker arguments never come into play.
>
> What I'm referring to is LLVM's MergeFunctions IR pass
> (llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of the
> optimization pipeline, within a single codegen unit, before any object
> file is emitted. Clang only enables it with the cc1-only flag
> -fmerge-functions, which the kernel never passes, so C code in the
> kernel never sees it.

Thanks, consider amending these relevant links and details into your
commit message.

>
> rustc, however, enables it by default whenever optimizing for speed or
> size (opt-level 2, 3, s or z), which covers both kernel configurations.
> It uses the "aliases" mode: when two functions have identical bodies,
> one is deleted and its symbol becomes a GlobalAlias to the other. You
> can turn it off with -Zmerge-functions=3Ddisabled.
>
> Alice



--=20
Thanks,
~Nick Desaulniers
