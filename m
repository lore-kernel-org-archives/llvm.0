Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793295143;
	b=SrXL6lI0DE7yVzkNhkL341FjHCyj/+MOVb3tJGW+16t+gDTlOOSf9eSCFvuVGIGeWiBK
	 ZbuWNVgV1x/G9BNVC8pHvW8k8fEbB0je+9nbFSe/pGqG59toaKRDCvq7Fd1wWFYLSFS96
	 4N76wDUjSgaYBSAOvXthMPUxlp03eecCClFfvbg5kXVg+lcAjyAnZdiPT5QhR5sERxLcX
	 hWlq1M6cS/M4Fd7SSP3OyilJKJwezBGndXhg+caXh9n2i23Fvol1Z+FYlNfiLqosC3rF0
	 1wTOcJKSMBM9ZEnbakWFBJsyT8dlWk7Ci4a/fTswKgP8aFy/75ztyA8ugQ+2UocovLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
	b=p346DKOEIgz70OWN/Lwswh21tEx8AQCwOMMZKqc5ylN8zAa+0ZSujo+dzYjEo+ePP/ds
	 OQ2UOfxVqyctYcJwRgvG+mydYNHKQhSNuCDThfKWf16ZUDgAld22im3OY9FXmMzMkJVdY
	 ulxfEyBybbdQBv938e5USHAJYevDG1BM53pIlrtnAi8f5ve1eoGPEcfIL1DjUVRs8HW1T
	 X0ioFVJZtUT8uZZDv8Rgtok+i9fQp+Pmk3hTHkKdeyRebTdvKvmaWM4E8L3Trd6Kp+CyI
	 riBlyV4Tu20ULvqozmcVz03OBmp26E1aKih8ynvhYDrR8ggWL+Q1kc/jsxhu79MImrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyUrDe3N;
	arc=fail smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C17606A320
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 17:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C17606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyUrDe3N
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369fc2e984fso233685eec.1
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 10:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793295142; cv=none;
        d=google.com; s=arc-20260327;
        b=GltJ/YjixCV+RzPV2ZcpD63MqE+SseCdP26lJQgdlEMUnxJ+p0huUjL8CDp1wVzVA+
         I9/Y2SIt19a6hrzghC5tcwh63zxzneYxtwxOKNYXS18QNqmhLcUl/5m7PZvhyDQWZkGH
         d8nX0bi2f3x1nCnhGRf+Jljcy2OUrRgJNIiEPHtqd6Wc+oc39aCWAmYf2W5FJ1UnaC6t
         fscoh0k4+FKtF72jVm4TiyBVtp8c8+ulAQTWZvKRe/ALqZA8jF3In6KRGUJSbRCytx46
         x6mB8S9LOwwknh8uRmjmKGgEN08YOEbjUIBno00OFx/O+DookEcbBPxq0ZejsIFrmSSL
         ZT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
        fh=hagn1uMj5Wy7aFOMVmvuL8lGbUFxgmNAO3wq9tzwcYA=;
        b=FnmNjz0W6KSoN5zu9ESIu1BmDuL5We6yOF++kyaMaXXu0K1mDcy80AljQIgYsdSqUY
         gFS8XiaTxcbxitzquK0kvgvY4b4M2CvtPyoOLeW4RFtFRGfa1odlIKOfVCDwuVLd9w/l
         c/XG22eMkLMwPLunRmN4qTc6T3lpVIkM9XP4Tevp4q6trapFk354aOnqwCw6DgMv0C2B
         7hNnbcISwUuAkrFuc+PlcvIxNA/+VcSDgRr96PxSkmY5rwww21bMe7acpUDugpQofBI+
         Idv+xRGbV4q6gBzc5XZANV8bUaJoQrBRlufHoq25wpsDFgtNU5RwxeNaIUyWL/r3swtr
         kCSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295142; x=1793899942; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
        b=uyUrDe3NlPCew69RbPIrM9wiY4PRYMsanvni+D3jov9+Dkt2DBfBqXaYmgmqN4ba92
         9xE57SPA2xezXJv+9Mc+K0yI99UBiXUMgOlnI03SPrAPArPNk0H+xcuy9oaokP+RcyR4
         mwmciRNhivHygQBiHnWetnz2LDvoCEaYBrwry2Ocjw6F6rdYIWzuNBa6nEEDeoAkweg6
         xO6LWNtdq6wwIU7mEGe8047IaznjiX3hEPH6SGxlAlhSM7ARtgzr1K7/hTnZZk+R7rkl
         teLbm8a2TUXsXnLfp6kmSZ31mNBEVnepFTfv7Ujr9HLi2DTvDHT8GCm1lJX5OHTwRv+H
         j7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295142; x=1793899942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
        b=bMZ9KnA51ZuHkHsWzwgoImWBl5NZG7HugiwNDyDRRn0rrpHEXnaB+pdEki+8HsAqE+
         /NJPgqa5EiPo6kQlcitK1OSX4Xc8DnAwz8FCOOrLFmjFtyJgIg1brS07FhaZrqw0EL0e
         r/4DGg+3NugucXCTJlYJNYdB0P4PQ/bGVSG0SCMulAU3VfdtPiehl1DbPZmRARglQ1GI
         kK3gxLD34hCBnK2IQwsBvNy9t0q2CvIRFiTuLNeQA2U06bdqGMFgKEK96gmk9/d9vGm5
         CdbLT7KW0G3QLThnsAgm5gtIWNVqWtRN1ztnBMbJR9m8/mkBNEEc3FFvY7T7Bom/5Xl2
         mvoA==
X-Forwarded-Encrypted: i=1; AKwUvBwpB7AhsuTan+mu8GxR9+iKULNPbBMWm7f8vwdikhmGQxJaB2OuMispwROd0whlp1HvBtP4@lists.linux.dev
X-Gm-Message-State: AFq9FYL86F5DZnJWU+hwge4H0DE+tJikwDXPpXNK20yRiFqhk6xF+5Aw
	J1Ni9QbnO4X85Me6t+2Wv9YNbwl8yRWy69HSQQkVT5wAxQ/zyvytrvQ0+HZ5aMh+befnfeGa2BA
	WA68jO9n1qyLX0o9kceF9Ohi4mzTYPIo=
X-Gm-Gg: AYBFou0QYnKSdCqyFxtnCSzfNNUwc31v4ibLmANYg9AvODcG07V+MYL1YyMnA6OecU5
	lT9c0Nnpw9tarsN27dPpiYRMiMD0DmnJULFLGrr/0NryIuiX5eDNPmrTsWHSo25cFfJ8qrryXmC
	wKWqwJxESA0Ueh3EuIIJWt6Kt2Nup2IAzoFdZ4fwxMOxuG/Y7/ojidmBEJ/tORh0vluva0MBTEY
	3Z3d0fk5zXMj1S6eYR7gC8lpp4ZpM7jLEMf5HtcGdLdz4dGlpbwK06QkxUgNmrbB21MVUxaVLjh
	7qEwQ4LBBARhpLlsQ4Aex7/bYG122Le1rSxFCMGAznVdXp3SlCHAc0PoJpclcu2OuvWMkbhcTb4
	DyQ0sKvxZqOCpIGrgrMDFbbNdDcNtOxOwn/TPTbvpbJDDADp+pKCK/GqsIxJ6DrMUR6thLr2GPC
	TAnSUUDPyvZWFLzOxtQ9afR2+UEACi6bJFYyPkSKlZUMjFmH7qSbEuPel4ZEwg/MyCaied/iZls
	Q8Ts4zAIY28hRW4TVG35z5ambHvwqkb44pNDBpprB7mifv8Dymp2GxCSA==
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr139643eec.2.1793295141770; Thu, 29 Oct 2026
 10:32:21 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com>
In-Reply-To: <20261029162958.3224280-1-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 18:32:09 +0100
X-Gm-Features: AclHuK-0mxI3LKAZpnOHH-Drrv94DNRirn4x7gfXbdMbpDKW_doTTtE6JJd6tT0
Message-ID: <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/3] tools: Add Rust library build infrastructure
 and prefer zlib-rs
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:30=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> 1. **tools build: Add Rust library build infrastructure and zlib-rs featu=
re test**:
>    - Adds `tools/build/Makefile.rust` with helpers to locate Cargo crate
>      sources in distro (`/usr/share/cargo/registry`) or local Cargo
>      registries (`CARGO_HOME` / `~/.cargo`), map `.rlib` prerequisites to

When we were discussing whether to vendor crates for the normal build
or whether to fetch them locally from the registry a couple years ago,
we discussed approaches like this one, i.e. picking a version from the
registry by folder name etc.

But that doesn't work too well. For instance, the graph of
dependencies may change, there may be several versions available (and
the highest may not be the proper one to pick), there may be different
major versions available (i.e. not backwards compatible), they may
change the build scripts, etc. Even picking the highest major wouldn't
always be correct, from what I recall.

I also asked a few distributions how they felt about it, and they
indeed said that it wasn't a great idea without querying properly the
registry.

So one should really ask Cargo for the right information about the
local registry (i.e. offline). It has been a while, so Cargo (or maybe
`pkg-config` or whatever) may have better support for querying it
nowadays too -- I would suggest checking that first (e.g. `cargo
metadata`).

I think depending on Cargo for this, especially nowadays and for
`tools/`, should be fine (we were considering even back then and for
the normal build).

By the way, checking Cargo's cache sounds very strange to me: that
means the version that gets picked is even more "uncontrolled".

I hope that helps!

[ In the end, for normal kernel crates, we decided to vendor for other
reasons, e.g. we wanted to pin the versions, to customize sometimes,
and most importantly to avoid any possible user misconfiguration that
could lead to a subtly incorrect kernel. But for `tools/` it makes way
more sense, of course. ]

Cheers,
Miguel
