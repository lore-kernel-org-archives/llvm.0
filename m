Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735F933C1
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 21:14:30 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id e15so23032358lfs.0
        for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 14:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=KstM2C1nqWzbgiq4lXjESSIV1F+sGBJqXZBKfIDDeII=;
        b=mJ2qrO5MX6fYku8PgLw5AnOtIoBprrurL+nSadvPZ/nI6zBSOd74G8iKYlHjlxhSGK
         USn07FxYrgyBuEIA+f2Mxh4Oa/e+iiBOCs19euWtk22Fu/Z9qw8oaRo30nQiHAkryS6Y
         OkGFpD8kk5juBZ0pa8b2rWt/+dgD8gCXmdnRvQK+0MF8N9K8OaD4UraP7imW+XgEtrf+
         eVDcIqCbW5EuGYwj2bh4+gx/7LwAiCviv4k3pi6iA8Z/WIOSMsyBb/O9EBsYHE7ukUS8
         xokR0vi2c3FQE9t2Udn3bU0+uZ3i4ejbYLZGKdMm/LrvNqJ66BM5i1pvxlXY91KPTSBE
         Nynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=KstM2C1nqWzbgiq4lXjESSIV1F+sGBJqXZBKfIDDeII=;
        b=jN+xf6LC3kb77JDBDG2c+EgbVHKNeZ1d92DL4nb6/0pI3JOUO2TVQJeX6vY8Cb/RS7
         6WTmMxRVuRvoBAhwDXqgTQtJwNWYv19CiyP4JMnnOrGH513Aqgy7nFFT4F4QraVOKgpg
         6KCKLUeCWGBvbF0Zhvk1fPdoWOsBHV3VKLpYyJWafGe5zVht9ZvpR0ys3ILKitLPrhe/
         hg362eKmlcXkklQqIomuv+vbUxEZlNVbop1OCopfzgqw+IaQTJzQIlANHgW9whrYvCsN
         GwhJ0aCdtT/1VmLgKfxrhF4f5f9NamcaWMsL9pVjg0K5+KixlOr1C29wnCmWGvIYMQk/
         fU0w==
X-Gm-Message-State: ACgBeo2Fasbg2/YBIMfKGXwoiJ+OqzOEf0oOWiq+iKw2Chkb10Hdkj06
	7wPJTQQcDlkJSARUeBoLfYjwd8utQoJpVcd+a4WDng==
X-Google-Smtp-Source: AA6agR7XAy8+dRFXr1tYRU78D2cRU1qIJone22+JuKdzodOZmAEH3tkfVSaACFucoUikH/AMCJJ0BTbB6CoPorjLq5E=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr11290623lfr.647.1660166068361; Wed, 10
 Aug 2022 14:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220810010809.2024482-1-nathan@kernel.org>
In-Reply-To: <20220810010809.2024482-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 10 Aug 2022 14:14:16 -0700
Message-ID: <CAKwvOdmZvB_=JTeLg08uMFhEMpWga4FJey50QHjzCv_jMVpwkg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
To: Nathan Chancellor <nathan@kernel.org>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Tom Rix <trix@redhat.com>, 
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 9, 2022 at 6:08 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A recent change in clang strengthened its -Wbitfield-constant-conversion
> to warn when 1 is assigned to a 1-bit signed integer bitfield, as it can
> only be 0 or -1, not 1:
>
>   sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to bit-field changes value from 1 to -1 [-Werror,-Wbitfield-constant-conversion]
>           dev->gclk_enabled = 1;
>                             ^ ~
>   1 error generated.
>
> The actual value of the field is never checked, just that it is not
> zero, so there is not a real bug here. However, it is simple enough to
> silence the warning by making the bitfield unsigned, which matches the
> mchp-spdifrx driver.
>
> Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1686
> Link: https://github.com/llvm/llvm-project/commit/82afc9b169a67e8b8a1862fb9c41a2cd974d6691
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Ah yes, my favorite, signed one bit integers...thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

grepping for `gclk_enabled`, we see three drivers with similar
duplication (single bit bitfields):

sound/soc/atmel/mchp-spdifrx.c
241: unsigned int gclk_enabled:1;

sound/soc/atmel/mchp-pdmc.c
118: u8 gclk_enabled:1;

sound/soc/atmel/mchp-spdiftx.c
200: int gclk_enabled:1;

> ---
>  sound/soc/atmel/mchp-spdiftx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
> index 4850a177803d..ab2d7a791f39 100644
> --- a/sound/soc/atmel/mchp-spdiftx.c
> +++ b/sound/soc/atmel/mchp-spdiftx.c
> @@ -196,7 +196,7 @@ struct mchp_spdiftx_dev {
>         struct clk                              *pclk;
>         struct clk                              *gclk;
>         unsigned int                            fmt;
> -       int                                     gclk_enabled:1;
> +       unsigned int                            gclk_enabled:1;
>  };
>
>  static inline int mchp_spdiftx_is_running(struct mchp_spdiftx_dev *dev)
>
> base-commit: 15205c2829ca2cbb5ece5ceaafe1171a8470e62b
> --
> 2.37.1
>


-- 
Thanks,
~Nick Desaulniers
