Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE50C2CA5
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643644299; x=1675180299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=54cGNW1ffKh1zeimLgvcbEyB9C+yHdq55Xw1Zs2NzFo=;
  b=at1uZfoW8owycQgNtibp6ZZJntyST0+qSbv9ILJUHUBUIpKoft9gg1b3
   rdFtrCVidHXoSzAuJ3WKgjchqbq3UEWfxjh2b0EZ0bl+uSY5JGVLNs04m
   V4/XZ7eMk3qBoqmavBGAekrycgRKviJfaB+xN/JKMoDzuJI5Ybh4hgqXd
   Xbzo/PjI+L8EK0PtliJaYawAdhyT2n/D9sg321VWs/s4RcM/BNmp5etHX
   L7RsblDUAkjOjlC+2fMDI33CDpzzpfKmFqGNRs2pPuoUDBLzCoILGsPqe
   dGPmckU2AiaBS9/7m0F33H4qoC0lCVnFWceRZiOwGgn8X8WFOJfMLrb4b
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="308218277"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="308218277"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 07:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="522700555"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Jan 2022 07:51:37 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEYxs-000S6O-LL; Mon, 31 Jan 2022 15:51:36 +0000
Date: Mon, 31 Jan 2022 23:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [linux-next:master 2083/2969]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:2067:22: warning: variable
 'p' set but not used
Message-ID: <202201312316.DZLM8JSq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   887a333c44eb67973622e530e43cd5e4cf9af927
commit: 367c9b0f1b8750a704070e7ae85234d591290434 [2083/2969] drm/amdkfd: Ensure mm remain valid in svm deferred_list work
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220131/202201312316.DZLM8JSq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=367c9b0f1b8750a704070e7ae85234d591290434
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 367c9b0f1b8750a704070e7ae85234d591290434
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:2067:22: warning: variable 'p' set but not used [-Wunused-but-set-variable]
           struct kfd_process *p;
                               ^
   1 warning generated.


vim +/p +2067 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c

373e3ccd859b4b Philip Yang    2021-04-19  2061  
4683cfecadeb38 Philip Yang    2020-04-08  2062  static void svm_range_deferred_list_work(struct work_struct *work)
4683cfecadeb38 Philip Yang    2020-04-08  2063  {
4683cfecadeb38 Philip Yang    2020-04-08  2064  	struct svm_range_list *svms;
4683cfecadeb38 Philip Yang    2020-04-08  2065  	struct svm_range *prange;
4683cfecadeb38 Philip Yang    2020-04-08  2066  	struct mm_struct *mm;
a0c55ecee10055 Philip Yang    2021-11-16 @2067  	struct kfd_process *p;
4683cfecadeb38 Philip Yang    2020-04-08  2068  
4683cfecadeb38 Philip Yang    2020-04-08  2069  	svms = container_of(work, struct svm_range_list, deferred_list_work);
4683cfecadeb38 Philip Yang    2020-04-08  2070  	pr_debug("enter svms 0x%p\n", svms);
4683cfecadeb38 Philip Yang    2020-04-08  2071  
a0c55ecee10055 Philip Yang    2021-11-16  2072  	p = container_of(svms, struct kfd_process, svms);
367c9b0f1b8750 Philip Yang    2022-01-18  2073  
367c9b0f1b8750 Philip Yang    2022-01-18  2074  	spin_lock(&svms->deferred_list_lock);
367c9b0f1b8750 Philip Yang    2022-01-18  2075  	while (!list_empty(&svms->deferred_range_list)) {
367c9b0f1b8750 Philip Yang    2022-01-18  2076  		prange = list_first_entry(&svms->deferred_range_list,
367c9b0f1b8750 Philip Yang    2022-01-18  2077  					  struct svm_range, deferred_list);
367c9b0f1b8750 Philip Yang    2022-01-18  2078  		spin_unlock(&svms->deferred_list_lock);
367c9b0f1b8750 Philip Yang    2022-01-18  2079  
367c9b0f1b8750 Philip Yang    2022-01-18  2080  		pr_debug("prange 0x%p [0x%lx 0x%lx] op %d\n", prange,
367c9b0f1b8750 Philip Yang    2022-01-18  2081  			 prange->start, prange->last, prange->work_item.op);
367c9b0f1b8750 Philip Yang    2022-01-18  2082  
367c9b0f1b8750 Philip Yang    2022-01-18  2083  		mm = prange->work_item.mm;
a44fe9ee051aca Felix Kuehling 2021-11-05  2084  retry:
4683cfecadeb38 Philip Yang    2020-04-08  2085  		mmap_write_lock(mm);
4683cfecadeb38 Philip Yang    2020-04-08  2086  
a0c55ecee10055 Philip Yang    2021-11-16  2087  		/* Checking for the need to drain retry faults must be inside
a44fe9ee051aca Felix Kuehling 2021-11-05  2088  		 * mmap write lock to serialize with munmap notifiers.
4683cfecadeb38 Philip Yang    2020-04-08  2089  		 */
2e4477282c8cff Philip Yang    2021-11-19  2090  		if (unlikely(atomic_read(&svms->drain_pagefaults))) {
a44fe9ee051aca Felix Kuehling 2021-11-05  2091  			mmap_write_unlock(mm);
a44fe9ee051aca Felix Kuehling 2021-11-05  2092  			svm_range_drain_retry_fault(svms);
a44fe9ee051aca Felix Kuehling 2021-11-05  2093  			goto retry;
a44fe9ee051aca Felix Kuehling 2021-11-05  2094  		}
a0c55ecee10055 Philip Yang    2021-11-16  2095  
367c9b0f1b8750 Philip Yang    2022-01-18  2096  		/* Remove from deferred_list must be inside mmap write lock, for
367c9b0f1b8750 Philip Yang    2022-01-18  2097  		 * two race cases:
367c9b0f1b8750 Philip Yang    2022-01-18  2098  		 * 1. unmap_from_cpu may change work_item.op and add the range
367c9b0f1b8750 Philip Yang    2022-01-18  2099  		 *    to deferred_list again, cause use after free bug.
367c9b0f1b8750 Philip Yang    2022-01-18  2100  		 * 2. svm_range_list_lock_and_flush_work may hold mmap write
367c9b0f1b8750 Philip Yang    2022-01-18  2101  		 *    lock and continue because deferred_list is empty, but
367c9b0f1b8750 Philip Yang    2022-01-18  2102  		 *    deferred_list work is actually waiting for mmap lock.
367c9b0f1b8750 Philip Yang    2022-01-18  2103  		 */
a0c55ecee10055 Philip Yang    2021-11-16  2104  		spin_lock(&svms->deferred_list_lock);
4683cfecadeb38 Philip Yang    2020-04-08  2105  		list_del_init(&prange->deferred_list);
4683cfecadeb38 Philip Yang    2020-04-08  2106  		spin_unlock(&svms->deferred_list_lock);
4683cfecadeb38 Philip Yang    2020-04-08  2107  
a0c55ecee10055 Philip Yang    2021-11-16  2108  		mutex_lock(&svms->lock);
0b0e518d61af8e Felix Kuehling 2021-02-24  2109  		mutex_lock(&prange->migrate_mutex);
4683cfecadeb38 Philip Yang    2020-04-08  2110  		while (!list_empty(&prange->child_list)) {
4683cfecadeb38 Philip Yang    2020-04-08  2111  			struct svm_range *pchild;
4683cfecadeb38 Philip Yang    2020-04-08  2112  
4683cfecadeb38 Philip Yang    2020-04-08  2113  			pchild = list_first_entry(&prange->child_list,
4683cfecadeb38 Philip Yang    2020-04-08  2114  						struct svm_range, child_list);
4683cfecadeb38 Philip Yang    2020-04-08  2115  			pr_debug("child prange 0x%p op %d\n", pchild,
4683cfecadeb38 Philip Yang    2020-04-08  2116  				 pchild->work_item.op);
4683cfecadeb38 Philip Yang    2020-04-08  2117  			list_del_init(&pchild->child_list);
367c9b0f1b8750 Philip Yang    2022-01-18  2118  			svm_range_handle_list_op(svms, pchild, mm);
4683cfecadeb38 Philip Yang    2020-04-08  2119  		}
0b0e518d61af8e Felix Kuehling 2021-02-24  2120  		mutex_unlock(&prange->migrate_mutex);
4683cfecadeb38 Philip Yang    2020-04-08  2121  
367c9b0f1b8750 Philip Yang    2022-01-18  2122  		svm_range_handle_list_op(svms, prange, mm);
4683cfecadeb38 Philip Yang    2020-04-08  2123  		mutex_unlock(&svms->lock);
367c9b0f1b8750 Philip Yang    2022-01-18  2124  		mmap_write_unlock(mm);
367c9b0f1b8750 Philip Yang    2022-01-18  2125  
367c9b0f1b8750 Philip Yang    2022-01-18  2126  		/* Pairs with mmget in svm_range_add_list_work */
367c9b0f1b8750 Philip Yang    2022-01-18  2127  		mmput(mm);
4683cfecadeb38 Philip Yang    2020-04-08  2128  
4683cfecadeb38 Philip Yang    2020-04-08  2129  		spin_lock(&svms->deferred_list_lock);
4683cfecadeb38 Philip Yang    2020-04-08  2130  	}
4683cfecadeb38 Philip Yang    2020-04-08  2131  	spin_unlock(&svms->deferred_list_lock);
4683cfecadeb38 Philip Yang    2020-04-08  2132  	pr_debug("exit svms 0x%p\n", svms);
4683cfecadeb38 Philip Yang    2020-04-08  2133  }
4683cfecadeb38 Philip Yang    2020-04-08  2134  

:::::: The code at line 2067 was first introduced by commit
:::::: a0c55ecee10055901c9c1b46d0d129cb6b51fa5d drm/amdkfd: process exit and retry fault race

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
