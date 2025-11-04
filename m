Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97311DA55;
	Tue,  4 Nov 2025 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762259740; cv=none; b=CvgLW2zX2aoqiJrwJwFw5akzQHvFJT4KMxsxIfMWBuFtmiybLeDI3Njqz6jYfSvxgoXQ1J4tCBIjrSFqDSrP2LvTqlGMEC070M2m8xAq1/8/MxtcFIWY9cAkM9IWfFl0eZhCeCyI9smY7PWwA+tTVCONr/uaN4NdDhf6wKOMw1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762259740; c=relaxed/simple;
	bh=p0eagkDnvmw/Z4qENrk/NB7I9MKlirPBGt3TMB3ysEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fa5KqQvF7PBKCHyUAgzPeWdVnkCpRLH3NvZr33E4hxnMjYywSsbWspspH9ZVtWRShXn4Fep+Wi3yYAUkGUE9pIvjuXouQtmtEjXWc3OHdPfng73uikThzKb0jSOGArmqEocQd6zXyS3ePhzAwzpjr6hTLSxkXjNiwsfFUg+7270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUg04Xzn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUg04Xzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E02C4CEF7;
	Tue,  4 Nov 2025 12:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762259739;
	bh=p0eagkDnvmw/Z4qENrk/NB7I9MKlirPBGt3TMB3ysEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUg04XznJMbchVEkfpqo2veRlgAYaxBqVIhsWxVdMxzoAdx77arpejtornLpI0D4C
	 S0U07bUvgKrlFQBCsTD8+VuKoirMa3hsE9/RKDciE90DUdIL4JkbCPw3LIYlfam0eX
	 hzEO/lWBB0H85HAp3iq1NrDebgua5PFhyW2gtl0nE1FnHmNMS/lGieIHzmEyNQvv7n
	 XUAnbsIeaaWV50Dd3HkuMrMrehhRD4xo3w4wA6R9zaaD5ov9fc7N0gWTvCx7Qoq9wn
	 YCFAlLI0BbCbK00EW3qQoFFcMix2FKD0yH3l2IHp6Uk4EZqr2/ssAH1fXnfvAXVY0S
	 Fw4QKfDg7hhYA==
Date: Tue, 4 Nov 2025 12:35:35 +0000
From: Will Deacon <will@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [arm-perf:for-next/perf 6/8] drivers/perf/arm-ni.c:433:13:
 warning: operator '?:' has lower precedence than '+'; '+' will be evaluated
 first
Message-ID: <aQnzF7BNIgp37kcd@willie-the-truck>
References: <202511041749.ok8zDP6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511041749.ok8zDP6u-lkp@intel.com>

On Tue, Nov 04, 2025 at 05:43:40PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
> head:   989b40b7578a2be7b0388522d33d751b257d59d9
> commit: 8fa08f8835e57e1fd5e2994c9cf76c84dadc1235 [6/8] perf/arm-ni: Add NoC S3 support
> config: sparc64-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511041749.ok8zDP6u-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/perf/arm-ni.c:433:13: warning: operator '?:' has lower precedence than '+'; '+' will be evaluated first [-Wparentheses]
>      432 |                 hw->event_base = (unsigned long)cd->pmu_base +
>          |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
>          |                                  ~~~~~~ ^
>    drivers/perf/arm-ni.c:433:13: note: place parentheses around the '+' expression to silence this warning
>      432 |                 hw->event_base = (unsigned long)cd->pmu_base +
>          |                                  (
>      433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
>          |                                         ^
>          |                                        )

Hrm. Doesn't that mean this is completely broken or am I misreading the
report?

Will
