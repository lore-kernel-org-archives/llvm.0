Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661052595
	for <llvm@lists.linux.dev>; Sun,  8 Dec 2024 02:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733623508; cv=none; b=BG1wl1JHYLynIOv6ZBNbIPum6r8WWNy+H/LLj6RV/9LSTgBM651VskjmYTSvHuiknnGuFZMcoLK32nHrLg06s/IyfYkGoW1rkS+BS7bne5jC7E3BXmGVEvPDGCiL1IL/Xh5tMu8/6B6yL7tdzQB9JxQQTDvqIJpkC6OvZTUakbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733623508; c=relaxed/simple;
	bh=IAtH1QPZVCuHz2tcdeD7lZlJGCLbl6dYQADoubFHbLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9+7H0FSVfxlCXl7ooBkyubcumX9wv+PAiPQNyL8FH/PZ+bXjvXMHQeYdaIH0pqRwQLCbTmI47svhlsirEr+a9AAw9yTmY6dNVBMUl8dLMZ7etomIj1d1pBsE1emKxerJu3FrRHelgSEZhl5ozaAK8buWTySNZRxiVbOh7rLupE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HN4CH221; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HN4CH221"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa62f0cb198so395720866b.2
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 18:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733623504; x=1734228304; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EZjbRKhMOCLvsh/fbuGewVnDsfkV1Y6IoPuC3JohNPQ=;
        b=HN4CH221Gg+nWRUmI7Ljcmm5mgh+IzJkKyEn/NyI9wZqEqO7DdAZrE0a0Tgz/IxbvJ
         DRVYqh5q7VJv6ezx6d2TWqtFdLngXGhCvcYhberViFsDXLizbqaTnUE/eKvhos76mfTn
         dAIsLzvqT38n9ZgPrZ8h6AjS8eyfGGDfJBnAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733623504; x=1734228304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZjbRKhMOCLvsh/fbuGewVnDsfkV1Y6IoPuC3JohNPQ=;
        b=F9tA/qIMEVb5CvP73nOk0NOHnOJojcaqyL0ULzKX7BvT4D9PvdCbSZQZVASYIKYX0B
         N+MhzD1An7k72AObharQlthKYegVcoPu+4JamSRaGqmpF/HboCh9RXX2XSObVuHvJPRq
         qRnSCvhlxIhrnzDLTdkkB1SkphieJBaW8xxdcRKcTJGGQNxbDILyw/eafigVXY4+PC5H
         PGtunXXPqsa2fENxzYKeS0OHRur1VsEa2tU4dShrnUK9If59Fx0Mcp+AIJP4rzov49mz
         WTMOWC2PS+AKVvGzpVi5/LCUxG+5E5oo/sveS+8ZkuXOBVuZjsERNsgxasZfTK/K6AdW
         6Qng==
X-Forwarded-Encrypted: i=1; AJvYcCUMjNOTEcUOZTS7158trU+DqTJEHKQ2gp86Uszng4cpM0ZS70xotyH79fnDIGo3ZT1HMuXg@lists.linux.dev
X-Gm-Message-State: AOJu0YwEJ86yxG7I+YlKpdYBsoCu+f57bLwFMQS0VlC1zND5SVqauTJS
	qbrnVSlnfHqKlIiKhCxK0XG1Poyr+ehyZTjyyKdJLhMd+qaN07VzGhuwqbi7JO+DDBMVQWuhMWL
	G/CCyAA==
X-Gm-Gg: ASbGnctsdUSvoCCVjQ5ZaaQXndcm4GQoAfZZgIr2BBF22AB2yrBIF7iiYr9OZ9kEfD1
	QhIEYM/KFu0bGzAVZzXfpdHUapRV6pFwr60V4FAXmtiJo7Ly2fFh14lVnkdL66addA2+lbMBlQx
	vpx1qg5BqaFE4H9oV6EOIT2RKcsdPpC1AM/f73oXpnTG3B5xFntTr+1BP8xck8dONVUn9oQGdMM
	23BKrzmoSgDcsKao0OH/56shkXezT4sXLYmdkkdZukfH3ycTlCQgTvtMpdcLMQ8gu15yHoM3va9
	XoBwfE12PQRv7FxUCGJisGoO
X-Google-Smtp-Source: AGHT+IHFLttGJiOTzFvo9tRVLVfV1OhaDY3nvZwgXyMVPhGQ4Htq/FsuuNRZzodKSByEKvaDRn36XQ==
X-Received: by 2002:a17:906:cc9:b0:aa6:6fa5:65b0 with SMTP id a640c23a62f3a-aa66fa5664emr113491966b.44.1733623504580;
        Sat, 07 Dec 2024 18:05:04 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eb1ad6sm460963166b.82.2024.12.07.18.05.03
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 18:05:04 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434f4ccddbdso271445e9.1
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 18:05:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrkSwYNM9LmzPZbrd9+VILd8KwWBkbPMIAo9klxVhmuQ2ag3n+Is87ikRa5PhkS8JnOk3v@lists.linux.dev
X-Received: by 2002:a17:907:84c8:b0:aa6:2fc7:71aa with SMTP id
 a640c23a62f3a-aa63a24f1famr565813866b.55.1733623133832; Sat, 07 Dec 2024
 17:58:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de> <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de> <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de> <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
 <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
In-Reply-To: <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 17:58:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgVGmj+nAju2XuWWD_FZHdeytRW2XX5D-L3MqDuRRciVg@mail.gmail.com>
Message-ID: <CAHk-=wgVGmj+nAju2XuWWD_FZHdeytRW2XX5D-L3MqDuRRciVg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Dec 2024 at 15:52, Martin Uecker <muecker@gwdg.de> wrote:
>
> Can you point me to some horror stories?

So the main issues tended to be about various static verification tools.

Ranging from things like the stackleak plugin for gcc, where handling
VLA's and alloca() (which are pretty much the same thing with
different syntax) was just very much added complexity, to perhaps
overly simplistic tools that literally just check the stack usage by
parsing "objdump --disassemble" output and then building up
approximate "this is the combined deepest stack" call chain
approximations.

And even in the *basic* infrastructure like gcc itself, VLA's simply
made -Wframe-larger-than= just simply not work.

I also have this memory of bad code generation (again, this is 5=
years ago, so take this with a pinch of salt: dim memories), where gcc
wouldn't end up re-using VLA stack slots, so VLA's made the frame
bigger for that reason or something like that.

We explicitly use "-fconserve-stack" to get gcc to reuse spill slots,
because gcc has been known to sometimes makes insanely piggish stack
frames when it just creates a spill slot for *everything*, even if the
spills aren't live at the same time (think big functions with lots of
case statements).

We also had several cases of the VLA's just being silly, when a simple
constant-sized allocation just worked fine and didn't generate
pointless extra code.

Pretty much none of the code core actually ever wanted VLA's, so the
end result was that we had these bad patterns mainly in random drivers
etc. Don't do that.

                Linus
