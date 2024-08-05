Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D3B13A271
	for <llvm@lists.linux.dev>; Mon,  5 Aug 2024 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722854883; cv=none; b=ff4YW67NtcfMEFieIEkzFpCC0CNZW0m0nuB1bPcNhnTjB8Ml1ubfsV40vX/6hXiYWuixu1M1DWgChZsH/pK65tKGvI4M483IZLSihkYmnnOK+8tSGSadyerC4D73mzDYF9oXqjD0+adocNVf74tt12vYV5MQN/eGS/RTzGpkqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722854883; c=relaxed/simple;
	bh=1erOG6BD+UVqmjSzqgy0UeFWC6Qbup+YMTG/351ock8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkgT2OBnu44U4ZzaKhXbtd90kPQ0TBnENKd3bLGRrIUtEZvQoUa9BJbJ2+s37MyKkMx21NYm/0ysjW4cDWE/nbAcZEf5gYSF+cc5JAz5gbd5o86LnDCsqGbkbRzpV3LQzs8B5htOzzARi8LgpOQ7QdsT3DY22miCyL+c3DsD+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oXjSHM0C; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oXjSHM0C"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fb3b7d0d56so56008155ad.1
        for <llvm@lists.linux.dev>; Mon, 05 Aug 2024 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722854881; x=1723459681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bZ4eC6aco2OMzLZcW32lNcwJ0jDMMtztuSf2DOiIEmU=;
        b=oXjSHM0CpVuabVEDVc6RRLSIMn7xoVyEinRoxr4POJI1wAil0D34vTaag3FVQ6VYUe
         mrdHZXTb21tPi5jig0CCw6iWbXumEVcIhLYh6q+QRvP1TP41Zpq4/F14czQNuB13ARBN
         7wM+KiazcY9ekZfS+2bJJIVStXZ1LaOEV3QBu3hKYdM7kRau8s/aydRIjOi6zrnLOxnH
         iG+ScJP3IzGFTfvQdXMrWXwNcrgzNzEBN6GiSnBjm6wx/PTGX9HB+VWqxsfl90Xd1tIH
         B2jG2AbESFQMsIOxo6b2lPh9oUq5Vd5VrJ7eMg2vj+FHSKSui0jq2aAYNcVRCvgUKdkC
         u8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722854881; x=1723459681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ4eC6aco2OMzLZcW32lNcwJ0jDMMtztuSf2DOiIEmU=;
        b=qXH23/JvQKfDYPDjxbTZnws+iq1scAE69yTfYcB/N/SKJ8x0F0nbVkmDNl46ihs+Pz
         f29BwPPSgq6ggzIyWsmYcrBDQaJpq0FCYFw9tz9EgcW6veddMCPPaNet+UkPucuPH/9p
         tYtHFas/lLudLEEUOJVwkKRExLJsKGLz0/fGVPVyIp4qWKWXBH4+oQxiGcs8rLPHZRbB
         13UgVme0KjL3FgeLe8j27foaPMHSm2MmGytQ0H9+crqiatI5FSRnnFkXdJMC3QpG7/ee
         Rti0w1nCo/g2OablDi/z7lRWIYT6YGNnroU5ZsQKSrpuGaJhbAZhGVgkc/wWVH5cwflO
         qocA==
X-Forwarded-Encrypted: i=1; AJvYcCWYJ+x+Nm6aLPioe5s/EGTt3fHT6KryhIZmh5GNrp4mFeaQbJfsATbK+GmbKz8EiBiRRJUZcxTa64ez8kGzOl4oq0TNqA==
X-Gm-Message-State: AOJu0YwOvezG1P4hQotkPy7rcoOeIFPZB93/NnK1hZOrUo40cr1gA83P
	FHnaUaEr+pBkkCqQxH7hOVmggletUEeqt3ofDLfLNY0t03B4omBGmqUtiHVEObU=
X-Google-Smtp-Source: AGHT+IHspederY56HLknhhlUUMxPp2/ot8UlLUewi1mzpD8jqzWyRsMD9OvpzVtKoiLvrCnVYGjDng==
X-Received: by 2002:a17:903:234b:b0:1fb:984c:555a with SMTP id d9443c01a7336-1ff574ba872mr107623905ad.52.1722854881353;
        Mon, 05 Aug 2024 03:48:01 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff591797f6sm64592435ad.208.2024.08.05.03.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 03:48:00 -0700 (PDT)
Date: Mon, 5 Aug 2024 16:17:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [vireshk-pm:cpufreq/arm/linux-next 2/2]
 drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is
 uninitialized when used here
Message-ID: <20240805104758.52obllbjvuvtmd4n@vireshk-i7>
References: <202408030418.gnJDcCpm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408030418.gnJDcCpm-lkp@intel.com>

On 03-08-24, 05:01, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next
> head:   dca2ef2b7d916c718c6e88084170413a8a1942d0
> commit: dca2ef2b7d916c718c6e88084170413a8a1942d0 [2/2] cpufreq: spear: Use of_property_for_each_u32() instead of open coding
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20240803/202408030418.gnJDcCpm-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030418.gnJDcCpm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408030418.gnJDcCpm-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
>                    freq_tbl[i].frequency = val;
>                             ^
>    drivers/cpufreq/spear-cpufreq.c:176:12: note: initialize the variable 'i' to silence this warning
>            int cnt, i, ret;
>                      ^
>                       = 0
>    1 warning generated.
> 
> 
> vim +/i +202 drivers/cpufreq/spear-cpufreq.c

Rob, can you please send a fix for this ?

-- 
viresh
