Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C4E3D86
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 22:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654208155; x=1685744155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BS3rLjdPqfSKzK3DmZXapPlrQnsi0Ki0Gpxo+UJQimA=;
  b=i0kKdJ35btCjkWP/DMR42mM7EV+QweJzcX4OY6EU7I74bX/n7Lh6dEdp
   bllw+3GQqTWWNdBBow5ff+jykgueHC/14uVf09RjhYk1iDoEID2j41fv0
   NM0nzTcPaMkaYBkRgH+mPXUMzA3VktRspANJoI2PilAZG5Hq2VIBwH4FE
   fhKSWUJRwRe4KACKXApWtlrpjufnAiSOk/OyXEAPZrojRILq5aejpZqbS
   LQUV8xx9+DPC+AklEDS5zECwDXZ73cWEOzxO0GO8sLi/BcJBPb/SCNGOo
   IFhKY80wE1DEtVeKx0eWr5UIRJiVD8Y5zkcHm2VL1uXD++K8GTBQjYREl
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="339142349"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; 
   d="scan'208";a="339142349"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 15:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; 
   d="scan'208";a="530766227"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2022 15:15:53 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwt6e-0005UL-KN;
	Thu, 02 Jun 2022 22:15:52 +0000
Date: Fri, 3 Jun 2022 06:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dave.2022.06.02a 56/78]
 kernel/rcu/tasks.h:1239:8: error: variable has incomplete type 'typeof (({
Message-ID: <202206030613.IxQYmIW8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dave.2022.06.02a
head:   2efc5c4abe4cc1259378f7c1678a93540559673c
commit: cda3200416cdef7f25546cd6249fb411c8c32079 [56/78] rcu-tasks: Merge state into .b.need_qs and atomically update
config: arm-buildonly-randconfig-r004-20220531 (https://download.01.org/0day-ci/archive/20220603/202206030613.IxQYmIW8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/cda3200416cdef7f25546cd6249fb411c8c32079
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dave.2022.06.02a
        git checkout cda3200416cdef7f25546cd6249fb411c8c32079
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/update.c:606:
   kernel/rcu/tasks.h:1239:8: error: operand of type 'union rcu_special' where arithmetic or pointer type is required
           ret = cmpxchg(&t->trc_reader_special, trs_old, trs_new);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1916:2: note: expanded from macro 'cmpxchg'
           arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:52:2: note: expanded from macro 'arch_cmpxchg'
           __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:73:9: note: expanded from macro '__atomic_op_fence'
           typeof(op##_relaxed(args)) __ret;                               \
                  ^~~~~~~~~~~~~~~~~~
   <scratch space>:39:1: note: expanded from here
   arch_cmpxchg_relaxed
   ^
   arch/arm/include/asm/cmpxchg.h:212:26: note: expanded from macro 'arch_cmpxchg_relaxed'
                                         (unsigned long)(o),               \
                                                        ^~~
   In file included from kernel/rcu/update.c:606:
   kernel/rcu/tasks.h:1239:8: error: operand of type 'union rcu_special' where arithmetic or pointer type is required
           ret = cmpxchg(&t->trc_reader_special, trs_old, trs_new);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1916:2: note: expanded from macro 'cmpxchg'
           arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:52:2: note: expanded from macro 'arch_cmpxchg'
           __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:73:9: note: expanded from macro '__atomic_op_fence'
           typeof(op##_relaxed(args)) __ret;                               \
                  ^~~~~~~~~~~~~~~~~~
   <scratch space>:39:1: note: expanded from here
   arch_cmpxchg_relaxed
   ^
   arch/arm/include/asm/cmpxchg.h:213:26: note: expanded from macro 'arch_cmpxchg_relaxed'
                                         (unsigned long)(n),               \
                                                        ^~~
   In file included from kernel/rcu/update.c:606:
>> kernel/rcu/tasks.h:1239:8: error: variable has incomplete type 'typeof (({
   }))' (aka 'void')
   include/linux/atomic/atomic-instrumented.h:1916:2: note: expanded from macro 'cmpxchg'
           arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:52:2: note: expanded from macro 'arch_cmpxchg'
           __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
           ^
   include/linux/atomic.h:73:29: note: expanded from macro '__atomic_op_fence'
           typeof(op##_relaxed(args)) __ret;                               \
                                      ^
   In file included from kernel/rcu/update.c:606:
   kernel/rcu/tasks.h:1239:8: error: operand of type 'union rcu_special' where arithmetic or pointer type is required
           ret = cmpxchg(&t->trc_reader_special, trs_old, trs_new);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1916:2: note: expanded from macro 'cmpxchg'
           arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:52:2: note: expanded from macro 'arch_cmpxchg'
           __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:75:10: note: expanded from macro '__atomic_op_fence'
           __ret = op##_relaxed(args);                                     \
                   ^~~~~~~~~~~~~~~~~~
   <scratch space>:40:1: note: expanded from here
   arch_cmpxchg_relaxed
   ^
   arch/arm/include/asm/cmpxchg.h:212:26: note: expanded from macro 'arch_cmpxchg_relaxed'
                                         (unsigned long)(o),               \
                                                        ^~~
   In file included from kernel/rcu/update.c:606:
   kernel/rcu/tasks.h:1239:8: error: operand of type 'union rcu_special' where arithmetic or pointer type is required
           ret = cmpxchg(&t->trc_reader_special, trs_old, trs_new);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1916:2: note: expanded from macro 'cmpxchg'
           arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:52:2: note: expanded from macro 'arch_cmpxchg'
           __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:75:10: note: expanded from macro '__atomic_op_fence'
           __ret = op##_relaxed(args);                                     \
                   ^~~~~~~~~~~~~~~~~~
   <scratch space>:40:1: note: expanded from here
   arch_cmpxchg_relaxed
   ^
   arch/arm/include/asm/cmpxchg.h:213:26: note: expanded from macro 'arch_cmpxchg_relaxed'
                                         (unsigned long)(n),               \
                                                        ^~~
   5 errors generated.


vim +1239 kernel/rcu/tasks.h

  1224	
  1225	/*
  1226	 * Do a cmpxchg() on ->trc_reader_special.b.need_qs, allowing for
  1227	 * the four-byte operand-size restriction of some platforms.
  1228	 * Returns the old value, which is often ignored.
  1229	 */
  1230	u8 rcu_trc_cmpxchg_need_qs(struct task_struct *t, u8 old, u8 new)
  1231	{
  1232		union rcu_special ret;
  1233		union rcu_special trs_old = READ_ONCE(t->trc_reader_special);
  1234		union rcu_special trs_new = trs_old;
  1235	
  1236		if (trs_old.b.need_qs != old)
  1237			return trs_old.b.need_qs;
  1238		trs_new.b.need_qs = new;
> 1239		ret = cmpxchg(&t->trc_reader_special, trs_old, trs_new);
  1240		return ret.b.need_qs;
  1241	}
  1242	EXPORT_SYMBOL_GPL(rcu_trc_cmpxchg_need_qs);
  1243	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
