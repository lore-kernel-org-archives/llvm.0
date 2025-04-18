Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4A1D7E41
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963882; cv=none; b=kbfgkmiMJoUNRBGDXEPvIllJBQQi/F9Y/jqplvB4bqloOECLIyEM5kEVwqEYr/5//XfPBmcO79Au3282U+VcIGDEdLeroCD1M0tEOs4p8Z10lLfZ/UdLjLZH1sNqJc06TplLVdh6mbhCrizJykb0zsXSTrhIjV16h8+FKMNMb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963882; c=relaxed/simple;
	bh=JTfpzxPO7tlw1FRlN8arOMR/8L4Ql6vMZq9I1vDRuzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwlhc+szejd6HMAtuyfH3SU2LSAxAAvjajKL9WuAPNdflc+1GKZsX3U/L+s6xn1Tu4vB8g6sQa70Vq++hJ9b85rxLAi5tYSDXZZqTN3wclDiCmNXcivVeWxWg8T77GKPdN2TCt54Vb2ShYH9HCo29xoR8V3Guq+4ng3WWb2M47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0xLBZ8X; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0xLBZ8X"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0618746bso11574415e9.2
        for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744963878; x=1745568678; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hBAVQUSIG8/FVcTA2w6Be8v3FlriNZP6ZHZpLpZIhIc=;
        b=w0xLBZ8X7d84LPC8JMY8wXw6MnMt1U/5yh4xVvsxV0kr8crV56xB/YAN0Nx66XtRB4
         ERKTkxRNb2uKt8SrMcwYD5JS4DfHHSW2sy7pPbtHkHRmT626ahS5f8ikLmeve1EyaN4L
         834RIb9Aj8NkDqG3ljV6zq392E8sPKlWpi2FhhveBsdIZbrco+PeHQnSvaM+Rki5G7Xe
         2O3VyAfhcf8pvYhoU8BYBLe9BA70CdE5F1XQgfrQx6cW7urZTztnNe9P149LPSZjJnjZ
         YHvGmUcxDNJA1ss48Cr7wHosummSgqq4jlsgK8RepCP9JKU1peMNA0+Ol4qEg+4w034Q
         K1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963878; x=1745568678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBAVQUSIG8/FVcTA2w6Be8v3FlriNZP6ZHZpLpZIhIc=;
        b=laiOQk5YLNN2g1cVpY+Uv5ejWaigJm/DK5h/C8vX8s0xT+fxdX+Xah4AOw2YAw1LLw
         2+shn902a6vIWdRCaSdfZfJv4qluyDEpOp3s/8Mx/SO1ky53cmSsZY309gvicRE3xtjm
         EYQ2R4anM6DYO8BJzTfA8j3ijPOJvcQUkac5Sg1f+S4OIAYG9pILhCLP3LJuRopfzz2y
         QPgpS3KOIPmE2ZYqgjmiHVhnsGlO8rbxssfxenutnGERbjA8vzfJmVmkAMs8a06J1JUV
         2M9f8ZcQaqn72K1DwxyXVhqqeBM+WFSpfQ2rO66R9BwugmnpLgvEyK1elDIfU6RL94P9
         g0Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXaxsfzwLvRJkyVsRXLGS5GacPJEHqy1PCdmeunzfZt2rMR752YXuDBmDqr6GzqEn6YMrC1@lists.linux.dev
X-Gm-Message-State: AOJu0YxKwwBIOHaWoQ9qcLjh1MSCxhgLXFOsv9DXLAGa/qrNNlUkB23Z
	dcHXza2fdJQXIT/Dk+nEUkOvObMn4S/p9NO2oYsA72mWeiyljrN7ISdU5+MytC4=
X-Gm-Gg: ASbGncs2a4RXTvH3m/y7RHVQSEACtTUoCuNuZ/FypewLnz4m2nHwJINcGMEujf6Z8/r
	K5fTrFiM9kLB8UFMzMn6zBQ5pqJPUdLFYkJpBjnDcdsdDF/t8DfyHUQ0sEJe25ORBO/ogQNWrcf
	IPwG/EyxRKkhBz6wD1bftr3B+HZ4X1SklcFKVU8MVr7pEsqVUSNVk48cxx+s7sqHDEbGZrs5S0N
	giNYWGjsiYeSOT/lFTjKlQxCzjtimUVPHoP+WYYHB7w6rB9R06ARlGfj9v/3MT0pP66OKn1UxB6
	t38RhWdvrg2kgld9DP4cHDwpi77oFsPv3QIMnPzFihvxhMqaOfWufw12CNS0iQd6zizUk52WFa+
	/4a7GZUA5R4jhrA==
X-Google-Smtp-Source: AGHT+IEqy72HPc2JLxk7cwyoLf4zIk+ZCEFJN86qbQUa/AJZooBD3mTTOHD22C31nQiUieXQmKAm3g==
X-Received: by 2002:a05:600c:4ecc:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4406ac0aec8mr10500975e9.22.1744963878336;
        Fri, 18 Apr 2025 01:11:18 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbd12sm12743035e9.20.2025.04.18.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:11:17 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:11:16 +0200
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
Subject: Re: [PATCH v5 2/3] drivers/thermal/exymos: Remove redundant IS_ERR()
 checks for clk_sec clock
Message-ID: <aAIJJKGif3i3-97g@mai.linaro.org>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-3-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410063754.5483-3-linux.amoon@gmail.com>

On Thu, Apr 10, 2025 at 12:07:49PM +0530, Anand Moon wrote:
> Remove unnecessary IS_ERR() checks for the clk_sec clock,
> the clk_enable() and clk_disable() functions can handle NULL clock
> pointers, so the additional checks are redundant and have been removed
> to simplify the code.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Typo in the subject: s/exymos/exynos/

> ---
> v5: None
> v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
> v3: improve the commit message.
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index 3657920de000..ac3b9d2c900c 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -258,8 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
>  
>  	mutex_lock(&data->lock);
>  	clk_enable(data->clk);
> -	if (!IS_ERR(data->clk_sec))
> -		clk_enable(data->clk_sec);
> +	clk_enable(data->clk_sec);
>  
>  	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
>  	if (!status) {
> @@ -269,8 +268,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
>  		data->tmu_clear_irqs(data);
>  	}
>  
> -	if (!IS_ERR(data->clk_sec))
> -		clk_disable(data->clk_sec);
> +	clk_disable(data->clk_sec);
>  	clk_disable(data->clk);
>  	mutex_unlock(&data->lock);

To be replaced by devm_clk_get_enabled() ?

>  
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
