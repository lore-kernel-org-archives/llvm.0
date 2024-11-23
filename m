Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F46136;
	Sat, 23 Nov 2024 00:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732321546; cv=none; b=Dx0rI8Gxj6cNuAvX+XduMgwtrrvMPe6vJsKliBWPlwXz1CflIvRHH3tUAgKFSC7kCUXIo/KFBtl/41ZS8iL9/W7vnKVAErLo2BDdspUPX6eoJPMW8/pe95KFK4VbcH5TPzWMiWdJXoECRBT3vgBVYoPPnssMbjr6KmBSlqt2UYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732321546; c=relaxed/simple;
	bh=PuPmWBRxqI4fli86UfRCmE9zh+5xXeyGiiE/rns2Njo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5vDanuKVqEVN4lpneYVdr/cXq9+MpDfY1LrI5WPfv4zDwwLQViKMCi+Skds5Pszd1pAtbLjOL2Lgs4o3ZFHxTkVXZE1KDs6wJeSi4YU4dd4BEeRWPQIcZrkxdz7mDdOBl9Z7YihxnRWwtFs5mH1wDcRQ/qDwLwcapi53a8RCZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WY4gM2PC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WY4gM2PC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732321545; x=1763857545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PuPmWBRxqI4fli86UfRCmE9zh+5xXeyGiiE/rns2Njo=;
  b=WY4gM2PCXJ61YHoKLQdC1O+oY00vBJeb5RmY+/5twYDQJEhsvNXSm9Jl
   819ci8xbqrlt5+IW8m11emHaxIKKztp7clvMTzXdtSez1cjMkz/SKtDM6
   9iWPYQ+jB+Iay1HY5FMAfgAQF5ZlbOEl7nrLC+XCVMvyodrZbA/3iLVNe
   OEVFkJs7ikF+tmfK2xuKduTHB8Gy61D3jODnkUJSXDXT7UATcDNpYQPq9
   XtUoqO/gSENa71ngJ7UqZT3to4Du4fi4Hs9gtce5N/TW1Pv3Y9FlYMI0g
   CEIqkVGbE6OOiGAPvSjdmcjpJzVH+HU+Sh7UxENT967Pzq5z9e14d72vs
   g==;
X-CSE-ConnectionGUID: cJ6xkZBmQ0i/xJJJwARpSw==
X-CSE-MsgGUID: ah2uahPhTSqmKWn62kdEXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49910218"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="49910218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 16:25:44 -0800
X-CSE-ConnectionGUID: 8ZDuLhYaT1SBxFjwyRcu+w==
X-CSE-MsgGUID: 7k1edDQ+S5+RpeqmQps8pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90355082"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Nov 2024 16:25:42 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEdy0-0004JT-0D;
	Sat, 23 Nov 2024 00:25:40 +0000
Date: Sat, 23 Nov 2024 08:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>
Subject: [mark:arm64/brbe 7/11] drivers/perf/arm_brbe.c:620:4: warning:
 variable 'sample_type' is uninitialized when used here
Message-ID: <202411230804.AOrSAnxZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/brbe
head:   f971faff791ba89b11f5e6ca351be0f54ee765bd
commit: 642985af34d2d6f54e76995380cf24d512078c56 [7/11] WIP: drivers/perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411230804.AOrSAnxZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230804.AOrSAnxZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230804.AOrSAnxZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/arm_brbe.c:9:
   In file included from drivers/perf/arm_brbe.h:9:
   In file included from include/linux/perf/arm_pmu.h:12:
   In file included from include/linux/perf_event.h:50:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/arm_brbe.c:620:4: warning: variable 'sample_type' is uninitialized when used here [-Wuninitialized]
     620 |                         sample_type |= event->attr.branch_sample_type;
         |                         ^~~~~~~~~~~
   drivers/perf/arm_brbe.c:612:17: note: initialize the variable 'sample_type' to silence this warning
     612 |         u64 sample_type;
         |                        ^
         |                         = 0
   5 warnings generated.


vim +/sample_type +620 drivers/perf/arm_brbe.c

   607	
   608	void brbe_enable(struct arm_pmu *arm_pmu)
   609	{
   610		struct pmu_hw_events *cpuc = this_cpu_ptr(arm_pmu->hw_events);
   611		u64 brbfcr, brbcr;
   612		u64 sample_type;
   613	
   614		/*
   615		 * Merge the permitted branch filters of all events.
   616		 */
   617		for (int i = 0; i < ARMPMU_MAX_HWEVENTS; i++) {
   618			struct perf_event *event = cpuc->events[i];
   619			if (event && has_branch_stack(event))
 > 620				sample_type |= event->attr.branch_sample_type;
   621		}
   622	
   623		/*
   624		 * TODO: explain why we disacrd any prior branches
   625		 * TODO: avoid the redundant ISB?
   626		 */
   627		brbe_invalidate();
   628	
   629		/*
   630		 * BRBE gets configured with a new mismatched branch sample
   631		 * type request, overriding any previous branch filters.
   632		 */
   633		brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
   634		brbfcr &= ~BRBFCR_EL1_CONFIG_MASK;
   635		brbfcr |= branch_type_to_brbfcr(sample_type);
   636		write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
   637		isb();
   638	
   639		brbcr = read_sysreg_s(SYS_BRBCR_EL1);
   640		brbcr &= ~BRBCR_ELx_CONFIG_MASK;
   641		brbcr |= branch_type_to_brbcr(sample_type);
   642		write_sysreg_s(brbcr, SYS_BRBCR_EL1);
   643		isb();
   644	}
   645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
