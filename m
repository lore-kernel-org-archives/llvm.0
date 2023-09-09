Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE211FD0;
	Sat,  9 Sep 2023 11:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694258659; x=1725794659;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1Qm4G+ctc0XTMeMDEIScgrnTgZRo7IOIPIsEkTKJwvg=;
  b=eIUbgbT5ZKLYSWJovHkyrce4oep533SMGGRb6+Ufl4zVWF675X21jyF6
   GqB+GdyEsSI+swlhpD/LEF0ABhvcey87p2DRwYVkB6MKKyLIlsYlKtsUi
   0JEcJW9v/9EYAb3YiZ33cYFWZYm86QlCJdsgDOTY0CyG5XIwXG3IZGH9E
   UHJtzNL3zLIkB72hMbcx0+AHrsbZC4rgPvuSTItVi5qXRj9rt8CC8Bxyo
   eybShH480bsu4unoQ/nRN0njgLI/0XkT83q1iZFwtCUXaccKWINFe9PkY
   UDxLc4KO8zq7kqVfpDnlWf9qjIS0DqFEjqybCuy7/29QqXatyuXanYnXa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377724646"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="377724646"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 04:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742796872"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="742796872"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Sep 2023 04:24:16 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qew4S-0003PZ-2j;
	Sat, 09 Sep 2023 11:24:12 +0000
Date: Sat, 9 Sep 2023 19:23:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_sym_address: .text+0x10): relocation R_RISCV_PCREL_HI20 out of
 range: -524527 is not in [-524288, 524287]; references
 kallsyms_relative_base
Message-ID: <202309091900.l3GzeeyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Zhen Lei <thunder.leizhen@huawei.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

Hi Zhen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: 30f3bb09778de64ef9f23fb4bb5f868c4728a071 kallsyms: Add self-test facility
date:   10 months ago
config: riscv-randconfig-r021-20230908 (https://download.01.org/0day-ci/archive/20230909/202309091900.l3GzeeyF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091900.l3GzeeyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091900.l3GzeeyF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0x10): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0x20): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
