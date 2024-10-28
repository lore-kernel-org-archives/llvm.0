Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3861D958E
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730118281; cv=none; b=fgSa1N6w49PsFOGWZPu9FIp8IGYvOw7eb1tpXHOXJCGZcvWPTI6WbxttCjHKHdzcV94ZKlZw2S89YN6vpNbP6r+4Y6TtGoACJ+IBRCYqnZgc7ux8apnEKOPa+m/ShMwVeqCDsgYNtP2ud4CiewJPSfYQuqdaEnIiwOlbqbDfamk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730118281; c=relaxed/simple;
	bh=mSaHE3v21lE8qms03Sk8jUDId6PqNL+b81JWEpgodG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hs9B7J0cepumuHDi7zuVMp/KFM1x136ocBqrQKJAGR83TVeOhvc4sPMkklEAOmS+Zb2T2ARxoVVquvi0VGpUmSp3Iu7RTE6XDhZW8ynKz5c9bpP5MNCCaMdYtWpgKqxRIP5MPvYXoYis5s8OVIWBULifyWa6bqb1qBimwY8QdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODLHTGYy; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODLHTGYy"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so41864671fa.3
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730118276; x=1730723076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hiakvBu5HWQteUMkqul4SIcxvJVDyv5yRsVh32mSkGg=;
        b=ODLHTGYy06WW6QNdbDhHO53OR1zLZNogvt4eryTJqsQWvP1MsvqaKOxHS6b8Ev2pcY
         lsGw7DJt5WdGyZCR9TYoNXifaMpvjba0/ms93w7ZQN8MIeERC6Z78Cq9Rh014CSx/xr6
         9BElC1u9zk7eoLPpKTl0PiEA/aLV0cLg5qUs0qhTRZOg7f1ycVDISACC9F1HOsVnd+we
         4EJ7rvIwJ7RuiB+Qz/v1tr2ROSuN+NcGauRdpYnvWgdPO9Nnsl30oYrP0A1iTB2B1zVX
         OG8YOSKZjuXGqxKicVoUImKyw45acIzU3ciyh1uGgxl35lM+KQnx1OYApkdPq8UohArO
         fvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730118276; x=1730723076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiakvBu5HWQteUMkqul4SIcxvJVDyv5yRsVh32mSkGg=;
        b=VYW8iC+6v2KCmFZLHERQsM2kD7uClj5cAL9Qk8oJBAum1UFOSmwDRzpjcZ79daU+Qn
         YxOJfGVhvUVlEGf+SOXaGTT2afhpTf6HO7mt5YfNo+w4Zry6FiXevGO3eKFQZLzj7kmH
         /CqZ4bkZ190BPd/jjCEENTgVIIurNqLPzqAaL3wIyT9C4IOw9aenD26cNco8x9bVLHnw
         gycXqnMSeBIeR6mu43RnDOpN0ly0TiRYVVFxwIHaxNQmpc4D+HR00K+dB/QbzDl3SqFj
         H/ySwrx0//FBmYbjfkwl6UFVI3in2MNmbFfFGf91nlvKELqzZ8xFWsDyGOoCHJaGRoKQ
         gcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPa13j7jvAtu6mP6Y8P4ZMCmTUjpxNnI5tjgHbvRCCIgrj11UmD4Uc1+8MhU0ngPtiJ+AH@lists.linux.dev
X-Gm-Message-State: AOJu0YxRjkfsWK6ufPfkO8GsIKGnTyH6Oq8sQ8rbydIYDAV01eRGoKfL
	qohjsKvdnLRH+FuC6oXAJetjCfRSWVeUWVo5DIhfRHKawIC6F/H8aFroekfneg4=
X-Google-Smtp-Source: AGHT+IHMzvTbKsXQiE7Sg+SLUe/8P7mNRx/fVvevQS58dQwaGnRtlPzMwEtJenkdv8S3A7kBzaWS/w==
X-Received: by 2002:a2e:b8c3:0:b0:2fb:3445:a4af with SMTP id 38308e7fff4ca-2fcbdfe8b81mr29076191fa.21.1730118275722;
        Mon, 28 Oct 2024 05:24:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451a043sm11549741fa.46.2024.10.28.05.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:24:34 -0700 (PDT)
Date: Mon, 28 Oct 2024 14:24:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
Message-ID: <qvi32futhcoe4tklfsdffhpkorpxjqxyjsajrlyuxega6o2fzn@p37z7llhr7c2>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>

On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
> Clang-19 and above sometimes end up with multiple copies of the large
> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> fill the structure, but these create another copy of the structure on
> the stack which gets copied to the first.
> 
> If the functions get inlined, that busts the warning limit:
> 
> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> 
> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> the stack. Also, use this opportunity to skip re-initializing this table
> to optimize gpu wake up latency.
> 
> Cc: Arnd Bergmann <arnd@kernel.org>
> 

Please no empty lines between tags.

> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

After all the discussions:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
>  2 files changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 94b6c5cab6f4..b4a79f88ccf4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>  	struct completion pd_gate;
>  
>  	struct qmp *qmp;
> +	struct a6xx_hfi_msg_bw_table *bw_table;
>  };
>  
>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cdb3f6e74d3e..55e51c81be1f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  
>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  {
> -	struct a6xx_hfi_msg_bw_table msg = { 0 };
> +	struct a6xx_hfi_msg_bw_table *msg;
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  
> +	if (gmu->bw_table)
> +		goto send;
> +
> +	msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
>  	if (adreno_is_a618(adreno_gpu))
> -		a618_build_bw_table(&msg);
> +		a618_build_bw_table(msg);
>  	else if (adreno_is_a619(adreno_gpu))
> -		a619_build_bw_table(&msg);
> +		a619_build_bw_table(msg);
>  	else if (adreno_is_a640_family(adreno_gpu))
> -		a640_build_bw_table(&msg);
> +		a640_build_bw_table(msg);
>  	else if (adreno_is_a650(adreno_gpu))
> -		a650_build_bw_table(&msg);
> +		a650_build_bw_table(msg);
>  	else if (adreno_is_7c3(adreno_gpu))
> -		adreno_7c3_build_bw_table(&msg);
> +		adreno_7c3_build_bw_table(msg);
>  	else if (adreno_is_a660(adreno_gpu))
> -		a660_build_bw_table(&msg);
> +		a660_build_bw_table(msg);
>  	else if (adreno_is_a690(adreno_gpu))
> -		a690_build_bw_table(&msg);
> +		a690_build_bw_table(msg);
>  	else if (adreno_is_a730(adreno_gpu))
> -		a730_build_bw_table(&msg);
> +		a730_build_bw_table(msg);
>  	else if (adreno_is_a740_family(adreno_gpu))
> -		a740_build_bw_table(&msg);
> +		a740_build_bw_table(msg);
>  	else
> -		a6xx_build_bw_table(&msg);
> +		a6xx_build_bw_table(msg);

Note for the future improvement: this begs to be migrated to the catalog
data, adding device-specific callback instead of this if/else series.


> +
> +	gmu->bw_table = msg;
>  
> -	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, &msg, sizeof(msg),
> +send:
> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, gmu->bw_table, sizeof(*(gmu->bw_table)),
>  		NULL, 0);
>  }
>  
> 
> ---
> base-commit: 74c374648ed08efb2ef339656f2764c28c046956
> change-id: 20241024-stack-size-fix-28af7abd3fab
> 
> Best regards,
> -- 
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 

-- 
With best wishes
Dmitry
