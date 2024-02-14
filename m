Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A39C191
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 00:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707870183; cv=none; b=QkmfA4kf2DVdNozj6TNTpNjNnzWg69ruoHT/xkNeS+7UhpkEFk7KxFB8+FdbjFdAwzvlijn4w/TJ2hizqmEz3O+8rME5UVaoEwmJixrGTHL3I8tKpnjsR1oTAle4cRfrSnLESrLDc+f9wzaqzy0PGkoxodXaC6Sc41K7PmoDCuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707870183; c=relaxed/simple;
	bh=ds1jHombM1rmzITyFT/LkXRFY7v4NO/aeENbS+5oo6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbthYt3HQJl8cy57eJIcaKncpPeU0nNOJvhzbZSA3EvcNU5wXmSSGt3Dk8WsCtjma+d2fyMOh6ttaBtM5gKeDdxLHx6paWadaGtAMzmrApMP07S7t7sfgVbe17poB0C2khIdb5zRfDGNCYnss2bf6KteMoUdGH/VUv0Ub0pPHc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UKGkNUX6; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UKGkNUX6"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-363b5ce4260so14509955ab.0
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 16:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707870180; x=1708474980; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jWP8VrxhP1EJOZNrm4lfKLrk9GA9+9HRFG23gj3nBY=;
        b=UKGkNUX65WmRDSnJbb5m3mJfGtXiAG0PXygN06YSo4bIIO5/h64qOMQLJUFi3zzWnO
         NV0wcNnJmpuNWbJhz9k7M3d3jAh/Po/Yl+5rQPPj3FoaXLE+mzj8zS4/ETsj1J/8A+ul
         RJHvW2Tr0gQcoCiMU0PAVEBbktzk5EBoQxhs7H2txDkMrzP99cDLfva/bOjLlEy2xB/L
         3e8vRpuJd3K5W6o7KArw5KyxnXGyGX2vT4vfOiRiAhBKZ7yKMc56dj+Mc4fHkzOg3D1Y
         c6n9avJSEmzgfU0Kq5Invd98+7o7O8VYpn1H9cUJlOFuDqt4X/aC30jNkTA0uvJk4EK0
         HGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707870180; x=1708474980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jWP8VrxhP1EJOZNrm4lfKLrk9GA9+9HRFG23gj3nBY=;
        b=H0+tU1Yenv2huXOA7eE2leXDgz1Hs94Kp8gC30AND0bpmAFJA2dHxK2fDMt4lKVhcb
         CrSjUs4mt2tDPBYwx3dxdf4B6gKZCBUMY2cHgIxAZVEAdGoce077w20mmZ31/ZgDlf/w
         QYMsndQ3hzIAAmWrXf3uQIMMsnt8erVzUQqSBj53KTIxeHNndHrwirmrZ1ZqxdX8ElOk
         ba+9ipHQUAh+oAbHxZVCiXCL4FDTk9kIaAVVDEAxa9WrPwI7/Pk1rGsgVGk7lq8m+jXC
         d1MnlPJ4ERu4c7nZ6w3jN2RHMsbnMh8NECVhkDPJnM6JNjm+ZQ5mmG3+Um3IHypArj2D
         yzaA==
X-Forwarded-Encrypted: i=1; AJvYcCXblB5UnHAXekVDmob8637TIlzgm/JMxCBXfd5AeZ9CvDhU6WhX8CqDSTgKXyTUbuCWJ1tEp3m5/BNk0UZHdjk17AcXSQ==
X-Gm-Message-State: AOJu0YyCYKO1E4bPABXXd1iTw39+Ql651xxQdvxKaTFcQrnd4bRnpSWJ
	Rr6jXfkYhRu5LNzoS9swUzcpUl60o35ZSItQGiHlk9IvCjcm8VfQ0NXGishmmw==
X-Google-Smtp-Source: AGHT+IGi6VVf6G6G8U5GGlsAZixQm5utU4tQarB9++MQ9JBSEGLE5FtrB605cWFIAkOkehjJn7O4vg==
X-Received: by 2002:a05:6e02:dd3:b0:363:9eb7:46ce with SMTP id l19-20020a056e020dd300b003639eb746cemr1293877ilj.11.1707870180370;
        Tue, 13 Feb 2024 16:23:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJKMkm18l+fATv5w8BOBEKdFq5seFQbl5h8/yelfPushV4gdBWN7jKSCWpz1BhL0Sti/1SuJTgYJ/fcVNH6XkrSm0NoaHSTSiI/fHwLilNsRJJtzimpBrGCTjtT9d3s2Ax3XegIe224IxqH7rcEwDA/kG7pamQItEMG58Jw4j5Ztxy29vglNeTsEkMdK0qDj8iMdP55M3/SCtxrS7QqjBNmHKuqoD07nm1SOMqL4/+aRObxOrky5V8t79knGogtBK/fly+mKEsz6LWFLZ/wRwleXiVozK6opOE16Q1C7tq1q89SonCNFWA89DU4D2TqFFavCW50sbPG+21GohBloHyGfw0ifOY2bFFrKJpEW3nXIMdIk7lVG+8R/xWdpNr5QXw1S7YliqMm+3mZOK0/P1E6lS9JjXddM/7Krxk56meFswS3dbQgAEWldQtjWJza6FMFw9c/mH20D+fWerx4TZ/afCihkwC1TzV+rBBmcZJRaKcldG2sFu38nMuPrF6aGgtI8dpeqPq8y0bVNRQfBUdTcdcWkCYI2pY3Cm0qX1G3/4M+87FoJzMfaTmNQydVUReHzA5OP8dyUn5MgQ=
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id s11-20020a056e021a0b00b00363a91effdbsm2807134ild.76.2024.02.13.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 16:22:59 -0800 (PST)
Date: Wed, 14 Feb 2024 00:22:57 +0000
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
Subject: Re: [PATCH v2 1/2] ASoC: meson: aiu: fix function pointer type
 mismatch
Message-ID: <20240214002257.bfp6wk5j3wsaq6f6@google.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
 <20240213215807.3326688-2-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213215807.3326688-2-jbrunet@baylibre.com>

Hi,

On Tue, Feb 13, 2024 at 10:58:03PM +0100, Jerome Brunet wrote:
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
>
> sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   243 |                                        (void(*)(void *))clk_disable_unprepare,
>
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
>
> Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Silences the warning and makes the code more readable without adding any
new helpers. Awesome!

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  sound/soc/meson/aiu.c | 19 ++++---------------
>  sound/soc/meson/aiu.h |  1 -
>  2 files changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 7109b81cc3d0..5d1419ed7a62 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -212,11 +212,12 @@ static const char * const aiu_spdif_ids[] = {
>  static int aiu_clk_get(struct device *dev)
>  {
>  	struct aiu *aiu = dev_get_drvdata(dev);
> +	struct clk *pclk;
>  	int ret;
>
> -	aiu->pclk = devm_clk_get(dev, "pclk");
> -	if (IS_ERR(aiu->pclk))
> -		return dev_err_probe(dev, PTR_ERR(aiu->pclk), "Can't get the aiu pclk\n");
> +	pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(pclk))
> +		return dev_err_probe(dev, PTR_ERR(pclk), "Can't get the aiu pclk\n");
>
>  	aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
>  	if (IS_ERR(aiu->spdif_mclk))
> @@ -233,18 +234,6 @@ static int aiu_clk_get(struct device *dev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
>
> -	ret = clk_prepare_enable(aiu->pclk);
> -	if (ret) {
> -		dev_err(dev, "peripheral clock enable failed\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       aiu->pclk);
> -	if (ret)
> -		dev_err(dev, "failed to add reset action on pclk");
> -
>  	return ret;
>  }
>
> diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
> index 393b6c2307e4..0f94c8bf6081 100644
> --- a/sound/soc/meson/aiu.h
> +++ b/sound/soc/meson/aiu.h
> @@ -33,7 +33,6 @@ struct aiu_platform_data {
>  };
>
>  struct aiu {
> -	struct clk *pclk;
>  	struct clk *spdif_mclk;
>  	struct aiu_interface i2s;
>  	struct aiu_interface spdif;
> --
> 2.43.0
>
Thanks
Justin
