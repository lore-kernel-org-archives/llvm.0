Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F85F3859D7
	for <llvm@lists.linux.dev>; Wed, 27 May 2026 03:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779853365; cv=none; b=hqjnLGsI4zOExfMQQzDF5Ifbstef4YANYW83a7lv2G80Y3ADhKv+od5Xo83YKat9W+JQaYiREWGgBsyUGJzHanmk5IXSJdSp7MviUaj6PWaqBgI98XuUJqi1xvql1RdysEEXEeASvWCY4h55WzJm83cfvZQZWLhdWFkshRU5M+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779853365; c=relaxed/simple;
	bh=mNdFNfR2e4/65shxu0CC2MkDNtzL89tuju83evaBLMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuqt2yQ7yHV/aaDYx1Y+Zg21CBCBFPce+D37FNfBlsoqX/QiYibcwxwqFylT5yxCXX4dMRZCjqurjL4TYQNb0XgkQtPr95X0TCo/++X8q96xop0PQtQZmzEfiGj77iPk60XQdQg7J9q4XbCLMAVklhoTj0NiTP07zCgPVHFcXPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IGFpuSCx; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IGFpuSCx"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-83d5bbef760so4691567b3a.1
        for <llvm@lists.linux.dev>; Tue, 26 May 2026 20:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779853363; x=1780458163; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFp/skMYpNsFk+AsET2tPkoK5hubkQ0FZUfrIoL0LfU=;
        b=IGFpuSCxFPSR42rEhUn79+UMpqRbL4JQe29h29e0LksPVN4LlzG+b505YkSETFlFjP
         QLr+HyvkI9Ak5ry9CWzlJysIM5ewpiTT8NASW4eUvSPtoQPRR7fMFXNt4eD7fn7KkPFy
         l2y8Pawi+oyJ71EmQjELCngC1BUimsFoiJhPdjD7LMvTFORVxg+yS6ymhfPsC4FHY/57
         9hXXDROXWy63mvHw65Qswa77Xh0ec2tCnIPhZ68U1Jq/GYTDn8lsstnMRnOVbBFnVysW
         BHJIPDtX7mk943GfMZAaAuE75OpGvFTJV5GYjJoDUZXCAIyYb272TJKPLr2O8lDQoj3l
         CK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779853363; x=1780458163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFp/skMYpNsFk+AsET2tPkoK5hubkQ0FZUfrIoL0LfU=;
        b=a5FNav3Pi7OSAhBaaexSBEk2ezb2AfcNFDNPFZXu9L13RZyJ4JoCz3oRFe7gvHSRtc
         +pOsJzvrvgS5buFr6cBPbCGso6CGAGTgHQb0rn8+FjH3UslcxmhSMITVPFhB2E7HFSY7
         NvOmn6MtzwN9Y8DcKGlqJGuH9rZ8Kb6QURGZwyBN270Gdh7LPc/7X3th57OVjcEWx71l
         QJErlLqQLIyUtV/tS/wqpFK6jusXgEMwl9Fd+vuGovfft58pposy8EjcecFlTtlIGoLw
         iw6VQYQJ9WvlmSdVrB/DanHycSGUox2B69QV+SUDd61/qbuz/I7yLjj8gFZAIe9DNFHK
         m9fw==
X-Gm-Message-State: AOJu0YxRk6pE7W5fNxPgSg7NIOaN+HjuWt/sFvQUiBKq8ebq2H+QK5Gg
	NPWK8VUs8zbHNQKzHrEfCn84rx+v59oaTJGmJW98m59HwWFcpGRfz2GyMydF9/cznds=
X-Gm-Gg: Acq92OGRFWpJddAJuxg8vkMK+lrWy3WS85b88xV3l5j3lVUAdp3BazNoAlc9SHlhg7A
	4yN0XipwroPknyAFlxpWdGZkQNrSz90UQ5THY9V1lk7hFnQzxSSG/JU2G1PulpHhYaKC+70sQqf
	1aulctCtUI47o4TPa/tcnb1kXPl5gkFmwBI6SFIFat/SRC+sf9HkJ8AZabQ9ZiIMdnbMSs0zjTd
	eoC+MpJk2kq3820BmrMjDGftIxbtdZ0vuLNLqLnmIMBiBhL8bUKNWB7U1XYbrKcqSyY4ZFmmneF
	KWIAQLWbawc801hKFIezB3Q5iP24cvZANE5HvBz0WyepH3L2B8M3DdVIZjXz1VTnX0HP0gpqBrm
	/uJMCkoys1Wuqa8XbSJ9mIKnHYjzObvmZQs+ctrnbWW3ksp98d/Zj3ogJQuQlD+nXEskQLd61gT
	pFQ3hVbZbzEw5HuN5Yr57vfJnnOgu5IuTUag==
X-Received: by 2002:a05:6a00:8c10:b0:827:32de:d197 with SMTP id d2e1a72fcca58-8415f37d792mr20378561b3a.40.1779853362397;
        Tue, 26 May 2026 20:42:42 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d72f8c7esm739804b3a.52.2026.05.26.20.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:42:41 -0700 (PDT)
Date: Wed, 27 May 2026 09:12:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: drivers/cpufreq/intel_pstate.c:2945:11: error: no member named
 'update_limits' in 'struct cpufreq_policy_data'
Message-ID: <iqboomrmgx2wwbhj4achjbiidnw4hfsamnnmurs3lp5texra2c@evxcicq32sji>
References: <202605261237.PUsriOv4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605261237.PUsriOv4-lkp@intel.com>

On 26-05-26, 12:56, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/cpufreq-Avoid-redundant-target-calls-for-unchanged-limits/20260521-194713
> head:   6721940d0119159636e6b2da0c43eb5cff826857
> commit: 74b0d552acf45e33ce12c19ee815e52029b0b0a8 cpufreq: Avoid redundant target() calls for unchanged limits
> date:   5 days ago
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260526/202605261237.PUsriOv4-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261237.PUsriOv4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605261237.PUsriOv4-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/cpufreq/intel_pstate.c:2945:11: error: no member named 'update_limits' in 'struct cpufreq_policy_data'
>     2945 |                 policy->update_limits = true;

A different change was already merged instead of this one.

-- 
viresh
