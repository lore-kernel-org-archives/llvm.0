Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454FE28D8C9;
	Wed,  7 May 2025 22:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655768; cv=none; b=RJbdNgNOuaKpmEC1ZuwX4LC0B3RBAsWcpk364BrtW7mGR/zyLOSokXiVSVkd+bPjMsxqFxxN6p5y72YfNJq/wZk0VtX+M7MTFXiZtsimIZMZhTLbd2zvik2kfO8CeWfzT5TyOI8NDSrEJBRncvjTpfQ8G2GRjus3A8IefxCR9Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655768; c=relaxed/simple;
	bh=im9XG2+eo1RqxPE7xYvj0FqzWW5ue7sLv7tiioVhWwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iFag9QSS6niXsOf3BXVSUDK8QYUy7aw9/qwBVGlyB+VTJpxVIRu1YH+O/t1w1QVPGuYrAgYwiMmgv4PL6He6bUG3CLFNq/8QVwguuvGwrMS+LpEywgCKK5xQKoj0xRa2gqsJ7j81eT0Z8axMMPPHiMACm+EQpEKs4SjEnQi3r88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpYQ0M9m; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpYQ0M9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746655766; x=1778191766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=im9XG2+eo1RqxPE7xYvj0FqzWW5ue7sLv7tiioVhWwA=;
  b=LpYQ0M9mltpTywUugP5AJGwmn9kk+0pYJl8dApFAQ3CosWKD24Y/tKvn
   MdxUgDyYuX6/Jsq1A2wxG5U99c2vI9Iema9OCDPSBEwhwRUiTJJ2VPBcG
   t1O5ONqIlsATFslNTbQoXTUAFxBzLgx0kkHZB/XPlbb176z8s7INkPcL7
   SXmf4RJrEhHTvs6R8LdodYAZAgMp9h7tij/W/zgB9vbMnpS37eJHB1Yja
   ml6GxmQKGsHS5n9dwLM6gqFcdQhN8EyvMrQNOipLBsa/LVxykSVLWsUCr
   XHXP8NIs5Csd57b8MWhjlybcKM8WSbcnK6kMWKP5+gcGxioAhvdL3uDuR
   g==;
X-CSE-ConnectionGUID: 4DB3GZE8SEu9uBEjohfOTw==
X-CSE-MsgGUID: UjggGtvdSVSkPWyM17c+bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48318868"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="48318868"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 15:09:25 -0700
X-CSE-ConnectionGUID: WK5zmaT+TEePnbbdoolgDA==
X-CSE-MsgGUID: g7ThL/iaTz+/lu0wsotEvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="135969778"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2025 15:09:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCmx8-00096R-0L;
	Wed, 07 May 2025 22:09:22 +0000
Date: Thu, 8 May 2025 06:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ulf-hansson-pm:psci_s2idle_deep_v3 2/9]
 drivers/acpi/arm64/cpuidle.c:65:10: error: too few arguments to function
 call, expected 2, have 1
Message-ID: <202505080644.bqOskuhU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linaro.org/people/ulf.hansson/linux-pm.git psci_s2idle_deep_v3
head:   dece57a7457f9f17a347fe697fb32b613e6c0c1c
commit: be7c3841af64d8463dc80a59d5560bc108fec682 [2/9] cpuidle: psci: Inform psci_cpu_suspend_enter() about s2idle
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505080644.bqOskuhU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080644.bqOskuhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080644.bqOskuhU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/arm64/cpuidle.c:65:10: error: too few arguments to function call, expected 2, have 1
      65 |                 return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM_RCU(psci_cpu_suspend_enter,
         |                        ^                                         ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpuidle.h:350:2: note: expanded from macro 'CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM_RCU'
     350 |         __CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, state, 1, 1)
         |         ^                       ~~~~~~~~~~~~~~~~~~~~
   include/linux/cpuidle.h:324:37: note: expanded from macro '__CPU_PM_CPU_IDLE_ENTER'
     324 |                 __ret = low_level_idle_enter(state);                    \
         |                         ~~~~~~~~~~~~~~~~~~~~      ^
   include/linux/psci.h:19:5: note: 'psci_cpu_suspend_enter' declared here
      19 | int psci_cpu_suspend_enter(u32 state, bool s2idle);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/arm64/cpuidle.c:68:10: error: too few arguments to function call, expected 2, have 1
      68 |                 return CPU_PM_CPU_IDLE_ENTER_PARAM_RCU(psci_cpu_suspend_enter,
         |                        ^                               ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpuidle.h:344:2: note: expanded from macro 'CPU_PM_CPU_IDLE_ENTER_PARAM_RCU'
     344 |         __CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, state, 0, 1)
         |         ^                       ~~~~~~~~~~~~~~~~~~~~
   include/linux/cpuidle.h:324:37: note: expanded from macro '__CPU_PM_CPU_IDLE_ENTER'
     324 |                 __ret = low_level_idle_enter(state);                    \
         |                         ~~~~~~~~~~~~~~~~~~~~      ^
   include/linux/psci.h:19:5: note: 'psci_cpu_suspend_enter' declared here
      19 | int psci_cpu_suspend_enter(u32 state, bool s2idle);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +65 drivers/acpi/arm64/cpuidle.c

5a611ed969b042 arch/arm64/kernel/cpuidle.c Sudeep Holla      2016-07-19  59  
69e26b4f43ed39 arch/arm64/kernel/cpuidle.c Peter Zijlstra    2023-01-12  60  __cpuidle int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
5a611ed969b042 arch/arm64/kernel/cpuidle.c Sudeep Holla      2016-07-19  61  {
9ffeb6d08c3a4b arch/arm64/kernel/cpuidle.c Lorenzo Pieralisi 2019-08-09  62  	u32 state = lpi->address;
9ffeb6d08c3a4b arch/arm64/kernel/cpuidle.c Lorenzo Pieralisi 2019-08-09  63  
8b9951ed7e5b51 arch/arm64/kernel/cpuidle.c Prashanth Prakash 2017-11-15  64  	if (ARM64_LPI_IS_RETENTION_STATE(lpi->arch_flags))
19235e47279894 arch/arm64/kernel/cpuidle.c Peter Zijlstra    2023-01-17 @65  		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM_RCU(psci_cpu_suspend_enter,

:::::: The code at line 65 was first introduced by commit
:::::: 19235e47279894b033a3ec5cf2732de634862b3a cpuidle, arm64: Fix the ARM64 cpuidle logic

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
