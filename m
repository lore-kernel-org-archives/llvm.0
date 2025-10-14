Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9BC2877F4;
	Tue, 14 Oct 2025 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453607; cv=none; b=B9Wh03Oi9Oj593d8xnfYmuZ+e7hXvdIK8QIaSJHgqH4nwlgw74fz9CFkNCVGswm6EN8tIx0aHvIsVhrgAULjuVRPBcHCjePw38AK8L6OoT3JYpJlFh/JZMo6KM8KOIV647u+mnGu8mUY+DRsy0l3uuQ5PnxHBrxOsKbKYe02PHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453607; c=relaxed/simple;
	bh=z6qNyT2/oj6cU0ryqpoJ0qcaj3pCu/T9Mq36j0ZaZyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uldew71d/Ljc2YLkwv0P3RtZ4oeCySr2pB69QtqkAmBPB8u6k+nfAp1/6/HI3qSFNuN+M3HbQ9X96tjFSh9MPnkJI2B8xaMxQu9rE6J9W+D7ArirK+3fK+H40x3qWTmc3Zx6LVRNWIyiKLBlR8ZRqFbwowb1mqKi+DV46qlduYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1MfV+5E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1MfV+5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760453606; x=1791989606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z6qNyT2/oj6cU0ryqpoJ0qcaj3pCu/T9Mq36j0ZaZyo=;
  b=D1MfV+5E19xGZQ+fEZF0H94XJ/8Avhoi/dc6+/9GsSbXKm9wJPcZ1hqZ
   Vbbxr6/h6il7uRQkUT29YEGLzk3XDjHmrTUZBkTiaWzA4xaKbH2WFzriP
   EK6s+J4j7sqY3JDyTjxPebO100ooGCvMSSEBoro8sVI8Os3Un5tVfEILu
   SK1qyFp4wcalKw+LSpkq7PBOhm81baYYNAHsSraYuNRcUV3Xq1d98yQTD
   Fy0McQ4KxW6emxa1KJ7XkCJ8EPwja2NVZ2AOoHq5Q++/zYBsYYWnMl1S2
   hmy5mQwSZK3N8eyeWOu9coH3yia4Ak1eRY7txsVv4J+My2qGwFrSHpo6k
   Q==;
X-CSE-ConnectionGUID: ISUFwiWXQ9mFKfC3Sh/fFw==
X-CSE-MsgGUID: ZSgp1GmrTbawbRuO7cw98w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73215497"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="73215497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 07:53:24 -0700
X-CSE-ConnectionGUID: poiBxSkoQCCEVEGLJGVzdw==
X-CSE-MsgGUID: 8lac8hSAQea4DlnmA1UaEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="219043783"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2025 07:53:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8gNb-0002tJ-14;
	Tue, 14 Oct 2025 14:52:23 +0000
Date: Tue, 14 Oct 2025 22:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 7/9] clk: samsung: Implement automatic clock gating mode
 for CMUs
Message-ID: <202510142228.IQJSNIFa-lkp@intel.com>
References: <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-automatic-clocks-v1-7-72851ee00300@linaro.org>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4a71531471926e3c391665ee9c42f4e0295a4585]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-soc-samsung-exynos-sysreg-add-gs101-hsi0-and-misc-compatibles/20251014-045559
base:   4a71531471926e3c391665ee9c42f4e0295a4585
patch link:    https://lore.kernel.org/r/20251013-automatic-clocks-v1-7-72851ee00300%40linaro.org
patch subject: [PATCH 7/9] clk: samsung: Implement automatic clock gating mode for CMUs
config: loongarch-randconfig-001-20251014 (https://download.01.org/0day-ci/archive/20251014/202510142228.IQJSNIFa-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510142228.IQJSNIFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510142228.IQJSNIFa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/samsung/clk.c:481:13: error: too many arguments to function call, expected 5, have 6
     478 |                 samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     479 |                                                 cmu->sysreg_clk_regs,
     480 |                                                 cmu->nr_sysreg_clk_regs,
     481 |                                                 NULL, 0);
         |                                                       ^
   drivers/clk/samsung/clk.h:453:20: note: 'samsung_clk_extended_sleep_init' declared here
     453 | static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
         |                    ^                               ~~~~~~~~~~~~~~~~~~~~~~~
     454 |                         const unsigned long *rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     455 |                         unsigned long nr_rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
     456 |                         const struct samsung_clk_reg_dump *rsuspend,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     457 |                         unsigned long nr_rsuspend) {}
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.c:511:23: error: too many arguments to function call, expected 5, have 6
     509 |                 samsung_clk_extended_sleep_init(reg_base, NULL,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     510 |                         cmu->clk_regs, cmu->nr_clk_regs,
     511 |                         cmu->suspend_regs, cmu->nr_suspend_regs);
         |                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:453:20: note: 'samsung_clk_extended_sleep_init' declared here
     453 | static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
         |                    ^                               ~~~~~~~~~~~~~~~~~~~~~~~
     454 |                         const unsigned long *rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     455 |                         unsigned long nr_rdump,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
     456 |                         const struct samsung_clk_reg_dump *rsuspend,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     457 |                         unsigned long nr_rsuspend) {}
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> Warning: drivers/clk/samsung/clk-exynos-arm64.c:249 function parameter 'init_clk_regs' not described in 'exynos_arm64_register_cmu_pm'


vim +481 drivers/clk/samsung/clk.c

   462	
   463	/* Enable Dynamic Root Clock Gating of bus components*/
   464	void samsung_en_dyn_root_clk_gating(struct device_node *np,
   465					    struct samsung_clk_provider *ctx,
   466					    const struct samsung_cmu_info *cmu)
   467	{
   468		if (ctx && !ctx->auto_clock_gate)
   469			return;
   470	
   471		ctx->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
   472		if (!IS_ERR_OR_NULL(ctx->sysreg)) {
   473			regmap_write(ctx->sysreg, ctx->drcg_offset, 0xffffffff);
   474			/* not every sysreg controller has memclk reg*/
   475			if (ctx->memclk_offset)
   476				regmap_write_bits(ctx->sysreg, ctx->memclk_offset, 0x1, 0x0);
   477	
   478			samsung_clk_extended_sleep_init(NULL, ctx->sysreg,
   479							cmu->sysreg_clk_regs,
   480							cmu->nr_sysreg_clk_regs,
 > 481							NULL, 0);
   482		} else {
   483			pr_warn("%pOF: Unable to get CMU sysreg\n", np);
   484			ctx->sysreg = NULL;
   485		}
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
