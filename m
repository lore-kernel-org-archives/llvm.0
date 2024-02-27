Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00A617C8B
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 02:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708999698; cv=none; b=u9OBFwSfWsSaL7InBOOWqQXDCA5fLhYDebR3a+TbmPFBgGbeE67CsUWGnAb609OD33Xv5xW7A9GpWl9Dcb+3WPEfAeyem0jIIUgChaxUTYcfDm247ctIqih3N/m4gkwD7wxU7MyY2Cs7RTjDgcMC6cAiXMRnzvOJN3ExVOh5hwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708999698; c=relaxed/simple;
	bh=1nrHMmEG51Sj437E4s1EkfyuxGl2jRLjyHs/cGUfhXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ez+bG9HJ+bmzYpBjtE6+NWxvkeEUAziRRKi7pHuJXjBydrp+ldn2rwkAXnW95GammTlX13+Q5+q+sjTOIyV5N81zV/VI6Pj48giOUjyJb3KPS+8qE76+lKwJ37jbyPSascmWsE38ktKVwhdFtKupDs2vwQL36m3Xe1GhvMEgKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FDf9ZQCc; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FDf9ZQCc"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so2382548a12.0
        for <llvm@lists.linux.dev>; Mon, 26 Feb 2024 18:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708999695; x=1709604495; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVkpTbipxCiUrmv2gBFC6axIfIqg3FWn8ARyZarMPgo=;
        b=FDf9ZQCc1Gfee9SiyySV7CH/seou9n0j/gpWJHk64eQjO5aPPXeSF3BHaMOVtG4NL5
         jzpP3Pd6OmnOnxpJLgb783zOyKstRyRGwrUsoEPMN2R3QBMYHxzI8TsF6SC6iawmJWBm
         AcA7y14v8O+EbGu18U79hRp+fbxv7vSqQdQJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708999695; x=1709604495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVkpTbipxCiUrmv2gBFC6axIfIqg3FWn8ARyZarMPgo=;
        b=JogfHecEUXmc95VhsztJI4X13GREq7ED9rScf7EpKo9EpoX2Yf5uj3jtIzVeOoativ
         Ezan/a5qJ/wE07tyFT3SVMHUaM74kqypdwDqYrQbnZ9giKRsVhmQt5N3TV9yaBcZ21uA
         JiVa0pAx49c+k2OC/0ztUcAm6jS5flSxb2gGpl7y9f1r6IxzzskPWEU80rLz2+iAqx9M
         TqN1tew5NdY+WpO6QsokbHs9mNLVIfCnNGx+hiQ+KvurqC72GvHMlM2zapD8C+9FGOn7
         +zxljGhrfw57TA4EPaAdOg3UesYOyagrGrXMI2Byurk8zVb8VosrxC9GpF5BjBHLa2cT
         xhpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4k5PUEMBgEG7PkA74IeX8UJOt4Rr0xXwvy2BtgY0WZen7E80FsapO56nGphzcSoNFaXjvJT83xhF5cJHOhZpPyiNwPg==
X-Gm-Message-State: AOJu0Yyt6SvMCjT8fAW0nxq7PSCgDa/z0e8tDubIrT7OWSlLyILfQBq1
	dsPSkg0tX1Smx/+7Bs/+3t3f9TekPS3eZ8FOmV9NREHLz7NWGlp437Cy3XbEjg==
X-Google-Smtp-Source: AGHT+IF6zdQ/2mc8pHy3ltuh8A68wKo1/k8qw2couBJUhs2wfECHjSq4AtVGKGBQE7knMNxjo75dzg==
X-Received: by 2002:a17:90b:124d:b0:299:32ee:a426 with SMTP id gx13-20020a17090b124d00b0029932eea426mr5747343pjb.32.1708999695238;
        Mon, 26 Feb 2024 18:08:15 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s62-20020a17090a2f4400b002992f49922csm5774240pjd.25.2024.02.26.18.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 18:08:14 -0800 (PST)
Date: Mon, 26 Feb 2024 18:08:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, gustavoars@kernel.org, morbo@google.com,
	justinstitt@google.com, stanislaw.gruszka@linux.intel.com,
	linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] thermal: core: Move initial num_trips assignment before
 memcpy()
Message-ID: <202402261806.A8340C71D@keescook>
References: <20240226-thermal-fix-fortify-panic-num_trips-v1-1-accc12a341d7@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226-thermal-fix-fortify-panic-num_trips-v1-1-accc12a341d7@kernel.org>

On Mon, Feb 26, 2024 at 05:54:58PM -0700, Nathan Chancellor wrote:
> When booting a CONFIG_FORTIFY_SOURCE=y kernel compiled with a toolchain
> that supports __counted_by() (such as clang-18 and newer), there is a
> panic on boot:
> 
>   [    2.913770] memcpy: detected buffer overflow: 72 byte write of buffer size 0

Yay, the "better details" output is working. :)

>   [    2.920834] WARNING: CPU: 2 PID: 1 at lib/string_helpers.c:1027 __fortify_report+0x5c/0x74
>   ...
>   [    3.039208] Call trace:
>   [    3.041643]  __fortify_report+0x5c/0x74
>   [    3.045469]  __fortify_panic+0x18/0x20
>   [    3.049209]  thermal_zone_device_register_with_trips+0x4c8/0x4f8
> 
> This panic occurs because trips is counted by num_trips but num_trips is
> assigned after the call to memcpy(), so the fortify checks think the
> buffer size is zero because tz was allocated with kzalloc().
> 
> Move the num_trips assignment before the memcpy() to resolve the panic
> and ensure that the fortify checks work properly.
> 
> Fixes: 9b0a62758665 ("thermal: core: Store zone trips table in struct thermal_zone_device")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/thermal/thermal_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index bb21f78b4bfa..1eabc8ebe27d 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -1354,8 +1354,8 @@ thermal_zone_device_register_with_trips(const char *type,
>  
>  	tz->device.class = thermal_class;
>  	tz->devdata = devdata;
> -	memcpy(tz->trips, trips, num_trips * sizeof(*trips));
>  	tz->num_trips = num_trips;
> +	memcpy(tz->trips, trips, num_trips * sizeof(*trips));

Looks good to me; thanks for catching this!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
