Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7112815CD41;
	Sat,  5 Oct 2024 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728153509; cv=none; b=EFNbY6J2YddZ1bP7ZI7ZKb66KWjsZxw25EppQpVC0nzU+b0IpTTgg2fYSVWeWkkXdKk8XaxwjmD5VONyDsYTy9Ct5AW/rK9JbOcyRavl9P93gjsf2LG2oY4F/V1qXcJV1kSaZMoKyvPSKNdVHOWEu7OVGp4ApVBcICyawlArWPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728153509; c=relaxed/simple;
	bh=NtgBqQDJpfZCg7WJ0fHzhOv2Dtvgwm4+VZBVXKvLU6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAdF3TySJ+MNOI2Z4XzTxR9f9fFivR54je+YwCXQvYmoic6YbP3wlIANT7KT3RMnsqABXkaXR0YPkhPU9+5bt1HMg65DmXxLWI0CEXu7FVBRptmMSJYeGgxaBwvVzXkjHk2AJdrRs1ZQAhM/+G6y7qHZXFROTV9aMa/zb7RAOY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtFoAWAq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtFoAWAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728153508; x=1759689508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NtgBqQDJpfZCg7WJ0fHzhOv2Dtvgwm4+VZBVXKvLU6Y=;
  b=HtFoAWAqAFhqalFp8YG6/62eX7AjLXVQEs1P+oaIcVJauc484zvw92eg
   wLkCunCp8QiI/pwe4Z8wAZOtft3yH2RyqcxursERkmhXSjcIwAo+1Oc5u
   oTrFWQwAbV3S2MdCabF3sGZrbZsdcTH9Kc00NdHgTTCzoPumAg92g68fx
   DYQrmCv93muIEXCCW5qWI8vsgUEF8z2f+J6S3M+U3vOVzfS6Fmf6q3Iew
   H0TgfaAMae0nlpOzfyzwkCDYkMDy0Muv4CW/W2R0NEm90YAhMeFh5ESqE
   2OcCnng1bRr7H8KCPAniE0zEuype0q19bjNKx1rRwT9FkDkSUw7Tn6Ib1
   Q==;
X-CSE-ConnectionGUID: aXVPk8HFSNO9N/jw1MeNuw==
X-CSE-MsgGUID: luWuoP6nSXiGfxs+FBokdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="38007371"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="38007371"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 11:38:25 -0700
X-CSE-ConnectionGUID: AdvQrcDrRhG0y+dcXAtSEQ==
X-CSE-MsgGUID: IbMma5fUREyadu5KBnjJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="112503360"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2024 11:38:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx9fZ-0003Gt-2m;
	Sat, 05 Oct 2024 18:38:21 +0000
Date: Sun, 6 Oct 2024 02:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>
Subject: [mark:arm64/brbe 8/12] drivers/perf/arm_brbe.c:638:4: warning:
 variable 'sample_type' is uninitialized when used here
Message-ID: <202410060233.AZ9FVSLw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/brbe
head:   cf9093b9f04351e28510d5c82217f884944d69b2
commit: 33c019c78f221ccf89473199c5c13015dec40953 [8/12] WIP: drivers/perf: arm_pmuv3: Enable branch stack sampling via FEAT_BRBE
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241006/202410060233.AZ9FVSLw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060233.AZ9FVSLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060233.AZ9FVSLw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/arm_brbe.c:9:
   In file included from drivers/perf/arm_pmuv3_branch.h:9:
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
>> drivers/perf/arm_brbe.c:638:4: warning: variable 'sample_type' is uninitialized when used here [-Wuninitialized]
     638 |                         sample_type |= event->attr.branch_sample_type;
         |                         ^~~~~~~~~~~
   drivers/perf/arm_brbe.c:630:17: note: initialize the variable 'sample_type' to silence this warning
     630 |         u64 sample_type;
         |                        ^
         |                         = 0
   5 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/sample_type +638 drivers/perf/arm_brbe.c

   625	
   626	void armv8pmu_branch_enable(struct arm_pmu *arm_pmu)
   627	{
   628		struct pmu_hw_events *cpuc = this_cpu_ptr(arm_pmu->hw_events);
   629		u64 brbfcr, brbcr;
   630		u64 sample_type;
   631	
   632		/*
   633		 * Merge the permitted branch filters of all events.
   634		 */
   635		for (int i = 0; i < ARMPMU_MAX_HWEVENTS; i++) {
   636			struct perf_event *event = cpuc->events[i];
   637			if (event && has_branch_stack(event))
 > 638				sample_type |= event->attr.branch_sample_type;
   639		}
   640	
   641		/*
   642		 * BRBE gets configured with a new mismatched branch sample
   643		 * type request, overriding any previous branch filters.
   644		 */
   645		brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
   646		brbfcr &= ~BRBFCR_EL1_CONFIG_MASK;
   647		brbfcr |= branch_type_to_brbfcr(sample_type);
   648		write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
   649		isb();
   650	
   651		brbcr = read_sysreg_s(SYS_BRBCR_EL1);
   652		brbcr &= ~BRBCR_ELx_CONFIG_MASK;
   653		brbcr |= branch_type_to_brbcr(sample_type);
   654		write_sysreg_s(brbcr, SYS_BRBCR_EL1);
   655		isb();
   656	}
   657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
