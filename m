Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6044D2820A0
	for <llvm@lists.linux.dev>; Tue, 10 Feb 2026 05:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770702904; cv=pass; b=OUe6ZZGOwu5zCY5AgX7SXcI8c5iarwoaf/QFi+wxOpQc3kw5Hf+/dLhArN0BalvIBuSlxfBvuF6EDLOvFTXU0drjeyXuKJVAm4Vgl0jdI0fi+b9k2+ng1bCKKczhxHHNyczQonuDav4pAm+Jh0kbLhUY8/Y7mjFTUOz4auy/gF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770702904; c=relaxed/simple;
	bh=MdV0x/eJTWzdX3ow0XOAbt4C2upZXdS42Vyfx2mWZvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4BWcwxywlQe73rTbAGbkzEPJWnhz7dH7nT29FJyD2zJ+pVWxp9lH+O+UYragkXC9y8/m4COQZKCM2vgQVJoEtmgsOHqRqvE4rmZSreyySAj9ALSOEZIY7pnd+SkHJ0pmN1Xr8X6MG4/XG87atLUzOE8aQpKsC7MJXMcllLQnzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpU9cbRM; arc=pass smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpU9cbRM"
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-59e4993dff5so3049509e87.3
        for <llvm@lists.linux.dev>; Mon, 09 Feb 2026 21:55:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770702901; cv=none;
        d=google.com; s=arc-20240605;
        b=jT/pwLjjus7mDRvDVYmMTxFhWZ3JEqWQdF3GK+FglrOv56GLtqRJfxkBjUUv9sKqh7
         lA3JT0jufJLP3t7BM6BTXixmiuD0r3r/vzg87zrMjbIEsi1KM0tv3efn4aM9bgbVQ+Rw
         lkbPxBwG+XcQJmI2ZyfzSXpMX4xk7hxBoVheUhP27fCNp5v1wSNPXmfCqOvHYNCcupBn
         EE38P5hOEVU+Kxg3cKielTZZ3iXK8k5dvI6XaRZcnCUPij2XrJ0MMu8pw0H90dve+NJz
         a+3KAQ7ERBWxHKbU1eA6ZruKUtNSpGpBdtqhKHTioowtzaqer3KvV7uQUSBQBkCfkX/l
         p0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l6qnAPvCXNqWlSbf+oOQ9VYTRnILyLNuodKY/j+4HmE=;
        fh=h9xBD+7I7pjngjnLgEJp/ETjgvznhD0y1Lg9Ge6+THA=;
        b=E0uv4B6/tBtjH4xBVFUQBEvDMlyQI9CRuutxuqwluihZapUUFvJnGnHZSwMMCjjuT5
         hkpIW8gy7SDzMqnlOSQlT3NAUEpFfBo1ArF2VZ223ENQrn67Udul6QhjH0JKa6/g9EXt
         j22eO3pps14ea1k+g0GHfvH6HW6mdwYRITRfu5En9m+aqOUTFbRICVBdTqF0D0JP/MwF
         CCBRgIS6RhygRQUFkt4Vmy5BR2E/09zi7FhPhFTUHFIaesCXKalgHDP5fP0tqsU3211Z
         pDszKKM0/6tuErf/s7nwFIv35QKuRwxhrgwb5mYmXt0qFn0XozBWPryB/dQf9BK+0a9T
         yAhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702901; x=1771307701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6qnAPvCXNqWlSbf+oOQ9VYTRnILyLNuodKY/j+4HmE=;
        b=OpU9cbRMkt6ZT9SE36dJJG0uuX4aR/A/cQi6XCxxOp7SLD54M/kFutRId2l0NXh9k2
         u0DxC5NTF01a6IF5FDe42qiZ3hm2mB+q1DMZ2/EnosqtIBcbLk17764WxYwdKg1JaWvH
         26xUWNC02cvIpGadANkYU5H2HfyHA6zkWdyEcD+1oYqzGCuutw+r81PD+4XXcTm7Y1q/
         TWIM8dqOymeHRwqesmcLfldvna/2LONdorwtkpIrn6h6iFvIpt+jf+pNriZ2gcR61fEX
         P/P+ZGNMfRvfDct+ZSwUyHt7DGoWnkAF1Yfh6Y8RLRwtccu9osWcTfMOrcpGqdw8LSyW
         6z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702901; x=1771307701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l6qnAPvCXNqWlSbf+oOQ9VYTRnILyLNuodKY/j+4HmE=;
        b=kbhXKDI5fwXijJk32OrKQjHnglsz+eyPF8Ef53BrRi71yDRZwhJr6fImtTLGoeIBYd
         9p+JYSvG9UPVFXD+m6L7mGUrptzqeA5IvbsC2AsTARJP1SAGFizqlfHVieRLkMzUCggv
         Q9ioixfJrb0q+s6QL0f/dyqLBexPlALg/+j1FoCMJ+S5H8ElqFOzDrLrARVI3UmdZV7J
         Em4+LUgIPB1dHghPrNnM/xyk2Ef9kch1h2CdV3RcajJj469CFM6VTPswlYExto1NtLP8
         WPNW2vAUv0VfIMMtpdZYaGGRjOUJmLC0TTBIxPHGKQNwnA3ERL++D2/XhC+GpRjXR80y
         mUdw==
X-Forwarded-Encrypted: i=1; AJvYcCVndSN5O96zug6vc1UrMYRl1QoRRKzSIGOxLbbGN7E9TXRuA8DmIc5YK5IdZBBE4z1kL+dV@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3xBLuCz31wmKW0eifsQTw7V8X8plThk874O2ADz/VHz1Ik7Sp
	/2JVWDI6oSrMieTYZfoeo+LAsasz2jHMhKOolVluPhtBlxkkk5yIZq5Y+9vgzlEa4+kKTB9fXT/
	+lwU+2xQX1q7VOvFzvikAggpRXHwPMqw=
X-Gm-Gg: AZuq6aLY4HMbf0zq0udmquNU65J18F2DtkXhxq1cqwhxGoXROkxKvf92KFhl8uzlJFL
	NY7o6mRQtVhktH1NYFOQaeZuJ93RvziUjeFLy3+ZsBNU2DWvFHmYYqZoBOhn1lmbuMGLm59Y+nF
	8gokoYx8MeaF84J9Hntk1NRQ4Dqqd4rjidBQ5fUe+MLGuT4smI8GLLDgZ6dZ5DyJuLKOGuX+qut
	XuEzNTCIXEItyVrYF5Sx9ZrxTHqNkgRGAIFYJo0rwc3tutizgHm+yECDev3E8SqyYz8PRkNA4jS
	Mpmk4rOq
X-Received: by 2002:a05:6512:1326:b0:59d:f69e:16c2 with SMTP id
 2adb3069b0e04-59e55b8abbfmr263238e87.12.1770702901183; Mon, 09 Feb 2026
 21:55:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223084337.3789-1-hupu.gm@gmail.com> <20251223084337.3789-2-hupu.gm@gmail.com>
 <aUrdUjqVEjJW9VBl@google.com>
In-Reply-To: <aUrdUjqVEjJW9VBl@google.com>
From: hupu <hupu.gm@gmail.com>
Date: Tue, 10 Feb 2026 13:54:49 +0800
X-Gm-Features: AZwV_QgvqbPoQHPhDibGtKcqXz19kRj7bz78kM8jjqTHIlCRKHK4Rf3x_mpslFg
Message-ID: <CADHxFxRprUvRzorxe00HmwG0o73VQJNf=yzM40fkiWjjqu7PZQ@mail.gmail.com>
Subject: Re: [RFC 1/2] perf build: Allow passing extra Clang flags via EXTRA_BPF_FLAGS
To: Namhyung Kim <namhyung@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 2:20=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hello,
>
> On Tue, Dec 23, 2025 at 04:43:34PM +0800, hupu wrote:
> > Add support for EXTRA_BPF_FLAGS in the eBPF skeleton build, allowing
> > users to pass additional Clang options such as --sysroot or custom
> > include paths when cross-compiling perf.
> >
> > This is primarily intended for cross-build scenarios where the default
> > host include paths do not match the target kernel version.
> >
> > Example usage:
> >     make perf ARCH=3D"arm64" EXTRA_BPF_FLAGS=3D"--sysroot=3D..."
> >
> > Change history:
> >   v5:
> >     - Update commit message
> >   v4:
> >     - Apply EXTRA_BPF_FLAGS directly to BPF skeleton build command
> >       instead of modifying CLANG_OPTIONS
> >   v3:
> >     - Move the variable description comment to the top of Makefile.perf
> >     - Update commit message
> >   v2:
> >     - Rename EXTRA_CLANG_FLAGS to EXTRA_BPF_FLAGS
> >     - Update commit message
> >   v1:
> >     - Introduce EXTRA_CLANG_FLAGS to allow passing extra Clang options
> >
> > Signed-off-by: hupu <hupu.gm@gmail.com>
>
> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>
> Thanks,
> Namhyung
>

Hi Namhyung,

Sorry to bother you.

I noticed that the patch adding support for EXTRA_BPF_FLAGS, which was
previously reviewed by you, does not seem to be included in the latest
released version. I just wanted to follow up and check on the current
status of this patch, in case it was missed or delayed for some
reason.

Thanks a lot for your time and review.

Thanks
hupu
