Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B069C204680
	for <llvm@lists.linux.dev>; Thu, 24 Apr 2025 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482938; cv=none; b=nwbUXgd2tiHc51FRkfqJLTo+b5bG7+bnJrDYi4yVlu/Blf7EWGy9372U9VIsiCDUKd7vm8FgLJoEpr7gcWCVh8eUt0AjZj5fELuLmvf/hCxD3MVF/JEz9D3GuST2rzL7g+YyJ+7NboifvthQrZdIbmT0nymw6jPXXarY91ljqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482938; c=relaxed/simple;
	bh=U2SWfmtUHoaXDz9lMOYfUI1uPEx2HBdKts1pl/F1720=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aSjXGcnflXHh8lOr+gnY4mBKPxRFFR914wI5YUntp/YwKlHkxFZ5mgkfQi8rvl4qqXfIxzLC20ci4HG+W4CvlGhEVr//gVM4VtNOCYpFwhNTJnnnzZEciweQ27bjioeo1RM+X2fXYSUmURbAMowmBijzGNDYyMhJBwFsX2svWKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVcOhgjr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVcOhgjr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so4608625e9.1
        for <llvm@lists.linux.dev>; Thu, 24 Apr 2025 01:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745482934; x=1746087734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIynMgzNZBX//p8JMkyZp6ri1Xu2zjE3M0NHiMyj2e8=;
        b=rVcOhgjr8H75UT7mba6QptPpPjjMWnswi/bdAsoWkEcQdouG8lbuM6uSnCUqTEFYs6
         RTXuCUsNwZMGHOUVSOfjHJ2JlAl15w5gAYUd3cQU6GLf5mgfsNkoPJzidnJuyyW3WyZt
         5KnkzOEtrl8AEgk+qLmgTkjnE6O9MRoWWQJ6MFmjxGXbfBQM+uGqVVwD6Q3+bLUkZMv7
         gy3+xgoNqtTuzhJpVf2xkENyEFAeEbnjaJKpKiGM/1Twtm4h7hBvP3R1ZZDpGSziOe29
         LA+UDUtdYdC3fzSjbdhKWGvJNElV60WT92nUkLg//P6qUGfkMgHFtcadjdh7OG96MIc8
         yrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482934; x=1746087734;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIynMgzNZBX//p8JMkyZp6ri1Xu2zjE3M0NHiMyj2e8=;
        b=AUftQvhPh7MOZAPFTv89dhMox0kroQJDjE/YcgIBXeMPas1YzZO6HxdPw6YFEhU4Qj
         KgWgdyryPqkhuFhfyTd+dFOvrzp9CKWDD1jK+YC1XIXsvopxy479WpBbchGxw3hsXSsr
         wSQHU7BgGjkjh+GkTNTdJ6FmsBY4eXLQ9H+sPBbPpyBQl9yFB3lmVjh+U/2OqFbusPv3
         wa9i1VsG4kbWppxjtJHfmjDWYtetCLBUYwcnsSw2ovU4YN8DhZhh6gS4+ME5Lcd1Sjwi
         GLSF9NilzcmqjnWAUIcyv744isTgXvnNMLynQjN/bqsBMOQi7Goau0LycGPJqvsuKNJf
         DPHg==
X-Forwarded-Encrypted: i=1; AJvYcCX/V/gHgg1Hvi67qE+/4a0Li1BaQctYNbKFLqe9fA73vcblczA/ZOqMe3nQL6cEGsbHdpLo@lists.linux.dev
X-Gm-Message-State: AOJu0YyS+V6u6kfU5HBf9x+LyPGxfhjq0NgaRYlD/L0FRPUNqZtPubOL
	piIcRZuI2UgfTqKT/WsGOF4Daxid3NF6jj13hpS6EpMoPyWm6PNiOwE/bPekJ2s=
X-Gm-Gg: ASbGncvzbz9ICobzEjY9DjQUnbo8Q388IJrFDRQl88rThjyrwE4G/yxJnOR3+ZNpKX6
	p88LoXFIyTiwIbOCVAKtL9/98V9KHoiqtnjKbriQabHFVY+LALPW+mJ8QY8ckzZ5jVo0Bu/hO+B
	lveUhNiYDu3uwksxHc59+rsFyo0psCmQsFAlMMS9hVSYubLLT4yJcETC7sZNMmXJvPjlTG8y46X
	AYqYoKcu5E/a0aY6m++cNrM8jhVni066gxf/zFCy7bLJXkdR9OYd7cEu21hGElLnD37iruh7H9T
	VN9fCTtlVXvNhQN0i4z72YR7MntvNXPK1O3i/GQzpDmFOm7uBoTv7pCPmEIU1w==
X-Google-Smtp-Source: AGHT+IGNoVo6KhUwBfuui2yrKQx8otgicR7UifrdI9urzxt8lGP1itEapAxnVeqq6j8kw3geKV6JYA==
X-Received: by 2002:a05:600c:45cd:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-4409bd07569mr14887825e9.3.1745482934032;
        Thu, 24 Apr 2025 01:22:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29bfc4sm11229415e9.8.2025.04.24.01.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:22:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev
In-Reply-To: <20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org>
References: <20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org>
Subject: Re: [PATCH v2] drm/panel: himax-hx8279: Always initialize
 goa_{even,odd}_valid in hx8279_check_goa_config()
Message-Id: <174548293341.3240462.5657130460856318772.b4-ty@linaro.org>
Date: Thu, 24 Apr 2025 10:22:13 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 23 Apr 2025 10:41:41 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>     838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>     842 |         if (goa_odd_valid != goa_even_valid)
>         |                              ^~~~~~~~~~~~~~
>   drivers/gpu/drm/panel/panel-himax-hx8279.c:838:2: note: remove the 'if' if its condition is always true
>     838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     839 |                 goa_even_valid = false;
>   drivers/gpu/drm/panel/panel-himax-hx8279.c:818:36: note: initialize the variable 'goa_even_valid' to silence this warning
>     818 |         bool goa_odd_valid, goa_even_valid;
>         |                                           ^
>         |                                            = 0
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: himax-hx8279: Always initialize goa_{even,odd}_valid in hx8279_check_goa_config()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0228687423587d8ef448fc1d81f96539507aa5bb

-- 
Neil

