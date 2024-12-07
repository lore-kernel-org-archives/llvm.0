Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1E33FF1
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733595983; cv=none; b=LDVcFHBTYr0uBH4DwJALaSTGg8+jGEg5pIGnnKuqvu1Bi7wk+p4Y7cVa1Z5W26ITmdIXi5MVzn4raeXqmZor7+FDFMsXbXGYAyNFBovmulpb6wpolkGkr9Dz1R/PpBsuxcdJ+2bAZUsCYtt87VmJssT7BVsmXK21hBWw418wWiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733595983; c=relaxed/simple;
	bh=pCyqxQB1wqSB6HSVhdTXB/6ltiXA8UsqI4BL9ES1zGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TD8G1sBSIbrmyUut9nL927oJlOb7d0qrcsem9+wxre/TNoiI/9QD/YGMiYDBiARUSdf+sLdhpS9cqAcxZPV0sT29n+hx0Fvn1sCjI2qdNXTswEvyrb7aDq+5UDgBVAlPbQQy78+J6lJ7iL6cBFfphJAFtEYck6K3vIJsCTYtMb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MuSBBmHx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MuSBBmHx"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa662795ca3so73007166b.1
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 10:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733595979; x=1734200779; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V/vNc5nALUWVUmfD8b/aC22BtPTbXjUkByw6MJHP530=;
        b=MuSBBmHxcFsLNo5PL3ZupPrEJcPHit785TBxPkkFF8CNoc9754NBRTnLSaiznQMUf5
         kw08jOSVa/hIscQKPlq8fN+cAqAOFRGdldYyRdeKIgjrUaX8qqDN89JTQ/FIMHQGAXW8
         CRHNlP1wN/sCepTtmQY4u8i5w7iqoObXFKTdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733595979; x=1734200779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/vNc5nALUWVUmfD8b/aC22BtPTbXjUkByw6MJHP530=;
        b=av9ptjLB9k+JCDYZzA/vvrP85pgE3apUCVA92KQs1VqYg7AXiwsx+Klbqd2ssnNtz8
         xgLJt8MmuYAirbQk2KyfkYkgj+VsONqT8PlngJaxJOn+kajjJduKWJJOnySPqhGKCmB9
         ZGOnCn2csTrK3VRY+dUt8FT4qtb1sLydydbNUW5x06Rah/+RREhquemwvx8BDJrZSGtt
         wVnEih+IBNNbg8Lbb485SLhc6YNKFzV5w4rAub95/Y3vt1IiOP5zUg+IxgRTedSiSD+G
         efzHt8XyD26rrGXd/UQsWixY0h95gepAQgWpj7F3fg7NnaHJnd+gX0ZZMPFne8jNSMXL
         g8hg==
X-Forwarded-Encrypted: i=1; AJvYcCVFQFb9FMRPmmAejCYIWmiW50JVZrQFButT1hLw0tbXdCkdeg7UI+MTWderBhDlzeUx3p+C@lists.linux.dev
X-Gm-Message-State: AOJu0YysEQ81ezc7+p/3PH6JTQOMK0bBiD+aRp4XpKbGMRIn7s70NipR
	Gu8YpKZT4qPJXuiUe2xkp0/qOssPZ1S6GUyJbLR7A0GB6o9pQCWsgXrLEGlUqPaf04ovMZZ9x28
	7lR+rug==
X-Gm-Gg: ASbGncsxe8n8ArGep5WacRIMolPydmrsOSgHGuwmAfVNKLjISC8TybE4vNXU1WrVZyA
	0E7cbaXXq9hDtuZoc7cuUIg7W41uta/9KxrKNRMbU+p4kKnSDhCwLCGCJMSn9ocMJtgxwH7FsSl
	f6nNanp7QTzjpZUdg66E/me9JEJJm1SMC1u4lmcP40zDodYqk7VzKBG/O4KpDEzxnnh9eGHiNto
	JaXYczX8mD79Tw47Rk7aI9KYmyzqc2mCwJk1tdVjM1FSaJPuOkw2c9jhYrBI2/xhoeXeaKmtrdS
	wlLeSoe76kWNZyfQHHfxPktF
X-Google-Smtp-Source: AGHT+IESBWtzHHM9+9aDPWi24ahaOAJI7aKxpWd3XzNuAChOngcr2AgJBP2KS5pcaKO1YkV34n5PNQ==
X-Received: by 2002:a17:907:7e86:b0:aa5:4e27:4bbe with SMTP id a640c23a62f3a-aa621a3da23mr938861966b.27.1733595979226;
        Sat, 07 Dec 2024 10:26:19 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa653a95e90sm110139266b.173.2024.12.07.10.26.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 10:26:18 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so690983a12.0
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 10:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqmXYCkG2lvTx3/3Fz87Jv3XFXPrXe9F/zmRVQ3RmbCSrEwumuMaRq7oMJBZ/lAWC9lPQo@lists.linux.dev
X-Received: by 2002:a17:906:32c2:b0:a9e:85f8:2a3a with SMTP id
 a640c23a62f3a-aa6373494a2mr765427966b.2.1733595978237; Sat, 07 Dec 2024
 10:26:18 -0800 (PST)
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
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
In-Reply-To: <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 10:26:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
Message-ID: <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
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

On Sat, 7 Dec 2024 at 05:07, Martin Uecker <muecker@gwdg.de> wrote:
>
> VLA use *less* stack than a fixed size arrays with fixed bound.

Not really. You end up with tons of problems, not the least of which
is how to actually analyze the stack size. It also gets *very* nasty
to have code that declares the VLA size using an argument that is then
checked afterwards - and if you have a strong preference for
"declarations before code", you end up with *horrific* issues.

And even if you are super-careful, and you solved the analysis
problem, in practice VLAs will cause huge stack issues simply due to
code generation issues.  The compiler will end up doing extra
alignment and extra frame handling and saving, to the point where any
advantages the VLA would bring is completely dwarfed by all the
disadvantages.

We went through this. We are so *much* better off without VLAs that
it's not even funny.

Now when the compiler says "your stack size is big", you just look
"Oh, that struct should be allocated with kmalloc, not on the stack".
Boom. Done.

            Linus
