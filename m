Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937597DA95
	for <llvm@lists.linux.dev>; Mon, 23 Sep 2024 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085514; cv=none; b=pf07HW53tL81cC6X6OrFt0cg8oZZtw+8bQBY7L3/ShVfviWeBY4KCLGdSWv9BxXwXWpb7gDcfmR/YUQf1DTIlarLjO4STa3vrUDCeO3i7Wgty9cFiGIuuHQwN0FrFQbkGvdgaG6F2Qz/w1bFy8YcyjevCwP7TKDEBmBdpAMog+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085514; c=relaxed/simple;
	bh=diVA6mkav7S1q4H7HLbHC6FC3Js5JaiEdmc0yq5VF+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT4OMNsdydALhBncGugMkyqz7eeaOZj3ay+/ZG5c0ReoR1DAoQNPbgIigIXwC2bEjqUSLf1LVW2vNaHGwPPFRYxfws3HhlYRkCyEzomKHqipwolaGl96mRU2Ul20UldRQVP9kFo+Kjm17WgW3jh9qXwMFK0zEAzqfDnr3sDtn1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gphOXaRq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gphOXaRq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-536748c7e9aso4934809e87.0
        for <llvm@lists.linux.dev>; Mon, 23 Sep 2024 02:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727085511; x=1727690311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub4XgTiDaTnG37jRiFm9Y2Fc+WlrLGpXlCWkejMfFT4=;
        b=gphOXaRqJqtCdfd8eDeUbRrlO60oifeVpWz9pmuPw4D2COwuGy+CCtToA38d3a17+N
         FBts//q+w4ck/cdJr4OFUfwVLguZUXx2GRRVrGlJ+vQ65L11H5rNnm4zSdZGbTstOrw/
         aPwi2zgQOJeFGMKBtK5o8qMGVhbKERGPr/8EK022JtNBhILv4EQTw3+OX7tSo0Ow2FWE
         HvrUR0mRTIh0nMYOI3BHVo911jHhoMQHZ9p7oUzAM593um/5kxZMUxfXbKhSuj/ZbISj
         5+SHCvehPb0zjF3x2tLwTepPuyhr8kIRpVKOHV35Krwl+HnZBr443pru8vT9Omksw0gf
         0p2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085511; x=1727690311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub4XgTiDaTnG37jRiFm9Y2Fc+WlrLGpXlCWkejMfFT4=;
        b=ceLEvyYjph6OZJDaeaMC1M44Lij5nE/vsZIeAN2HrP9hIfWzrhRREZ8NmDxKkMi757
         yEUI9pDlmU6RUnunR5w6spC6RMUYJ972sSnHka4DMwV1rUO+AdokXCbhCEvepQdU5aeO
         LwykCPGzCaj3M81fvsOj9iKHZPlnSaIMnM3LWhRK4ghvrJgm+KDpOqQeEd8vNrSuoPSj
         qfs0Q23LyN8IMNqbgRa52F0wyZwnEUL/ur16kP+Z7g+hsj2UvvEReBe/zhowuSNeOyjW
         8CH3bbdA1i9UtyXEbxv2VyKnHgQlmwoNaORcS+5adOHNdqhVb7iXzxv9LnOIfYIqKzOk
         bxnA==
X-Forwarded-Encrypted: i=1; AJvYcCXD9VSrEUgCoMMlb+Jce+x5l5vzFXpcVRrht9aIOmekPg5tBSF5moua9CmrFj5UO5KJ+jTJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxH70gyF1ld0siJVyaJC7Oe3h6rgqtgeNP8iJ3rc+AiyeUivEn6
	BuP4wmcR2H1Kh0jVazQ3pvuwN3Q6wwbJGeI/UuhceZ0vgCOjrnkLFAc02NFRLLQ=
X-Google-Smtp-Source: AGHT+IF70YCd6NPOg2g1uNWxOpDA5cEHVgZRGvQWfOhS4sHNqYU0tUy6qbj/ZoxZsUYtksuWhlIynw==
X-Received: by 2002:a05:6512:1309:b0:536:568f:c5ed with SMTP id 2adb3069b0e04-536ac2d6909mr5891988e87.1.1727085510477;
        Mon, 23 Sep 2024 02:58:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368709684dsm3220907e87.148.2024.09.23.02.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:58:30 -0700 (PDT)
Date: Mon, 23 Sep 2024 12:58:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
Message-ID: <utahvquemchnryqnbhuv2rfxqcgfowqqhjrbs3xtxej7ts47km@bbir4nq2mfwv>
References: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>

On Sun, Sep 22, 2024 at 12:14:48AM GMT, Dmitry Baryshkov wrote:
> The pll_cmp_to_fdata() was never used by the working code. Drop it to
> prevent warnings with W=1 and clang.
> 
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 


And of course

Fixes: caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")

-- 
With best wishes
Dmitry
