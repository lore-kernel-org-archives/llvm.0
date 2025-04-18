Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6948462
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744964378; cv=none; b=rLC/1lWQQvoGenGpJ4siy2S9nB9Jqy1K5kbub6xeDtKnu8BKWlx/uuerh7loV5S5Lb9j87wLVx9e/CN5Wa4sotZn1do6QxYH66VrK06RCoknp+tDQAQ+oXZ8PH8T/ozAem8DIOwqkI6W0Qtme3gYcSvMYi8+5xZT2UEx4romKMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744964378; c=relaxed/simple;
	bh=OyANNumqNGehMqydbT5YMfLr7i8JOGPuL+legh4Nnyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qs3AJV+hvCYP9I6YrLN96dK+6okjxfuNTm+HajWsD/8QbVRJzDQV5x5s4dDBtyR/j3yYjyCc8Z+D+Z82bWsKk6nGI5iEEAMxcNJ8DwZEn7rJX46+td66mCMG3CYk4Htg55xF6ZMNjFNXn24FdEXTfooiucfExP4sJEdPy3Afb0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3tG132U; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3tG132U"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so12546085e9.1
        for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744964373; x=1745569173; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L630Qky/UZ9kI7H0yEROeZ3XG2IusjzeuDyDM/AGMdw=;
        b=P3tG132Uwsh1AD9n3MEYcV61x29/N3KuqjCEgxdi0ydopsAalnicCLnLKL9078no/q
         i5qUJvnDL/W5zSy//oDvy6zxuojM5bc9KUZI/jwt8ZzjXcZTM8IfwZjnTPD7JEj282Zy
         YU7vNhWLZcseKdgrqxcwOQKaFfdBEwisghDGnlkc8XtDh1NfmN09vhCLRb4uPU6sFwB/
         ccz4sYASP1pv/APCLJXNl84z/Wz3YcZ3BWApn7WL/iyATq688dqSgHwijwRym64cVbmF
         3MFZEUrw8M9aORuSLFrJNV/rIBwp7S/5qGul7RCESVzj35tI6TYzsSwz5nb4nKKQ86EN
         1WXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744964373; x=1745569173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L630Qky/UZ9kI7H0yEROeZ3XG2IusjzeuDyDM/AGMdw=;
        b=Sj0Ftd8/LrRYo5x71v3zifLb2lTXVX7S9Le+lQJlqInvbYF7C2pAe+s3kfl529Q6eU
         TH0hi6EhIpy0bgRI4sgQnn1feFwmwKAdFr9PnD0tWkHm1C9HXxgmqHojfyfs9YKsCz2k
         elsfFaap/FlAMlX7gtsaIzd6tVMYsIfBAwBbLBkXv39g/8FWkPPhfhOSVC7S6DQQpl4X
         h3jh8NKfQc42GcDTd/pyTolAKs75b+mntgdk4cKIJUBNOQ+O1YEMw/VobET7yif7BIir
         hmxgW/IVh5Q6jNOARJYK5NHE+4d+eCU8o0jBkn7c2dl4449hyWx00fH7RDBRmPI2bgaa
         CeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk9Trvc4dHKOicyIuQ6+EVc8RnYN8XUvGmhX5CCvWd5RI4hth2dh5f/6rAHqjrJZnAhUTz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2B3Hlhj/+cF3DTfyww+90+eDt940moGvD9ll2B8Nst38faghN
	1U2Sa6gEd7lybKq7ZkqlZikdVqb7TSKW4ggtquyFX+LP5znoX27fMpAuN93VEbs=
X-Gm-Gg: ASbGncsRw3+wICMKaff1JxLl392dfl7pn258DXdUR/LyNeLpBJXHyV8mGMY5Xv/j+hm
	FTxzjpPF+8oevIuB543923exvxq8NhDtM5RKfAPNxmaCIViZeSJbQkNsYJ8tuFmDvlejthUhpSl
	LM3uMsibtN9pzhZ6Kp/w9C0YXrGQF1rN4uuYaR+FL3dnOV/vXytP92rjUmz8pbVzsDLjBaIfM20
	bUcz/sXdiT0o/Ie75Uvd2+B47gDs0MVZr0cYVgsQZXtkgNacpXhZWv72QAO5p0bpCtnommn6N9U
	zXX8dmj8XTlQU3yCD4DiA8lO6ZHu3dUwAkhiROShi7aHm78LxWdVCeThYxTANdRq82Gbki0gUBS
	2y7Y=
X-Google-Smtp-Source: AGHT+IHprYn4MpD5iVpcM5XtKPgBCL4PbwyZvt4l+PuNDtvWyynJ4XbaF2lxnyotFbTDZATgIX8ZLA==
X-Received: by 2002:a05:600c:35c9:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-4406ac412f2mr11115405e9.33.1744964373510;
        Fri, 18 Apr 2025 01:19:33 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433354sm2079318f8f.32.2025.04.18.01.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:19:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:19:31 +0200
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
Subject: Re: [PATCH v5 3/3] drivers/thermal/exymos: Fixed the efuse min max
 value for exynos5422
Message-ID: <aAILE01SjRR874jc@mai.linaro.org>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-4-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410063754.5483-4-linux.amoon@gmail.com>

On Thu, Apr 10, 2025 at 12:07:50PM +0530, Anand Moon wrote:
> As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
> if e-Fuse value is out of this range, then thermal sensor may not
> sense thermal data properly. Refactors the efuse value
> initialization logic within exynos_map_dt_data function by
> replacing the nested if-else statements with a switch statement.
> Ensures proper initialization of efuse values based on the SOC type.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Same subject typo: s/exymos/exynos/

> ---
> v5: None
> v4: None
> v3: Improve the logic to convert if/else to switch
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index ac3b9d2c900c..a71cde0a4b17 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_device *pdev)
>  		data->gain = 8;
>  		data->reference_voltage = 16;
>  		data->efuse_value = 55;
> -		if (data->soc != SOC_ARCH_EXYNOS5420 &&
> -		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
> +		data->max_efuse_value = 100;
> +		switch (data->soc) {
> +		case SOC_ARCH_EXYNOS3250:
> +		case SOC_ARCH_EXYNOS4412:
> +		case SOC_ARCH_EXYNOS5250:
> +		case SOC_ARCH_EXYNOS5260:
>  			data->min_efuse_value = 40;
> -		else
> +			break;
> +		case SOC_ARCH_EXYNOS5420:
> +		case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +			data->min_efuse_value = 16;
> +			data->max_efuse_value = 76;
> +			break;
> +		default:
>  			data->min_efuse_value = 0;
> -		data->max_efuse_value = 100;
> +			break;
> +		}
>  		break;
>  	case SOC_ARCH_EXYNOS5433:
>  		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;

Thanks for taking care of cleaning up this portion of code. IMO, it would be
interesting to go a bit further in the house keeping by replacing this big
switch with a set of structures stored as __init sections. The initialization
finds the right structure and does a structure copy to 'data'.

It is up to you to do this change or not.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
