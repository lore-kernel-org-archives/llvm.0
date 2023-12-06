Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6541DFCB;
	Wed,  6 Dec 2023 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSNVfiaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701871956; x=1733407956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9KBgE7WoLm30p8TsqNuDi2Qwjj4S4nvLK9g7bzayGd0=;
  b=MSNVfiawnDZsKhdlxj21cX05ULEFhJAosarrdtxgsXb5wTWgz9TbGrGJ
   nIXnJrC5vOT9wDVEAfx5/Z/ZdYoLkxAMqhwohczcdW+XIGEqGFsHc4xNa
   Qg3irBAG4BF8X3TYAUDP5B6VEczaA52AVR2O7HovuHIkUb4qyW5rvwCSI
   V8/Md/d2i9g44cn/Ee1MrO0idd2YvwibKHeEuy0TM7da2ssUrts88LnCt
   q6h9RqxsRlU9UJtShw+15r4FNNVvL44T9KQkUzZs1YLRGKUPiiSLVg/49
   iEgFbGL8SDudZQE3BwD7kS0gxBUPDPz7dVhooxMDVsGj9i23+52uqWpsO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="396854834"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="396854834"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 06:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721092649"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="721092649"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 06 Dec 2023 06:12:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAsdN-000AuH-2z;
	Wed, 06 Dec 2023 14:12:21 +0000
Date: Wed, 6 Dec 2023 22:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [linux-next:master 5063/5273] drivers/perf/riscv_pmu_sbi.c:1008:19:
 error: incompatible function pointer types initializing 'proc_handler *'
 (aka 'int (*)(const struct ctl_table *, int, void *, unsigned long *, long
 long *)') with an expression of type 'int (struct ctl_table *, int, v...
Message-ID: <202312062242.RFPPozG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   577a4ee0b96fb043c9cf4a533c550ff587e526cf
commit: c8be9e66ca1eb71c694537e20d00533db48650a9 [5063/5273] sysctl: treewide: constify the ctl_table argument of handlers
config: riscv-randconfig-001-20231206 (https://download.01.org/0day-ci/archive/20231206/202312062242.RFPPozG9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062242.RFPPozG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062242.RFPPozG9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/riscv_pmu_sbi.c:1008:19: error: incompatible function pointer types initializing 'proc_handler *' (aka 'int (*)(const struct ctl_table *, int, void *, unsigned long *, long long *)') with an expression of type 'int (struct ctl_table *, int, void *, size_t *, loff_t *)' (aka 'int (struct ctl_table *, int, void *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
    1008 |                 .proc_handler   = riscv_pmu_proc_user_access_handler,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1008 drivers/perf/riscv_pmu_sbi.c

cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1001  
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1002  static struct ctl_table sbi_pmu_sysctl_table[] = {
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1003  	{
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1004  		.procname       = "perf_user_access",
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1005  		.data		= &sysctl_perf_user_access,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1006  		.maxlen		= sizeof(unsigned int),
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1007  		.mode           = 0644,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02 @1008  		.proc_handler	= riscv_pmu_proc_user_access_handler,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1009  		.extra1		= SYSCTL_ZERO,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1010  		.extra2		= SYSCTL_TWO,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1011  	},
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1012  	{ }
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1013  };
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1014  

:::::: The code at line 1008 was first introduced by commit
:::::: cc4c07c89aada16229084eeb93895c95b7eabaa3 drivers: perf: Implement perf event mmap support in the SBI backend

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
