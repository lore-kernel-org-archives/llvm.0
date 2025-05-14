Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD3342A82
	for <llvm@lists.linux.dev>; Wed, 14 May 2025 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221838; cv=none; b=hnEAp9srsxFYg4xYtc+CnqjhKrfD9jYNIjpzCTzaXIiweJxP6u+YbPi9HejmxDoemhRruSMGFI9EyUSbrTYNfelf5CbLtWrHg1SSNXHnVPAAKQp3h8ikBKv/LpjmZUFL90HwPWCPbx6wJUIYxWXFY6VnP9zR02Yln2a4UVxFo94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221838; c=relaxed/simple;
	bh=tx8YzHNBUj2kXpeOe64RZVIheqYx8JBL48xF8A/l0Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9ZKp/M98ih1N+5p7ZDV0KFqimbHCBekX2PiaoazHvwvf0Hn2gcI/UaElgoKnafnB/O6aS9mMqwVGpnkTZu2H1jZ0M1vxnboZ49nhr/s5uCVLQv12nuIz0r8xhSZOhBYJYJzy6jb9KlXCqJwN3b7xJEJLn8UWN4bjyC8N9EK0x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O/R27MrK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O/R27MrK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0ebf39427so5549893f8f.3
        for <llvm@lists.linux.dev>; Wed, 14 May 2025 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747221834; x=1747826634; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PqwsD7WCcNuEv2WTK4iZPHlU9QaOgxXWeL2peqyTOEE=;
        b=O/R27MrKZahNgW40ULDcGE0KRvcCcK0s59NUHa9YWk+kQ89QefSO0KZ8vrqAZ9g1r/
         3nmHt6DKndOW5f/3jU0aYKh+FG+8Ixuwuk4BaU9GJ8/u0jve2/9XmZHRRfJPzHZHA2Fy
         Vwaqi1DqR9MuVUByaj4/gFIjKQ49Jbtbo9CuExV0iUv+X9kPMEk4A/VAnE1nd3oOcRZh
         l3rlUHtGkGX7fPjkPfJ5Gj5kVfY6bnHadg/RBMF9gC2veO/rJBQi0culFymvjH/G9s1I
         kptcpcmK8HnygIZwu+7XJZHeGZL5ZM3qvHjDuNUklIY5miga/D4yRAhXeEG1Jy2DAw0x
         v7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747221834; x=1747826634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqwsD7WCcNuEv2WTK4iZPHlU9QaOgxXWeL2peqyTOEE=;
        b=RuLZbFFx2PBnKghoMs/ZXcfpsIoiA9Dv8d31bd8z4AOwo9aduwFPxs2rcKnF2K4SUs
         71QqNHgNVVy6onqTFXi5u6r2efrixCuMylJrqx+3Mdss9d/Z7zT4v/K+ZUag4w/ZbCeN
         cXhjrNf3SQ64P6m0iik3wMzfHH6dU7p9lZhImP2oo1f4+16ubTfRwpwBkkqy8kYKmTPJ
         h1eRLQQyk3DwN3xCFVg/FeE3FA6PQw0Zw9JVzenIPNb/6NYz0dWmZXwH/JoGvBWpTo77
         Zjip6fvOIlwlg4Wu28AtNLVMQTg2eWCJJdkG/GsfFY0Vnxtcp1KXpwpBD34iYmsS+y8P
         kmBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7BZr3nDA7JIjor6qIzFVtKTSdpqSA0yN3Fmj5b09roz5HA3yuDZPQj98nm75SpwxocR5K@lists.linux.dev
X-Gm-Message-State: AOJu0YyDwWbfQmsxNW0n7iRPqEGj8mU03YK9FI0u2tVMSu3VmQYNsapf
	d2GIDPXXlrwheTrlt/4WinoDDZWTd5EAu4Q4iWKfUZt/f10PB7TXFle9xmwXUnI=
X-Gm-Gg: ASbGncvJsaTPYsQpbiYBpkxzFcx3+A9+QQKsurJrvZW39ttJKj+vj5Igop4guDLVqN3
	8weKqCzUQDunmC6oIW6+ScbyRXMJfQLi0tX+Ni/hyp4lgdOUWhUx+sFTVOBhWoXy0u0JfdPe0f/
	4ENZPn+XD2j/NPT6CM0X2fw5dU9xh6ceu3twJt0G2sLKB7uni0LPrpr54Al6LwOndpsCo9UG2Ct
	urN8cxlGH76QrQsO5zIVDO8KWHnE2yrfff71v6K7QNN0xZNLcE3BVbV6GeTMmhxk5DiLqe6n+wS
	ulDwHm5S6dGHPcIzxhMmbUVFSh70vQKOXF1IPryN4AKFklS1c6wHAj60vrrtVp7WYCAsmSCipxz
	wKBGEe9Sv3y+99Q==
X-Google-Smtp-Source: AGHT+IHd28mYJHFkZ2YC/3FfmJfsWok8nxf/8sbB3FWwSEaJKR0MYxIrlFfEdGODFNdqer26tUf9qA==
X-Received: by 2002:a05:6000:2506:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a3496a48a7mr1875484f8f.13.1747221834230;
        Wed, 14 May 2025 04:23:54 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2b02sm19714077f8f.51.2025.05.14.04.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:23:53 -0700 (PDT)
Date: Wed, 14 May 2025 13:23:51 +0200
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
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
Message-ID: <aCR9RzGMWEuI0pxS@mai.linaro.org>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>

On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
> Hi All,

Hi Anand,

if the goal of the changes is to do cleanups, I recommend to rework
how the code is organized. Instead of having the data->soc check all
around the functions, write per platform functions and store them in
struct of_device_id data field instead of the soc version.

Basically get rid of exynos_map_dt_data by settings the different ops
in a per platform structure.

Then the initialization routine would be simpler to clean.

> This patch series is a rework of my previous patch series [1],
> where the code changes were not adequately justified.
> 
> In this new series, I have improved the commit subject
> and commit message to better explain the changes.
> 
> v6: Add new patch to use devm_clk_get_enabled
>     and Fix few typo in subject as suggested by Daniel.
> v5: Drop the guard mutex patch
> v4: Tried to address Lukasz review comments.
> 
> Tested on Odroid U3 amd XU4 SoC boards.
> Build with clang with W=1 enable.
> 
> [4] https://lore.kernel.org/all/20250410063754.5483-2-linux.amoon@gmail.com/
> [3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
> [2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
> [1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
> [0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30
> 
> Thanks
> -Anand
> 
> Anand Moon (4):
>   thermal/drivers/exynos: Refactor clk_sec initialization inside
>     SOC-specific case
>   thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
>   thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec
>     clock
>   thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
> 
>  drivers/thermal/samsung/exynos_tmu.c | 100 ++++++++++-----------------
>  1 file changed, 35 insertions(+), 65 deletions(-)
> 
> 
> base-commit: b6ea1680d0ac0e45157a819c41b46565f4616186
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
