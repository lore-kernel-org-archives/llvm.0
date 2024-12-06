Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABD113D516
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 19:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733511789; cv=none; b=Jc6cV0POPIKLBeIPVs4IwlJBwgHNecXKD+6GXGmuPBBoDu1+AJmBijGOuIGCwzsMFHpeQCSNHObu60O4As4pH+Ae/PI9r+PeQOxbkJ5SndFB083f2e/YHpnI/MioqS55bAHhv17oI1KYmrv75v0hgT3E3kQjncfKY2ZzQLjA6Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733511789; c=relaxed/simple;
	bh=mpzJOBPMyEgZbeHSaWVVY8PUqVjZS+sd0oYWuGX6RdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwb//FZGNwGEvMMUj0bWieG//4N+DQ02HRkgGGFo9WlCG1df1vVEi90Btu9PwcZHJRjX4KupSamTVUSNcRurgIs3aUVerfd8sLWPkuqQJAaa6ydEyMkCuvF19Z5aE/EvyBKTKMi0aORrRwz4Z26k1BLpkLSnwlISp5fLAPXOSXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IKyYf3nd; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IKyYf3nd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cece886771so4409954a12.0
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 11:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733511785; x=1734116585; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CnspTgT+QlMaq72RnxBUxeYja+eFoihpXPIoDsPSZVk=;
        b=IKyYf3nd0FkNttSM23p+vSXXcT72DQ/GU9VXAGVU2FnoURBnXqQxe/gbXhXhRYWmIc
         fDrXKabS0z+jAlviqSmtL5R1BBfeI4YiWPVnuD8kYry7Bq3W4kHLDqqhmrtRQ+IC9O/a
         KF/B6apn3rwCrCXYtaQkhiJnC7wPT1tX7fZoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733511785; x=1734116585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnspTgT+QlMaq72RnxBUxeYja+eFoihpXPIoDsPSZVk=;
        b=b8aHHqNexiBBu+hQ3MBB2LZV6LQ8nMm3hPYeoZYlQK4vHTJhDljkBrrFJdIzLmScRg
         QEJeLjRoM8+dsZMx31aWxnMK1+UM0phkssqkYY4lZspxLgRBqocv7aCfHKCH04ER0QDf
         nhq0EDsavg6s6D6vgj8lMLON3Qx1KjXVIMOYoQ6Vd3rFnMpWl8OnyJSwNXOVuF9NrORS
         P0VJZEuaGGxf7pZBGitoX/qsgPPn0b4bciOCH4B1ld6p++6NIJQmhTl4soaOT9FjBz6k
         OkNfjojs7RpRh0w9Ng08Nojd0YpakxH3k0LA1mH0JZoqOEIcYaw7gWN7kt7oLc/eUVT3
         ue4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/fViEepOn8+1wE9NNv4vMjx2ddJcVq2qpIyRVT+WFfma5z0NnDfLoebMQt9poFfEsEPQp@lists.linux.dev
X-Gm-Message-State: AOJu0YxwQw60Zs9BR6mx0xHeEuVSInxkZanX34YoCfkK2q5toxRQqKNI
	97Se/EqHnqbkfm7dveD1hmHrDJ79F0n8E+U8aPoF3c0T6Xdd/oz1Oy0Ni1fZnAa9IPHV+03V1VT
	zm0JRHg==
X-Gm-Gg: ASbGncsaXfH/wFYNvJmhUEXXg4/iCGFNoYjrucu5G916paC8jwGj6TDurGjKnfxDBl4
	e1BdLMJIQWgoJ5ev8AyAhPwR+fUw/sRUp/RvS3s6e2IJ46kpqtyJAIFr2gQ8GL1PnlS/cYnjjKK
	8FrScI0R6AUEqMr5JX3t7pH0XZ79l5BHw4n54mTgbrUVJx11xfvcdBXIXzFbU07haOAONi0fvDo
	INGT/W+rJ/kgmXilK5gCeCY/b6P7GeWx399rQWxz4LOo2Elcjn/rLbHTIq8440IIKoYv6wQVO+L
	Z7snHYRNjN182Gj0VtitCMAe
X-Google-Smtp-Source: AGHT+IEYvczgQfiL/aVTgybXF3pZgdcHzZO7hgTA8Gufq5M22tUSG9EnHykZ0a1WiO+ovyVl6ykI0g==
X-Received: by 2002:a05:6402:430e:b0:5d0:9867:a6aa with SMTP id 4fb4d7f45d1cf-5d124d6c718mr8170004a12.6.1733511785359;
        Fri, 06 Dec 2024 11:03:05 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49f79sm2510671a12.32.2024.12.06.11.03.04
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 11:03:04 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa62f5cbcffso309920566b.1
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 11:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXp1lYTh+l2aHtfX2zSjNX/7mdUCa3YMMe4T3BVdhfvPBYRMthZZZsBdImVaaEIiGt0eKSv@lists.linux.dev
X-Received: by 2002:a17:906:9c18:b0:a9e:b5d0:4714 with SMTP id
 a640c23a62f3a-aa6375f5cd6mr310802966b.21.1733511783880; Fri, 06 Dec 2024
 11:03:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com> <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
In-Reply-To: <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 11:02:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjk_thfjRnAYRoGX7LjJ8AyiPTmBqjJEPu6JiKDLG2isg@mail.gmail.com>
Message-ID: <CAHk-=wjk_thfjRnAYRoGX7LjJ8AyiPTmBqjJEPu6JiKDLG2isg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Vincent Mailhol <vincent.mailhol@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, uecker@tugraz.at
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Dec 2024 at 10:52, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This may be a case of "we just need to disable that incorrect compiler
> warning". Or does anybody see a workaround?

Hmm. The "== 0" thing does work, but as mentioned, that causes (more
valid, imho) warnings with pointers.

And it's not necessarily require that a pointer expression actually be
marked as a constant, as for the fact that these macros often get used
in various arbitrary contexts where things *might* be pointers, even
if "not constant" is a perfectly fine answer.

We do actually consciously use __builtin_constant_p() on pointers.
It's very convenient for format strings in particular, where
__builtin_constant_p() is a good test for a constant string, which
sometimes gets treated differently.

And in fact, dealing with NULL pointers statically might be worth it
too, so I do think it's worth keeping in mind.

               Linus
