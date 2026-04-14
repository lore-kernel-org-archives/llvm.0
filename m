Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0403AC0FC
	for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161028; cv=pass; b=WBNli5G3j0jGubHTLbTYOQcKp1schv+PCF77AiiRVlOMAR7H0tTjOhigTpcoClp2YSfCJF6xWSLmV8xab2PmDyVoJzJGyReZLM/E70KJC1XEN4SpMLxIuYUhW/vqgi95xFC9cFVN7+zqT8YGsHT6yvkEY+tbXTA079hpC3fLj10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161028; c=relaxed/simple;
	bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVl1xcGRgvm0l921NrC8PzqYP0HSCTMTPy68lfCVfZOHOp7kqDe8/ZSyEbxkqbpzc6IrRn2NI6CVr9+c0lWxnbUFAPUtl3x8EHsNGsLjXnOxjKhiDXhEOYTNMaCCZw4hbxtCwtv1B+lqwevAalforJgLEeqpXBOEz1x/1eqZFc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pt1vU13I; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pt1vU13I"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-127148c2112so902691c88.3
        for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 03:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776161025; cv=none;
        d=google.com; s=arc-20240605;
        b=KRSVtvoOaKvEHSPcV1VEdDRvqMoiLGsDnUMs0X0NVPRZsR6tf2JzwuiOI0vF9dcTww
         r8XBbSeNaK3bcQVr2NkKrWiBgW01wo9tyPu+TD3hunyXNvshFVktcOkuyNT6k6TmYncB
         i9x2bCnvFkWS48NuQM4zvOK3EK/mtXZMBqPb3wjZBxeiWgzTGM8czFVIe2pJMvXiSZqY
         q3XpbQn2yDpud7HyEoMf2+lAkM8Cwl5eh0Raj2kDCMG0WqUQtDTcYpSGU7d5uPvCqUcY
         jkunQ8OrVDQyqbXtNMgxIVgq7vT4z4tdkyWdsg5dIBJcUIwVX+lc1D+LlBKBkeikNEwB
         cKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
        fh=jqZCjON0ahu1QaJlJOkC72BomyVzaYUZMH8oRsL1IRQ=;
        b=eC/khmdulgsuWL58DvUHlhpFQnKRPKBFbjozmEM4jKuT8Hhe1vpUTP9MiFvMuD5GIT
         6koxn3c5YVA2U4LAIgSJyzBd7ewziNQYyfFRRld1u4N0uqZHG5/ssXS+O3F8CgCTjIF5
         zGPAxsyKu+odQEok7MhsrO87EqSVzvRqqLdB8TsA1oGyD2jorJgWVqmXRaKmS1FmvxkI
         PgpC61dVETEfDX0T5rBlngO/DDeBt1ye8uDxESsIinxZZqZDcK20c6nDtvQ9pTs1vcuw
         zEel3wV5lRndVvtAOKThc/Yz6XOJ/7BTfhHtFRY/0/3UmprDy7xkaooxm54xyfXpAILH
         y/3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776161025; x=1776765825; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
        b=Pt1vU13IvWkq9O+z2VoyKVxiSdAXIUxuwrPd4bAhABULlx/KQjMT8OUp4N1gVIh9BY
         z7XxXPoexaLQyOPwHNhns0lJdRLZmq2auS8ZrDGEgW8tS4aU5sh9plgEeL//zGQPD7tu
         u1xZTbQOORqD4I2987RtI6lF9zIN33Q9mPDbmPQ1eI7DZOWyhl0zrhyA7Sai6sMH5Iiw
         IL39zmb8Ednlj7/GzwBdDODfgHdE2F7vdbvKSBfjwBMpWhEKYayjm6/SIi6Ro0mg/HNE
         MyndtMW4nuJUtCXuZvDjN0pRBP+cgAlAt9UrWSnV7eF7ygrRxZU94fC/Gr7aZNrqdSaH
         x+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161025; x=1776765825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
        b=lxCWFlHjFtuylbj/r2iN7H3SuxD5OriaUPsTJ/eqCIEI/gjuXZrS7FkcSHXtaTApUe
         U3+kj1HNNHbR6caLffNarpWZonleQmSt9oyTLy+2Ays0cU7v1QCnCCJRpN/l4ycqEstF
         XcqB4XjWUYWUCYjzK8fE/zzExN1YdgkkW241GGEJlGrqW+MOK8XQ9DuD8cMhBoqAI0mZ
         e+351ZFmr1FLb/G73DTa/GVCT6pWXtfSXncYmd4FtKX/2f30ea5AZPwocuIZkxQyw0kS
         khLMsMpEuG2XbVStzAAqdl1EJz3Solrz5EwTlnLzyrmNEygJB7tpIVTBOiWK+LWvMGVJ
         RnpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pSc5pHA27mUYUCFZ9sapG0beJqVy5oM8fipC5WXqCbupkyw72uzMDcE+CiUc/NMvf+5Sx@lists.linux.dev
X-Gm-Message-State: AOJu0YxMl54By1j14s5jlXs6wwsU/Tc296I5lU5dilBr9CgMqnNC1mhk
	PsDtTskI74GstR6Jh0yJ+C6jjC8+4OKI3RI7+sVO2w2Y5Rth3RnuqeiU29ecq02iVIleXOdu552
	HnQG2bz1m1LcGxHHlHzf6aFMQwU8C5R8=
X-Gm-Gg: AeBDieuwzV6sWXTSk5EGtnliKFTi8cjnuWqVM8sJtHMVTWj6uuIXSvmljbsjtHRsEX3
	/42+lP5D+D/Iyj5456kDxmvqNQ6enxDFW5T9E/Lb0LV9MhmP9Np4Cy0oYLuVRWCSJMm5hGJZIsZ
	BCsS7mwlW4rXrCIIRmGQdgud3zPj/Xo8PvORNkTmwwFwrw68r9R2CUlPnbXwUl2kjQL8dJGDS8o
	8FOT2KG2hSbaEbaKGmnsVNeI0+xMTHHsaPTbwQMU6aO9PuTz/ZaCMD6DqsbFEH84XkGHIbmaLtq
	B76TU7OUpqv8PRoFrTsGhdKH7OTlkuF7bl/ZsIWRGMkxf0DE3oF4r+6gtPBh8kGKCaZpvGDyeOD
	2e891pyZTY7OdI8pqF6Jj058=
X-Received: by 2002:a05:7300:6da6:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2d58966b77cmr4005329eec.3.1776161024897; Tue, 14 Apr 2026
 03:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260414080500.320095-1-r@hev.cc>
In-Reply-To: <20260414080500.320095-1-r@hev.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Apr 2026 12:03:31 +0200
X-Gm-Features: AQROBzC466LTvnRS_A9FBMV0x9gLQuJNVW1COdEXUuheC7eprPjxu95Elog66iQ
Message-ID: <CANiq72=c2wniA2piByZNUVzSUA2YPhRPKBq7e_bBP-69Lo+wCw@mail.gmail.com>
Subject: Re: [PATCH] perf build: Add clang and rust target flags for loongarch
To: WANG Rui <r@hev.cc>, Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	loongarch@lists.linux.dev, Haiyong Sun <sunhaiyong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 10:05=E2=80=AFAM WANG Rui <r@hev.cc> wrote:
>
> From: Haiyong Sun <sunhaiyong@loongson.cn>
>
> Add missing CLANG_TARGET_FLAGS_loongarch and RUST_TARGET_FLAGS_loongarch
> so that perf can be built with clang and enable rust cross compilation.
>
> Signed-off-by: Haiyong Sun <sunhaiyong@loongson.cn>
> Signed-off-by: WANG Rui <r@hev.cc>

FWIW, sounds good. I guess the commit that added the list should have
had it to begin with? Cc Dmitrii.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
