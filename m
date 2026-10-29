Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793298232;
	b=qJlfY4LBlBhKgQSCRULDTsxN4kP6PyoKERlf7ZiSbWcVbSdUO5R6oe3jXwFbfVIHdZ37
	 rWdHsF23v1arubhuwqU19X6BjtZDKfMXaaWu/pznWeyHzPIU95V/C321hmRVtD5vKnmwC
	 //QEab6jaPi74HwiNjnl3xJ35Ud9KLJ04DOq/wMRZwWKxn1c9bPIM+4P0vWy41FK56W48
	 0e0KicpavFeT9l2kyWQcP+ocXFPcDVBjwU8L87U1P5RNw6dDl12dgxkwm1a5n1hgbPENH
	 VIJcswe3x66JPfTCjOwEQPXWj3Xae1L0TfOwyrnMB60KCsS82lm+ykSJNvFJv8shlcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
	b=KUF27hng4fhWurX8cnhGHfIWEGcQoQelEs9yMk8+zrDIugQd1CE3dW33PK0uK/+dtPQs
	 Ru9Jrwey0NQ0CYyaPOpdpj6PExw1vU2/wxo/lTGk6CJzuoTMaViVZB+JBbEtvgLMD+6i6
	 p852wzvuboAnomsFNCuMMN/3e5y/OW82UST/zt9cGFXjaqMy7UONQA/6NwoUuWaH4jnnn
	 aDqaASdGLtaAAKRxrEPgpfekW5GPgj3ikTTVM12nDBRxwtHlZBTbHO/K0lR6+fSQ0awHq
	 dLTQSbowbVmwHbyhjSsQx4Oyz6AJ6PynSNzNfB3vteUDXkfMNGBM+UN4/VaoknVsOfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DvqiCEa+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A02606A31A
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 18:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A02606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DvqiCEa+
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so46221cf.0
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 11:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793298231; cv=none;
        d=google.com; s=arc-20260327;
        b=JTaSyLsHVyya4KjH9PacW2oi1Iba81+9RjcYs16wi5Ducy6fBSfMv9zeDeBqP/dZkT
         fqju4txhO7F9PlspMCWdJ8sdKasM/bF9F4eh0HoeDsIlX/6c4qr0SH7Sj7CaZ3znq/1o
         AsQzElQb4EdfYaScF4/4yIqHNQER0fZVGOYWYi8SMA28jtV4dICThGLp3dqVD/aPmPnm
         GVGykXCLInTfIofNrXy3z13NY2Q3ILgs3QYyfbnFiFluJwDy7JENVuwZiPZ3TRvqvNoW
         jjYteqqNK62E32+UtZFnyhFfVnZNHT+88dg+KUyUokwVSkh88VBjNFEacrsnqXP7n7wk
         EUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        fh=XlQkjXF/z2okRxVCUzFsW8bz5U4KGG4n3BcofNmaOPc=;
        b=axhLTQtzchm7qAiGkvj4t8HmOZCV+BmRp/6gbrV/uzolwEQopkn2kChYgbgzNs8jc1
         jQHgqif+7PWjeh/rcj+WCnUY39mK61VwKbos21lyfrVU/NnhT882/o+yVpcd9ujpVzJn
         66+4clQ8Pg9KYOYZSSu47FnUQEpjlRP1OEveTy7hpOe3CtbdmthdSlEo1lm4k+IgJHpB
         PxQrjOeeCd1tvAyBfUNUgkMAZCcX6XIEDyIx26YFT9D6WoXzzxonDVlPV0ll6WFIdPOX
         Q6ONLdTXiBXXJNGJM4boWEJfkqfBGz7QoVovw1+EpX5qFKxezGYIP52u6mu16nL+G8jh
         fWFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793298231; x=1793903031; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        b=DvqiCEa+qGDN/EDl63OCR2Pv+gwnv05/HWuFYhCVd/5kpaU+KU+d2xEXrL2M3Zr8AK
         vym7p8G8GxCSr1YM80t4m0D8boDQOZgafICDWbV6HsiGWPCPxDGXz84TU2082tYOn6i/
         12fjWE7hzi5E6nf14ITxpR+eC9XL6jltIGbjKjvI1xyXnykgPviL+CRaJvySkLrWuIWj
         93ZK+P+118J5SDKKFRlEylDo629v9FoV9ipemuNb5GAibDSjKlB95p7qLhyO7f/Q1y7I
         /5W/zEFY+Ac79hJ7u3f3MzM3u+OGm1hsB6ta6HOSCuzSKXXEQKUtVfzDMt94+gW44zjC
         fxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298231; x=1793903031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        b=eizLDR+XSY0oFYRj0wV9hzILli2nCaKjJwoxVf9hz/y0RTKagg4+AyjzFbnrBlhfiI
         6BytBVLhZ11VbJlqyofmtXZhjk1xD5jDpQefcQIKbwuy259SET9/TlSyxW+T+goM5FGf
         hvkwgH0H8V1yUkV71hl64YcQhXaO+W4V9jE6FuqBnL7r13xQAtnkOXcahKNWz+BGaRd3
         EcuTohDJ2hIoyk/QHA9b0GFdd1K3KvmDzys3GpJ37INZiW8rKWJ/gClKXQX+f/txQmVA
         chTtX5knJpYgWRr9U1G/unIWcjTa12ZUXLNK4ymNjvMxzuPHUSOdg0eSD0CouYCeFrEJ
         dD3A==
X-Forwarded-Encrypted: i=1; AKwUvBz06eJAdcGpyDhtgaFx1u2EPN2+zUS1mFC6Wpf2/FJfteMhwstCAES+kdrO8PVgrRsFcYU7@lists.linux.dev
X-Gm-Message-State: AFq9FYIguDOvXW6E/drTAriIrJ1jXRf7zrVB+0VWbm34nzsSF114+tFm
	9zZ9BM3PkyPeDsawyc02VxShWIHDRwfhLD+pzERB7AeIDZe56O1vGd0A+GQFdGZuFAYHRJevbfq
	cXeryhG0yzmfKVq8G5snCU0pNKklan2cOAEhqSQ/3
X-Gm-Gg: AYBFou1rx+GbIrAdjbe7I+3T2H6SFmUAO8Cl4yJ2ptX0sJSyW6/7yGz368WfxLFIxnL
	l6O8+UGKZqKuMtaccZAPEHb5tTuM0VuAh2Ti5wysJldvrZucbQ+NLsG26sHyaqPeS3C01q6p3v+
	HkvrZEX34FMZyt0fr40wz+hubSlPnaqcNcmxlPz9/0Z9bnpCwYJ8NZXtuwxO37G2AeXon+IuLSP
	nrc0+YlslS1oRZjwX7TmNbqqTnGHQEN/ec+ByOH+7tKpWz3xR+PU4w6XxAtG9gdFSxjiAsnLK9S
	jTCKmbKdNEkiraK93vfQVYu65dulumyeR1Lxkk8XKFtLcths6Zox5mw50S8FaU9VGmxkh8ewqKj
	5N2UenO4GZnjdrlmY0T8KOar1G62MXe+o6MMR61RK3PuRAB0YOEV/OwdFJGkTaSzo2Q==
X-Received: by 2002:a05:622a:2b45:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5414ebdf590mr23748491cf.14.1793298230692; Thu, 29 Oct 2026
 11:23:50 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com> <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
In-Reply-To: <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 Oct 2026 11:23:39 -0700
X-Gm-Features: AclHuK8I2R6ZBL0M8gpXX54gY1Y2jQq5EjXVV3xSH1Vs5_u0FZ2MTRQeP10WsJs
Message-ID: <CAP-5=fU8K4as51_Vi2vKAC-kGMVEFn1LDjCg1WvP8R0Y=8SbcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/3] tools: Add Rust library build infrastructure
 and prefer zlib-rs
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Thu, Oct 29, 2026 at 10:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 5:30=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > 1. **tools build: Add Rust library build infrastructure and zlib-rs fea=
ture test**:
> >    - Adds `tools/build/Makefile.rust` with helpers to locate Cargo crat=
e
> >      sources in distro (`/usr/share/cargo/registry`) or local Cargo
> >      registries (`CARGO_HOME` / `~/.cargo`), map `.rlib` prerequisites =
to
>
> When we were discussing whether to vendor crates for the normal build
> or whether to fetch them locally from the registry a couple years ago,
> we discussed approaches like this one, i.e. picking a version from the
> registry by folder name etc.
>
> But that doesn't work too well. For instance, the graph of
> dependencies may change, there may be several versions available (and
> the highest may not be the proper one to pick), there may be different
> major versions available (i.e. not backwards compatible), they may
> change the build scripts, etc. Even picking the highest major wouldn't
> always be correct, from what I recall.
>
> I also asked a few distributions how they felt about it, and they
> indeed said that it wasn't a great idea without querying properly the
> registry.
>
> So one should really ask Cargo for the right information about the
> local registry (i.e. offline). It has been a while, so Cargo (or maybe
> `pkg-config` or whatever) may have better support for querying it
> nowadays too -- I would suggest checking that first (e.g. `cargo
> metadata`).
>
> I think depending on Cargo for this, especially nowadays and for
> `tools/`, should be fine (we were considering even back then and for
> the normal build).
>
> By the way, checking Cargo's cache sounds very strange to me: that
> means the version that gets picked is even more "uncontrolled".
>
> I hope that helps!
>
> [ In the end, for normal kernel crates, we decided to vendor for other
> reasons, e.g. we wanted to pin the versions, to customize sometimes,
> and most importantly to avoid any possible user misconfiguration that
> could lead to a subtly incorrect kernel. But for `tools/` it makes way
> more sense, of course. ]

Hi Miguel,

This is great feedback, and it's why I thought this was an RFC series,
rather than a full blown series intended for immediate merging. I
think the other obvious point of contention is preferring zlib-rs over
zlib. I'll incorporate your feedback into v2 along with addressing the
large amount of feedback Sashiko has given, which may become
irrelevant if we trust in Cargo more.

Thanks,
Ian

> Cheers,
> Miguel
