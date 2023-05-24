Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC06085B
	for <llvm@lists.linux.dev>; Wed, 24 May 2023 13:11:19 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-561c46e07d7so13800677b3.2
        for <llvm@lists.linux.dev>; Wed, 24 May 2023 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684933878; x=1687525878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MvZGpV39H6LWTzsLCijgX3+057w1b33nSMugKocz4KY=;
        b=RsvzRBXyg2HzzC8gG/xUrb3Dcbh95QtFJlZpWi84s1DTAD4gjXpoYWLi+17/llgvbf
         HI7yORJ0R55Nldwipx8Wm6J7sBRt6mrIHuXA1LuG+r5EvowNzPEqJXT1FQH/+GutYWo8
         Q7Hxu2TjrDn3gDyqBzedoEuNCNPvHx9ndrVCgweSn1Li5ysK49zalz/MpKS0vElza29t
         dKVbq13lqTLptPwl/a3lefmYJUtRiZwl9+qEncUDBcN02oMz//XsTZX5Jmet5v5v5uNh
         JxZYwwsjFmnt1Gx1/stRgiBlzbd8NbUvXDVJ2OAjiHgNAegX53HAaQeCuluAG4D1tPiw
         w0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684933878; x=1687525878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvZGpV39H6LWTzsLCijgX3+057w1b33nSMugKocz4KY=;
        b=HjlsR5+WQWaa4b/JKHVHOHwL/DVAIlTTiKwtD1tzilYDGojoA0vUbHgN+Ez2f7HKVR
         nWpmTR3G4j8HZZZ2b8MX322i+Ay3F/TLVcQzTSe1f9izPgaY4WsYJxznzzi0G2p/UIn4
         yHp3BTVjxoWAFH5uTQsNWZANgm/6ZlQWrkRfnW6Io6UBBgICHjMAGJbnLcBVALyYMnld
         rlBFZnXFLA+aBnUAfnpuTKjJwjntQFiwKXEq9sOt3dF4ez+R2KX06Xz2PibfX/vQjfQ4
         6ugwtbdFluGtHW2SgenhuMnwlPbyDRntLyf0fmGV9P4VeChhV07C7uJBtrDXF7baHX0q
         RynA==
X-Gm-Message-State: AC+VfDwstaK0Nmj+eBAg2YrmyeK3ELZpGzgvgDFFt532oxxoAyCK4q9S
	6cyKBB60KlEG2UIsl++o4ToZaAwDwbh8dqeuuvgkww==
X-Google-Smtp-Source: ACHHUZ7Mrhuw8pccSbQf9WGKebUOBDZeHw5kYpBk2mDjue1to21G1j5Hluqsi4/jn4RAAvknTppQxiz6JmxokHmHIf0=
X-Received: by 2002:a81:7405:0:b0:564:c4db:6329 with SMTP id
 p5-20020a817405000000b00564c4db6329mr15659384ywc.11.1684933878470; Wed, 24
 May 2023 06:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
In-Reply-To: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 24 May 2023 15:10:42 +0200
Message-ID: <CAPDyKFpj2BNEUTWeFZLWL-VDze9Ravw1SDEM=Zhe-v2Ov2udhA@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: Avoid cast to incompatible function type
To: Simon Horman <horms@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 May 2023 at 14:39, Simon Horman <horms@kernel.org> wrote:
>
> Rather than casting mmc_free_host to an incompatible function type,
> provide a trivial wrapper with the correct signature for the use-case.
>
> Reported by clang-16 with W=1:
>
>  .../meson-mx-sdhc-mmc.c:791:38: error: cast from 'void (*)(struct mmc_host *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>          ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
>                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  ./include/linux/device.h:265:38: note: expanded from macro 'devm_add_action_or_reset'
>          __devm_add_action_or_reset(release, action, data, #action)
>                                             ^~~~~~
>
> The same approach is taken in litex_mmc.c with the function
> litex_mmc_free_host_wrapper(). There may be scope for consolidation.
>
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Simon Horman <horms@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> index da85c2f2acb8..97168cdfa8e9 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> @@ -776,6 +776,11 @@ static void meson_mx_sdhc_init_hw(struct mmc_host *mmc)
>         regmap_write(host->regmap, MESON_SDHC_ISTA, MESON_SDHC_ISTA_ALL_IRQS);
>  }
>
> +static void meason_mx_mmc_free_host(void *data)
> +{
> +       mmc_free_host(data);
> +}
> +
>  static int meson_mx_sdhc_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -788,8 +793,7 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
>         if (!mmc)
>                 return -ENOMEM;
>
> -       ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
> -                                      mmc);
> +       ret = devm_add_action_or_reset(dev, meason_mx_mmc_free_host, mmc);
>         if (ret) {
>                 dev_err(dev, "Failed to register mmc_free_host action\n");
>                 return ret;
>
