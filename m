Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE442C21F4
	for <llvm@lists.linux.dev>; Thu,  5 Mar 2026 21:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772745756; cv=pass; b=iwXUkruJv0W8chOl0s19K11w4wqP6g/ZhUpKW7XfkE+jWjOCCxrrSgZHsI1GPk/tt/DHpS/sgpEeSvLTrFrCV5/OnjAJVHLdT0LFtoKh3bNyUnGiGTIpRjJW/MtwnYClrz8fj47nxv/sVI4Fg8Wh56DKcUdfkKcz3uPgOufdXeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772745756; c=relaxed/simple;
	bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQwfIEw81xvZWsT3So/oiSMxcSJo5S6urml3q9wTUqhPydZe+Jjo4JpVTokleDJiajZ/61hzfSEMt+BtTrMgVktdN0Zyf66IoAktqsbD/qwTCGQq++JbBu18Od8GVRsx/WatAA3ZEYkTj3A4qHD6kAmMIBnxdPXU7msYJDwpHHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GISBgxH+; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GISBgxH+"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79652789a0cso5204437b3.3
        for <llvm@lists.linux.dev>; Thu, 05 Mar 2026 13:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772745754; cv=none;
        d=google.com; s=arc-20240605;
        b=McrPLuA0bwrkVDPELVkUxYXeZxbzG0UYq3dAdzX8+vGX9TqbvGfOhWC3bMVjPCZoV7
         ONnMvHhbP3TtuO4mM5tzDsMtSZ+HYimiCYQCBVxiy6Fj0qoqInaE2NGh3XTi6wFoZESi
         KwjE/fmYomTX+wG1QY4p9zlap0nhGDIfHt3/udi3+HHjlPlAgjj5wdHZZgewkcdFyUwN
         TVZydxPcZvKSh1PP2DMSi+L2uqT9Bz7Pk377ibFOvp2PhrnOa/NnZVwG1b06GKH0Uo3d
         Aa3Pkzsxa7KCjV/7hgniQmBNxW15h3yZOcp/VV4iZBX+5BbCslKF99vXbcWTMcN2Fcft
         OqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        fh=OI6zTF0IGqhZYv8p+LpZ4FSa+p1DZ/ftIErkNVZ9ECg=;
        b=NgTgruldwBwIb+2M1LVXtXBYqeXcv2+sk531lweXeWvGCPcX+fXtxFhqRxUoIIOkyX
         oqDGNrJnYQrVn1+6Okl+PEgxyKsEW/2ENJ+wNhj8sRu+A72IuYDJBQoA0+hYCx38qprV
         8NMxlZbJbi2cqlrOsz0p2ac3z2I8jlAkMpVoPwxcQZzKose/M/Z8tzYCk3cKQn5XAw70
         A4oP8Ud6et49WKYQoAdZU5NKoL1cLgjvim2JHXFjzB8XZ//nswvnctwG3R8RuEnpAFaP
         C1Ah/uUo43t/3eBZW9IWgdWqC8DqmBIVjBbWU8WIAMFGtm7x4OQxzu1ZUC3li4R7Zush
         UgZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772745754; x=1773350554; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        b=GISBgxH+G1LkQ+YIdCBJqPiji96X1y0oFehjJmsnJZwXehUBcFA9aRve1F0clcV3MT
         VTtIXx3hOL5CcJcNVNTTtu8m97FiBOqdBV3DB00mBq1wcV84IzV3sArzjzYMQpmb/4p1
         IwnjGbN1OtyuLi+r/Si0mFzp/Edce9Augmqc2ZQS2PCDG70ScL1GdJqWV03FnlK59F0g
         Z/n4Y3K7rTIf1/i5P3wsqjASw+EmIQCWyOonejiivKKFljXALCtRHz0OGOqrndEQnTis
         eiUi2/jXOWc4nKGAnqr4PPHVMWv64D4sNLY42qnJzD8quM2MO3e+snbbmIM1bMaznJ4U
         up3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772745754; x=1773350554;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        b=eEMUyy43B4ry5b2iQzp2RhOYay3pi2kpdNSBhE99FZHViR2IeJJpHZDh5PNzh+ZLCC
         xNbUwfSSgGlkZ9El2rMl8VZVAy36nzBmxR4LjgoIo6SmIWsIno0v52dmU0R/qW7pB3KI
         5LxYwnaAB8njr6vYjhgnkZuJNftV/wZfLHnVrmDuCr9r7r7mHGIlJrtfaDoB57QuoDL0
         hUmHq+Q4iSM+4IyW1dqn4i0rxzyDKZ3MnbAL18eMV8QWIogT52lK6ukwXlvP6AtD7Dyg
         TaU2bAPgrHWdNf+8QKwYWP9pgSJBD+GIFW2RBNl7z6lYjmCvQ53u8ErnoTtqNde6UMhZ
         IB4w==
X-Forwarded-Encrypted: i=1; AJvYcCWHxaY0F0BuxbgvoUS4GfFwLNG7exIdI0DomycHM8QNmfNoz9MNifv1Kq+7L8jRlStBXIeM@lists.linux.dev
X-Gm-Message-State: AOJu0YwaRblQkntf1FIvk328Lcqm934KJN7h9Al/pxIWVIX7R3jMhgyA
	S+BO8FkDZhvAAKex6UzJ7M+M1zMLZbbfceoDqJnRU3G7ko1gq/tghIHh3IUTmNvKh4cZEOXO/js
	bVwUwNA5YhIRk6IANQV1xfuwAv0N0838=
X-Gm-Gg: ATEYQzxG+c2+Siob+tOnqyBcrh0/I3vFtFAsgyN/MDtPiSnyuzvLnictrOGazhOSWDp
	q2fXIwQlfBBU8abyrRnieexvuMGSx8uiygwUj2x6glKTr7jqzoYzOV8GeYdJLQtwGXgrwSqittY
	ZQh7+bxQ8l20T9bEf4hFX4Bg+nHITlRO8kgzrC2EdtwROnct0kw9YG/kdEdC4ajg2eu6FpV6FCZ
	dLumM0Kur1eJvw+YfW8zNGR5oRZP58zKN0A+swsR5Mk4mCNHmYkRz1zq5+PnlH6G1tGg/aaBBcS
	etXBxouO
X-Received: by 2002:a05:690c:385:b0:794:2fca:81a with SMTP id
 00721157ae682-798c6cdffacmr55975367b3.8.1772745753906; Thu, 05 Mar 2026
 13:22:33 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 06:22:32 +0900
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 06:22:32 +0900
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
 <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com> <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 6 Mar 2026 06:22:32 +0900
X-Gm-Features: AaiRm539DykMmBy-Zg-BtYOlfUPQKOJ6bwMQcvFff9WH9ZMuhoRcwF9c8D83p3A
Message-ID: <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Samuel Holland <samuel.holland@sifive.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:

> Thanks, that looks really neat! I should've thought of that instead of making
> separate arch versions :)
>
> Do you want me to attach the code you posted here to this patchset or do you
> intend to post it yourself?

I think you can just squash my diff into the subject patch.
