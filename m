Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA425387;
	Thu,  3 Aug 2023 01:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691027438; x=1722563438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LRsDLJhvTUpYRlixB+9UVWHr77vJPkh7RO04vqPXvEQ=;
  b=Oi8zzRW2aH6q9rOT+hW9a3yH60cthUqID+CLNYW5A8fTzl/xZSQMPBZh
   5u4SvS6k5IOhe45ToxjOPmUOd0RyX5rjFwQNqhfhcXDJK2S4QBmIP1/Q9
   EFn0pJ0fHd3impe5yNJK4ufH6iA3wL9k4kQlSUsfF9VA2mz8vEC6W8UvE
   Bn8FnymBCv90X8DIfCgdtZVZi8IShMWy0IsU4Djkog6ykdITh2Y0TP4Jd
   6q9BkhtKwz8Sq5bQtrxXBHK5qXUje3g6lf9uDau1sNwwLf6zyD//PPZLw
   Hz6Kkt/R8N4HkVQ94g1tBsKG/CZfJUNBMNhOzSJKm0FK5v5HlrFsG4hY+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372480194"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="372480194"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 18:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="729357739"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="729357739"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Aug 2023 18:50:36 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRNU3-0001eV-0n;
	Thu, 03 Aug 2023 01:50:35 +0000
Date: Thu, 3 Aug 2023 09:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/core 15/17]
 drivers/platform/x86/intel/speed_select_if/isst_if_common.c:723:2: error:
 use of undeclared identifier 'INTEL_FAM6_SIERRAFOREST_X'
Message-ID: <202308030949.RgZ4Lz9T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   322e3d171eb9e48484a86fc187e26132f063e5c4
commit: 271f9a993c86023cf4dfd331e7a6d3e7a8f8bdeb [15/17] x86/cpu: Fix Crestmont uarch
config: x86_64-randconfig-x003-20230731 (https://download.01.org/0day-ci/archive/20230803/202308030949.RgZ4Lz9T-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030949.RgZ4Lz9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030949.RgZ4Lz9T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/speed_select_if/isst_if_common.c:723:2: error: use of undeclared identifier 'INTEL_FAM6_SIERRAFOREST_X'
           X86_MATCH_INTEL_FAM6_MODEL(SIERRAFOREST_X,      NULL),
           ^
   arch/x86/include/asm/cpu_device_id.h:161:39: note: expanded from macro 'X86_MATCH_INTEL_FAM6_MODEL'
           X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, data)
                                                ^
   <scratch space>:142:1: note: expanded from here
   INTEL_FAM6_SIERRAFOREST_X
   ^
   1 error generated.


vim +/INTEL_FAM6_SIERRAFOREST_X +723 drivers/platform/x86/intel/speed_select_if/isst_if_common.c

35f2c14d2a076b drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  720  
e6d3418130cdf7 drivers/platform/x86/intel/speed_select_if/isst_if_common.c Srinivas Pandruvada 2023-03-07  721  static const struct x86_cpu_id hpm_cpu_ids[] = {
e6d3418130cdf7 drivers/platform/x86/intel/speed_select_if/isst_if_common.c Srinivas Pandruvada 2023-03-07  722  	X86_MATCH_INTEL_FAM6_MODEL(GRANITERAPIDS_X,	NULL),
e6d3418130cdf7 drivers/platform/x86/intel/speed_select_if/isst_if_common.c Srinivas Pandruvada 2023-03-07 @723  	X86_MATCH_INTEL_FAM6_MODEL(SIERRAFOREST_X,	NULL),
e6d3418130cdf7 drivers/platform/x86/intel/speed_select_if/isst_if_common.c Srinivas Pandruvada 2023-03-07  724  	{}
e6d3418130cdf7 drivers/platform/x86/intel/speed_select_if/isst_if_common.c Srinivas Pandruvada 2023-03-07  725  };
e6d3418130cdf7 drivers/platform/x86/intel/speed_select_if/isst_if_common.c Srinivas Pandruvada 2023-03-07  726  

:::::: The code at line 723 was first introduced by commit
:::::: e6d3418130cdf718eff72db9a05d7262ebb49cff platform/x86: ISST: Add support for MSR 0x54

:::::: TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
