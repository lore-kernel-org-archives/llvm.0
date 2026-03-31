Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E552FDC5E
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976530; cv=pass; b=GYOma3MOHEBzddXi2mz/AR1XXRpXHzJFgHnnzklFqB+mqXOZKn5cq7hJkm+a8dH+IhjSn1q8ULXTWTq5geZy9Jv1hU7oyKjq4XBb7fnrfcSVbT+ryRiuMWbs9AiadAwdRyRqcCkS2VwlCNzWMOiwXtanGqsx/RQEPyZVOEPWXb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976530; c=relaxed/simple;
	bh=g/vQPQS0w9Xxi55W5EhGbOlAIubJN7tvka1LWWLiAXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rN2tbTwWctFiikgrwRk7oxeaUqq/edqtRK+Uf2eqUvdaWzhT+x/iCXAl/EJf7yxevNkxfgErdsh1HNQnoGfvAnd8lE7fvzyJxx+BtGTJeTKWDgIySAxOBxWOv4ufjwpiSYR2Wixptqo1B1bCR2u0vVlz7lf4zAiNHxS3whIMzQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU0fJp+p; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bU0fJp+p"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b8095668ebso141177eec.2
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976528; cv=none;
        d=google.com; s=arc-20240605;
        b=WG73o39qZaczq62krGd76tIIKDgT4ZZDJ/XppC1Mh0oTaD8GK7trUen79wpCkOveLa
         r5CF+CvWwzqSgpVmFE+NT3yxxSOYpJ/EiiYXJ/TyGds6PK0lQvrqIE5GGa/7aUV9vw2L
         JZA6iEm4zKeNk88/g/Y4EBvDY1iACookgLAgv9wki9r172GOx6MeM5+7XxF4nFJpS3II
         HCSDn4gWOSKuHE21zQOYjyorXNYOzdyM7uNedBT81bdITs4vGhxfR/ORjPp7Svgwwb39
         vceLLG9sU0uLPFyNziUh6l1GKhN1In/QoKd0H66rvywDvETgb25OOYkzCrOEVxfmLs88
         cClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IU4m3ma81SYxNj71QUeHGIKcLWU6SzNh0VTIbMzWeYY=;
        fh=KiwEebbrYBiPHupXE+8tUKTteyjmyDw+QPCpTOEKyuo=;
        b=I64bls8uLefqz6JmbpSuIR5xNXUtlYP+d/8Rzg8i4XIW5yR3KmdbF+r6B/m9fa+mrA
         OFvDD22/FJcsV3j0cafEZw4YOWDDpUi6StTcw1l3B3gNq1Bx5N3EWUjxHV7qVKx6FKIX
         DivRCMskfSUv7lZwb4dDLhOr7t08wAT1HNaJ1ghmqgzIqybEvfu8l3Fb0f3dq5tXUc+Z
         oNMPpV14uvQydn4AjohtHAKYBk3DaV0iau7laVnSOBnAC+UZYDJs0ylR0+9+8217PXYH
         nUnI9vG8I67nV3mgp0jL/1FQE0zxWmZ3BC7rk1h1YsErlVPI3R8bDpW/d3YLu3YMxJyz
         3G8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774976528; x=1775581328; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IU4m3ma81SYxNj71QUeHGIKcLWU6SzNh0VTIbMzWeYY=;
        b=bU0fJp+p8elZTWQzbaBdeW0ncH/N4H86Ov+UuvDBOTjNHy0EWf+WIpdhX+aACg9ViA
         KFphjrPRe4xKJ0H7FNUTvuFhI0b0mN3uEffk/XyTWeYEmcZfCnT8KEj+p73nLds4S52k
         CWR7hTl0O1Bkh+tJpwPHTPDXueQ2UV75jMvJ/PHjzLy+r4Z4XYiZOTeu2aAJwTFbtVF+
         GxNvcuPAy8t3zbM6kdHq50JygaJrwAUyP2/7Ce7HQrLgEy6RT5h54CJn3kWHbxdxxX9u
         51TA+5CbqR0xkVJs2NKn029VUjTBs5ZOJmWsGoNd81spzR6BO3I0iIJhbrhz8Ju0kiz6
         VKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976528; x=1775581328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IU4m3ma81SYxNj71QUeHGIKcLWU6SzNh0VTIbMzWeYY=;
        b=ZI1/TwWFxzqq1sVxIAjDQltWZxhbFRGdQ49NhmLBMj1Tzwk3ND10QmC5aJv01xuqd5
         p/aYeYu7bnTkKZkIzXqGU1RrbsteZLi/8DTtkeaebsYJItTGEhCP6W61YWH8molUCWIr
         wAGTKpWBjUP/nSZL8IX+XNJPyJXiLsOOXhmFyAK5laEnKoFHk5uBUHxMDvMMilVKdAHu
         3MxOhSgSw/svdMINAHN/CRxQyLKoGeQLtw7nDn/iJ8BM3lhwIzPAnmM+xoo3I4nG/AOn
         TD9CCJPOdl38AFe0a3GeaTR8/nRm7g+5cQNfZnBQWrMzpYuKbBHuQWZ/qSxaHHNCVQ1i
         MGQA==
X-Forwarded-Encrypted: i=1; AJvYcCXBMQ0K68cHK6yC8nXVyLj4vs1KIPvPW3Qzd0kW7Nyx3ZnoymQ2IQosR3pzmGM+OGi6cT8b@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3kjPg4i+hyrR3MeqpJjKTvFx670Je+ONunrek6Ipvoj8LOd1n
	mzaWtp6WyDU+J4yNkLHf2QKJkwCYOjpKR0Uc0QLB7RUYSxV9CjcLVtppwH/Esizy4eMmLRfKaRl
	Gu+qG3AaXadqIfXvXLUafJQ2O1CilGnc=
X-Gm-Gg: ATEYQzwQlXcxVEMCnxdF706r81ei6r96m4WKMpZ3sEfg1PhWxJcsym5pdyccw7tYeMk
	oe3oDhWNLAgRwqUQ4XdJbHNrvIi97aiUcXZZSPxM+nAPV7Y34p7BjcxAaak1JjFy38wSMT4WrXA
	co18+VNcbq94p3celQEkEz1pk1fcPqj9tMMxRJjH87LDeBPi835ChoDSy2WOIxMb+cZXOewpBNC
	vfAVkT8C4HLqGgWrPyHbcHCaX8Sh0f95840P7LCO5T60mUUACznfKblWt5C5+IfNUkvy4K262Nm
	VvOuvMECv5kPh+fu8cBe0eB1Gxidlitn57//f8k3cMWjZDPz0CwwIX/jc9oakL+GJ+h4JiGaIz+
	4tuzWlCl8zMHF7A5AhWBe9BQ=
X-Received: by 2002:a05:7300:8c05:b0:2c8:aef9:cf3c with SMTP id
 5a478bee46e88-2c8aef9d5bbmr578311eec.8.1774976528009; Tue, 31 Mar 2026
 10:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-3-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:01:55 +0200
X-Gm-Features: AQROBzACBmAh1Gj6cURe9fgjRYkC4LMT-gxdC_n35omwVPBYsPI5mIuUgNZG76o
Message-ID: <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> +/*
> + * Optional: only supported by Clang with -Xclang -experimental-foverflo=
w-behavior-types
> + * passed via CONFIG_OVERFLOW_BEHAVIOR_TYPES. When not available, define=
 empty macros for
> + * the trap/wrap annotations.
> + *
> + * clang: https://clang.llvm.org/docs/OverflowBehaviorTypes.html
> + */
> +#if !__has_attribute(overflow_behavior) || !defined(OVERFLOW_BEHAVIOR_TY=
PES)
> +# define __ob_trap
> +# define __ob_wrap
> +#endif

Should that have `CONFIG_*`? i.e.

     !defined(CONFIG_OVERFLOW_BEHAVIOR_TYPES)

In addition, since this depends on a `CONFIG_`, with the current setup
we would put them elsewhere instead of `compiler_attributes.h` until
they are promoted to be "unconditional" (i.e. without the compiler
flag):

     * Any other "attributes" (i.e. those that depend on a configuration op=
tion,
     * on a compiler, on an architecture, on plugins, on other attributes..=
.)
     * should be defined elsewhere (e.g. compiler_types.h or compiler-*.h).
     * The intention is to keep this file as simple as possible, as well as
     * compiler- and version-agnostic (e.g. avoiding GCC_VERSION checks).

However, thinking about it, why is the config needed?

i.e. if the compiler is not passed that flag, shouldn't the
`__has_attribute` simply return false?

Also, I am a bit confused -- does the compiler flag automatically
recognize the names like `__ob_trap`? i.e. I see the docs mention
using the attribute,

    typedef unsigned int __attribute__((overflow_behavior(trap))) safe_uint=
;
    typedef unsigned int __attribute__((overflow_behavior(wrap))) wrapping_=
uint;

But then we don't actually use it?

Or should this just be like the rest of the attributes, i.e. we
actually define them here?

Thanks!

Cheers,
Miguel
