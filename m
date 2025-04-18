Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557BBE555
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983110; cv=none; b=WiWY2IGEoMBLxlUlah/wxk4ZKVNpYO+B8PjLgfLDjIvbqIaBF8C5g/BXkdJZtWGOxK2ZWQ5J5xy+tOShNFteqrewJ/lIZXnWI8KQhRaO9pYRrKEA1qohyIMpPA6jkn0VywvEI9Lv9g3FHcPA4tRbbILBqKPUnUvLgibM9UpAy7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983110; c=relaxed/simple;
	bh=+ipEq0DN1psmNTdr4XRWkkXLvcwAD4hbAap9lZ1Syy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLCP4uzex/vcgGYPRos7HO7ySZ5zUpnVJhYhg22vgT/eroX+zkNrj+8c3pIF37HR1z1viHdU4E2H8MfIg9TVbr3VuBNr0spGIrkqO7xWVgLhM/p6Ez3SdumNdp+E+48KinwhJP2TlVZd1A3eM7uTmm8pnRuQ9DvRi+miNyBQ19Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9CXe16z; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9CXe16z"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so71280a12.1
        for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983107; x=1745587907; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW/r+Xskypu97YYD6KF6jc5zwux2QZnn2gKuuTUWqVE=;
        b=I9CXe16zyqDcM9NCQpnX90Wk+FTBeYYfxC4/RB6ffLTXr/aN/Znw8wQq43iIuOZIcb
         2XBoRTo3OE6OTt0XZWyMAyMyaMDo/Lfanno30tB3XlmteR+63Sj4e82eBPVgemXxKw0W
         9iCYka33J8Km9JziRl5JoRya8ZHLL8ozXeQX3Cg+q+qSgwI2Yqh0GmFxzofzvA/V+zbS
         Lo7ydX5axW1nEQzZrF+1WT9vmE6WZY9WeCmoDv1smhMACewV2qOM7qmH0Uc5RhvFTY+3
         Bd85CSrA2s1/SjHlDG5SvCSQuWUZqD9H66++kZoOsD6HdnuGUZX0VGiSDvXTWeWJcfRm
         WIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983107; x=1745587907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW/r+Xskypu97YYD6KF6jc5zwux2QZnn2gKuuTUWqVE=;
        b=iU9o5mUFYhnoVy/1YwC7nw5dfCaXEVWSLZUx22LJy4caV2DBP+09inDx1ENbINnfin
         U0PbCgqPkkY1fFnVyA1m51iXLLxHz9CiXR4ipTbxnnBbklO1VIAiu1MgSXJ7YAO3jV5e
         h46ED2kSAxyb4L237E0BC75IgTggD3VgkLFUihbtjirBDFUYpIdTt5v+GTubtJonEhxb
         o5Mr5dNUAslNl1B1Pim+HKpqi+GVHqGmxl4PYvc43tmdoY0Cbham5F+NhLY+wQXzuYEI
         dKNDdkUjz7ctcmE46j8Z+rN8TdHko3AeB1doSZsp+toz3z1l7OW/y4xGcuHVy2i5eW8B
         J9xw==
X-Forwarded-Encrypted: i=1; AJvYcCV6mDH4jyXooII8wJtIpiABgorRdNDieOU3WXQsRYF1tgJxrxKSKfaJZuQ+zG2iSVUIZzSW@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8am3QuL1ZnwF+vLVU1WbsC7bjhmkt6Hf82XgsiYDzdhtBQ1aF
	hWoHiON7s1nGJ2OFJutveYz64mzeVtflHxGKXUv3J/u8smrFsNDAVQayqYGMDWVTfEwqx0csyLl
	luyfRAr21qL/I8AR7D0cnOErISNs=
X-Gm-Gg: ASbGncs2rveyAPVQImhulrZ9YeZxPfl4bEBZcff7hJc8262GHRjXbyqE2f0/6LNf4T2
	T8EnVAwRN43c9alIIUn3TdgrNyazvmLoWRen/tadB7amS0sUiJ2DRSFSAqrgcniYA4cj7Fxg1qf
	3l/JHJCXBjpU8NSRf+xtHA
X-Google-Smtp-Source: AGHT+IE+R7I4dVbYwOWf8/dydNM3ras0vM8Hcd1dtJhxh5iLeMMP4/GOg7s0W+7aCQ1EW35HU9YjtmFodyE+MqjWPmY=
X-Received: by 2002:a17:906:e208:b0:acb:85f2:f032 with SMTP id
 a640c23a62f3a-acb85f31115mr5753166b.13.1744983106327; Fri, 18 Apr 2025
 06:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250410063754.5483-1-linux.amoon@gmail.com> <20250410063754.5483-2-linux.amoon@gmail.com>
 <aAIIH7H1oQH8cf-6@mai.linaro.org>
In-Reply-To: <aAIIH7H1oQH8cf-6@mai.linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Apr 2025 19:01:29 +0530
X-Gm-Features: ATxdqUEh1pZaqB8ipWBIif6O9726dyogwx9y_IR39XM-ncpaQF8skGDo78Oz4mw
Message-ID: <CANAwSgS_OnEv=r7S4CetLkW4vo-QdFAKTbqRK9H-Q0dq5VDYLA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] drivers/thermal/exynos: Refactor clk_sec
 initialization inside SOC-specific case
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

On Fri, 18 Apr 2025 at 13:36, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On Thu, Apr 10, 2025 at 12:07:48PM +0530, Anand Moon wrote:
> > Refactor the initialization of the clk_sec clock to be inside the
> > SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
> > is only initialized for the specified SOC and not for other SOCs,
> > thereby simplifying the code. The clk_sec clock is used by the TMU
> > for GPU on the Exynos 542x platform.
> >
> > Removed redundant IS_ERR() checks for the clk_sec clock since error
> > handling is already managed internally by clk_unprepare() functions.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v5: None
> > v4: Fix the aligment of code clk for clk_prepare in proper if/else bloc=
k.
> >     update the commit for clk_sec used.
> >     checked to goto clean up all the clks are proper.
> >     drop IS_ERR() check for clk_sec.
> > v3: improve the commit message.
> > ---
> >  drivers/thermal/samsung/exynos_tmu.c | 37 ++++++++++++++--------------
> >  1 file changed, 18 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/sam=
sung/exynos_tmu.c
> > index 47a99b3c5395..3657920de000 100644
> > --- a/drivers/thermal/samsung/exynos_tmu.c
> > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > @@ -1037,29 +1037,30 @@ static int exynos_tmu_probe(struct platform_dev=
ice *pdev)
> >               return ret;
> >
> >       data->clk =3D devm_clk_get(dev, "tmu_apbif");
> > -     if (IS_ERR(data->clk))
> > +     if (IS_ERR(data->clk)) {
> >               return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to =
get clock\n");
>
> As this branch returns, the else block can be removed.
>
>         if (IS_ERR(data->clk))
>                 return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to =
get clock\n");
>
>         ret =3D clk_prepare(data->clk);
>         if (ret) {
>                 ...
>         }
>
Earlier I got this review comment on this.
[0] https://patchwork.kernel.org/project/linux-samsung-soc/patch/2025021619=
5850.5352-2-linux.amoon@gmail.com/
I will try to fix this in next vrsion.

> May be worth to group both calls with devm_clk_get_enabled()

Earlier, I attempted to change the clock ABI, but it didn't work.

[1] https://lore.kernel.org/all/20220515064126.1424-2-linux.amoon@gmail.com=
/
If you're okay with changing this, I'll update it in the next version.

> > -
> > -     data->clk_sec =3D devm_clk_get(dev, "tmu_triminfo_apbif");
> > -     if (IS_ERR(data->clk_sec)) {
> > -             if (data->soc =3D=3D SOC_ARCH_EXYNOS5420_TRIMINFO)
> > -                     return dev_err_probe(dev, PTR_ERR(data->clk_sec),
> > -                                          "Failed to get triminfo cloc=
k\n");
> >       } else {
> > -             ret =3D clk_prepare(data->clk_sec);
> > +             ret =3D clk_prepare(data->clk);
> >               if (ret) {
> >                       dev_err(dev, "Failed to get clock\n");
> >                       return ret;
> >               }
> >       }
> >
> > -     ret =3D clk_prepare(data->clk);
> > -     if (ret) {
> > -             dev_err(dev, "Failed to get clock\n");
> > -             goto err_clk_sec;
> > -     }
> > -
> >       switch (data->soc) {
> > +     case SOC_ARCH_EXYNOS5420_TRIMINFO:
> > +             data->clk_sec =3D devm_clk_get(dev, "tmu_triminfo_apbif")=
;
> > +             if (IS_ERR(data->clk_sec)) {
> > +                     ret =3D dev_err_probe(dev, PTR_ERR(data->clk_sec)=
,
> > +                                         "Failed to get clk_sec clock\=
n");
> > +                     goto err_clk;
> > +             }
> > +             ret =3D clk_prepare(data->clk_sec);
>
> Same comment, devm_clk_get_enabled()
If you're okay with changing this, I'll update it in the next version.
>
> > +             if (ret) {
> > +                     dev_err(dev, "Failed to prepare clk_sec clock\n")=
;
> > +                     goto err_clk_sec;
> > +             }
> > +             break;
> >       case SOC_ARCH_EXYNOS5433:
> >       case SOC_ARCH_EXYNOS7:
> >               data->sclk =3D devm_clk_get(dev, "tmu_sclk");
> > @@ -1112,11 +1113,10 @@ static int exynos_tmu_probe(struct platform_dev=
ice *pdev)
> >
> >  err_sclk:
> >       clk_disable_unprepare(data->sclk);
> > +err_clk_sec:
> > +     clk_unprepare(data->clk_sec);
> >  err_clk:
> >       clk_unprepare(data->clk);
> > -err_clk_sec:
> > -     if (!IS_ERR(data->clk_sec))
> > -             clk_unprepare(data->clk_sec);
>
> With devm_ variant those labels should go away
Correct.

Thanks
-Anand
>
> >       return ret;
> >  }
> >
> > @@ -1128,8 +1128,7 @@ static void exynos_tmu_remove(struct platform_dev=
ice *pdev)
> >
> >       clk_disable_unprepare(data->sclk);
> >       clk_unprepare(data->clk);
> > -     if (!IS_ERR(data->clk_sec))
> > -             clk_unprepare(data->clk_sec);
> > +     clk_unprepare(data->clk_sec);
> >  }
> >
> >  #ifdef CONFIG_PM_SLEEP
> > --
> > 2.49.0
> >
>
> --
>
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
