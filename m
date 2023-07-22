Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6111C9A;
	Sat, 22 Jul 2023 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690019165; x=1721555165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/G+YLx0+4C3YYzrehY+BxUMLRFy4uSGSxx9eWc+7bM8=;
  b=Yfhj7cm/VefkySTTIiFP4WDvpmkSbRxBVPpP9Jxl6tH1EFFlFkcAMruy
   QDTnmRHfirfVWKUwcbOX9s8dDR844BG+KMGVPl8bsbw0f89XyWimSU+kv
   spH1vNDtjoNHCrdzCjBTIoqbqZ2nOcdnVE9Kx9/+R6g/sThE1VO4R+Dcr
   j6CF1cltuzKSgAD6Z3bk5f13yAoi59i7kuWdc9uNP6Xev0Eo0dJ9rctAS
   Ht+L6hj+toqDiKuJ11hUOhnHYJfc+j3+j3+K2G0D5euo9yflTFNmCloKL
   5uIyWipD6/xinVhHuvWOcxxCGI7fV8K0kV71Tp+pj1U6HlrHl0VXXhA/v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347468572"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="347468572"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 02:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="760219465"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="760219465"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Jul 2023 02:46:00 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN9BX-0008EE-1R;
	Sat, 22 Jul 2023 09:45:59 +0000
Date: Sat, 22 Jul 2023 17:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 16/42]
 arch/riscv/kernel/vdso.c:309:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202307221725.bXxd5JSG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: bf3d65e88214791eb913d50e7e876c590dc4ce09 [16/42] riscv: u64ilp32: Enable user space runtime switch
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221725.bXxd5JSG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221725.bXxd5JSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221725.bXxd5JSG-lkp@intel.com/

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

76d2a0493a17d4c Palmer Dabbelt 2017-07-10  297  
3092eb45637573c Guo Ren        2022-04-05  298  #ifdef CONFIG_COMPAT
3092eb45637573c Guo Ren        2022-04-05  299  int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
3092eb45637573c Guo Ren        2022-04-05  300  				       int uses_interp)
3092eb45637573c Guo Ren        2022-04-05  301  {
3092eb45637573c Guo Ren        2022-04-05  302  	struct mm_struct *mm = current->mm;
3092eb45637573c Guo Ren        2022-04-05  303  	int ret;
3092eb45637573c Guo Ren        2022-04-05  304  
3092eb45637573c Guo Ren        2022-04-05  305  	if (mmap_write_lock_killable(mm))
3092eb45637573c Guo Ren        2022-04-05  306  		return -EINTR;
3092eb45637573c Guo Ren        2022-04-05  307  
4613fb010928a1e Guo Ren        2023-05-31  308  #ifdef CONFIG_VDSO32
4613fb010928a1e Guo Ren        2023-05-31 @309  	if (test_thread_flag(TIF_32BIT) && !test_thread_flag(TIF_64ILP32))
4613fb010928a1e Guo Ren        2023-05-31  310  		ret = __setup_additional_pages(mm, bprm, uses_interp,
4613fb010928a1e Guo Ren        2023-05-31  311  							&vdso32_info);
4613fb010928a1e Guo Ren        2023-05-31  312  #endif
4613fb010928a1e Guo Ren        2023-05-31  313  

:::::: The code at line 309 was first introduced by commit
:::::: 4613fb010928a1edfaef78e3ea7175807fdb3bb5 riscv: u64ilp32: Adjust vDSO kernel flow for 64ilp32 abi

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Guo Ren <guoren@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
