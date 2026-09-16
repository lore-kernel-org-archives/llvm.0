Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FB84C33DC
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 23:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602068; cv=pass; b=ezQOTIi2ITQSONDyJM7e+KTK+krj7wX4rsukZCgiqKPXsI4gNxE6yU1Gb6PytcLseTTkuAcs8TEmiXHNgZOZVZIYWa6rkfpG7HcISS10M6BIcops3ECr9zbsRtxwmmQAWrhbm4QA9jo6ETVEms3IyYn8mHYBQkmhiaZDmd8k5q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602068; c=relaxed/simple;
	bh=lb/6KfgPkAz+SGqEMJXWqTER4Sq1FTeFhEUqu1TJfFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WL6O6ifVRZBUmNbp0Q6xipoVehEd710ETVpgY72J11zXDVE9aWkEf8sQx6WL2pUXNncvn89klGleI5Sc2pnsZ7mwHUmzdqiYbBksBXX+WSutp4esID2DTUZsVGypMypWX1DSM7UvumtHpo+V6QE21tddUJIgydej75CKKYClCDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fyNVp3NH; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fyNVp3NH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so190829f8f.0
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 16:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602065; cv=none;
        d=google.com; s=arc-20260327;
        b=UJg87kDfG9bxC/ItgI4GvtW/BTB4wg7H1Lb+B4TZynVrhw9TJv7r2mn1QPjsQN08LP
         8WEO4pfn0vS2Vlr1r594i9Va23N+A0faP7nOQqya/J6cjs1gaDAnvYAIpXQWDdSZowXo
         yQClJYPj3z5bzPC5mLgRGnT2/gw+RnijP3XscFs6FZNULBf7FTrdDz+x9CFaGHP8I7vQ
         cGlbb3emokluN5lrh61LqfGpp3fLsCWUmGLhjjfwp/91aEPqL0WTAgNBMkenZeyNu5rt
         w/9AyceQbEyhN1t8c7qWAvzDN/BZLJoEw8f1AqFLcvKK5db00z/WqIatSwMyvY6/Pozz
         OLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gH7nz+bt0aml9YC56TYqcpLaibFKsNDsHL3XOgPNbns=;
        fh=iPjHETViIdqD0wy3Eb1rZnY9NNlGzcGCenfiO7BPDU0=;
        b=dy+kwPQpuvezidR2J3f6wQI7uLhc+dvrL68fpdxrJuRXiNZ64WhdYAh9uoeeLesuNS
         EpPjns3jvNMyu6R8pt+POIGUkmO5VjKPvqzjzO5aiNGE/6B5IV01hRArWrXbmMhhK0IU
         dcOXmr8Wi/LyBIsKrMbO2sBo9bx8idsQ7Bz/H+X5iMZl6ozraSrNt1VJ5zZqwc3quFqw
         WnRfMWKLhAneUVM/EsjqVQQaX+kiIKhBbYlB3XbnQ64WqueKoYvtdbcLwKDf19rMo4FA
         kE4v7yJ4ZLgaWSWlNoGOil4aZd13OEy9ErSxHhSEUasciATMeYeUuQHuZD8bp3KHz6AL
         dN1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789602065; x=1790206865; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gH7nz+bt0aml9YC56TYqcpLaibFKsNDsHL3XOgPNbns=;
        b=fyNVp3NHOvADGJSVZ6yVmyMIDAmQ0/Tr0gKcf4xqYsMeUHzIvBWyX8VHzIXnoIw0yb
         gEWx84IZ9oy5NRa4pLjLtRB8NeetjyECjZ8QjuUYV3qJdLeo9eCWhW3Axnf4coq3ECNX
         qR+IPLToQ+Ja5r114MXiiqUP4lQe9u9azwvEs5K5gQycPOaYpc8Z8PE3jz6B4TRuVD7u
         /BBpCN7yueXgeTXN7pWh9rX82JT+bpqDIck42wPowYgKKTwyKxEVxMKv9dEwH9lvryhz
         En306JVl4CguIGk6KfTdSbpoHGHqZlDehtXl1hsyJL7BA3PLb9J69t7qFs97qf61TEZ/
         twhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602065; x=1790206865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gH7nz+bt0aml9YC56TYqcpLaibFKsNDsHL3XOgPNbns=;
        b=2auF0S1J/SteBCJzN/9cfffC6JyTonUOJEdFKw0L1uZ0+8GoirQ+aCpXMgRoDRMiKc
         3DCzJBxoRvt8tGSjsAEqKFGB3ksxmD2/9ftQDGV8DCKH4PrTibA8IEvXP0svKeOo6oK3
         6DuxFr3BKGoCKYRoijUOLyfzrzwgIOFpuwantCYnV+V48gsjtQVEzxcSaiGqhgMea4es
         Lwxql8uZmfWnvehC21D6eZF3+4L/VZ6qhVVGktCHUL4T5dZxYQca5hGp4smxhXxHK1gA
         l9gw8cUkeFOB9gikBnlwp+Th7WK+08lljB4BGUFAyi1AJxuvhmBUr23CnGVifHD50y5y
         ttcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPoDK4P/+r9UWPhG5p/iAfvO3KGd9kNgrNtRoPw7mTrivciqbi2bGknkRKM4YJKgKq0MxG@lists.linux.dev
X-Gm-Message-State: AFuF++lkCuSdVz6kfbS1s+N5zDCHy+rt9OH9RF9g8+EnYEKcXyQ+ErNv
	H3+c3ACntaa1KMZNvdEjls5tnC15JPveuNaGg4RrX8dTM4PnSFxv7L5QVL8CzNahjXzh8K8Oj6v
	C/UfH0Je3AzJs+aiv94KZ4hBf2lVkWobD/ibWucYR
X-Gm-Gg: AYBFou31HQoCzqhnT8km6RYv3V3NGl2QDQKFNb16JQQRLp3RZdVTiyvnneEHoOIMzlO
	IBg0oBxOvQHud0Ylv3CM6lXNcH7wlz1sbJ/RGPUTtJu1Sgydny5/oQMil3Q+Qe7HAbCuvENSkIS
	c5tnvopP6ip3okIOYwClG2vXAz0pKHiWFlLpXYlds3PoQKo81Fczdx+h8WPUPZ31KCHfQ0ckXXX
	hudd0A2Nrmoag4bBAuJooCKIJuzbPml0vC3FAcKXmm8rtLlIR2QdD5wtrijrRBwb/tpOjlyau+K
	+zjUmLtTZWbcgnyrGTGcFVp2Dr2ZJLcws6uZElVX3QU7E8JJVJvACQifTAG/JFHhBbXnqW4+q6r
	IYPGq95pK3X32KH0Hjr+1K8F5m7NGKjdpzfEsXDbclhGs3aEgUC9ixOy779spc7mEbfqe
X-Received: by 2002:adf:e19d:0:b0:487:ff2:12f4 with SMTP id
 ffacd0b85a97d-4870ff21384mr4842187f8f.40.1789602064723; Wed, 16 Sep 2026
 16:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <CAKwvOdmnfkra0N34v5w8qh+8bb4X5AxLTtOULu46S8q9KCvzMQ@mail.gmail.com> <20260916225700.GA4107307@ax162>
In-Reply-To: <20260916225700.GA4107307@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Sep 2026 16:40:52 -0700
X-Gm-Features: AcwNN1Xf8BJxVeyQi1pPTbOgFv4VYZ927MQjzdjJDkXyRlB6RTq8PQa_yc11fiU
Message-ID: <CAKwvOdnPbmDcw+gNzHHZJ5jTKV8dfJW6W1QTARw=XAQWo_OEgw@mail.gmail.com>
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:57=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> > Any idea why we only see this for riscv?  Would think loop idiom
> > recognition would make this transform for any target.
>
> I have not confirmed this but based on looking at the aarch64
> disassembly when deciding how to tackle this, I suspect some backends
> can expand certain calls to memset() to a set of instructions, as I saw
> a set of stp calls with xzr as the source and offsets into params as the
> dest.

https://godbolt.org/z/dbPrexfvo

Yeah, just seems like there's a heuristic/threshold for the trip
count. (GCC will also generate the libcall for trip counts >=3D 16).
--=20
Thanks,
~Nick Desaulniers
