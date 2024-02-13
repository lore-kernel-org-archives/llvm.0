Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D023754
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707820829; cv=none; b=QX3cgDVhzH27Wc442wYKUMklwthFXjbg8eTNSjbDQRBFLY6CgoLdlbeFgqTb5q04+sTliLKF7hc9rgwHbItAdKy9g7t70U4vuTObIZzNR+wUNMzACydzdYuqIgQ61yA51fQZWvgBteSC0lia2UFyrcWRn09EtTUAjWS+fhMJiHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707820829; c=relaxed/simple;
	bh=krsCH14lzt/9Maep29rwlQil5zrN1KmqSS4gA+WXvOk=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=WCkGyWTBYYn+uI3L7yNhLClmV80iQT8IN9nQ4cRDslLJSy0Sx/+SoQjQDa0ugpfU4kxlVL8/WJ/ynyNGRDYwHd0TQcye558MVSXKgB2IPlu6x7AaOqMKsgWbP60MoYUgWESY4dsAjevc8cRY4kp1LhsMVGrBoAdceNdeJSonOxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZUVYeG7k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZUVYeG7k"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-410cb93185dso15772095e9.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707820825; x=1708425625; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=73nQOWwOG85LqUQijwY3y2kTDnNiZFOlELYxkV2QtZQ=;
        b=ZUVYeG7ktyVFh/nMdDSps3kctpEThOHbSO2/OUP640RrvVk3isWDvdSQSpvV7ZgZjr
         Gxtg05idRv8VdvDD9H4re023WYhjItZeL1Y0z/yPk9egQJVGzfwCyYB9qxxS2jPwuQ20
         nA0cj2Flbm5SGlLDgrT1sQPQrr749n406vlBGPQDVH5gWHmxOudyHAkTksb9HxLYTJAJ
         CKOpjg/LZEimtUX37XxCtplFRcA3k0e/7CtK8whAlpAO7RkErI9Gt+kF2IvePKgx0u26
         U2ILV1FAFI2tpEei3Xyqwj1ggbyC3Y1XMG/91fgxCd79lH8aFXzt7+g7jmuS5fZ0S1bT
         yswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820825; x=1708425625;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73nQOWwOG85LqUQijwY3y2kTDnNiZFOlELYxkV2QtZQ=;
        b=wjdttFYJevt3s0RvS38hlI1FpRIek8b1kC3AhU/5HGJdFgdIfhyy7TlLqY0QIwzJky
         jHAP0TPnpzL6gY/ZcnxKnq8gSRBt5s0+QXyLDeYOLHqQi5KhVS+cIzzFQ6kHQ9CCafD2
         3euH3TrXoCc42lfo/VWAjJhqtMftV0OzeY1f/H0oZBhhsJDrJHLcXfrpLcPHV1QhKmpJ
         WE+P3mZjGYrlNTI69YM2LNWwhME4W6Og3bDadA5587rJZbRFBKB+OQ1Dg2lYfdF/mJLH
         0iU81MbYq/TLjMGIaQVInyCSbjSW2OFDMVslLV+1f8phqZjPGbvX06rZKCGtxfoc595J
         ZcIA==
X-Forwarded-Encrypted: i=1; AJvYcCW941DJn1nkD8UN9y4KCimSUXadWugECm2CkY0g5YCeGMdoncWVKk+pv2VzG0va/Cpz6YMV9F2PUqJQC6Mq292KDQnnMQ==
X-Gm-Message-State: AOJu0Yz8fd+Rr1uT0HcwoqvGSf+Yeyh8P5+FrkFns/AAjaGL8+alMyIb
	aS3KlGjTzZp1vufBhB0iqBhLlPu8nyh42foQXxJXErYL8bFgEh3c7ncorFAqjjo=
X-Google-Smtp-Source: AGHT+IFE2dDl+7H9jhreEKYF+PUjtVPBRcNJ1aERTrrwwC5G4DL6A6zOSd3wAcqga8EO4wTyXt03Pg==
X-Received: by 2002:a05:600c:35d6:b0:410:bb99:af83 with SMTP id r22-20020a05600c35d600b00410bb99af83mr5171034wmq.23.1707820824810;
        Tue, 13 Feb 2024 02:40:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmcpbchwPyNzBfnbLcEYhaLnxRQSdBvMKjGg0MfaCh7YWyITG3KZKFcRYjfwe4AlHSq1gIXWIjsiVyv1IInLv1tZVd8zmquscCy1pDKYwdz6ynaEkFHraLMWSkLqh5TRj+L/JjihgJpQCVLPbPVfylHTV3batPXQXXindEdpdMqE0SUk5RUOICCx9f4Eb8h5DTJ8vDSxJbXIeNoJfFhXRq8lNOY7jMZ0c+xcyncspd16YHa0IkYhvVU1WUQqEArUfvTF+SOUM4Dt6OU0uFU2i45yO6k7zltzOl+BYRYI7XlCDdoZkIcl6ELjYAmedeiuco7vlSNcPnTNVtdkYiXPyrZF4K/En7BMlacB3N5g8zIxanpUjM7LvvquL2djRo3o6JaZB2FQXw7cwz+qwougFRtQ5bk+HRzQ8Ra85TnWjlTyaRM3YUC2vSlcte05ZhhsU6FN+8sVvI8CBvm84Yfr43mveqKKKtpCM3lfNAJocWu3ZsxvGPwGF945dM0y7mcsU7DT3vSkHlfGIfh+vu1JdHCc99fhNPmRDiBz88JQwxFhk5TEvCYmvJFBeL6rPDrBlBgM2F5Ni3KdJGf3GhrGtWo9/OtDGksh6UCEtuWoWIVDh1P6usyEPmTFpYFe0IEzH8GUOB4to5Jo8wRg+cp9MHbcK38SJVltJ8NNXA
Received: from localhost ([2a01:e0a:3c5:5fb1:509b:4241:48a3:e3e0])
        by smtp.gmail.com with ESMTPSA id m20-20020a7bce14000000b00410e0fd6179sm4811973wmc.34.2024.02.13.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 02:40:24 -0800 (PST)
References: <20240213101220.459641-1-arnd@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jerome
 Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Date: Tue, 13 Feb 2024 11:36:28 +0100
In-reply-to: <20240213101220.459641-1-arnd@kernel.org>
Message-ID: <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Casting between incompatible function types causes a warning with clang-16
> because it breaks control flow integrity (KCFI) rules:
>
> sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to
> 'void (*)(void *)' converts to incompatible function type
> [-Werror,-Wcast-function-type-strict]
>   243 |                                        (void(*)(void *))clk_disable_unprepare,
>       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>   406 |         __devm_add_action_or_reset(dev, action, data, #action)
>       |                                         ^~~~~~
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to
> 'void (*)(void *)' converts to incompatible function type
> [-Werror,-Wcast-function-type-strict]
>   274 |                         (void(*)(void *))clk_disable_unprepare,
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>   406 |         __devm_add_action_or_reset(dev, action, data, #action)
>       |                                         ^~~~~~
>
> These two meson drivers cast clk_disable_unprepare() into a different type
> in order to have it automatically called from the driver relase. Add
> trivial helpers to do the same using correct types.
>
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/meson/aiu.c   | 9 ++++++---
>  sound/soc/meson/t9015.c | 9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 7109b81cc3d0..211f360df284 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -209,6 +209,11 @@ static const char * const aiu_spdif_ids[] = {
>  	[MCLK]	= "spdif_mclk_sel"
>  };
>  
> +static void aiu_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>  static int aiu_clk_get(struct device *dev)
>  {
>  	struct aiu *aiu = dev_get_drvdata(dev);
> @@ -239,9 +244,7 @@ static int aiu_clk_get(struct device *dev)
>  		return ret;
>  	}
>  
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       aiu->pclk);
> +	ret = devm_add_action_or_reset(dev, aiu_clk_disable, aiu->pclk);

Hi Arnd,

This probably pre-dates the introduction of devm_clk_get_enabled()
It would probably be better to use that instead of duplicating helper
functions which do the same thing.

If for any reason it is not possible, a common helper in clk.h would
preferable I think.

>  	if (ret)
>  		dev_err(dev, "failed to add reset action on pclk");
>  
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..e0f9a603a5e9 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -243,6 +243,11 @@ static const struct regmap_config t9015_regmap_config = {
>  	.max_register		= POWER_CFG,
>  };
>  
> +static void t9015_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>  static int t9015_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -270,9 +275,7 @@ static int t9015_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> +	ret = devm_add_action_or_reset(dev, t9015_clk_disable, priv->pclk);
>  	if (ret)
>  		return ret;


-- 
Jerome
