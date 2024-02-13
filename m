Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C8249EA
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707820025; cv=none; b=LvLa/t4gWk1XjtWlKjLv77TzJOmyyTsMFUC3GtDLDI5U7Gz/W+nb230lnNhOJJIW5PS2gzf1dwL0B6CaIbquxKtZk3mgCF5wlfwDy84zosNjYaFo7AqjL66fHVdZwMwawE3/o7nEeer6qPkwNbpVKTYBwv9wNIchuJitq1Gsf74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707820025; c=relaxed/simple;
	bh=wLSgMc3bJnAeZo1CWOjEKBvGuJBI2cVzMzh2B5Q/wgQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U+FZicvt7fSLwYAc67ewXsSPd6r0+ZAGlQsLXDm4WYfsx7ow4FeekasjwXklp03HvPbFGEEwSj6OjzE0c+xwZT+gPvMN0zYv+9WtC6px+PX+fwURCsVGUNw7zsaMo9t/cUazq3LMtsvu9LK5UZDZFhP4kO+tlT1V/P3SHpomlz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NHgptVjR; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NHgptVjR"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d107ae5288so5819241fa.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 02:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707820022; x=1708424822; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4c3xyw/xCs2E5+LzzLXM5z0PjXuIuQUQWO5R/iXN6aQ=;
        b=NHgptVjR44xqu5ZHms+xgB+r/SO6rdG/+Dx0+Jb+VkLRv8K16mI7wL1sHItgW5VUXE
         sOsfLItq70gfudpMj6SzUaY1m18s+DL5nv36rLYQZaGSMbCNT0xI1R4dJBOvnODStT2t
         CqIVMn8KCfEs5iDXFAscQx+amRxj3JgR0aOplEBtdqXk2wPm5mBJ16LshewDkedTrU60
         4UYM0HIYpvsx2WuZKrqlk/Q2JO/sDlthd15lxRqxBqELDA9628DYtpm1TZRbY2mafnd0
         csoI5kfIipFd15RAVpTasHtV2jVTm4CSurpJmxKOGpUK3e/hs3WkPXNtOLt8WWI4UkqC
         f2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820022; x=1708424822;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4c3xyw/xCs2E5+LzzLXM5z0PjXuIuQUQWO5R/iXN6aQ=;
        b=ElyHQnCfYYvMY54vq5eiVki4H6g/NF3ltxU6gqv4kAn91vqlO2A9FEtZphv9spjLxk
         zS/2omIQ+nk0ocq3PFb83e+FC0bFKdA44qxUsFuowW3rk1mugASBXvI7By59SHNQHxCJ
         FRFVP1Vjh2kz0x5Koe3EaoCZNVsum6yVSZMwhFih5tQGAQw7jXr9++swyQcSSAaILbDd
         /REDPZH1F3Hd7nT4QYSrmGG86si+Mq/KeqMJ/1Ybkwx8rN00toKedJ2X2x5RTK5iy5H+
         fzM7qK/Aelm31fn695MZX2cul3DuKioa3PzOTXH/Isi5R5YcRBcV9ZAP68CjbZ8obPDQ
         l43w==
X-Gm-Message-State: AOJu0YyTGiyxUmXDwK9CKo8apSS+w3Cx0mtOOGzDmApaGqOmCbsab3M/
	0ea/ZVQS1fN7dcwv+F8OWIGt+jJTP4akXRGLPRVJXgRkeJg/4spJjsI5H1bDLI4=
X-Google-Smtp-Source: AGHT+IHuKNJR46KDTZkQXgqrkgiw2kQoSC8gATB3UY9HLdsK/ekr2G7xO4uo5qQhmNWx/uV2t6T5aQ==
X-Received: by 2002:a05:651c:220c:b0:2d0:d40d:9697 with SMTP id y12-20020a05651c220c00b002d0d40d9697mr2842108ljq.22.1707820021744;
        Tue, 13 Feb 2024 02:27:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzDhobkhGIrG9q3xJKC52MHcTtp+goBN6WnDQIxmINkGbfXWF5gOZT2IuchNi/rudcx9drENluvxSSxYwPBrVa/Yo0/AWzlRHPOakw/5Bf5hILiF2b9Zv4CqR2CsLOZAqLORBeLd3Zccmw7w2aPDZH7hkWyTGJG8MHPf8ydbI4giufHmVHFdOmR4RzrTqpop1Z++TKxRhTlM0zg0a+5f43yUWASsajh4ug7bha92YREyrHr/JUlHM3Qz3W6MP8PBahCI2WTKCTFU1l1JKrwvSB3tlJco1IEs8ucKtet8HGDQVzg4wzvMZjchnrfUzuHyi3J4r6CQczFl3cYqU2nifdn6niH13N0lo0KmR8NF8A8YJsU1LBWS+yHqAgF1J5MZIM/ZyKjt843pGPFBqcxh2TMF0eKQb4svjyWv3w8bx+I2QazSSvqgIOEFh2rEI5jlDFgM2P1tsnZcnMEXQH2pspXol4oBkMDhCWJHrk8VmIYOk1PDrV4ahV/WFejiGpYlE6zyEY70OAwpCogiEcvS8LlbEryzohGfQQtfKcxyeRlpFDM5pR7YyROzSzXVodK7JKIY5xscPk8IID+Yo2w3TzMGScXrsAC+8/+O8iv8DNbKLqGTg=
Received: from ?IPV6:2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b? ([2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b])
        by smtp.gmail.com with ESMTPSA id m10-20020adff38a000000b0033b0d2ba3a1sm9161150wro.63.2024.02.13.02.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 02:27:01 -0800 (PST)
Message-ID: <01bdaec0-c926-4dbb-884d-2215981299ab@linaro.org>
Date: Tue, 13 Feb 2024 11:26:59 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240213101220.459641-1-arnd@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240213101220.459641-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/02/2024 11:11, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Casting between incompatible function types causes a warning with clang-16
> because it breaks control flow integrity (KCFI) rules:
> 
> sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    243 |                                        (void(*)(void *))clk_disable_unprepare,
>        |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>    406 |         __devm_add_action_or_reset(dev, action, data, #action)
>        |                                         ^~~~~~
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    274 |                         (void(*)(void *))clk_disable_unprepare,
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>    406 |         __devm_add_action_or_reset(dev, action, data, #action)
>        |                                         ^~~~~~
> 
> These two meson drivers cast clk_disable_unprepare() into a different type
> in order to have it automatically called from the driver relase. Add
> trivial helpers to do the same using correct types.
> 
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/meson/aiu.c   | 9 ++++++---
>   sound/soc/meson/t9015.c | 9 ++++++---
>   2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 7109b81cc3d0..211f360df284 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -209,6 +209,11 @@ static const char * const aiu_spdif_ids[] = {
>   	[MCLK]	= "spdif_mclk_sel"
>   };
>   
> +static void aiu_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>   static int aiu_clk_get(struct device *dev)
>   {
>   	struct aiu *aiu = dev_get_drvdata(dev);
> @@ -239,9 +244,7 @@ static int aiu_clk_get(struct device *dev)
>   		return ret;
>   	}
>   
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       aiu->pclk);
> +	ret = devm_add_action_or_reset(dev, aiu_clk_disable, aiu->pclk);
>   	if (ret)
>   		dev_err(dev, "failed to add reset action on pclk");
>   
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..e0f9a603a5e9 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -243,6 +243,11 @@ static const struct regmap_config t9015_regmap_config = {
>   	.max_register		= POWER_CFG,
>   };
>   
> +static void t9015_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>   static int t9015_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -270,9 +275,7 @@ static int t9015_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> +	ret = devm_add_action_or_reset(dev, t9015_clk_disable, priv->pclk);
>   	if (ret)
>   		return ret;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
