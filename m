Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173ED1DFD8F
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963622; cv=none; b=cqEet1Vfje/NqYNTmrTI5kbdffdB9/98gXXUmxcnwj/L4TqqPWFJkPlnqmwQZ184f6wsk5LbfpmcrUnTMH707pl4u3c3UtBSSxuKHAreQtHIHMa9feYYJTd9HHiwTwWZe71GYCpFZVj5P3KHQ3pfFbUSqexPs/a/6yQCA1xVzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963622; c=relaxed/simple;
	bh=4SeNgi1wLdy5CHoMa+2nCAoVEtUaMl4h182JOclLDMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hk5F6qK+d1us7OVULn4Gfuye9t1ID61klLJ9EXh/bxSen5NgWT2NqWz/bmlQVcKGAfswMj5gCd5llSFDJ7qt2po6N6AnwRpmZJWNsh9KQxkKZQfQ2Rs5sBatI2pL9PU2o+j6Ry3bCK7ZwzztpEffqfUC8mCJF4c/azF2hC4jzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1GpsgpW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1GpsgpW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0782d787so11411855e9.0
        for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 01:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744963618; x=1745568418; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8R7Qp36puqcIKgf+lMIiPQAk3WNF5lMseB0RPPm+UOE=;
        b=n1GpsgpWafYwHBqIUW8xkzd+ATsTNEzfsSrF3RqeXUjZAfeGwMogPAezC+B0HuqaKX
         aIq9WWQvlRDVKLq1q61CsjsK5dsd/X6naJS8SKXnnM+MFlkSWizAr6yufgyD+tpj4SiM
         z7BDjJ6rpFvSwbCacBVs621iNz0tYK9tbWOODfrUdMXrdg1ifkn34iR6vfHR9wnbw8gu
         GVoV2620CfAtWHgmPngrWuY3f4J/7lnHhyBbz5HS2xTTk/NlywO6MdbW+MliJfOG2ED+
         tvMburh9pijFQC02EdZPpaaVOBQZ/wzxdsuqd9IWCv4uP+L1YN1uH+Y2Kyua29K3VyJG
         KLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963618; x=1745568418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8R7Qp36puqcIKgf+lMIiPQAk3WNF5lMseB0RPPm+UOE=;
        b=DxaRzo4Ax9aHaVn91o81XJKZGS7H7mfcZxKsfNYwPw2eEWOkLjxMMDX/udjfrkCZk+
         02RZLD9C66eOawZKSrX8i6UTG52bamNkNO4nsHJSy42a/mF7gajFXJrABJHlRavpZGcE
         kx1UGzf1wvhF8aw70zf4wsfMsciahOXLgFa2M5KMdjjngPdNeC0SUJtuozPY1VCFuyqR
         HaKmuYyG433GMHNJe/BSAbuBlptIlmwXn/hL2ly+Fh4jrWi0DsyZOdKI4ioEuPhWyH6u
         Etk5WPOaNqaOycxZuTIXZFZ21pKOcdK4NBMdjMdmbNzaNVSJu7QiNTI2TGxeS7x858nk
         19Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVAvgtuiTzXVm9aQbSuXlCME1+Eqxg7rQ232g/KW1jJ7jgk3iGqwtonqkLFJN5uoiUd6Z0h@lists.linux.dev
X-Gm-Message-State: AOJu0YxDJuphFRggw8YKa9xpibkD96bEsrvnOy5rsNIgJZxZz3gaedHf
	FhgWfkOoAuqsf3p1Tvenpo/59mGpwDqf427u7DurNhyTiZUkGx55KRGcYcwaOek=
X-Gm-Gg: ASbGnct1/gkYlMlolFypHarhHGXrmgTUogrDLX6yMuOuWuqdhHyC5PSdupJvqwfR/2T
	JlzdpNWfuFz/QXylKTjna8nGGOmLrTPBRTm4rrGtJ0oH/iUU6UuiZTD/ZwmBCDgu0EW5QWldp8x
	0bz3ZlEKp2XLGbzUM5c+WzAV006rbi/4dcxg5ETp9cXkrqrH7r6uetG2CiESO2RLP/GKtI8yUNl
	/kOOATXPhaanV8iQf+qCMw1QnPvgJtY3etujoIJhl75eFQE4XURrKOQd07hP8BxglmUQQO6zOmy
	EPDJK+J+sEHbBeZcppQYZM+xzvs2mYaYnYfuM9T0vgxqwFLH+uQkimIwQQMuTVL95dholFOrQpA
	oEiI=
X-Google-Smtp-Source: AGHT+IGroX56fUpTWu8kdLamlS3WqtQ3AvZMCdPeD85f7x29lyEmfTuKBJbY/GKTp63EX5l2l7D2JQ==
X-Received: by 2002:a05:6000:458f:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39efba46366mr1072505f8f.24.1744963618329;
        Fri, 18 Apr 2025 01:06:58 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406e0056c0sm7725435e9.0.2025.04.18.01.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:06:57 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:06:55 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH v5 1/3] drivers/thermal/exynos: Refactor clk_sec
 initialization inside SOC-specific case
Message-ID: <aAIIH7H1oQH8cf-6@mai.linaro.org>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-2-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410063754.5483-2-linux.amoon@gmail.com>

On Thu, Apr 10, 2025 at 12:07:48PM +0530, Anand Moon wrote:
> Refactor the initialization of the clk_sec clock to be inside the
> SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
> is only initialized for the specified SOC and not for other SOCs,
> thereby simplifying the code. The clk_sec clock is used by the TMU
> for GPU on the Exynos 542x platform.
> 
> Removed redundant IS_ERR() checks for the clk_sec clock since error
> handling is already managed internally by clk_unprepare() functions.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v5: None
> v4: Fix the aligment of code clk for clk_prepare in proper if/else block.
>     update the commit for clk_sec used.
>     checked to goto clean up all the clks are proper.
>     drop IS_ERR() check for clk_sec.
> v3: improve the commit message.
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 37 ++++++++++++++--------------
>  1 file changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index 47a99b3c5395..3657920de000 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -1037,29 +1037,30 @@ static int exynos_tmu_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	data->clk = devm_clk_get(dev, "tmu_apbif");
> -	if (IS_ERR(data->clk))
> +	if (IS_ERR(data->clk)) {
>  		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");

As this branch returns, the else block can be removed.

	if (IS_ERR(data->clk))
		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");

	ret = clk_prepare(data->clk);
	if (ret) {
		...
	}

May be worth to group both calls with devm_clk_get_enabled()

> -
> -	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
> -	if (IS_ERR(data->clk_sec)) {
> -		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
> -			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
> -					     "Failed to get triminfo clock\n");
>  	} else {
> -		ret = clk_prepare(data->clk_sec);
> +		ret = clk_prepare(data->clk);
>  		if (ret) {
>  			dev_err(dev, "Failed to get clock\n");
>  			return ret;
>  		}
>  	}
>  
> -	ret = clk_prepare(data->clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to get clock\n");
> -		goto err_clk_sec;
> -	}
> -
>  	switch (data->soc) {
> +	case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
> +		if (IS_ERR(data->clk_sec)) {
> +			ret = dev_err_probe(dev, PTR_ERR(data->clk_sec),
> +					    "Failed to get clk_sec clock\n");
> +			goto err_clk;
> +		}
> +		ret = clk_prepare(data->clk_sec);

Same comment, devm_clk_get_enabled()

> +		if (ret) {
> +			dev_err(dev, "Failed to prepare clk_sec clock\n");
> +			goto err_clk_sec;
> +		}
> +		break;
>  	case SOC_ARCH_EXYNOS5433:
>  	case SOC_ARCH_EXYNOS7:
>  		data->sclk = devm_clk_get(dev, "tmu_sclk");
> @@ -1112,11 +1113,10 @@ static int exynos_tmu_probe(struct platform_device *pdev)
>  
>  err_sclk:
>  	clk_disable_unprepare(data->sclk);
> +err_clk_sec:
> +	clk_unprepare(data->clk_sec);
>  err_clk:
>  	clk_unprepare(data->clk);
> -err_clk_sec:
> -	if (!IS_ERR(data->clk_sec))
> -		clk_unprepare(data->clk_sec);

With devm_ variant those labels should go away

>  	return ret;
>  }
>  
> @@ -1128,8 +1128,7 @@ static void exynos_tmu_remove(struct platform_device *pdev)
>  
>  	clk_disable_unprepare(data->sclk);
>  	clk_unprepare(data->clk);
> -	if (!IS_ERR(data->clk_sec))
> -		clk_unprepare(data->clk_sec);
> +	clk_unprepare(data->clk_sec);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
