Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6937E4;
	Wed,  6 Dec 2023 04:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W33opN97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701836017; x=1733372017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxmONCgKfZI6KMl80B10ht+fqajVkiKsAfUIRAC5kKA=;
  b=W33opN97q9+pm5E+9gKwuaxpfMODQTy3Le4hiPfujvjBrJteWI5zla7q
   qmReLZh8ZhKcN3RbJScP5PgbQU5gile7mfEcwqr0HHtUslDo9EW5yUtv5
   WYK/u/66O82tTB7VKdAuldNTm8Ns7f2AW2gcLz65J6x6G8VLML3beDdsm
   vnuuB3TG46nT0ZpOdLJcdWhjbyKwCpAavPt8i4ODIGIzlRcCfugTLj5qS
   cEOm4JcXoP7Si9i60B0RXEO/zLm0sK9Ma87NnoeEskUpP0M6jlRswblhA
   Nix+ekhG5kuBao7SsEhfcd+toOobRg23AYKV231nHOCe9MAZrDjGMnshD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1096680"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1096680"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 20:13:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774863528"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="774863528"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2023 20:13:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAjHw-000AEn-26;
	Wed, 06 Dec 2023 04:13:32 +0000
Date: Wed, 6 Dec 2023 12:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:perf/overflow 1/3] drivers/perf/apple_m1_cpu_pmu.c:385:18:
 warning: unused variable 'regs'
Message-ID: <202312061231.KUbaq7xt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git perf/overflow
head:   f3b357f85dad79444f2d0c645833fb947de1e88d
commit: 80783e59015586b6cb6b3211b0753822929e6969 [1/3] arm_pmu: centralise event overflow handling
config: arm64-randconfig-002-20231206 (https://download.01.org/0day-ci/archive/20231206/202312061231.KUbaq7xt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061231.KUbaq7xt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061231.KUbaq7xt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/apple_m1_cpu_pmu.c:385:18: warning: unused variable 'regs' [-Wunused-variable]
           struct pt_regs *regs = get_irq_regs();
                           ^
   1 warning generated.


vim +/regs +385 drivers/perf/apple_m1_cpu_pmu.c

   381	
   382	static irqreturn_t m1_pmu_handle_irq(struct arm_pmu *cpu_pmu)
   383	{
   384		struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 > 385		struct pt_regs *regs = get_irq_regs();
   386		u64 overflow, state;
   387		int idx;
   388	
   389		overflow = read_sysreg_s(SYS_IMP_APL_PMSR_EL1);
   390		if (!overflow) {
   391			/* Spurious interrupt? */
   392			state = read_sysreg_s(SYS_IMP_APL_PMCR0_EL1);
   393			state &= ~PMCR0_IACT;
   394			write_sysreg_s(state, SYS_IMP_APL_PMCR0_EL1);
   395			isb();
   396			return IRQ_NONE;
   397		}
   398	
   399		cpu_pmu->stop(cpu_pmu);
   400	
   401		for (idx = 0; idx < cpu_pmu->num_events; idx++) {
   402			struct perf_event *event = cpuc->events[idx];
   403	
   404			if (!event)
   405				continue;
   406	
   407			armpmu_event_overflow(event);
   408		}
   409	
   410		cpu_pmu->start(cpu_pmu);
   411	
   412		return IRQ_HANDLED;
   413	}
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
