Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC03B1173C;
	Tue, 12 Dec 2023 23:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWlpvSgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702424054; x=1733960054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oXSA8jxVoxyNs1/jPfiImkarLyrkPqzeonDOOTNMG8s=;
  b=RWlpvSgZV/CQBsMmOyj+ijQJvKpGp1suL4hiM0hnSjQ+0nYNJtusje/v
   BjRz1ViZbNFeasvxGh3rURSCefBQnQWfq3lp9hxn8SyLS2j7rUCNWBmiO
   nJm7FoAQAPm35UiU4bs2YawHG2qFd6nBrmeBigkPTsI1wRdHqQS+ECZvh
   qT5wlfRYfJ44JivmBukTh63kV2IxUsTEMY5JVG8PPKaZN/g7jOXtADpbU
   7gagFfyZTHt7uyPi0+a7KQANzQTiMr27yUPpHcLQafcujdXTz/7LsgqKa
   thUmmhATnWepmGO5pZugBhky+3JWJqN1BXeIEoaxj/ynlvaRo3Khw0Gd3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="394636596"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="394636596"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 15:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="864400099"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="864400099"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Dec 2023 15:34:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDCGQ-000JrT-0z;
	Tue, 12 Dec 2023 23:34:10 +0000
Date: Wed, 13 Dec 2023 07:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [riscv:for-next 1/2] drivers/perf/riscv_pmu_sbi.c:994:33: error:
 passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *'
 discards qualifiers
Message-ID: <202312130700.1BNERVAH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
head:   6c312912da5cefafd501f47afb59c1a3cf54e6cc
commit: 0bd6bc435f7db3e22acb410b721e97a97463c51c [1/2] drivers: perf: Fix build error by adding const to ctl_table argument of handler
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231213/202312130700.1BNERVAH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130700.1BNERVAH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130700.1BNERVAH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/riscv_pmu_sbi.c:994:33: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     994 |         int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
         |                                        ^~~~~
   include/linux/sysctl.h:72:44: note: passing argument to parameter here
      72 | int proc_dointvec_minmax(struct ctl_table *, int, void *, size_t *, loff_t *);
         |                                            ^
>> drivers/perf/riscv_pmu_sbi.c:1015:19: error: incompatible function pointer types initializing 'proc_handler *' (aka 'int (*)(struct ctl_table *, int, void *, unsigned int *, long long *)') with an expression of type 'int (const struct ctl_table *, int, void *, size_t *, loff_t *)' (aka 'int (const struct ctl_table *, int, void *, unsigned int *, long long *)') [-Wincompatible-function-pointer-types]
    1015 |                 .proc_handler   = riscv_pmu_proc_user_access_handler,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +994 drivers/perf/riscv_pmu_sbi.c

cc4c07c89aada1 Alexandre Ghiti 2023-08-02   988  
0bd6bc435f7db3 Alexandre Ghiti 2023-12-07   989  static int riscv_pmu_proc_user_access_handler(const struct ctl_table *table,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02   990  					      int write, void *buffer,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02   991  					      size_t *lenp, loff_t *ppos)
cc4c07c89aada1 Alexandre Ghiti 2023-08-02   992  {
cc4c07c89aada1 Alexandre Ghiti 2023-08-02   993  	int prev = sysctl_perf_user_access;
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  @994  	int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
cc4c07c89aada1 Alexandre Ghiti 2023-08-02   995  
cc4c07c89aada1 Alexandre Ghiti 2023-08-02   996  	/*
cc4c07c89aada1 Alexandre Ghiti 2023-08-02   997  	 * Test against the previous value since we clear SCOUNTEREN when
cc4c07c89aada1 Alexandre Ghiti 2023-08-02   998  	 * sysctl_perf_user_access is set to SYSCTL_USER_ACCESS, but we should
cc4c07c89aada1 Alexandre Ghiti 2023-08-02   999  	 * not do that if that was already the case.
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1000  	 */
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1001  	if (ret || !write || prev == sysctl_perf_user_access)
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1002  		return ret;
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1003  
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1004  	on_each_cpu(riscv_pmu_update_counter_access, NULL, 1);
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1005  
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1006  	return 0;
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1007  }
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1008  
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1009  static struct ctl_table sbi_pmu_sysctl_table[] = {
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1010  	{
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1011  		.procname       = "perf_user_access",
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1012  		.data		= &sysctl_perf_user_access,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1013  		.maxlen		= sizeof(unsigned int),
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1014  		.mode           = 0644,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02 @1015  		.proc_handler	= riscv_pmu_proc_user_access_handler,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1016  		.extra1		= SYSCTL_ZERO,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1017  		.extra2		= SYSCTL_TWO,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1018  	},
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1019  	{ }
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1020  };
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1021  

:::::: The code at line 994 was first introduced by commit
:::::: cc4c07c89aada16229084eeb93895c95b7eabaa3 drivers: perf: Implement perf event mmap support in the SBI backend

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
