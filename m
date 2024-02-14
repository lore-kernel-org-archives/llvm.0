Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6CC38C
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 00:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707870434; cv=none; b=UXenNpdvfDz0EEDZOz8bS2rYNNfR3EODrHXhNa1ZjjKuAp25ny845QqJfTi9X4/DF/HixITyTuVWJV4em5FTJNtal8G+ElRwg8R0Vb3ZhnU0KtRa3DwB0oWCGWxZLK0naUV8H17upgGUdr2nuyb7dpUk1qAuQPG8SimPJg+044U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707870434; c=relaxed/simple;
	bh=yDHy5RDbymgdUKbLBpcBU7q0gdC36wyOUaU6V100yVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTqFstdvgNOGpxW3F3NalY74cdAlr11Y3N6lKQgCLrKz3lwQPEK1s7VvzduhSsuBf0udw7pU6Du+zKlQtDkaBtIxdAghKxze2Pnilp0MUSs+BvjGdYUeZQTPeCTeWJW0Ldu9FRl3Ol9hj4etpfoKNnFxbN+pEq+dj1H9RP1IY9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xlX/zH45; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xlX/zH45"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7c403dbf3adso254487539f.1
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 16:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707870432; x=1708475232; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5T7AJQgyciJK6sFO1yWt0ErtUqKT+irq43WlU30JPg=;
        b=xlX/zH45NgsFBTsSW2uOI/74hR2N4WvR86KdWzJ4kgzW0Ubhn5LAK/uKfMRjhvLveS
         dj1P4RUV6bcUMYQdCsQ/6CRvNH6otG/0Uh7Eq22P9P3BhElX+swuDKnigl8PhXbx75nX
         Pb5jGVd/QfmreT4nMjAh+k1pwTJuJkvVfSzFpmdkoMvnFPbwVAjp5jUvwEHM6kFI4EOW
         tK2BFbiQHTQ6Rl11gagCQrDpzWqJfhv2dSYcH3nhAxD87Z3R5NBkPSvAA3gDUFLymebS
         kZJFtIJLARK2byO2m/NdDXd1WMhOKPZwWTzBGChGW7c/rzyVHx7yzTCuPgMe+JhTb1Mu
         bQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707870432; x=1708475232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5T7AJQgyciJK6sFO1yWt0ErtUqKT+irq43WlU30JPg=;
        b=QSBTD+D28IUXwE+gbyBvnF8yoE69ylaZUcMF3Mk+k+U4nQeMZw6+y3YPg79k97m1aT
         XlsStnBVOQxOJWsGPrz3Ktt+oG888pjhEUYdeckOS4xgUq2DRX1Kk3+B6iaoABx/kP1a
         FuV7RGIi9GFCUQ/9hVLc63Z7ByExBD/oAe5LJwVp/AM+GQtGBtlZAjeXckY6Lom969yN
         BpnrIWFuZb6hnD5NM4C5V6zpvW1LrllMUHCiuSGrt3tD2fNjfr84uqKXe6b+c8vUwl1I
         OxsjDFuicSqfC7B72W1VM6xYZAgalp5N/w3mWD8F++4HTjAy5BKfq2EfsSHl9Rt19VT5
         82Fw==
X-Forwarded-Encrypted: i=1; AJvYcCX2P5Rr1GGuKydknGpL7UNwLmofAsT7VsBbs+iQ1m6hYmFgQ4eW8TLVZptsxi01Q2pM0XLmx/gQqidG60MKwdzKGI9hTw==
X-Gm-Message-State: AOJu0YynQjQa22EUaaj7m7cPm+Uqz8X6d43aPE7S34JBdqYZON4Rplc+
	bmK11/7XhgW7k75n/w7HE8BhImvPJBULob2oTxypFfaaOdzYVrp6ckiyUrO/Sg==
X-Google-Smtp-Source: AGHT+IFlwS590K6G5HLkJzVAbnXNA3kjuDrNpfVIBkAOMMF2uKbvfvsNtgUXwFSf/vpyKj4XnjzfVA==
X-Received: by 2002:a05:6602:1c3:b0:7c4:19c7:646a with SMTP id w3-20020a05660201c300b007c419c7646amr1528777iot.19.1707870431645;
        Tue, 13 Feb 2024 16:27:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKbZdIao3MuWR588UKr53QbpcAZKhB9kXOjFoOwymzV+XRimiyLDuoM9Vs57HxOeDppfShIb00Z/u6rJ/tcurfJC3aTiIHy1JRA9nuzvdJSQyVigWL++i27Tg6fIAUmRPs3pe2p+FtKb8rdbUMwpszXHSfCYQ8lYx38ofWsyV43KntDzujWzjLLSYTYoTLz3/NQjxi7/US3Au353TFVbFIwDOwxfHDJfrUod67S4qui5i1m/1IHpqXQQ8wnRjb8MTF97izsHtcc/FdPHceEDqvEzUcFd3/ar9ByItkSBO9/+ufMNWKR/VqijYcxsIvZSPceDEMFIXWklvAyj1SFYHkWcQ5tDpEWTfPAvBv2CiYeyyLsoEeJXsoz8uTOZZuo2pDMSlEFzbAPlrHbAeBfQJJPM17PdZXYkPCbH0wUEjQyBL/W9YvrBKJV/h/Xh6m+14cbyX11OSRs9vYRixUqjBQBfEct7pfYePjSPdHykil6zADzWKQp4GEBbBYxlESGl2IAPVmFP5hsrMppTcEWxjF2HY22Cx0LgkOQRCIACoGIRiPq0cj6S3iAoDhbjgIvMmD+SLjXHsNtqaZMzM=
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id cp27-20020a056638481b00b0047140ce03casm2180833jab.22.2024.02.13.16.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 16:27:11 -0800 (PST)
Date: Wed, 14 Feb 2024 00:27:08 +0000
From: Justin Stitt <justinstitt@google.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] ASoC: meson: t9015: fix function pointer type
 mismatch
Message-ID: <20240214002708.bhpvpt7cv7o4os5t@google.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
 <20240213215807.3326688-3-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213215807.3326688-3-jbrunet@baylibre.com>

Hi,

On Tue, Feb 13, 2024 at 10:58:04PM +0100, Jerome Brunet wrote:
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
>
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   274 |                         (void(*)(void *))clk_disable_unprepare,
>
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
>
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  sound/soc/meson/t9015.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..571f65788c59 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -48,7 +48,6 @@
>  #define POWER_CFG	0x10
>
>  struct t9015 {
> -	struct clk *pclk;
>  	struct regulator *avdd;
>  };
>
> @@ -249,6 +248,7 @@ static int t9015_probe(struct platform_device *pdev)
>  	struct t9015 *priv;
>  	void __iomem *regs;
>  	struct regmap *regmap;
> +	struct clk *pclk;
>  	int ret;
>
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -256,26 +256,14 @@ static int t9015_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, priv);
>
> -	priv->pclk = devm_clk_get(dev, "pclk");
> -	if (IS_ERR(priv->pclk))
> -		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get core clock\n");
> +	pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(pclk))
> +		return dev_err_probe(dev, PTR_ERR(pclk), "failed to get core clock\n");
>
>  	priv->avdd = devm_regulator_get(dev, "AVDD");
>  	if (IS_ERR(priv->avdd))
>  		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
>
> -	ret = clk_prepare_enable(priv->pclk);
> -	if (ret) {
> -		dev_err(dev, "core clock enable failed\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> -	if (ret)
> -		return ret;
> -
>  	ret = device_reset(dev);
>  	if (ret) {
>  		dev_err(dev, "reset failed\n");
> --
> 2.43.0
>
Thanks
Justin
