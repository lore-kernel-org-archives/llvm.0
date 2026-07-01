Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946333603D5;
	Wed,  1 Jul 2026 05:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782882778; cv=none; b=U7MN7i6J4JMt7SAjkUDQmH2LEfwE1wUH31Ds01y51i4XANPNumnB+ey5O+id5NiE7pPDCHPuinM1swmiMHbFfjn5YjCfhkvx+FqqdOXdHnrN47XTSP/WW8+i47R4OAKyPF44n/Q5Z8onwSCYeKn5PKZf8eV8s1AD1GluoCorKCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782882778; c=relaxed/simple;
	bh=jQFEP3G5Omfcqd8+QcgPAZu1BuU6ZjO5SvXlcS2Sn5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T5Xb7cMa2ew+w+0HjAvd+CTLK2fE+YE5xpUoWc0AYna4pxMnl8GIo61dN740SpYVYKZ0hmvs4gmJKNia2ehjIwfz32L1UGCFABzSmHRmip1yfxP75GM/Es5ng2u1sO3ms1m5G0zuhG7T6y04XPMolSW9oNkZhsfyyll5lRSpto0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyrRybwu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyrRybwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782882776; x=1814418776;
  h=date:from:to:cc:subject:message-id;
  bh=jQFEP3G5Omfcqd8+QcgPAZu1BuU6ZjO5SvXlcS2Sn5w=;
  b=iyrRybwuOQXFC3TPiaO1lK7Ae10X7SPi7ehe7aF+xDkAGfjUX2tupmIo
   bKNjUxSSPKMPg3g4gyUz8pRknQTHCeN1pbwubM6NkHmX3pABEcZMFxXKH
   djTV+qbrSLfY+RA3Xr8VQZkUQAFHgt5uGJWdXkuqPBSdIXgo5Yrrit3KN
   /9k4580h/CPw+YnYnU6d942s/tfl1x3F99hNq/k+xIgjKKaA/z1hSyvVe
   CPXC5BWf/lBV47oOX/ZX3732wqlcWgqqFJgjpTZDX+qfIBhTacd8ldgkN
   iILuZUQV+wZZol6K82XovutXAmNMXZAkCTGPIXWFC6KJd9uX1CclWxlhb
   A==;
X-CSE-ConnectionGUID: CuMC53C+TSuK2kldHOnQkQ==
X-CSE-MsgGUID: C8ydDWDfSVyddZb1rSQjBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87287767"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="87287767"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 22:12:56 -0700
X-CSE-ConnectionGUID: VuxbFmV6SjejV6E8gZHUnA==
X-CSE-MsgGUID: UO8klK1BRGiHcEsIsIhHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="251404813"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2026 22:12:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wenFd-000000008x5-42T1;
	Wed, 01 Jul 2026 05:12:46 +0000
Date: Wed, 01 Jul 2026 13:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:sdei-nmi/diag-complete-off 5/5]
 arch/arm64/include/asm/sdei.h:56:15: error: expected identifier or '('
Message-ID: <202607011301.rVxTXAGl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git sdei-nmi/diag-complete-off
head:   9c7998bb7f7765535361c4ac0087f1401b3eecd4
commit: 9c7998bb7f7765535361c4ac0087f1401b3eecd4 [5/5] arm64/sdei: DIAG complete-then-CPU_OFF for the SDEI stop (Grace re-online test)
config: arm64-randconfig-002-20260701 (https://download.01.org/0day-ci/archive/20260701/202607011301.rVxTXAGl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011301.rVxTXAGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011301.rVxTXAGl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/smp.c:11:
>> arch/arm64/include/asm/sdei.h:56:15: error: expected identifier or '('
      56 | unsigned long sdei_arch_get_entry_point(int conduit);
         |               ^
   include/linux/arm_sdei.h:16:45: note: expanded from macro 'sdei_arch_get_entry_point'
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                  ^
   In file included from arch/arm64/kernel/smp.c:11:
>> arch/arm64/include/asm/sdei.h:56:15: error: expected ')'
   include/linux/arm_sdei.h:16:45: note: expanded from macro 'sdei_arch_get_entry_point'
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                  ^
   arch/arm64/include/asm/sdei.h:56:15: note: to match this '('
   include/linux/arm_sdei.h:16:44: note: expanded from macro 'sdei_arch_get_entry_point'
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                 ^
   In file included from arch/arm64/kernel/smp.c:11:
   arch/arm64/include/asm/sdei.h:57:9: warning: 'sdei_arch_get_entry_point' macro redefined [-Wmacro-redefined]
      57 | #define sdei_arch_get_entry_point(x)    sdei_arch_get_entry_point(x)
         |         ^
   include/linux/arm_sdei.h:16:9: note: previous definition is here
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |         ^
   1 warning and 2 errors generated.


vim +56 arch/arm64/include/asm/sdei.h

9c7998bb7f77655 Kiryl Shutsemau (Meta  2026-06-30  44) 
f5df26961853d68 James Morse            2018-01-08  45  /*
f5df26961853d68 James Morse            2018-01-08  46   * The above entry point does the minimum to call C code. This function does
f5df26961853d68 James Morse            2018-01-08  47   * anything else, before calling the driver.
f5df26961853d68 James Morse            2018-01-08  48   */
f5df26961853d68 James Morse            2018-01-08  49  struct sdei_registered_event;
f5df26961853d68 James Morse            2018-01-08  50  asmlinkage unsigned long __sdei_handler(struct pt_regs *regs,
f5df26961853d68 James Morse            2018-01-08  51  					struct sdei_registered_event *arg);
f5df26961853d68 James Morse            2018-01-08  52  
d60b228fd19985a Mark Rutland           2021-06-07  53  unsigned long do_sdei_event(struct pt_regs *regs,
d60b228fd19985a Mark Rutland           2021-06-07  54  			    struct sdei_registered_event *arg);
d60b228fd19985a Mark Rutland           2021-06-07  55  
f5df26961853d68 James Morse            2018-01-08 @56  unsigned long sdei_arch_get_entry_point(int conduit);
f5df26961853d68 James Morse            2018-01-08  57  #define sdei_arch_get_entry_point(x)	sdei_arch_get_entry_point(x)
f5df26961853d68 James Morse            2018-01-08  58  

:::::: The code at line 56 was first introduced by commit
:::::: f5df26961853d6809d704cedcaf082c57f635a64 arm64: kernel: Add arch-specific SDEI entry code and CPU masking

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
