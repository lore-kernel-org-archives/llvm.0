Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547D8171C9
	for <llvm@lists.linux.dev>; Sat, 19 Oct 2024 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729343661; cv=none; b=tIXIA83V7lgod6qoxIPyjz46di9JWYxMiFi5HLMH8Hh7BYvTWZXNBdA/RotDnhVfwhTyVWuqm80O2tbywuIDdY2KNtjX6AHtMJ1YXADCJjoqyH9w5grF7VijaD827DJNk2KCkEzDoPW2ZAz1nlqL9F4caKMNYzRT5wEUCCsYQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729343661; c=relaxed/simple;
	bh=nFttUmTwQuRiqVsH4U6ZQZ/PMt4PrXLz7NgQU/oEK8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1WxyqLt6Zcg72bPk2ddWcVJmioJDVRweON53oaT9Ak4XL0ptdWhToVSs7b9atg/t4sUGin71em6dsBMFBCjsdXGdF3umJi8NwUtbwql0M71Weoy3bsgnI2k9rZSWpXGTieN3hfOuuJKcStmGsvE4qSDIbtBJmX0a6gmar1fpZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CS/pD5Zt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CS/pD5Zt"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb587d0436so30521181fa.2
        for <llvm@lists.linux.dev>; Sat, 19 Oct 2024 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729343657; x=1729948457; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DsxiJAaLUxZ8WyINPgvN9VPitcA+1/D6dK458s/cN50=;
        b=CS/pD5Zt84j0EeslmBurEtmmRYF69WARMXHUwWqPVVlMdLovj++WIhw7zpPH2uAeNK
         G9xgI2CVQNZJCG6laD/4mNWnhyGWw4niJXZ2qhkIxBRBkAA7wg5m9iJuPKzZMvP1j4k3
         q4XEGKFIvk6Xeu/DL3rBDxHgrTSY3Eh5F6sbNH96t3MAuxNJ9SWMSytDc3BnFAbgyHiB
         uCuRqJy0ItLoGRRVsX2ThLvEcsNJJED2anyCnn4uLyEQsdrs4N1TNP4WfwGqHNXDb+4k
         gSPmAK9j7qHHIRcoSwP/nfKwmcQCbAcJoEAgcQs6bRRMorDgXVSc9gTlSktNGKPiceh0
         fqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729343657; x=1729948457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsxiJAaLUxZ8WyINPgvN9VPitcA+1/D6dK458s/cN50=;
        b=tU/lf1TEGTmIqY/wLLrTBh7THz1wAcNln9w3kA04nLs0ESohYvexpyeMquxx9XdN3x
         cJH7fFuU+Pqgpxo/tZ10ylXAHtD/Qk2rkhiTujFLL49cgVl51xDmBRtgSlYDtAsegHsw
         l8Njggwal6ZrZRlOEnBXO6wCH7wfkg6FmBFcF+NKHzIFETYdDI4xvV2qLBWfVGgkOM20
         fX+R2QjVfaOt2kI+beokhpYovh2/hR2HIg/sApqyuAx69Hz3JU7MxxhFHio0RtdJS8x7
         nxEmyzA7G54eeGlxB82cKGYpWOlo8jkUEtAt4hEaaofpLTBmHAF+F3hYjcKbHMY7sder
         iN4A==
X-Forwarded-Encrypted: i=1; AJvYcCXjQ9hQtDGcgHwgZ+tTWN4nwsMtXN2bnsaRziyt9zVOVZKR5AdjHwPHSlXX85WjAA9tI+Ud@lists.linux.dev
X-Gm-Message-State: AOJu0YzUdSS2FnVjo3yt1KuUluTZjtfhyZmYyGXmI3ohB99ylGE6qu13
	fdHBkf8g7aHseIjkFLK7I8Fw13QawRi6FRTCVoOJQsT/ahe5slfP9S3LZ8lE+4o=
X-Google-Smtp-Source: AGHT+IEjv+MXakpefCsgi5HLZxPHwYDurtx/yD0nuWtCXMQYx9C38W3JKkkERUExxV4d2KBsbM6yEQ==
X-Received: by 2002:a2e:e01:0:b0:2fa:cdd1:4f16 with SMTP id 38308e7fff4ca-2fb82ea761bmr22402471fa.14.1729343657256;
        Sat, 19 Oct 2024 06:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb80712069sm5028321fa.0.2024.10.19.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 06:14:15 -0700 (PDT)
Date: Sat, 19 Oct 2024 16:14:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
Message-ID: <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
References: <20241018151143.3543939-1-arnd@kernel.org>
 <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>

On Sat, Oct 19, 2024 at 03:01:46PM +0530, Akhil P Oommen wrote:
> On Fri, Oct 18, 2024 at 03:11:38PM +0000, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Clang-19 and above sometimes end up with multiple copies of the large
> > a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> > a6xx_hfi_send_bw_table() calls a number of device specific functions to
> > fill the structure, but these create another copy of the structure on
> > the stack which gets copied to the first.
> > 
> > If the functions get inlined, that busts the warning limit:
> > 
> > drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> 
> Why does this warning says that the limit is 1024? 1024 bytes is too small, isn't it?

Kernel stacks are expected to be space limited, so 1024 is a logical
limit for a single function.


-- 
With best wishes
Dmitry
