Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD271274FF8
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983159; cv=none; b=SzjoYsrY1n6aK3fCDC0j8hK3Uvuj6vG9dUldATTojUj73Xd0AnxbTg7/Ms9TdAuorSJCWGHsUiEgQQpIzEgHOat57GZADQZpgpf4jT8Gc9zx4/4f/OAL9MsW5M9gYWtZUhYHYDFFV47Cb4V8v7S8cQmDZv1j/Lovi2AvzNRXF2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983159; c=relaxed/simple;
	bh=7eowmYUF0pclok0D9/mq1P0map8wOZ69347Wa9sCHNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOmPcsWKBQKUmfvEzt11wuIkr/TE3rUgzX4KWp0+WmpYD/grf5dmgfR7fcncbUnhdBcWs7PoRduid3nsDgoueMyLDmUqUiQOarBkaolyl94xI6UPxmpTwLSstZ+Yey4bCCzPPQDJ9vFJ/M3qlm/GVHnM3Fh0b9tZOLpwkyQyC+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJc6lAzQ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJc6lAzQ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso2831742a12.0
        for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983156; x=1745587956; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXZIWWM8mZYdiQktFqPI0+JPo4B/dX6RUUwchm1Zb5I=;
        b=HJc6lAzQAQ+Iig4VsLdTQMxMiicOZsNUf89HWZgWthd6e9MrbzQqfW7iDOb3GI8SZi
         8mDcqqazgUasDJ+QkJ8HV5BGBvwFS92Xyf55Kkz2vT32XLb29K0szSRhagxhe8UvtZuO
         symkRqSEubuiKva7cBw88D51UJ5AgyNiTP4ihXi33L+XsCjSh9IQRMk4S0qfjIxBMC2U
         cSc9E1xC6xHE50cbYtcc8TSqkA3Was8pTY2P8QTGnp+TVmAj9NQgMlIsBtRGEwBZmrk8
         gcOASSkDQKbg2QLKfdhzTigISBJRncZ/XQ3P8+a/oWjC5csrFw9PwHTWPxwJrMHLH8O3
         TTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983156; x=1745587956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXZIWWM8mZYdiQktFqPI0+JPo4B/dX6RUUwchm1Zb5I=;
        b=oA2wPhTvVsRCezngA+syBlOler2fo/CA/VvjPrhQ633AJqY6wUwm3llb4VJ9IGFexy
         yZr8Jfm2R/KKKKJrZAzmqHiujtDy/+Eh3Bqt3TUpIdoYfuuw4uRdevBz5qyyZ5Per3Z6
         QIKuOWMJX+jo3i4TGTdyQ05RIRdo8jbkIwRn2sDPnmHwStRE0AgUUSg/aviSAfGAwT+a
         EOec09i5ULvqKvh0Al7ZEuv3CHW1OGIK+Cwm4bJ/Igl/v3k+enQk4qQPzk6/dRZsxG8P
         pBbfGJXP5NdaL79ExO/wd2xbtLSGOIoj4pQFgr/Q7R7spFcAFpHGTvHfbpIeI1oMrguW
         7y2w==
X-Forwarded-Encrypted: i=1; AJvYcCUx/XXeOheAABJGgDlym19XDnbENTcabG+v7FhN06Z4JJSzbapC339zZAv8rlkAn26g0Bk/@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ29Rw4Mcvt/NuBP6UcARCb+0k1AP6DoZG0rFlaAraHuAJxuA8
	jKGwazwhMwfe1AoOk6fRCZyU5b4UQL1nJSoruhvIOvCS7v0t17uhe7jde8DN4t9TXkKZBnCfgNj
	0Jrs77qXwSCCvyAPG29I7XEvJdWQ=
X-Gm-Gg: ASbGncvugDtcuwZuha4qTy+0M0wSDXcAVfOX318w2hhLkBiQYlDh+rmhpP17fjfOov1
	X88gJewQnw8Mdgf+PC0RgTMK07IHrTeHFArSWxY3H98m/VBA4C2Cx6Lla7yFcLb+miCNm45RJSC
	ICOSGzfKz7v9ZbTok4kBla
X-Google-Smtp-Source: AGHT+IEf1FP4PE+QPrL3TzSuKDCTAio1byV8qwIANyIcWwl3yMCy7oqqmZBQNjRLb7+OZ1bOcdJO2NJMrjzSMyIelCY=
X-Received: by 2002:a17:907:6090:b0:abf:4b6e:e107 with SMTP id
 a640c23a62f3a-acb74b52090mr242322666b.25.1744983155938; Fri, 18 Apr 2025
 06:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250410063754.5483-1-linux.amoon@gmail.com> <20250410063754.5483-4-linux.amoon@gmail.com>
 <aAILE01SjRR874jc@mai.linaro.org>
In-Reply-To: <aAILE01SjRR874jc@mai.linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Apr 2025 19:02:18 +0530
X-Gm-Features: ATxdqUHbJXVdHhwcS0IwraNdsY4dmTwIZsNctwmfdNkH6lfYcXleJugDkxPs4Aw
Message-ID: <CANAwSgRK5ONpBM35U7DG=wtHv9N-9kRpbveqyGsVORnJiS5mmg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drivers/thermal/exymos: Fixed the efuse min max
 value for exynos5422
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 18 Apr 2025 at 13:49, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On Thu, Apr 10, 2025 at 12:07:50PM +0530, Anand Moon wrote:
> > As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
> > if e-Fuse value is out of this range, then thermal sensor may not
> > sense thermal data properly. Refactors the efuse value
> > initialization logic within exynos_map_dt_data function by
> > replacing the nested if-else statements with a switch statement.
> > Ensures proper initialization of efuse values based on the SOC type.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
> Same subject typo: s/exymos/exynos/

Thanks for your review comments.
Opps, I will fix this next version it got skipped.

>
> > ---
> > v5: None
> > v4: None
> > v3: Improve the logic to convert if/else to switch
> > ---
> >  drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/sam=
sung/exynos_tmu.c
> > index ac3b9d2c900c..a71cde0a4b17 100644
> > --- a/drivers/thermal/samsung/exynos_tmu.c
> > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > @@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_dev=
ice *pdev)
> >               data->gain =3D 8;
> >               data->reference_voltage =3D 16;
> >               data->efuse_value =3D 55;
> > -             if (data->soc !=3D SOC_ARCH_EXYNOS5420 &&
> > -                 data->soc !=3D SOC_ARCH_EXYNOS5420_TRIMINFO)
> > +             data->max_efuse_value =3D 100;
> > +             switch (data->soc) {
> > +             case SOC_ARCH_EXYNOS3250:
> > +             case SOC_ARCH_EXYNOS4412:
> > +             case SOC_ARCH_EXYNOS5250:
> > +             case SOC_ARCH_EXYNOS5260:
> >                       data->min_efuse_value =3D 40;
> > -             else
> > +                     break;
> > +             case SOC_ARCH_EXYNOS5420:
> > +             case SOC_ARCH_EXYNOS5420_TRIMINFO:
> > +                     data->min_efuse_value =3D 16;
> > +                     data->max_efuse_value =3D 76;
> > +                     break;
> > +             default:
> >                       data->min_efuse_value =3D 0;
> > -             data->max_efuse_value =3D 100;
> > +                     break;
> > +             }
> >               break;
> >       case SOC_ARCH_EXYNOS5433:
> >               data->tmu_set_low_temp =3D exynos5433_tmu_set_low_temp;
>
> Thanks for taking care of cleaning up this portion of code. IMO, it would=
 be
> interesting to go a bit further in the house keeping by replacing this bi=
g
> switch with a set of structures stored as __init sections. The initializa=
tion
> finds the right structure and does a structure copy to 'data'.
>
> It is up to you to do this change or not.

I'll be sure to check this out.

Thanks
-Anand
>
> --
>
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
