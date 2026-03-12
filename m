Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372DC27B4F7
	for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315927; cv=pass; b=tM1mtmu+F2I9pz3P+XOZ+GQfWxin3a8mcZnQr4whPvh2EdQLxoJ1BOUhS2QqcALCYND2T3GT6uAL+OeSIcIHWXAfruM0Y9Qr7m+Yf5hV0dNr6ujdmcMA2H+n8VJ/nxu4U4HnCoeLsuFQNCfaWS7rnaWHaSjuJa0eRtzZIH4ckKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315927; c=relaxed/simple;
	bh=X8mqXhY9gTYTpA1Ii/Sq9UmHokzMRb0eTBsgPlGyvIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLfLLQVcP1iDhzAXUiGudLVZixm6IpPzrEv38cid44wC5JmJ+p8Ojfyh/yV/R0uUnajEK9LbjlSJNXPbz8AYNDE1b5aA/xYkkVKwhQJ0Z3ePqQq0FSUqs4VLAJRR5KESbKN04NA0jdkjiFKqs77NGNvsuUWbNRvxDftAOiW6Lrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FTvF3xD1; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FTvF3xD1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6628cc1bd69so6953a12.1
        for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 04:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773315924; cv=none;
        d=google.com; s=arc-20240605;
        b=IKkkMWSmbuXrZr+U1Pr43EXMROevmAVlckxAg/nsBlxCV2Ssp+mrP5SSFwN8JTFOTi
         SLJ+tcQqmc3yr3UQU0y4sDw0FMguI0mfPlJfK9gIwvmmzZax9KP4ghpDuUGunQLmZzXf
         E45vM1YTQtFkWC8Tp+qfIQH/g4l2no/lERme11h2lTIj6yvmBuBGn9lvkXgUTh8rpnX6
         vP0zvya6pVQFigzONqD10i3sOVwBQyXcffL+emvtsLz3gTh/KcCMyK4P6EJsBcaIPtp5
         K8RJOxyvJCMV2tGwevYV0ucq2OUkp5unIB1mHS+03At1N/7/vKkNRK+rprNWw9s4k6x/
         YWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X8mqXhY9gTYTpA1Ii/Sq9UmHokzMRb0eTBsgPlGyvIg=;
        fh=c4vtFXEXAPSs2L6So3x25wmmhtRSz1KRk89iaJ+PIyg=;
        b=D2p2cW+9ewL2WqXR+zRjcZ1MK6hxepVNzuq0sCrGns2RuBlE2iu9ZCt1Yg9LjNo03M
         f7ddpHeWioNG7a94f8dt9f8hS2UQbIo4PKEiRM3d2eeZqnhlWoXF8hTjHDJbqNArux7/
         VDtTk/bPwzV95yYoelOlbc/JBHtWMqZVSo3ZjqTAEkjgzt9Yee54rDC5qX+08UnIFaYd
         4aXNELp0LM48bo8f2RvdnKUNoe+KM+3xePNVE27uTtXjw21R3Nau696XZZM8cXagnXc3
         8ro+pecPlNxUQ81Vn7B9L0XzLKkpLp3YuPctPXtUWPyeskBcYsgF7wORwXDtaMuKujzD
         zrCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773315924; x=1773920724; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8mqXhY9gTYTpA1Ii/Sq9UmHokzMRb0eTBsgPlGyvIg=;
        b=FTvF3xD1+XY5PAvJQhuS2paW4Dg1bQpkkPF4qi7vB3VQKDkV/gYScLmur67R3+iEif
         GHWjXRGR2Ifqlp/COxmmG5mAA58UCiadooheDLC2+IEb5tGt3nFji9mZaW9hWggW8Lp4
         KDbl29rhylPKbm/GiztBfK49kAEugb1nVsDHEdHdt7f6MjWdTKmzZpgme+D7Y+JbXtIo
         eXmzYO/JxIvKhHUheAtza9s6rZOSQPUtiHAV2kRmnKqQ5ELmqI44E2nV1wFSDw8gg1lf
         z1yBjgqDxOTSMLR/odh7+RC7pnKrph2iRQEd/1nbnAEnEl0kis5JNgzEVF/NrTlL2Gr1
         OnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315924; x=1773920724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8mqXhY9gTYTpA1Ii/Sq9UmHokzMRb0eTBsgPlGyvIg=;
        b=PKbdf9aDuAOZN59JhhUoObxzMB3lsAZF9s5liIe+6wBhgIpQqM+suPGjMySqM44rqk
         XH5zU4lAOr1HteWnm8HkfiTs9Yu/IefV01sFpZvfwXadde1F1RCjCm9SXuUMdEFvpU2X
         GtZz6GEHMixjkxi2km4XsWclNEzxwUjnvlubNv0WzgdCOI4xt1XkgFhFndMqEfKtEv6r
         NKU+wWHhvz+D+QfnqW9s722gggKiMyJ14JIXv6XV6DQkN18Pws3hDvq92TCuoE7cmrQp
         NswO4OpJ4Dy3wn1pLVkmDTZDlrZq2lo+RT1EXAUi7mX3MdqC2WSNnH5ANZR9Xx1IfdIX
         xNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeoiIj7DJCYs/gsbzzMsgpTIR0JCILX+cC5BMNyXHXNe5RkhCFRG5Y5hPmhB9+supes0ez@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/dpQMsDobWDo3vvyrDQkAlH2DfiPqyJSjsKTl2TP5vqaNbp11
	AwRQTo9AbHhTI/6FLzJs/2Kk36b5dSb86Y1fEhXGlGYDzbrh5CzJzesQNtXT1gGAdfDOpoYS61R
	uIG7qRC1tt5Eqt3riq44DweXpIzPJXqJt4Povnomv
X-Gm-Gg: ATEYQzwA2/+WQdR//EDIdl0iqfISAuLuHr4JUSsDy9dpl7M54w4w3/XnTiSkeM1hHSz
	4k9E4ymZJjHTRds7bjc9Zz/ysMnsV5dDAh4g5/g7t6JjWdNpZ97mDf8M37xFaXbLIaqhe6cieon
	ceofwczejRtzkEaKcvZnVDA9XEJXcBh6yDycNJ61WP6kvWchPUf7fhGdrY6mSUYhGLMvR2gj5fk
	55jQmQyVoHBopC2zx8eWoFwDmzkceqnNN9zn0AxBHHgl8sMQR+ZnxEMZJjHs6ALe2bjvmoUrfun
	yM75NztvnXMrlV/gc5WvfHykSaCplJmGc/UJZQ==
X-Received: by 2002:aa7:d857:0:b0:64b:2faa:d4e8 with SMTP id
 4fb4d7f45d1cf-66361cf137fmr31716a12.1.1773315924001; Thu, 12 Mar 2026
 04:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com> <20260311225717.GY606826@noisy.programming.kicks-ass.net>
In-Reply-To: <20260311225717.GY606826@noisy.programming.kicks-ass.net>
From: Jann Horn <jannh@google.com>
Date: Thu, 12 Mar 2026 12:44:47 +0100
X-Gm-Features: AaiRm50QWh1Nj2LpHOw3udJm_njRdRiZKS2l5lDJTx9MAkzkBkdjudL0pPisNLk
Message-ID: <CAG48ez3mKsdpc6KK+PC--1dkrNrRJ9SXPHjJhQXVfkfap+fjcA@mail.gmail.com>
Subject: Re: [PATCH 0/3] KCOV function entry/exit records
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 11:57=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> And I don't suppose KCOV will finally honour noinstr ?

I believe it should, as long as the compiler is new enough?

We have this in include/linux/compiler-clang.h, and I just checked
that, for example, the noinstr function fpu_idle_fpregs indeed doesn't
get instrumented with clang:
```
/*
 * Support for __has_feature(coverage_sanitizer) was added in Clang 13 toge=
ther
 * with no_sanitize("coverage"). Prior versions of Clang support coverage
 * instrumentation, but cannot be queried for support by the preprocessor.
 */
#if __has_feature(coverage_sanitizer)
#define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
#else
#define __no_sanitize_coverage
#endif
```

And include/linux/compiler-gcc.h has this, which also seems to be
effective in a GCC build:
```
/*
 * Only supported since gcc >=3D 12
 */
#if defined(CONFIG_KCOV) && __has_attribute(__no_sanitize_coverage__)
#define __no_sanitize_coverage __attribute__((__no_sanitize_coverage__))
#else
#define __no_sanitize_coverage
#endif
```
