Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD163B21
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 04:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645070642; x=1676606642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhFXlAR4H63qsxXD7MCMTe1kjTBib/DCLsYseU4m9/8=;
  b=YX2nE/WaCN+Rjlh8ly+HEzDmvA+ll3PS76kbma9aANG4oyFbAuVWcTA9
   O5Z344EUeDDvHN+0dNigQ8505o+PBQHPewN34dcgi6L/8wxYTIGm1+S6Q
   9n6Ha/bPIk+fx+mvslzviH+EOVeJ1JJ8+fmqb/i6LAD3121GRrfz061Nh
   BrjxlAL3gwMBglk6W/SrHbXRDKxw67+Ax4XCsRzVl0uLCk/uvnrwR2/UP
   D4e2BTLM9xnnvgp7ILSN2P1sNWhe1TA2arhFkDfUhfc3LP6MU+kQJPfdA
   TSUtcHwqKamG+rctRzDAgQvgVM/21K+g2CKI22buO/3fgX1BnwCtmyKnV
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="314054110"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="314054110"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 20:04:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="625777194"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2022 20:04:00 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKY1P-000BRQ-RH; Thu, 17 Feb 2022 04:03:59 +0000
Date: Thu, 17 Feb 2022 12:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [kees:for-next/lkdtm 3/4] drivers/misc/lkdtm/usercopy.c:74:39:
 error: use of undeclared identifier 'current_stack_pointer'
Message-ID: <202202171116.tFKzkUFI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/lkdtm
head:   2223f39d57e495531165ed5bf1d94bf4f1be7963
commit: d89624a74df284274743400bb318dba7246250a4 [3/4] lkdtm/usercopy: Expand size of "out of frame" object
config: riscv-randconfig-r004-20220216 (https://download.01.org/0day-ci/archive/20220217/202202171116.tFKzkUFI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=d89624a74df284274743400bb318dba7246250a4
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
        git fetch --no-tags kees for-next/lkdtm
        git checkout d89624a74df284274743400bb318dba7246250a4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/misc/lkdtm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/misc/lkdtm/usercopy.c:74:39: error: use of undeclared identifier 'current_stack_pointer'
           pr_info("stack     : %px\n", (void *)current_stack_pointer);
                                                ^
   1 error generated.


vim +/current_stack_pointer +74 drivers/misc/lkdtm/usercopy.c

    53	
    54	static noinline void do_usercopy_stack(bool to_user, bool bad_frame)
    55	{
    56		unsigned long user_addr;
    57		unsigned char good_stack[32];
    58		unsigned char *bad_stack;
    59		int i;
    60	
    61		/* Exercise stack to avoid everything living in registers. */
    62		for (i = 0; i < sizeof(good_stack); i++)
    63			good_stack[i] = test_text[i % sizeof(test_text)];
    64	
    65		/* This is a pointer to outside our current stack frame. */
    66		if (bad_frame) {
    67			bad_stack = do_usercopy_stack_callee((uintptr_t)&bad_stack);
    68		} else {
    69			/* Put start address just inside stack. */
    70			bad_stack = task_stack_page(current) + THREAD_SIZE;
    71			bad_stack -= sizeof(unsigned long);
    72		}
    73	
  > 74		pr_info("stack     : %px\n", (void *)current_stack_pointer);
    75		pr_info("good_stack: %px-%px\n", good_stack, good_stack + sizeof(good_stack));
    76		pr_info("bad_stack : %px-%px\n", bad_stack, bad_stack + sizeof(good_stack));
    77	
    78		user_addr = vm_mmap(NULL, 0, PAGE_SIZE,
    79				    PROT_READ | PROT_WRITE | PROT_EXEC,
    80				    MAP_ANONYMOUS | MAP_PRIVATE, 0);
    81		if (user_addr >= TASK_SIZE) {
    82			pr_warn("Failed to allocate user memory\n");
    83			return;
    84		}
    85	
    86		if (to_user) {
    87			pr_info("attempting good copy_to_user of local stack\n");
    88			if (copy_to_user((void __user *)user_addr, good_stack,
    89					 unconst + sizeof(good_stack))) {
    90				pr_warn("copy_to_user failed unexpectedly?!\n");
    91				goto free_user;
    92			}
    93	
    94			pr_info("attempting bad copy_to_user of distant stack\n");
    95			if (copy_to_user((void __user *)user_addr, bad_stack,
    96					 unconst + sizeof(good_stack))) {
    97				pr_warn("copy_to_user failed, but lacked Oops\n");
    98				goto free_user;
    99			}
   100		} else {
   101			/*
   102			 * There isn't a safe way to not be protected by usercopy
   103			 * if we're going to write to another thread's stack.
   104			 */
   105			if (!bad_frame)
   106				goto free_user;
   107	
   108			pr_info("attempting good copy_from_user of local stack\n");
   109			if (copy_from_user(good_stack, (void __user *)user_addr,
   110					   unconst + sizeof(good_stack))) {
   111				pr_warn("copy_from_user failed unexpectedly?!\n");
   112				goto free_user;
   113			}
   114	
   115			pr_info("attempting bad copy_from_user of distant stack\n");
   116			if (copy_from_user(bad_stack, (void __user *)user_addr,
   117					   unconst + sizeof(good_stack))) {
   118				pr_warn("copy_from_user failed, but lacked Oops\n");
   119				goto free_user;
   120			}
   121		}
   122	
   123	free_user:
   124		vm_munmap(user_addr, PAGE_SIZE);
   125	}
   126	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
