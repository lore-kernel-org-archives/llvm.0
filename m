Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E60839FCA;
	Wed, 15 Nov 2023 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfMRUrAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700062151; x=1731598151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JbigwBrughK1HrVAdmTEZJCVpTmiWAiYfLaWLhvOPOY=;
  b=BfMRUrAk4WETJZOAmK8rOWj9WvtMAqNZzpCPp/PXs4lf/CLIigK+TLp6
   9atpKUMpJtC6OFWZS4ifBMi1JAG28iRA7LsPLc+FhZXFRt27R3iTNudQD
   E6fLuP6V1PDYOGt7XwbvzRwdcgbdbWYJTaX4+DOYwCzXaDUK3NIbnzAzp
   Bh8grbyczrPxTISw3WvrnIyGTW4ikVJMBq64m9Z/cmfwmlbVPdK39Mdwb
   dQb+I86E9GaHSX2NUP3imJENicg47m4+Gso9edT3m4OUBy4jg1QgJLWgX
   VbshlC/CEZRvIdyWvEvo2v8Yr+Lkx8Zr6tJJlSlqahNZRfbIp2/YeqvK+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12444184"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="12444184"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 07:24:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="830978622"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="830978622"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Nov 2023 07:24:22 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3HkZ-0000SS-10;
	Wed, 15 Nov 2023 15:24:19 +0000
Date: Wed, 15 Nov 2023 23:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, sudeep.holla@arm.com,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dietmar.eggemann@arm.com, gregkh@linuxfoundation.org,
	rafael@kernel.org, jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com, linuxarm@huawei.com,
	yangyicong@hisilicon.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] arch_topology: Support basic SMT control for the
 driver
Message-ID: <202311152356.OWWDpFRB-lkp@intel.com>
References: <20231114040110.54590-2-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114040110.54590-2-yangyicong@huawei.com>

Hi Yicong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus arm/for-next kvmarm/next soc/for-next linus/master arm/fixes v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/arch_topology-Support-basic-SMT-control-for-the-driver/20231114-120544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231114040110.54590-2-yangyicong%40huawei.com
patch subject: [PATCH v3 1/4] arch_topology: Support basic SMT control for the driver
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20231115/202311152356.OWWDpFRB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152356.OWWDpFRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152356.OWWDpFRB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/arch_topology.c:32:12: warning: unused variable 'topology_smt_num_threads' [-Wunused-variable]
      32 | static int topology_smt_num_threads = 1;
         |            ^
   1 warning generated.


vim +/topology_smt_num_threads +32 drivers/base/arch_topology.c

    30	
    31	/* Maximum threads number per-Core */
  > 32	static int topology_smt_num_threads = 1;
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
