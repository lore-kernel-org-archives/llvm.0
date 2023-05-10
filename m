Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670B1174E8;
	Wed, 10 May 2023 19:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683746749; x=1715282749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbF9cDuYLfi2Lkc/Fd8T0Ym7FAElxPngnHVYsz6YF10=;
  b=efgqZVw9qsuTZ/z4hSdoE1CSOraxhcK9XdEsagQb5FlyKvIzVZstS1Nf
   mIurq45Ij8tI7sYYDCjWWjGL4rgel95fXoL+3sL+qr22FUmK1A6aPuSwW
   WPpTCyFzFQKMcLWUNHEV4fAW8K0GoITgg7quFU1DZDGP9pX2nBl9bOjzJ
   qmlbv+ldrTee6QZuJ5DDfdRCGBb5fpVL2SUVu4YM53mio+UTyVMRWrhpX
   Xd7igTgaopUGa9ZebXybCucfcDfIo/w9qm8p+FR6/4rTEWU9acgky9RzW
   zVu8d5G07C3WgDx8VFt2Ku/FVZ9uyuSP0Y9BdZlo1r8/4EmCXYepGh8TE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339555042"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="339555042"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 12:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="699419161"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="699419161"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 May 2023 12:25:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwpRY-0003XG-1T;
	Wed, 10 May 2023 19:25:44 +0000
Date: Thu, 11 May 2023 03:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 1/2] kernel/locking/lockdep.c:3603:65:
 error: too few arguments to function call, expected 2, have 1
Message-ID: <202305110344.xVyXq6m3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   c9b4ca9414103eefcb5b2fdce5b0238f64768a53
commit: 42c02af27bb3c420d2de11d8c9c0b17ce40f76ac [1/2] lockdep: Add lock_set_cmp_fn() annotation
config: arm64-randconfig-r026-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110344.xVyXq6m3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=42c02af27bb3c420d2de11d8c9c0b17ce40f76ac
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/core
        git checkout 42c02af27bb3c420d2de11d8c9c0b17ce40f76ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/locking/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110344.xVyXq6m3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/lockdep.c:3603:65: error: too few arguments to function call, expected 2, have 1
                   print_lock_name(lock_classes + chain_hlock_class_idx(hlock_id));
                   ~~~~~~~~~~~~~~~                                               ^
   kernel/locking/lockdep.c:732:13: note: 'print_lock_name' declared here
   static void print_lock_name(struct held_lock *hlock, struct lock_class *class)
               ^
   kernel/locking/lockdep.c:4915:6: warning: no previous prototype for function 'lockdep_set_lock_cmp_fn' [-Wmissing-prototypes]
   void lockdep_set_lock_cmp_fn(struct lockdep_map *lock, lock_cmp_fn cmp_fn,
        ^
   kernel/locking/lockdep.c:4915:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void lockdep_set_lock_cmp_fn(struct lockdep_map *lock, lock_cmp_fn cmp_fn,
   ^
   static 
   1 warning and 1 error generated.


vim +3603 kernel/locking/lockdep.c

39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3591  
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3592  static void print_chain_keys_chain(struct lock_chain *chain)
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3593  {
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3594  	int i;
f6ec8829ac9d59 Yuyang Du                 2019-05-06  3595  	u64 chain_key = INITIAL_CHAIN_KEY;
f611e8cf98ec90 Boqun Feng                2020-08-07  3596  	u16 hlock_id;
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3597  
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3598  	printk("depth: %u\n", chain->depth);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3599  	for (i = 0; i < chain->depth; i++) {
f611e8cf98ec90 Boqun Feng                2020-08-07  3600  		hlock_id = chain_hlocks[chain->base + i];
f611e8cf98ec90 Boqun Feng                2020-08-07  3601  		chain_key = print_chain_key_iteration(hlock_id, chain_key);
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3602  
28df029d53a2fd Cheng Jui Wang            2022-02-10 @3603  		print_lock_name(lock_classes + chain_hlock_class_idx(hlock_id));
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3604  		printk("\n");
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3605  	}
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3606  }
39e2e173fb1f90 Alfredo Alvarez Fernandez 2016-03-30  3607  

:::::: The code at line 3603 was first introduced by commit
:::::: 28df029d53a2fd80c1b8674d47895648ad26dcfb lockdep: Correct lock_classes index mapping

:::::: TO: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
