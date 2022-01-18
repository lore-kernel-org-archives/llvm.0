Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B40E2C9C
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642528266; x=1674064266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFCgYk2DElcIeAwc1zdq0CzYHz9lRa1g5BLMWxbDp8g=;
  b=XlQCpuAKhcXDl6pyiPfXTMepjCZ0T/NtHV83hKSZ7958vQilnJtunMTt
   hnWIaHK9ZUWEVsIfn+4Figtygf8uUXWGUMmwZFN/jSR3Gatv0YqzxUrOW
   isnc+Ncm//EQwPeQNRK+tsuItauGtmUwi5A9poDnMExjjEHv32PyOa9oU
   yoScIToDXozVVFeTPm1g+rO1Wf3ONMfwcerJBpSEcL5V5o36gJPNOsSUg
   dznWGf+fRSuRfHwfN2KJSstaXW9iwXR/tiEBCrLh4qHiAvwZI2d8cRO+E
   7G5+e1Potmp6Xl86nkEVjbGcrQU7BtwG7IvPgm590HHY6I0Jmt2xpIWFD
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="245071501"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="245071501"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 09:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="477069871"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Jan 2022 09:51:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9sdK-000Cnn-OW; Tue, 18 Jan 2022 17:51:02 +0000
Date: Wed, 19 Jan 2022 01:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [csky-linux:riscv_compat_v2_sv48_v3_mmind_pbmt 31/44]
 kernel/locking/locktorture.c:918:39: error: use of undeclared identifier
 '_PAGE_MTMASK'
Message-ID: <202201190125.dGN7taEZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/c-sky/csky-linux riscv_compat_v2_sv48_v3_mmind_pbmt
head:   b28a50c03a72c48d3895320bdd0757e0a8acb881
commit: a8a0c8f014166b1e95e223240632fd0baac50ea7 [31/44] hack in a debug output in freeinitmem
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220119/202201190125.dGN7taEZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c10cbb243cafc0cf42c3e922cb29183279444432)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/c-sky/csky-linux/commit/a8a0c8f014166b1e95e223240632fd0baac50ea7
        git remote add csky-linux https://github.com/c-sky/csky-linux
        git fetch --no-tags csky-linux riscv_compat_v2_sv48_v3_mmind_pbmt
        git checkout a8a0c8f014166b1e95e223240632fd0baac50ea7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/locking/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/locking/locktorture.c:918:39: error: use of undeclared identifier '_PAGE_MTMASK'
   printk("%s: -----> %llx\n", __func__, _PAGE_MTMASK);
                                         ^
   1 error generated.


vim +/_PAGE_MTMASK +918 kernel/locking/locktorture.c

   899	
   900	static int __init lock_torture_init(void)
   901	{
   902		int i, j;
   903		int firsterr = 0;
   904		static struct lock_torture_ops *torture_ops[] = {
   905			&lock_busted_ops,
   906			&spin_lock_ops, &spin_lock_irq_ops,
   907			&rw_lock_ops, &rw_lock_irq_ops,
   908			&mutex_lock_ops,
   909			&ww_mutex_lock_ops,
   910	#ifdef CONFIG_RT_MUTEXES
   911			&rtmutex_lock_ops,
   912	#endif
   913			&rwsem_lock_ops,
   914			&percpu_rwsem_lock_ops,
   915		};
   916	
   917	
 > 918	printk("%s: -----> %llx\n", __func__, _PAGE_MTMASK);
   919	
   920	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
