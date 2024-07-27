Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C756228DD1
	for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722111742; cv=none; b=G8f+Y1YHFmClyqLxQeOTF/bxgv9VVziMNkjxs8MC+buJbCUuWVmSszU3rkE1CkGky/rYNxrpJNZIwQuaC6xscqw6vrIxuGtPTs88jwPL9DCOrxYra7svq/altNP/TUKZRgT/qnLB4CMmiiUKtYOApEEBIyK5U61ylJAmMvTxF2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722111742; c=relaxed/simple;
	bh=kHGL1U4vzMPjvspLRMbkYBQBI26OdTx3BOt3JS1aT1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXGoHfRQmjNGUKikJ9vwM4gsKDP7KqVwUI6UHQeVfjt/r9vkiniBeHbbQuBf1YPQt8QAnmC0L1FYNJHBBbp0AlK53NB59TuJzMLTiMIudSMBFHb189/LcPtl6doeS1TSy3Pgv/ESLa2aR1k0iUKyhwow6nFjaHgSk5Y8Vrsfnys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BamznoJ1; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BamznoJ1"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so29113341fa.1
        for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 13:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722111737; x=1722716537; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Huc0K8rSvsCtHtQb7ohCUWF9mvI2cqys5jRNGU3Q/E8=;
        b=BamznoJ1S2lEe+Dko8RiKCHVORH+6JEOKH5LGFGIOOZgDbyF0EjEpMVyaGN8Cs6tZ8
         d63DyORlpqn3IRk7MtkaOFMOBmW05p9S+6wf+7cOSLtzH2lGr5dh1EuED5oOmTe+FqN1
         tn1LIpFy8CSE51A1J+YLsEJ97kwlRW3vVcwYUkyfb1oByvon8bQ6nHfhlFAQ8/3u1xUs
         DBeJqtTU8Rx91SO7TzbK+5JPzngqcJwPFp4wIyQZMbT3VXicg5/GbDFxETZ10nRtFtwO
         ELCFw8iZrooLRQooTsQ305y+G+NB7oQVYr8hl+R4rId9jARm1YsB7NWp311FC5uZhAwL
         GjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722111737; x=1722716537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Huc0K8rSvsCtHtQb7ohCUWF9mvI2cqys5jRNGU3Q/E8=;
        b=vmxKdcK03OjIAw8gnZE22j3Av116+R16S4Usqvoyt6W89xQKXsXlFXMqTBnmJbLjx+
         EYHp52Nwol/sBGlNcRIFX4REL6YNu5D3aBGq57sKVXAAkjXtpeK3mdVFiJsdtytCQCl3
         YTrUxUx/Y+sS2P4MLU1o1t7jqjHZ4VvOxkd6N2qcdla6e0Q+x1+Lpe+ycLPBVPGu67Bx
         lgUw9uSrxr7z8kx+G4wzmZBV9rmoTPfodnTvY+e5bROEuSX4MiYvLxtXE6nMQmB3kUQU
         Z0kI9iUOlbr25PhKKixYt3vy8QBhiOB+Dsl/pLQr7SCC9l+OAbJX8LCQYzV7tZ/fMbV/
         ogvg==
X-Forwarded-Encrypted: i=1; AJvYcCWZj6/oo4E3FSsm4+HpYEcqtSBYwbEhEih1pgfbBrd/BECUBFCpCxgsii1xmIkINQqquAUO+5Hd4YPwzux1/NXrzMkmDg==
X-Gm-Message-State: AOJu0Yym2JIRl6XFypZnTRsEARCeFFqFDH9edb7+7QnN6TE8u9mmu55f
	BEu2qSFy1tQm1VjU1x/ngnHqd74tgHib4GpJjMQk8X9/s9uFIlPsYApCIYcd690=
X-Google-Smtp-Source: AGHT+IEAM19ZrUTa03e6rXgthK0w+W59uGj7mGDLlSdELDkmYK6fX4CrolrKItgRARpBhijKL3BlCQ==
X-Received: by 2002:a05:6512:3416:b0:52c:1d8a:9716 with SMTP id 2adb3069b0e04-5309b270b3cmr3069385e87.19.1722111736812;
        Sat, 27 Jul 2024 13:22:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c08e9fsm843335e87.134.2024.07.27.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 13:22:16 -0700 (PDT)
Date: Sat, 27 Jul 2024 23:22:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Message-ID: <hyjoqu6w4oqv5i4hvuewtgod3ngdkkanzokz5k2uh24gce74jw@ne5ctq7bfzv4>
References: <20240727182031.35069-1-a39.skl@gmail.com>
 <20240727182031.35069-2-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727182031.35069-2-a39.skl@gmail.com>

On Sat, Jul 27, 2024 at 08:20:24PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)


[...]

> 
> @@ -320,6 +331,9 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->spkr_iomux))
>  		return PTR_ERR(data->spkr_iomux);
>  
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "quin-iomux");
> +	data->quin_iomux = devm_ioremap_resource(&pdev->dev, res);


This will still print an error if there is no quin-iomux. It's better to
call devm_ioremap_resource() only if res is not NULL.

LGTM otherwise

> +
>  	snd_soc_card_set_drvdata(card, data);
>  
>  	add_ops(card);
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
