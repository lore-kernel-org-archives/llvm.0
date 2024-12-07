Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664822C6FA
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 20:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733603894; cv=none; b=sCL+z7IDzPX38FMOn20H5/0m79UjgioC0Zg7V0aKdkwCkt6KSWZfeIAMMIhZ6czQyjglkQB//AL0+aG5E0ls9BmNjBVRUDy2ABYndybJdNRgTSvEflmqzErZzQvl371DUEfQ+GtI16eFHCnOLTugNS+Y1eWBDzvZ7aKiel1meHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733603894; c=relaxed/simple;
	bh=ct+vM4e0Jtr5aDgyp/mMMW/kc2rgYH8fWmf1syFBJE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srNSYyj1grAEth6cxk3/ZWSsaUroU7At6uEl4YoIjcce5JQUH9dnhzwqqTJbwzhZfAN7s3qniKfyjEg3Rj6frnFUfcFWWH+J9rFp4m822rbEUZvZcI3Scizm+sAb6kOEThSyKh2jq52MQ8gSj2CMx7jnWF/BjQ/U+ROdhWkVnWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UKTqQgKz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UKTqQgKz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e3621518so2344894f8f.1
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 12:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733603890; x=1734208690; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ms7Dj4PhpQjQO3I96MAeIgwapri0gFHpEAP0IFi7Ea0=;
        b=UKTqQgKzBt4Je7G3HLxrbg+fKFH1Sdnca2MBs4tpliM5dGsBo/ae700Fk3PcT1tBhQ
         SfP2WUjXBY0Sku8z6uCrJ/R53xzBDn7MRPoFO5f0Pl2RhuleMstYReCPlRD2V7cCO+3j
         JeJa4kYmFNzKFwBXw6xeAybUE1mCBBvj/OYx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733603890; x=1734208690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ms7Dj4PhpQjQO3I96MAeIgwapri0gFHpEAP0IFi7Ea0=;
        b=pEWTb7fxxNizr6rnsaz3CDDg/bCFJ+on5GPPrqCCy9E+FmvtQ6UOZmu/Qbq36JgvAr
         r4G1Lnlzak7GQdqzExAjgbxRRNbfpZIao9q13VQrGBsW647AwtVviKXOyR6ozGCGfVfs
         eu05Ejm7l5pt63rMqoljw+xN0sDDzCXrktKtKy5bjbmv8zSwWdaznjBbNBGhSjnjKHqk
         2CGL6uCfZB2dKwTn+JQsVFauCIVhfS3oLM9yh9Tm2rLIgoYbDy7kD/MLibLFGQ6rrZ7X
         +3HfCCK3UvdLz3qm40JKkcii+hhPIIh7ZPiwVaqVOhpqeGjnUm2U3hEa/br9Bs1bs3q1
         0+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/NilW3IhaiB0VhS57Yg4OKD1JrOHlDp9vHQaztt0G/kc7hOOWsmquOvRRH9fa31Mgwhyq@lists.linux.dev
X-Gm-Message-State: AOJu0YzM12STxTlh9ECFRJV1DUyA9SWnBnMLCngWrHNjqrDpzsPKQ/97
	CJqJvUmo6o+dTT3BOwAsVDPJJcRry6D9GmLwAm8EIzKueN3SADaXbtvuf+3oTloYhrCesu6wsUS
	LLT0g2w==
X-Gm-Gg: ASbGncviqrSh3VPxF537jYYHtIHOVsIv0gHWdci1lz83XQjHDJLFlnS1gh8Eo3teoF3
	tI13NTMhRjGCNLXjVwyAwLbtfvj/NS7k+XMzFRqmD55qOKrxKMycnO9+p5crsnYu9//DAS2qoP/
	+ekp/Ywx4vpfOQ6+srz4Lp1p3UxuySLulKn/Ei6sFFAnZYhJxb4y6fsBlDL1VbFdep663oyAYux
	fujt3de4X4z/ecPAYRdpWxZvZUg+PeYT1s91pZTUnpWdzWiW3tI9uxQz0ZBtK/22gyeDBzrfL4M
	tVH2bzcXCRIMJ1FQAJ+vOnIM
X-Google-Smtp-Source: AGHT+IE/jWo8rBWpkPb9RRBXU6hjccwaCVP6r1iTs6M86ySL6v/z8+bG4I6Kbs8toq6aCOmkmExsOQ==
X-Received: by 2002:a5d:47ac:0:b0:386:3262:7419 with SMTP id ffacd0b85a97d-386326275bemr3542773f8f.1.1733603890589;
        Sat, 07 Dec 2024 12:38:10 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dbacsm424868166b.16.2024.12.07.12.38.10
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 12:38:10 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385eed29d17so2457737f8f.0
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 12:38:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/hke7VpoDqXTpA4RZkgZLnFz7gZdIECL/9pzkEjEtVFcP9hbbBbCFC0TRO5BvaUAMQRJh@lists.linux.dev
X-Received: by 2002:a17:906:328b:b0:aa6:326a:bcb9 with SMTP id
 a640c23a62f3a-aa63a10fe42mr541173966b.33.1733603485779; Sat, 07 Dec 2024
 12:31:25 -0800 (PST)
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
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com> <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com> <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
 <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com> <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
 <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com> <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
In-Reply-To: <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 12:31:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=whzFAaksqMdYeYC=T82tny1HnGGcYu_xJTXZF1OZwVziQ@mail.gmail.com>
Message-ID: <CAHk-=whzFAaksqMdYeYC=T82tny1HnGGcYu_xJTXZF1OZwVziQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: Vincent Mailhol <vincent.mailhol@gmail.com>, David Laight <David.Laight@aculab.com>, 
	"w@1wt.eu" <w@1wt.eu>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
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

On Sat, 7 Dec 2024 at 11:51, Martin Uecker <muecker@gwdg.de> wrote:
>
> Am Samstag, dem 07.12.2024 um 10:19 -0800 schrieb Linus Torvalds:
> >
> > If there is one feature of C I would have liked it is "allow inline
> > functions and statement expressions with constant arguments as
> > constant expressions".
>
> There exist proposals along those lines for C2Y.
>
> From a more near-term solution, I wonder if making it possible (or
> easier) to return integer constant expressions from statement
> expressions and allowing a restricted form of statement expressions
> at file scope would help?

Even a more limited form of this would have been useful several times,
but as mentioned, the problem tends to be that we end up supporting
compilers for many years.

So then we end up having to work with older compilers without that
feature, and can't actually clean stuff up until many years after the
fact.

We're currently still accepting gcc-5.1 as a compiler, although it's
time to look at that and probably (judging by what stable distros use)
upgrade to something like gcc-8.1 as the minimum supported compiler
version.

            Linus
