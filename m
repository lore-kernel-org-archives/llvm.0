Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C36024EA91;
	Wed,  5 Mar 2025 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741188556; cv=none; b=txRanUZmIz97vEGfKskuECMoib3zbNz6/ZSkW9nJ4Iby6B0kdY58dOdS08Z0ary5QhHgJBzy6zs/+Qv18ih1lPSXIvIzLcEha4HMC7jAsAANfogW+/vQfQ0s8EROjYfz6ijMWGpgMAHd8tggaSpnha2wIazXq4/Dw9oubsOvD7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741188556; c=relaxed/simple;
	bh=brd6qryqI2OqJ10VAvgsstU48fVOEBGewa4UW9hHXTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l68PN7WmuLT4OYBRcrj+/7Usly61yqCMWA66H0lam8hvq/paukI5U6OmYInT4zAylWQr0wqhuUw0PCsV6lCtoCZwmIyAes4LPmIKnP1XjhEtoDZWT/xiQ50O9POzpP6j6jqDsNV/auugaA084QXrMMaP1l8rIyepyijY0H0ry6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFY9EgCH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFY9EgCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741188556; x=1772724556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=brd6qryqI2OqJ10VAvgsstU48fVOEBGewa4UW9hHXTM=;
  b=NFY9EgCHnag3K3ffP0IZA/90EwGqBdRVh871Xe7sxBMH+yUUyuj9i3Ax
   1Qv/aQyy4ambFHNi8IO6wEWzgvVzaeQhRaZLeSP2t+unoIZ3AtLu2209P
   y94FkcabebzFFEKcJ+6girkGowjnCjsBAe5tHgl0k6qLEeiHLgafQFQnp
   Ixck+Rbp97YXh76+RyJsUz6UIZrGTf8YOmMoCD3p5o0yzu1inktFAkf8C
   0HDXtt/mMPC0qDiS0R/MwVd3+OX5L9iC/nmns+A3HMxXzRVo40BYHT9cT
   Ll9hRJqM+ktrgluckbUJO9Kd4cIM+VUEyHvBfK6CQ+5ljGwsJUeBCLd0v
   A==;
X-CSE-ConnectionGUID: Q5y/0Vm4RuC/bKfW3uBZfQ==
X-CSE-MsgGUID: mAdViEV0ROy6jhuqJ7kGuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42064430"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42064430"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 07:29:15 -0800
X-CSE-ConnectionGUID: pndPWfs6QyOmC1DOheMvlg==
X-CSE-MsgGUID: 7knxXuWqScyOLLQ9jGacrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119640346"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2025 07:29:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpqgG-000L9W-3A;
	Wed, 05 Mar 2025 15:29:08 +0000
Date: Wed, 5 Mar 2025 23:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/perf/core-book3s: Avoid loading platform
 pmu driver during dump kernel
Message-ID: <202503052346.eTbppObo-lkp@intel.com>
References: <20250301182310.6832-1-maddy@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301182310.6832-1-maddy@linux.ibm.com>

Hi Madhavan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-perf-hv-24x7-Avoid-loading-hv-24x7-during-dump-kernel/20250302-022531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250301182310.6832-1-maddy%40linux.ibm.com
patch subject: [PATCH v2 1/4] powerpc/perf/core-book3s: Avoid loading platform pmu driver during dump kernel
config: powerpc64-randconfig-001-20250305 (https://download.01.org/0day-ci/archive/20250305/202503052346.eTbppObo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503052346.eTbppObo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503052346.eTbppObo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/perf/core-book3s.c:2599:6: error: call to undeclared function 'is_kdump_kernel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2599 |         if (is_kdump_kernel() || is_fadump_active())
         |             ^
   1 error generated.


vim +/is_kdump_kernel +2599 arch/powerpc/perf/core-book3s.c

  2587	
  2588	static int __init init_ppc64_pmu(void)
  2589	{
  2590		if (cpu_has_feature(CPU_FTR_HVMODE) && pmu_override) {
  2591			pr_warn("disabling perf due to pmu_override= command line option.\n");
  2592			on_each_cpu(do_pmu_override, NULL, 1);
  2593			return 0;
  2594		}
  2595	
  2596		/*
  2597		 * If the dump kernel is active, skip loading these drivers
  2598		 */
> 2599		if (is_kdump_kernel() || is_fadump_active())
  2600			return 0;
  2601	
  2602		/* run through all the pmu drivers one at a time */
  2603		if (!init_power5_pmu())
  2604			return 0;
  2605		else if (!init_power5p_pmu())
  2606			return 0;
  2607		else if (!init_power6_pmu())
  2608			return 0;
  2609		else if (!init_power7_pmu())
  2610			return 0;
  2611		else if (!init_power8_pmu())
  2612			return 0;
  2613		else if (!init_power9_pmu())
  2614			return 0;
  2615		else if (!init_power10_pmu())
  2616			return 0;
  2617		else if (!init_power11_pmu())
  2618			return 0;
  2619		else if (!init_ppc970_pmu())
  2620			return 0;
  2621		else
  2622			return init_generic_compat_pmu();
  2623	}
  2624	early_initcall(init_ppc64_pmu);
  2625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
