Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1403E140368
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713900766; cv=none; b=VRHqzVsMzEG5yyJPEybxVHpBb2ljBbu32JcafjDgmDygrAtkGeyeLsO1k9bFa5Nx1hvAUzMAluBe6ncYd1Da2rtA0gx2A4O9lFHGkvSJQhXSSgX9v00Y/dRDvVrE2N/yuYLbVbc8q6AKqKUn63gD/+c82xPfpCVRVbMaaFoUo8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713900766; c=relaxed/simple;
	bh=Yg9JT0GPJ5FCanV1IVJLCalS6j631626ieKfDNZIsrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbHo/Sp96xZpKu7M8aUkETIBJSPocUDlaec8rCQasIHtvI7KBKb+dZShxuR5PRFhwIuh1ei371J5MSONxefyxpq9SgeGV0AVSR5CaV6baeLcfSuLk+CDcCWYGnlYyz7JqHZyJNFN4CIMAfVkIaeV4uJuRNY/CfTd5CAK3d2Ng10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEjolXSX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEjolXSX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e3e84a302eso42177495ad.0
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713900763; x=1714505563; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGaS/zfSaOemq/5va4z7SgRNYZdnHSSpsk3opQQf4+o=;
        b=uEjolXSXGwHU8bFjCX9AKMfGRYlsFBFlYBpzkAri8o3mS9TgV9heGPFlJDLeKyMmVg
         FdMe/ncw7QFQuZB3CtmMBWuVIuYiIGi6yed3GIWwgHGhg4YvgoSMVu6AK9x0NaVSqK0m
         bwZUroZJABQTAecVg89xbXZPfl3vHMKxUPRVF7vHO8mFgz55ncxyvyI+6ZnpjSJUTaGP
         a4F9Nf1PsuoYXAfPQ2C6Ix8Ig8NZ0UQkIFZ2m0rQtSuvNztY7UcrE1dWcLHhEbg5F7Hz
         HDEUNTzdqQAvGvFShgCLC8+zQWxUOGlqhdeMnGJdE+8b1JuwOkjEN+7Y0Ld0KdpKQWv8
         XvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713900763; x=1714505563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGaS/zfSaOemq/5va4z7SgRNYZdnHSSpsk3opQQf4+o=;
        b=nX0fbPTCgdRZXMxPKzRqRNGiVefLkPOiWfd1KKkQ1JA/SrVdv4fIFTvkSwb3xkjQyF
         gUSeA4M5aFSYlYhkTyAjt/E2CE301wHtzusUrOmPeqEpjvIOxKHc920DLtF/oR2JyJ3x
         ev1QnT8m+5r5nKTBdA7pcWDaTNF/fH9HsHGpuiRnxgN2EqcttmZUgvIr8tb/F6muA+3n
         PP3JncIZHo+Do2/CQs4ZW/aKjLdLye1kraTxkr7dnh3DUunvO3a0VqT1F0ChvUev90Z2
         xps1oG9yjzMbrnZd87EEPwoqeJtaPiMyXYXFOkhOHC0SKmuTfGvD5iUjSOBDkjJM/aFA
         2voA==
X-Forwarded-Encrypted: i=1; AJvYcCWrU61+eQfGAu6peAtgUPDaZb8aYUio4dxIoXEfZXxEgcbbaCBW7ZX8g/kU6VSOEhmTih7rbb0MAZFZVZRP8Kn3d0hA1w==
X-Gm-Message-State: AOJu0Yx3DsV/PXTfRKVWCE6gulvAqd5SbSQyMFcEukoOe521jVsRMPi2
	uXphzB7oqgF6I2hFvGoW24LZaOVUj/91RtJTPwWxjzWOuW+Vt2KcAG4qp3iljTk=
X-Google-Smtp-Source: AGHT+IE7HckQKrB7EekRQpTfXp8JNrKSb1ZYBxmPz3IOLyDMxafIxaoffEuDaKvno/obq55gOhpMuQ==
X-Received: by 2002:a17:902:cf11:b0:1e9:55f:f3be with SMTP id i17-20020a170902cf1100b001e9055ff3bemr533792plg.43.1713900763238;
        Tue, 23 Apr 2024 12:32:43 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:951d:44de:e424:2887])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001e435fa2521sm10401699pll.249.2024.04.23.12.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 12:32:42 -0700 (PDT)
Date: Tue, 23 Apr 2024 13:32:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drivers: remoteproc: xlnx: fix uninitialize variable use
Message-ID: <ZigM2KORFbsJgHEW@p14s>
References: <20240423170210.1035957-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423170210.1035957-1-tanmay.shah@amd.com>

On Tue, Apr 23, 2024 at 10:02:11AM -0700, Tanmay Shah wrote:
> Fix following warning for clang compiler with W=1 option:
> initialize the variable 'ret' to silence this warning
>      907 |         int ret, i;
>          |                ^
>          |                 = 0
> 
> Fixes: a6b974b40f94 ("drivers: remoteproc: xlnx: Add Versal and Versal-NET support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404231839.oHiY9Lw8-lkp@intel.com/
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index a6d8ac7394e7..d98940d7ef8f 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -904,7 +904,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  {
>  	struct device *dev = cluster->dev;
>  	struct zynqmp_r5_core *r5_core;
> -	int ret, i;
> +	int ret = -EINVAL, i;
>

Applied - thanks,
Mathieu

>  	r5_core = cluster->r5_cores[0];
>  
> 
> base-commit: e99fcac055b3325283d6c5c61a117651fb147686
> -- 
> 2.25.1
> 
