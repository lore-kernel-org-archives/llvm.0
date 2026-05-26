Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643833CF97E;
	Tue, 26 May 2026 10:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792995; cv=none; b=BpKJjQNxbQfSRrGrCh7w0hTiymstrGOE7qGpVQrMowXXEcw/tTxPCKOMd+ZBXng0a8/yBPD55TDn8KvHT3KnsK+zBVWBOd7sei39wJmjVyX31zHPSVH6QHjXqP0Dg2hBh/X1p+pModPUaTk4+AudI8BytG1U9j8SfvwdXQ/mFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792995; c=relaxed/simple;
	bh=FUn9jnk2b3C51wwXxarijdEuKgaJ+IP+qMReYP/cfPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z3a3dPO6rzaKkLiWI1Vi2RNtkLCcpEiysdqhWNkiE994FTeKOClzKCRfMCLqseFdJq7Nylonk3AhL8dPDo0x8kqMHIf1PLdMmTe6G+V4/teQudsf8DPv/kzNAfJwA1QaKOUwzCXP8397QlBseQwv5OBhYqFjzPm71/WGMGzwhCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJM8chd0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJM8chd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779792994; x=1811328994;
  h=date:from:to:cc:subject:message-id;
  bh=FUn9jnk2b3C51wwXxarijdEuKgaJ+IP+qMReYP/cfPQ=;
  b=LJM8chd0tmpA+2+da8Z91rvZN8chlpQ47Bu0AAV1YLIhMzwVw/f4iCx9
   z1df+G+MLTapuIL7EwDUBSa2lfax80ZfiY4aCLfilL5yrED56bfdDVwB4
   CCltrZD1ZbMgv7EVLu/e5p+Y2h9R47Ky0jPk3/h3dg1nnrfSgbmiOFwe6
   cCbW9Mus+ljnUdVYJxYdoF106j5udnNZ3A1QwdIzkBd2QidoOkW11Qgj3
   YCQSyLwXPUDyng3emMjJojgFhToPng+Hh3rLMubFZ/ukDhVifvOtjhHtR
   RM79OLfL6if78wpEo4AdrfnfcT7N1u0widSWy7lIFV+MYDkrNIpfNaFDn
   w==;
X-CSE-ConnectionGUID: NrhJODgCQMG17WOz233JnA==
X-CSE-MsgGUID: O42WVYb/T9CFfKMlsHTw0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="92073259"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="92073259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:56:33 -0700
X-CSE-ConnectionGUID: en5/IKnHQdSJfHOm8SvgiA==
X-CSE-MsgGUID: diS7J9xrQcKAHgS7cDgygg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="242060623"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 26 May 2026 03:56:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRpSX-00000000COP-0eaV;
	Tue, 26 May 2026 10:56:29 +0000
Date: Tue, 26 May 2026 12:56:20 +0200
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/cpufreq/intel_pstate.c:2945:11: error: no member
 named 'update_limits' in 'struct cpufreq_policy_data'
Message-ID: <202605261237.PUsriOv4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/cpufreq-Avoid-redundant-target-calls-for-unchanged-limits/20260521-194713
head:   6721940d0119159636e6b2da0c43eb5cff826857
commit: 74b0d552acf45e33ce12c19ee815e52029b0b0a8 cpufreq: Avoid redundant target() calls for unchanged limits
date:   5 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260526/202605261237.PUsriOv4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261237.PUsriOv4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261237.PUsriOv4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/intel_pstate.c:2945:11: error: no member named 'update_limits' in 'struct cpufreq_policy_data'
    2945 |                 policy->update_limits = true;
         |                 ~~~~~~  ^
   1 error generated.


vim +2945 drivers/cpufreq/intel_pstate.c

  2935	
  2936	static void intel_pstate_adjust_policy_max(struct cpudata *cpu,
  2937						   struct cpufreq_policy_data *policy)
  2938	{
  2939		if (!hwp_active &&
  2940		    cpu->pstate.max_pstate_physical > cpu->pstate.max_pstate &&
  2941		    policy->max < policy->cpuinfo.max_freq &&
  2942		    policy->max > cpu->pstate.max_freq) {
  2943			pr_debug("policy->max > max non turbo frequency\n");
  2944			policy->max = policy->cpuinfo.max_freq;
> 2945			policy->update_limits = true;
  2946		}
  2947	}
  2948	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
