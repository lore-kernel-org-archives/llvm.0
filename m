Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD912C0F9A
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 22:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766096379; cv=none; b=NSpWu1urG+jsCGGXaMs0I1Tu4OPu1LFOk05zXr/FAJnEn1+vVzG1tvS9PeLNGgigrOYlZkBwiXuWuitvdszD9QZFZzzhMomadBP+DgPgNeBujrTsnsJf8++OyjbWVSWAbdUiJA6bfgqPYD4STOszsEyuRZ8PnfVp9LC3z1Rp7Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766096379; c=relaxed/simple;
	bh=8pSoe1Bmi+W4NijU12aYw3XcputPGwR7O6GNCXc/aeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7/qJyuDkKKryH6I7y7+NJYjBebrhtEwCkhEw8OSAo1wUwE59p3tVnIbEkqfkUy8GLl9tAsWt3bFjzfkyPxLWpSFtRlEg0hY9xHUdGvyYaENdcM5pQcB+SFrjGMgFRrKw9NPrOsAPB0kgazVJA2eSzgMms0Av+/6OhGZw9wfkaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y7ucPvlR; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y7ucPvlR"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b61f82b5fso1491419a12.0
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 14:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1766096375; x=1766701175; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jndt3SqYxM2jZAywVtZf3yYDl10GUxyvdAXQWbglW60=;
        b=Y7ucPvlR5Oe5zMrDoBvVi0nXdGVzr/R5JO7s747c0yQ8S7IwllEMdPTtL9U0x6pVfP
         MrJ+/kLfeMx9SrSX/k1DdavMZxn/48/CxntE5wFgcm852XE+LFBUi274ZLBEO+7Nses8
         Op3b8URjYC9wmvA+7SE2lo/DX0uSpxtqPtnRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766096375; x=1766701175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jndt3SqYxM2jZAywVtZf3yYDl10GUxyvdAXQWbglW60=;
        b=MXhG9jxq7hikvbLG+T6GBg20+vwCOLtihuJaatyjlmPqUVobl9sjSJV/EGCDZmqCwF
         i68PZHLy6LH/eP85uFnGnxE7yrJci/vdIjCs3Nuys0/sGrg1ezoVh5Ukivpg9gOyZNet
         5u0j+KPyZsc5r2XGHt1NsjKWZXgCtO+ykzYi3G+LQaaD5Ri/KPccDBJqrjX2OWPH7mwL
         mt0lZ50i7OPJM/ROfC3QVy19ySnq7Twe1p0T2Ya0vo7WH0dJq6Ocu9z/o0upZGYkWNex
         337YqusLIFj40TqwnaEF/uFvdvXGDpam6ET08P7OViSE95QG4yTcNY2iPb3pa81Z3Ucc
         N1eg==
X-Forwarded-Encrypted: i=1; AJvYcCV7XeukODtpExdt/u7U1jiwLTlq2ljCtR8m35e5JqJzB+ijL/FBa9p6OJy7n8rdNLg8WpF8@lists.linux.dev
X-Gm-Message-State: AOJu0YwwQahQUeiyAN2ahL1M9PBP5se+w9x8Cke0TTZpxpgbvjxsrFY8
	Z+dt93SIGmuoEi5zcG+X7v+/M8vol6151o/1aDyDtaDwy9nCaQxdMCLFw+sAIhPuk4+2VVNDTtY
	kylfw1XN90w==
X-Gm-Gg: AY/fxX65n6e3ab+JimPc++Ia8aqZu3AVC7CCclRkoZ99u5hfa9l7z6h4qmRjUPBgCMh
	TcqZGqXGvKoATy/RXO0A3R2SHldnH2H7g9e/1JVbjyIXAMWlAaXCMEgUo5E+WpR10bR2PQsja+M
	fZnWZBuOgxeaxpF9SSBgZ62bHrI954t/uAwBSsgPQ+NRa+zpElHvsWCZbAd/bf29okbWBk82dcP
	YEOM1YcEDy36k0REkn7G87YaEJxUwwO0bLWjaEaiGagC9SNP2GOziz195KHYgZ2aRX1qHs1DKCX
	sGw3pwCJXyH0qxs26TJ1Q6TKLRKomWs+cZB4wS8okSY/DRfxP0Xh4dIeyKFpRZPlfdMqYAXMH1K
	e6gqG8d4WD4P2kLzdKmZqRfZwBhfaPIvunc8JonwVUSHUZwiIj2MdqLpmQDgDbQUGMoW28oX8kx
	3aNjmAPa1wbEdZtlLxZPHbdUHliJeW1RTRkTmMWR9/3DDW2JPaKFR/jyow2YIO
X-Google-Smtp-Source: AGHT+IGEcJeCJb+MESCej6OJm/z9AKGcbIv2a3wxOFSQHqCHrXgwhbLwlks+S46bZ4JvPpLB7ul0LA==
X-Received: by 2002:a05:6402:5208:b0:647:54ba:6c42 with SMTP id 4fb4d7f45d1cf-64b8e946d95mr865009a12.4.1766096375340;
        Thu, 18 Dec 2025 14:19:35 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105b31esm542789a12.13.2025.12.18.14.19.32
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 14:19:34 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b72b495aa81so198478166b.2
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 14:19:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgBd+g6TkIEcMvYEyUcV+FdVBrPFonllFwZhu2ZwQaaFXUXzakexEzQiWdzIxjwXs1pByI@lists.linux.dev
X-Received: by 2002:a17:906:4fd0:b0:b77:1b05:a081 with SMTP id
 a640c23a62f3a-b8036fade7bmr90274566b.27.1766096371748; Thu, 18 Dec 2025
 14:19:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218202644.0bd24aa8@pumpkin> <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
 <20251218220651.5cdde06f@pumpkin>
In-Reply-To: <20251218220651.5cdde06f@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Dec 2025 10:19:15 +1200
X-Gmail-Original-Message-ID: <CAHk-=wjMVfu-aiQ8aNHcgsh6hYwbZCoX1B4ps2scibokO8EZ+A@mail.gmail.com>
X-Gm-Features: AQt7F2rQbkmjgbTYE3I0u5o-OP0XOCVU9BjhcXCAu035ycTBeAxGxqvP-3yEHoo
Message-ID: <CAHk-=wjMVfu-aiQ8aNHcgsh6hYwbZCoX1B4ps2scibokO8EZ+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
To: David Laight <david.laight.linux@gmail.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Dec 2025 at 10:06, David Laight <david.laight.linux@gmail.com> wrote:
>
> True - especially for code like:
>         if (x < 0 || x > limit)
>                 return ...

Exactly.

And yes, sometimes the type of 'x' is obvious, and having the range
check for zero can be seen as redundant for unsigned types, but even
in that "obviously redundant" case the code is *clearer* with both the
lower and upper range checked.

And apart from being clearer, it's also then safe when somebody does
change the type for whatever reason.

And lots of types do *not* have obvious signedness. They might be
typedefs, or have other much subtler issues. Something as simple as
"char" has subtle sign behavior, and when it comes to things like
enums the signedness can also be very non-obvious.

So having both sides of a range check is *always* a good idea, even if
one side _may_ be redundant for some type-range reasons.

And there really is absolutely _no_ sane way to get rid of that broken
warning except to just disable the warning itself. All other
alternatives are actively broken - adding a Pragma only makes the code
worse and illegible, and removing the lower bounds check again only
makes the code worse.

So this is a compiler warning that actively encourages worse code. It
needs to *die*. It doesn't fix anything.

And the people who point out that it can show bugs - absolutely *ANY*
warning can do that. That doesn't make a warning good. Any code can
have bugs in it.

The sparse warning I outlined (and that Vincent wrote up and tested
and made into a proper patch) was actually showing interesting issues
in a much better way.

And that sparse warning could certainly be improved on too - I think
that one too would be better if it noticed "oh, it's a pure range
check, so let's not warn even when the code otherwise looks dodgy".

But at least it didn't warn for obviously good code like the horrid
broken type-range warning does.

                  Linus
