Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D5198A06
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733512933; cv=none; b=mjoHNOUTftxCBJlYl7soc4AyzNSZ/VDIGK6SHDSakud5Nk8vasvG9pbpAJ/jFAFR2vVDhgvuWBHuIHwBNGOBXam2Uqk3TnJLp6kvsrQKzk1DZQ+tBIs1aQrEih1b0mlsNRp9JpUHQQgI+WO5DTnemyhAe2ECt3XuKIfHjsi02ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733512933; c=relaxed/simple;
	bh=i8VSKf3d9h7aPyCMroFIPs2BgVVC/quFiHlWg+y9lfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtNT0ZagcB6VHZXRiOzmerC7vPu3NQLsb3AAfx3SphUANKX+MW7g2W1gpM4EPK/rY+Pcl3yYJ+D/vegy9CURxnSZuzF63IF3awrX4bQ9vUD9NEZ3jMeHzNV3pHolEek8DTF8yoXncAMboIOjRH5PBDIpmajvv5RCVZdK5dMXAq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IvFrSLCG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IvFrSLCG"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e2baf3160so1703449e87.0
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 11:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733512929; x=1734117729; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB1D/kV+LS+wbR3JFN0rKIWFlL1hHHNzi40qmGJ0Urw=;
        b=IvFrSLCGI5u1LHB9ezbZ6X3WRcsBRR+M6+kad7HTlrYrxwWa7PiDo9yw7pD3MtkEiC
         I2DHAhZMp4JP3fiG9a5IIBY9y62EMqmwmhHMwgOJG2csqYScbbIZ/t/WXlR1YzvxWPMV
         FbgXJG9MkWChgDBnP0I38/3mtVsmHnniVB+d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512929; x=1734117729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HB1D/kV+LS+wbR3JFN0rKIWFlL1hHHNzi40qmGJ0Urw=;
        b=XOZ/P6obtoaEEJwTU52oEKwo43K6RcaBkJolVodz5PMSdM0FxeDm7K9yngA48hGFdx
         jRhfPXhh3fniY4OYBFsDxpNKV1btqFK2I0DX3dSUXGvLcd8JNWbm9CAg/vyz71XYTdzi
         duVqAyU80Tj9NBIDqwMb7c3XPggT5nNcXumkm8ifCykgYOGx/FYbJVQyNiyrkWFu/CJH
         bsch1kXJsaHlK5TNzqQHSNXMWWrZkOPFVkHd3RujvKN9gJW+VOx8a9KYaoWmAgH0Bh6g
         SCqKPZb0AYwI1Za5CDE8f4PBzNXCcHAb/Ph38ZAfD6cTxzAZtpLM3/XnKNpC9tKzLkpG
         j0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcVhPwhPuo01jVGmJjipXxYGMuw4LbDGA5iA4srCWcgO1LS46aY71UWx9YL71WzjC29fQF@lists.linux.dev
X-Gm-Message-State: AOJu0YzjrH8nxaG+tgjJf2N2Y6Sm6Q9dAgNFp3D0rLIlq/9vAdWRhkfp
	B39vJEnOEleEi6k2raUB8PKJJhh53j6jXqem7xO0u9KZ3TfLLRI+Ys4sZQGOj827NhlkhnblXOJ
	E0nhkwA==
X-Gm-Gg: ASbGncsB0lblPI3dfdYdIzIvucvS4pdJhZAGdtgYSg/2tQeyBLbwJbMy+9saFboPCaZ
	ZrdxuCf42mMw5c87P4Ld7DKx4GHXQiudxWm1KrgKw97Ub2x9twueE15s+ysaI6Dv16SrvLsE3CJ
	PS3Vhu6TvAFQZoaHnKl+VyvBpDGNUdq3B+8fuAbZhdSDJ8nil35xwYoO2lrZ1sKmpmXYa6/FllP
	kCp7mXu22006UjMc1qxDiZiNTRenhCN6lDsvSFGJrdqFCla0/Qp8ERIg5XeK8p4KUy7aHYT9xlU
	SdoPOibOnZUrWEtOq59vQxZ6
X-Google-Smtp-Source: AGHT+IElPbR56li2rC3XFpk1fq47dD3xdcO0kP1UAfgIqdzumNOmXxnh1JkIu7aZYmnqIZnpcAdpuQ==
X-Received: by 2002:a05:6512:b11:b0:53d:eebf:ee17 with SMTP id 2adb3069b0e04-53e2c2b0d55mr2457064e87.7.1733512929470;
        Fri, 06 Dec 2024 11:22:09 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260a3beasm280554166b.162.2024.12.06.11.22.08
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 11:22:08 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a2033562so22951855e9.1
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 11:22:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKTek94HxPssxXYxxgAhTQABjN6vV5EjcOwMigE5OakyProiSRlM6J8FkWCBY/qFFYxG5d@lists.linux.dev
X-Received: by 2002:a17:906:4c2:b0:aa5:308c:3489 with SMTP id
 a640c23a62f3a-aa63a2519b0mr271057466b.58.1733512537212; Fri, 06 Dec 2024
 11:15:37 -0800 (PST)
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
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com> <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
In-Reply-To: <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 11:15:20 -0800
X-Gmail-Original-Message-ID: <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
Message-ID: <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>
Cc: Vincent Mailhol <vincent.mailhol@gmail.com>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"uecker@tugraz.at" <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Dec 2024 at 11:07, David Laight <David.Laight@aculab.com> wrote:
>
> I'm missing the compiler version and options to generate the error.

Just -Wall with most recent gcc versions seems to do it. At least I
can repro it with gcc-14.2.1 and something silly like this:

  $ cat t.c
  int fn(int a) { return (a<<2)?1:2; }
  $ gcc -Wall -S t.c
  t.c: In function =E2=80=98fn=E2=80=99:
  t.c:1:26: warning: =E2=80=98<<=E2=80=99 in boolean context, did you mean =
=E2=80=98<=E2=80=99?
[-Wint-in-bool-context]

> Does a '+ 0' help?  "(var << 2) + 0 ? 0 : 0"

Yeah, that actually works.

And "+0" is nice in that it should work in any context.

> #define const_NULL(x) _Generic(0 ? (x) : (char *)0, char *: 1, void *: 0)
> #define const_true(x) const_NULL((x) ? NULL : (void *)1L))
> #define const_expr(x) const_NULL((x) ? NULL : NULL))
> I send this morning.
> Needs 's/char/struct kjkjkjkjui/' applied.

Oh Christ. You really are taking this whole ugly to another level.

           Linus
