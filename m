Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643CB125D6;
	Mon, 24 Jul 2023 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690241666; x=1721777666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lrk4sW9f//3CiUWwWf1RLHLuEPo9aqOtPKf2FTXXCYs=;
  b=g/bdTLeUSQmi8viD1agZ+6CrDTAyGcjdPbOs8FjWvbpgxZbaWv69tGHB
   e90uW6Xv0gWkn2NmFNhHKy2kTW/mH2VYqZHeeWC6ihY3onrj15XeBSOeX
   yAP1dedNMJP5pjLAdj5yKjTBb0LQ2t6JdNk6O7v0LDf/lKXac6Mq+nVm7
   Jmbx2j4mHW9pz3mpwhYdqrZbmaDXRcXO7vGpYLJsyz+gpuKIWikSguftB
   BqLSupet74sKdXYdq6NS7OJyvhx3c+xecS4o25UJwZb5tXi/rXJ+P8ceH
   NlMzZgrlKv1guJJoMjQFka1ps8dUmi2tQh7qKdnF1QGuY39q/umOWIjgU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370243634"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="370243634"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 16:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="729101194"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="729101194"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jul 2023 16:34:22 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO54I-000A6e-12;
	Mon, 24 Jul 2023 23:34:22 +0000
Date: Tue, 25 Jul 2023 07:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 16/42]
 arch/riscv/kernel/vdso.c:309:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202307250718.R40DjDII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   afe9d1bbe54feff432a2c25572304c06de598ec0
commit: 1727f1271e2e6d73c7cc2737a4f22e872789d9ad [16/42] riscv: u64ilp32: Enable user space runtime switch
config: riscv-randconfig-r011-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250718.R40DjDII-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250718.R40DjDII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250718.R40DjDII-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/vdso.c:309:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     309 |         if (test_thread_flag(TIF_32BIT) && !test_thread_flag(TIF_64ILP32))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:141:2: note: expanded from macro 'test_thread_flag'
     141 |         test_ti_thread_flag(current_thread_info(), flag)
         |         ^
   arch/riscv/kernel/vdso.c:322:9: note: uninitialized use occurs here
     322 |         return ret;
         |                ^~~
   arch/riscv/kernel/vdso.c:309:2: note: remove the 'if' if its condition is always true
     309 |         if (test_thread_flag(TIF_32BIT) && !test_thread_flag(TIF_64ILP32))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                 ret = __setup_additional_pages(mm, bprm, uses_interp,
         | ~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/vdso.c:309:6: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     309 |         if (test_thread_flag(TIF_32BIT) && !test_thread_flag(TIF_64ILP32))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:141:2: note: expanded from macro 'test_thread_flag'
     141 |         test_ti_thread_flag(current_thread_info(), flag)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso.c:322:9: note: uninitialized use occurs here
     322 |         return ret;
         |                ^~~
   arch/riscv/kernel/vdso.c:309:6: note: remove the '&&' if its condition is always true
     309 |         if (test_thread_flag(TIF_32BIT) && !test_thread_flag(TIF_64ILP32))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:141:2: note: expanded from macro 'test_thread_flag'
     141 |         test_ti_thread_flag(current_thread_info(), flag)
         |         ^
   arch/riscv/kernel/vdso.c:303:9: note: initialize the variable 'ret' to silence this warning
     303 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +309 arch/riscv/kernel/vdso.c

76d2a0493a17d4 Palmer Dabbelt 2017-07-10  297  
3092eb45637573 Guo Ren        2022-04-05  298  #ifdef CONFIG_COMPAT
3092eb45637573 Guo Ren        2022-04-05  299  int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
3092eb45637573 Guo Ren        2022-04-05  300  				       int uses_interp)
3092eb45637573 Guo Ren        2022-04-05  301  {
3092eb45637573 Guo Ren        2022-04-05  302  	struct mm_struct *mm = current->mm;
3092eb45637573 Guo Ren        2022-04-05  303  	int ret;
3092eb45637573 Guo Ren        2022-04-05  304  
3092eb45637573 Guo Ren        2022-04-05  305  	if (mmap_write_lock_killable(mm))
3092eb45637573 Guo Ren        2022-04-05  306  		return -EINTR;
3092eb45637573 Guo Ren        2022-04-05  307  
fea3d07fbad0af Guo Ren        2023-05-31  308  #ifdef CONFIG_VDSO32
fea3d07fbad0af Guo Ren        2023-05-31 @309  	if (test_thread_flag(TIF_32BIT) && !test_thread_flag(TIF_64ILP32))
fea3d07fbad0af Guo Ren        2023-05-31  310  		ret = __setup_additional_pages(mm, bprm, uses_interp,
fea3d07fbad0af Guo Ren        2023-05-31  311  							&vdso32_info);
fea3d07fbad0af Guo Ren        2023-05-31  312  #endif
fea3d07fbad0af Guo Ren        2023-05-31  313  

:::::: The code at line 309 was first introduced by commit
:::::: fea3d07fbad0afbaa64bac1e849bdc298d4c06fb riscv: u64ilp32: Adjust vDSO kernel flow for 64ilp32 abi

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Guo Ren <guoren@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
