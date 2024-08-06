Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A116EA35
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 04:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722919774; cv=none; b=ofMZrO2/zVkBbb6Bvqszg1nxuj6ozZeonTxWnVqjJaxZl24Uf6diLL9QBnFUCd+ht2x6Pe2EImI5pX59T6oTnhpuvRnPz55ISMVjxEKF1tY5kKWqdhL58z3cbR+lqeOJ1ribhGdr4caJ3is4+d8FKVqRQDhPEpW1b+e0ZL9EGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722919774; c=relaxed/simple;
	bh=zTCOmw6gISVXSp48IiCz6bMdu5nKagmz8qJ2lcvbZyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nl0EpNQ4ubcyQCxx/YQ8qGQx97Ln9NqmVrTnNHRhAwMvmX6W4CnSsgRA5YrRZOVCBrOp2phO/1O+MEYMrLBAs0+JoN8/ZT34O4CHzRsZwf41zHEyGP+WyoSkxTpB1QR4trDRq91wepnxUUmtpay9/rGLqWTR7m1NwmFhX99AX9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHb2o2Zz; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHb2o2Zz"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso151778a91.0
        for <llvm@lists.linux.dev>; Mon, 05 Aug 2024 21:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722919772; x=1723524572; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHH2ZM2ZbaCsMqJvKElXG0mbw5W5n4WMRbqy0wJyJXY=;
        b=wHb2o2Zz66/FR1lYBxn5nCv7UU0hBTgxddg3QGgPIFUNxDWEYBLTJd5aev6benTq2x
         AkDlrb9/eQDXoyk490rT9bUCZCjIXNHUEIdaYarM0wVy5H2UC0bRdN+oEK2gA9//xsu1
         R8roQLPinUddPHcREqT64pQymgDJQiRePjt368WqazJsvRzCn9WZcSR8g0umHHO6u/DI
         WJU3zOMIhGgqBmor8q/VaIGe7FVX/TAzu476Swo6q7jFl9aIcbt9gt5ncnPvhnZrSi9D
         fHZukyeO0dVqGN1AYepduC1n4uV+qjU62vsHQ++RvaBZUPbKVtQ8GCLs4mRDRC2eIHCc
         yLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722919772; x=1723524572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHH2ZM2ZbaCsMqJvKElXG0mbw5W5n4WMRbqy0wJyJXY=;
        b=unR93D/mxQydUttn+w+oXhX4NjCyANijaYR5wFymOjfhvjkE9EYg/nqe9VbLtXtabV
         YkwMkI+S39c8Rwpqa8AvLNRAER8Mp23bm3rS9QIOKXZveM0ABiMJHx/EeGTIZnKJmcDr
         ya6odQ3RIkK6toAiMG9zho60ynZYeG4U1kSPKnlgJ4YNkUXrKkGHXkCrkRksXs/KmFJ0
         t+FfsWk2Ltk7uAVXJ5lbW6C41v+Ihs3Szg86yNy691N+5bNaV/5egU/E32Pbz27b8fmd
         WzPu7E53XZuOO0hc28DPJeazdPHD7Mik0XjjJ9xacCh/xoL/wJEMa/0zubIAjFxCd5ye
         ZPqw==
X-Forwarded-Encrypted: i=1; AJvYcCXUJ+Zcufl0nxDOt1qVaHZmhA0ok8JunQIstcY7h075+pytFKhIbOMNNsx+Y3KXi9tKUWqbh5NBLYjC2PxWjHhMHUIAnA==
X-Gm-Message-State: AOJu0YzmQ3W0au0zVfrlSOkz1RtYJjPF+bqVJZ93MGV9TaM46TZlvfhn
	JbBnKywPU5BzJyXqWf4DZ4YO66b2RbU4KstElKSEpiU3E6Y3Rb60K8MXLY9CyMs=
X-Google-Smtp-Source: AGHT+IGIufVjk3jVXDFP+ZPCWH1xn0RILusDbBQ8tTUG4kEpwICOp9qYPfj0joz3IsRdV9VFGoKiNQ==
X-Received: by 2002:a17:90b:2307:b0:2ca:7636:2214 with SMTP id 98e67ed59e1d1-2cff9414339mr17227568a91.4.1722919771767;
        Mon, 05 Aug 2024 21:49:31 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc406468sm11668707a91.1.2024.08.05.21.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 21:49:30 -0700 (PDT)
Date: Tue, 6 Aug 2024 10:19:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	kernel test robot <lkp@intel.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] cpufreq: spear: Fix uninitialized variable "i"
Message-ID: <20240806044928.2j6z2ucnzk6lg5y3@vireshk-i7>
References: <20240805202042.3229190-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805202042.3229190-1-robh@kernel.org>

On 05-08-24, 14:20, Rob Herring (Arm) wrote:
> The refactoring in commit dca2ef2b7d91 ("cpufreq: spear: Use
> of_property_for_each_u32() instead of open coding") left "i"
> uninitialized. Initialize it to 0.
> 
> Note that gcc doesn't detect this, only clang does.
> 
> Fixes: dca2ef2b7d91 ("cpufreq: spear: Use of_property_for_each_u32() instead of open coding")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408030418.gnJDcCpm-lkp@intel.com/
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/cpufreq/spear-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
> index 4d28147c23f1..f8c16699a68d 100644
> --- a/drivers/cpufreq/spear-cpufreq.c
> +++ b/drivers/cpufreq/spear-cpufreq.c
> @@ -173,7 +173,7 @@ static int spear_cpufreq_probe(struct platform_device *pdev)
>  	struct device_node *np;
>  	struct cpufreq_frequency_table *freq_tbl;
>  	u32 val;
> -	int cnt, i, ret;
> +	int cnt, i = 0, ret;

We don't increment 'i' anymore, don't we need an i++ in:

        freq_tbl[i].frequency = val;

?

-- 
viresh
