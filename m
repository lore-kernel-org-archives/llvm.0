Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D82369D53
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625166; cv=none; b=MUQh6nkjlbOQx3Q+f/M2MLs4VufIwX6SARUV63Zs/RH721wMzDX2iy1B2XZsB1vLt6NWNnwCSlmGt92DdeEfw92mg1SpaEuEpRhqxGYiEVNC2aki+VDD/lSYuoHyg3QmLmTOUhKz35a61kUxn3ecqjaG15mptpNEPq8dIEqo1fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625166; c=relaxed/simple;
	bh=FTFVY4LJSlBMUY/FEld8hN6bCc4348a28Oei6Yt4Qoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXuSnW1Tsy5Eshqobx4TYQSiPfk9xXpbj9NA8Fd13hH3DcqvkCGluU+kZIIsnXF3VhfrAbA1CTq1By7sMYjI2AovU8qkWecJ6rlrLvieZX0o2Y6vFEbG8SLsxj5+Pdu7S6DulHSu3csYeFGECGNKLdZem/bz5+wEvG7D2d+G8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTUNBz76; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTUNBz76"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48436686a40so401145f8f.3
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790625161; x=1791229961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nE0ky2uir3ZbtbsE6y1/dKsaMUepowe2tawAEc50Fw=;
        b=rTUNBz76e6EWIzIFDoLFr+fhYCqEtNhbQdb5G07o2bag6rYXViW+hB5kzUz91az6aB
         6z5q1myJvFxFUlQo+bmRv5Ozwtm1X75Y+GTfUNYhKjly2KaXHRI/w2F9ELsC4sW42xKM
         FDDwEaeKOksjhqjqscMrrJFJQ5dBd9Ru2GODsLjB6hkNDnibtDvgbXfDenaa0mLz4kui
         kxrM2KOY41M3FWiNrtJzkFoNPj6mXbydlA1owjNpR7KXEd8bOv7u7mmRv+JamhpXyxie
         PGphXVCVCJzwN6890dTNZrNN2to3c8ro+1h7MoI+tUAY63+bFV7tqPLnmDLfDAnmHFT5
         IPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625161; x=1791229961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nE0ky2uir3ZbtbsE6y1/dKsaMUepowe2tawAEc50Fw=;
        b=DqNcmGYu4gpFl1sN8yAMIBcyf+ayUjwoxjk0GHJwNbDyuM3gCludEt/dI6oQil1qbn
         fT/fuv0imOqG7FDzAntRs68Ih5K2MXvcPhcOmqUViyAJRszVsimAVDfkUXdD64mvpcl6
         S4ik7EP9ms4PnXYAzBpWCMBrI9qQ7WFU2AMShTx3vGBjoAF6KERPPTrP/+aN7RzXuUWa
         zwump2fL5SjpK6SaYvcSoGnKjuRq5xX6uaaXGiYDvUvSBPMUwrzQrYznM+2rGDRxrgpW
         VoQlSTsNfiYBSqfAuUFTq0Jk9flNG8QI72zDeBRnwAzAp/VNbxAKaMPNHd+ZYPLIR8Zs
         SBZA==
X-Forwarded-Encrypted: i=1; AKwUvBzO5iXxKQG4b009ooBjTdDf3BOKQWE2S8gU6gHvrtMpuIYPh3uvhw3PlzS/QMKWRHX7FUQX@lists.linux.dev
X-Gm-Message-State: AFuF++lf0tzb2jAXzkTwyb1Uy9ye17qw7VS/Nen9+H0/+80Pf++LDNjq
	1yoDbArNb7bcu1uIR9dokMB2c9VdOijsIp7GqQF4RnTIpFnlKzigDIaH
X-Gm-Gg: AYBFou2ewGR7mzEY69enrh53FlzNMH1eslkeWUD6fCqc7zLpIk4onn6CT64BdSleveJ
	dW7e1UywE8uoT/t4h8aYWNHaG/FAOiwhecko+9uKZJ0IuHmue1PrIKEDaWDwxwpiInDMK2R6T+B
	DvBw5tzYE5XFpcofom6KRk+aFoK+BJYUQQo2yTw+33HTpene8NtrD5T2XEFPCaX80sTN1E18N2m
	hIHJOX9Rhy/igk1qonAw4PpxRSFlH2lGsdr3HEyuymqgrN5S/8Iy1rlNLFu9s3QDAM9swwNEEwI
	6zsz27bXkx0bqTH8/tGfVdArxnhNA+XocC3aEZF1aDh6dI/oHN7h6P0CKdV73JHrdxaqty4lell
	gHgnDgiGjkHdArauyVYqxjiovtZeelGSGGsXtp5cuvvzIGosGjOBIql/PN7ecMqyfqXQFLbHRIc
	5BSwLFDfXV0VCVHz3PxVDxByCTBCz4CAKx447dmZlxgQ96kb13eQxF2I03Y2xcpWgvCiQYSCC3i
	e14vHSrY+eEV/2sXJfA
X-Received: by 2002:a05:600c:8b38:b0:4a0:b6e:b844 with SMTP id 5b1f17b1804b1-4a00b6ebc3fmr26077875e9.1.1790625160463;
        Mon, 28 Sep 2026 12:52:40 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c130538sm22768995e9.4.2026.09.28.12.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:52:40 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: KPrateek.Nayak@amd.com,
	Vishal.Badole@amd.com,
	klaus.kusche@computerix.info,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	peterz@infradead.org,
	platform-driver-x86@vger.kernel.org,
	ricardo.neri@intel.com,
	stable@vger.kernel.org,
	x86@kernel.org,
	yu.c.chen@intel.com,
	llvm@lists.linux.dev
Subject: Re: [PATCH] sched/cache: Honor asym packing over cache aware scheduling on hybrid system
Date: Mon, 28 Sep 2026 22:52:31 +0300
Message-ID: <20260928195232.61319-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <221f8b0345328c4b26b65daff4d3eec56a32b06d.1790617047.git.tim.c.chen@linux.intel.com>
References: <221f8b0345328c4b26b65daff4d3eec56a32b06d.1790617047.git.tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Helloooo Tim,

> A regression was reported on an AMD Ryzen AI HX 370 running a cache
> intensive Clang full-LTO link. The little cores run at a much lower
> frequency (3.3 GHz vs 5.1 GHz) and have only half of the L3 cache
> (8 MB vs 16 MB), so pinning such a task to the little-core LLC hurts
> twice, and full-LTO builds slow down dramatically compared to
> pre-cache-aware-scheduling kernels.

> Asym packing and cache aware scheduling express conflicting placement
> strategy. Asym packing wants a task to run on the highest priority CPU,
> whereas cache aware scheduling wants to co-locate the tasks of a process
> on one LLC regardless of the priority of CPUs in that LLC.

> When asym packing tries to migrate task to an empty
> core that has higher priority than source cpu, let asym packing win.
> Moving tasks to a higher performing idle core will buy more
> performance than cache co-location.


> +static inline bool sched_asym(struct sched_domain *sd, int dst_cpu, int src_cpu);
> +
>  /*
>   * Check if task p can migrate from source LLC to
>   * destination LLC in terms of cache aware load balance.
> @@ -10847,6 +10849,10 @@ static enum llc_mig can_migrate_llc_task(struct lb_env *env,
>  	if (cpu < 0 || cpus_share_cache(src_cpu, dst_cpu))
>  		return mig_unrestricted;
>  
> +	/* Prioritize asym packing over cache awareness */
> +	if (sched_asym(env->sd, dst_cpu, src_cpu))
> +		return mig_unrestricted;
> +
>  	/* skip cache aware load balance for too many threads */
>  	if (invalid_llc_nr(grp, p, dst_cpu) ||
>  	    exceed_llc_capacity(grp, dst_cpu)) {
> @@ -12043,6 +12049,15 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
>  	    sgs->group_misfit_task_load)
>  		return false;
>  
> +	/*
> +	 * On asym packing domains, if the destination CPU
> +	 * has higher priority than all CPUs in the source group,
> +	 * prioritize asym packing.
> +	 */
> +	if ((env->sd->flags & SD_ASYM_PACKING) &&
> +	    sgs->group_asym_packing)
> +		return false;
> +
>  	/*
>  	 * Skip cache aware tagging if nr_balanced_failed is sufficiently high.
>  	 * Threshold of cache_nice_tries is set to 1 higher than nr_balance_failed
> @@ -13458,12 +13473,12 @@ static int need_active_balance(struct lb_env *env)
>  {
>  	struct sched_domain *sd = env->sd;
>  
> -	if (alb_break_llc(env))
> -		return 0;
> -
>  	if (asym_active_balance(env))
>  		return 1;
>  
> +	if (alb_break_llc(env))
> +		return 0;
> +
>  	if (imbalanced_active_balance(env))
>  		return 1;
 
Hope I could test this. But I don't really have hardware for it :-(.

Regardless tho.

Let's say when entering can_migrate_llc_task(), dst_cpu is CPU0, while src_cpu is CPU1.
And CPU0 has a bigger asym_prio than CPU1. No SMT. When entering can_migrate_llc_task() and sched_asym()
from there sched_use_asym_prio() returns true without checking if the core is fully idle or not.
And sched_asym_prefer() comes back true too, so sched_asym() returns true and, we just returned mig_unrestricted.

I could be missing something, If I'm not tho is that on purpose? If it is, the last paragraph needs to change
since it says that "asym packing tries to migrate task to an empty core" and after that "higher performing idle core"

Thanks,
Kayra

