Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A812A1FFC40
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733511579; cv=none; b=u6S3vXBxOgTEIZGiEBQ83Fqz32nfw19EEJhLKILOL2+l26CWk3vUasHpDi/lOilpY4CF+5ESc1Da4pAT8YmKowgN4lIvFGaB1H6z6UOIYBgnAPm9DPxnpZe93fRt4Ocbfmj56uLAv0dXWXkiuMTNh5bFSVBDFwzwS95Rrkge2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733511579; c=relaxed/simple;
	bh=uWEIYj04jJcQVEnaMjzH0epqUyK8EmgQnn9LnSnYd+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VY+q64o/++LdKfxUWAQj+pBwzffX+7LxzniHfu8Pj/1i7UCAxa+1/HaRlDdtmfugCx4fN3DvD9P7ge2bPA8F5XP6vgkMsSK2XdNE62jjAUL5FziCp0GO313ODfnnrIiSrpUHEnc9zcoYGimX+nTfxpzZzfwesvhdClnIIvxTllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZW51kyVG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZW51kyVG"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3003943288bso8490541fa.0
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733511576; x=1734116376; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WGtbOaTCTsAvyUDr9a4PNqlmY0QlpNlNkPLsZ0+zYxc=;
        b=ZW51kyVGY+f/Od4ejMDLAkw6dUtXBSzQeCSED4klzA6zzLCVTmwvRMTBJfCbcZYdt9
         rD5WrbB4o3v6BwNZPjlXGp1U301PBab84prqAoZECNTn7NDHONVxTjyqNmw3ZpmkHAqs
         4T/R66oyd7xMw0Q9+4NIss6v6Ml7MyxF0vFa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733511576; x=1734116376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGtbOaTCTsAvyUDr9a4PNqlmY0QlpNlNkPLsZ0+zYxc=;
        b=MV01Jd92tGzmJxVwhhxm5xppQ2VJxeM7k3tdai8ge1pW5RlnwhxADVHC4G4Y0QP8+6
         WY4OjuKmskOVRgrLHOMkTFT2+WFp2m8oCkxhapIGcNmuIeKhhm757hhdXUAABVBykSCx
         fhFPmam86C7IJXRIZ735HbejBZkp9SWWirhosHgsuRBnhhwVmq/1545l/YFaWyvlX6Td
         91JPY7EJIL/p7dGOvlbH7R0n9uTvEiNwWVLKJFocxqmCrDBqCC5iDAZEPV4zX1P6dC5g
         qVIHZrJ3Hse7dLdgzcgWx5o9KKWgdYMZGTwcuiFWqffnd7Fw3lRySQ4sQFUXVynrsqZs
         gtRA==
X-Forwarded-Encrypted: i=1; AJvYcCUmDzmak0AbvY7p3yZlVl5BReDBdjMNrSJmS31c658KTbqYzUTG/yKdoBJDaxFjBtVs9m76@lists.linux.dev
X-Gm-Message-State: AOJu0Yz36xyvYRpP5hCuFpZeB3f8iUaPDnPt078cA4oDhVI1WM5oqhTC
	VOY5wee3Xrd1GKr0ItzHGGfzBXiYH21F7W9wJkVy/nCRthxtKz0vmB4ZBnoPHoo/OvZsW9kEo+P
	rhgHKQA==
X-Gm-Gg: ASbGncuLG50t8mbMXY/3g0c3GWWblzqdOaRHmWA32ZSy2XpylyxTDJghkpS2y9/+rLh
	1IZ14ozk/zSe10Ml08Sjaw14iaL+osmomsAhMdTxDEksU7/LZRyWHDOraRbtzK6GPQN5P4dNnhk
	eLiWXyeBulaWvGml/pkpW7ZxJlZp9hRFlrRpPzRGewIJ7hBdiglJCZjq9uosuwwtFgUou5sTAfI
	6q1bPjDpkyDy9JqACNlBTVvYba0Gr6uaw1aCTGwDHu1tAbmQj57+uG9o9+1b9khCzCGytP1paHI
	nMeiwVjvH++kwG4DMSocXCRQ
X-Google-Smtp-Source: AGHT+IGLU5kydHSvGthWEj4fAEINpxXTz/gBfWyItH5f0itxyD6EL6xOZP1D1oARXhUdeUi2ax4ulw==
X-Received: by 2002:a05:6512:3ba3:b0:53e:3a43:9243 with SMTP id 2adb3069b0e04-53e3a4393b4mr286313e87.17.1733511575674;
        Fri, 06 Dec 2024 10:59:35 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22974f38sm588867e87.95.2024.12.06.10.59.34
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 10:59:34 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e274f149fso2822606e87.1
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 10:59:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWt9EvGq+kznznhHvHq168xOvDPV8AM9GPDM7StfqqiDWFhXmd04Bl4FWYjyJZ8wP+n/pUU@lists.linux.dev
X-Received: by 2002:a17:906:1ba2:b0:aa5:451c:ce1e with SMTP id
 a640c23a62f3a-aa63a0aa48amr290776466b.32.1733511169269; Fri, 06 Dec 2024
 10:52:49 -0800 (PST)
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
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
In-Reply-To: <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 10:52:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
Message-ID: <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
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

On Fri, 6 Dec 2024 at 10:31, Vincent Mailhol <vincent.mailhol@gmail.com> wrote:
>
> > causes issues when 'x' is not an integer expression (think
> > "is_const(NULL)" or "is_const(1 == 2)".
>
> But 1 == 2 already has an integer type as proven by:

Yeah, I was confused about exactly what triggers that odd
'-Wint-in-bool-context'.

It's not about some actual bool type, it's literally a random
collection of integer operations used with logical ops.

So it's things like "!(var<<2)" that generate that warning, because
some compiler person at some point went "maybe that left shift should
have been just a comparison instead '<'".

But it turns out that "(var <<2)?0:0" _also_ triggers that warning.

End result: I have *no* idea how to shut that crazy warning up for
this case, if we want to have some generic macro that says "is this
constant". Because it damn well is perfectly sane to ask "is (a << 3)
a constant expression".

How very annoying.

This may be a case of "we just need to disable that incorrect compiler
warning". Or does anybody see a workaround?

             Linus

              Linus
