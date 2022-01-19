Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667E7168
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 22:42:57 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id m1so14235256lfq.4
        for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 14:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QBGuTeJTY4evy0pXgZPGqi5/7wy93IQZWaIcsbMgY0o=;
        b=dYC5q0yEQzPOlqU9aFZ+eQoQxQ3kRwyvkrWswfbjilki02dUSHfjXLVlYHyG3RbZc9
         43iXn+7gaxMapqt/maDxgsSzOpqe1wO9m5FSHukYaVDr+dcjmxtWaCyeeixEpEZdtrFi
         f/nHFkgj9vX6p11C4mVS5/7zRupL8vitbGDGjvryR3P9miQ5WminNEdIF5FIaXvcAZy9
         gyYEdbXwSo7JfZHMDC7euBIbvNhbeo9d4jxoL+XyW2qF6I1b57PgBxxABMXFAw1LArhX
         YZ0NEukdwR2+mL7Q6WEjyhu3flddZe+JjX2Z10mJP5CuhgoeQC7M9DKQDSnsjGlwBk1a
         MoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QBGuTeJTY4evy0pXgZPGqi5/7wy93IQZWaIcsbMgY0o=;
        b=3+Y+6NTAkMixW3uzAJwbAf/Og/3uJNrDnLWhbpSwVRdlVsORR7lCQuRgrP7/FVK1Vp
         6taJV8hCppj78vCKidrZHqyFrg3Wu1bDuFGEtlZ+folkD/H0bacJzz+4Vq5EQO5Qw5Hf
         mln1J5i8TaRU4v1erIJyC6S74YqreCAFe9F15WbBv3fuUgONRCj0+xyGI6vLSLsxHxbL
         CHKwAfRpXTHsbVCUEbgIhp8emN30I6BHAm4hdyV0zIFP5+sSxGfQthAKU19cziHWn37z
         AVisVEidDiLZwLUcLiy/Sg4J7bDS/blYVcxSFf8UHrGc2rdRbjBLUObhqkPtpVUHVRmX
         rTHg==
X-Gm-Message-State: AOAM5322zv5q2AVbEX2YKDTttqaQ+bNWF57bzRTAjcf3SvREoCiJt3AI
	E59opaHmdlWGZUvbluWEkbvkpA==
X-Google-Smtp-Source: ABdhPJyKemZP+GUHTthbYxnWBhvreucyqWDoJdwuFoi+Cbpif8CLT38VaRlhicyGPRXwE+Blu2cNfg==
X-Received: by 2002:a05:6512:260c:: with SMTP id bt12mr29003355lfb.506.1642632175437;
        Wed, 19 Jan 2022 14:42:55 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y19sm85202lji.135.2022.01.19.14.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 14:42:54 -0800 (PST)
Message-ID: <74c6ad05-331f-5073-89ad-0efda6226dbc@linaro.org>
Date: Thu, 20 Jan 2022 01:42:54 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] drm/msm: remove variable set but not used
Content-Language: en-GB
To: Yang Li <yang.lee@linux.alibaba.com>, robdclark@gmail.com
Cc: sean@poorly.run, quic_abhinavk@quicinc.com, airlied@linux.ie,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Abaci Robot <abaci@linux.alibaba.com>
References: <20211216031103.34146-1-yang.lee@linux.alibaba.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211216031103.34146-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2021 06:11, Yang Li wrote:
> The code that uses variable mdss has been removed, So the declaration
> and assignment of the variable can be removed.
> 
> Eliminate the following clang warning:
> drivers/gpu/drm/msm/msm_drv.c:513:19: warning: variable 'mdss' set but
> not used [-Wunused-but-set-variable]
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 2027e5b3413d ("drm/msm: Initialize MDSS irq domain at probe time")
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index ad35a5d94053..59e30192cdf6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -510,7 +510,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	struct msm_drm_private *priv = dev_get_drvdata(dev);
>   	struct drm_device *ddev;
>   	struct msm_kms *kms;
> -	struct msm_mdss *mdss;
>   	int ret, i;
>   
>   	ddev = drm_dev_alloc(drv, dev);
> @@ -521,8 +520,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	ddev->dev_private = priv;
>   	priv->dev = ddev;
>   
> -	mdss = priv->mdss;
> -
>   	priv->wq = alloc_ordered_workqueue("msm", 0);
>   	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
>   


-- 
With best wishes
Dmitry
