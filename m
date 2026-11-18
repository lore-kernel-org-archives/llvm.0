Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795032722;
	b=hZg5Bw8DDYFQB/xCeQhXGXCkk81mSmshJHknzcbjG5tibvKurR4YNAbTq6ZIXavcU5pi
	 MaUHRm/LH/Yc7SIL6HSAZfAZiNPCk6b2EkBPE62tj4OGW4xbssK1JACo6qD7A757DD766
	 B2GwNwDrBXyb/GMP2F+37Qj4p7jR5oZVk6+iGozhPYax6zuB2ItXWj2sEV6AsCynji+A3
	 kOKy+ISsiaKB13fkNwN7GbRwIWILUV0a346HRUPlaRpHAKAGYlxUOdPkmeSIRrWd52+XN
	 vU4letzgeraBRPSXSRJAVIuNxbEAl2289KFnSy7qOf3Kh4uOFEASP5W3npsO/3YtSSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
	b=geyFvU1krPMmRv7utkixww0+v4IAdQIEF6jFXra8EsTSwBepPcUIXmcx/pf/x69VNzeo
	 EfczRJrIs28Q8LZ2Z0OHsS5Otyweno4w+7gp/iso9fdlAVeiawZa3n9N1fy64of/9FVHG
	 mRfM4o57sVcIU0KDvOxFQYzxygCqN1vSNKJA7JnIOKXe2/mbqyg1PvTyUzdPYofWwZEHM
	 Q883JSCZUBZHvHXbGZiJ7wsD+mC5HqG6LxPKNhBjOGSPzWDvVLxPeWXTZYrWOc9/V7kWP
	 +/ifbCOQplJxg/eEAcJgfelgruNLjM32pu7G39gtBmGJ/jDhprZcygI/6Rtuex8wVUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NVeszBlv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E16606A332
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 20:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E16606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NVeszBlv
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11634065e9.2
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 12:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795032715; cv=none;
        d=google.com; s=arc-20260327;
        b=JFETSZGdjfCJiA+EDE9PS8Q1nzxHFJLDo0KqnuJhTz12G0maLbDC3T+qsxxurl3hnT
         FCF9r4IXuJj+V+y5ff2Ft342rsm/Mi+uexlGn3h+ER1em1owC98hTV33XtzAKVmUFzMv
         sPeXpjvYI6zHvY6WwhPoP8Q6yDMO9GST1BPPICxyUNd1G6A5SpTK5HZUnDDDpB51NLKu
         hU2zBFzxSnDWDWc8QF3jm2SVvOGsDuFzx61EDWaVy5X1k0/7Mpa6EQUrHBzYmpIj2bWS
         ZMzG/h7n08F4gFHy+7lDQ92HhAvjf+cq1l7pLJwpn7/mPOMn0uACxnoHHkqaW8xrsCX+
         ZaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        fh=5lH1Rkv2GK3ReseMfPb8D5BAlrak0GlBVhLResp6JY4=;
        b=kwMztnf0eBUbaaFcXgZ5+X5Ebh6Fpsk6OxsOm4TLT1Cwym/BpCArQol+tUDGE95erI
         989q9UaQDXQTEXOJBhi8uc2HdpLFsHG0OBATToSpSbXKnb66jkWvliGGkzYkEy69oOC3
         NVBFwEfT8AFR1DIIT23cX0936fnxTY1l1twXa4A4ThfVSGDe8xWbabh0CBGqlKSSioxr
         9vhbqrh8lBH5TgCj7WzgtgG9t/BBKB+hyWya7dLcWdeXWDPCFJhkM31SEQo/1K/ag1Gc
         yL67iFgqCqbgqxS54eXMu7k8v0iPpYSShopLpNz3SKGhGonPq8AOCjbS71xoG66AduY9
         TKWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795032715; x=1795637515; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        b=NVeszBlv6LvNlkoJ6IAbTWc4WmPWFMfoxB0aI6876HJPunQsmnlAOlWuFea8WkZHQz
         weB7ofhf6D9O++SJ/Eb7tDSlemmpC7SL4TrnGcP4ahBYF8eO0cug4VVRDr0VGy0CyqGN
         44+ZWNfTk/nG0mpC347pADz249pvx9zUekkperqqGB+IoAaXG2FLOUkztKA/jtnyMBDg
         CGMgtgKeZMlbjMrgJwC2n+jxxj3Y3eElcQHBx9YT6tJIMUs4jooFDI1jG+MBPyNig7+w
         nr9q90DWqwDw65HS51jjFpBLr2H28qI0KQjIGee+RkEIXsndPd4aGbItACucAibNuIx6
         7psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032715; x=1795637515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        b=T9P8v2W0RHL+zv+PDIG8U6BwD41KxUymMM8cTbt/6iPuDQU36HeRmzzdY3N3wVxsoF
         zsoFF+6xCZpWVXmYuaaKFnYvUInJ29FMZFS2lvxzNj+/LGKg44MrNbuFuPBQJ/0A7O9d
         gMIx2dd6FqJdlVb0JpiD8FrK+kMVQ95/FohHBz1eiRTg5d3o91gAkn9cZAaDwh6ane1D
         cU0dTmZUrNGcF/th3CpGDpm4gHPsonMjwgYujk8tcdjVKD2zdPs1P4N9pv2SDRz6KDo8
         uLbYRtzQB0n/vTrL5qnHLGRRm683P4trSwntn89OI/+X6+4/wQax9E6kYtGUFmQLIsll
         9mKA==
X-Forwarded-Encrypted: i=1; AL+hErHaSjFzG12aPrPQFQa4D/VXmblEeHXk/AJdTc0kzjsSEQ8zGLYFI8aSYz2uNP8zgwW3bWmr@lists.linux.dev
X-Gm-Message-State: APuU4Z/9p9rpzgTrC47Jp+DImqFcnfVFMYlIQOtrSAF4tWwvHwG8pcvA
	Tpp+LKycA6qTOzYIyQ3e5BeCQi/WeKyCBofSsayJIloPS6twgqBNFNWT7WY06l5m7wtRF9tNdD2
	JTGnjSaGeEtRmrOznzOcj0hYucZnnv/I7COCYVgvC
X-Gm-Gg: AYBFou3RyXuES0RrjkrPeKrZRTfEThkIDORFOWoCh1W20zYTLqga9z55WBAtvqLh7cT
	PBePpZqtaGHeAcr/L2cEqideGj2mO54833qMEX5cUeTLP4tjrz70+vsd2XwEuDUrUOlYD3DANLj
	KPU7Sd2utAZQae0JBtloLtpqi3vPbc0WJAR7xLl1Bl+HpLAqHWFx4o1bPAMxBi+zHKY5TFp5EHc
	sKwUIBM4HcSAWaUt5j4BvHrW/dDTOvpuB5LjCLSA1vXy/nGBllPjWj/L7E/hzEavsbMguFPqDYL
	on7vqDtq8c12E4HKcSiaLaPFRhIXrAKSgnxkCWmBmLr2nHBqlfX0E2yhStrBuQzVRAw/TjZjoBI
	cGQPwuVncZWe0e125uOuqLGxW2qzeuhRACREU6umq2u53HiBYbhyaJF1O13UVAaEM4Fglxp2zCu
	rw64j+bEot3OVa
X-Received: by 2002:a05:600c:4f4f:b0:4a1:f377:5c6c with SMTP id
 5b1f17b1804b1-4bb7da1274dmr73938355e9.10.1795032714637; Wed, 18 Nov 2026
 12:11:54 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com> <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
In-Reply-To: <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 21:11:42 +0100
X-Gm-Features: Aa3M54q33nCN9_jrrnbqRVjKUIfyyWJWqzyIJScCl4pTAw6Zw2JFPOFUAC-yfZc
Message-ID: <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Nick Desaulniers <ndesaulniers@google.com>
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

On Wed, Nov 18, 2026 at 7:48=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Function merging causes various different issues:
> >
> > * For CONFIG_CFI there's an LLVM bug causing functions with different
> >   CFI hashes to get merged. This can lead to crashes at runtime.
>
> Do you have a link to a bug filed against llvm?

https://github.com/llvm/llvm-project/issues/217629

> > * For gendwarfksyms it causes functions with different CRCs to get
> >   merged. This leads to broken MODVERSIONS information if the function
> >   changes in the future so that it can no longer be merged.
> > * Wrong backtraces when a crash occurs in a merged function.
> > * Possibly also issues with pahole/BTF as the merged function's debug
> >   info is lost.
> >
> > These issues are new to Rust because in clang, function merging is off
> > by default, so these things have never come up before. Because of this,
>
> I've never heard of function merging (in clang). I've heard of
> -Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
> default, implicitly?
> https://github.com/ClangBuiltLinux/linux/issues/1598

No, this isn't linker ICF. rustc doesn't pass --icf, and in any case
kbuild invokes rustc with --emit=3Dobj and does the final link itself, so
rustc's linker arguments never come into play.

What I'm referring to is LLVM's MergeFunctions IR pass
(llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of the
optimization pipeline, within a single codegen unit, before any object
file is emitted. Clang only enables it with the cc1-only flag
-fmerge-functions, which the kernel never passes, so C code in the
kernel never sees it.

rustc, however, enables it by default whenever optimizing for speed or
size (opt-level 2, 3, s or z), which covers both kernel configurations.
It uses the "aliases" mode: when two functions have identical bodies,
one is deleted and its symbol becomes a GlobalAlias to the other. You
can turn it off with -Zmerge-functions=3Ddisabled.

Alice
