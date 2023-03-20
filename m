Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF31923BE;
	Mon, 20 Mar 2023 16:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679329135; x=1710865135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQdM0riCbeP1sRWzrLXe5dOWuCERMjrqwkeUy1B09Ow=;
  b=Um1nbjY/duk+6WHSEzBJZnj45WQO3nXOEotUK6IcVbg6XGjCxML04tob
   AMfHbBQnpYco2aPzqGdl1RFt5Yu4KMo1uAE39d9b4889gfpz47wRRx5JC
   G4ZQamg7bv7N4osHDJa2Lm+d//3trWvkxA78VZHtEUZfTZICwNF+rKXLt
   ZNMbuNVCpveWHBAdKUtQBD4sc/RyPUcxifwu4lkf+mqNqKwBdolqDrmfy
   0Z+AicMMYHzjNEqY2nYA68nHhhHJYP6JnUqULxLYI0PS0Qm77PQgxNW2d
   06am4FGY3DXqQXWKjaecDwxMPEUuw/8hYrvc4WK7uttmfoKFb9uSVMIT+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322549091"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="322549091"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 09:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="681138458"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="681138458"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Mar 2023 09:18:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peIDf-000B8l-38;
	Mon, 20 Mar 2023 16:18:47 +0000
Date: Tue, 21 Mar 2023 00:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 4/4] kernel/rcu/tree_nocb.h:1340:3:
 error: non-void function 'lazy_rcu_shrink_scan' should return a value
Message-ID: <202303210029.e3BTmJcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   8364e60b2b41c706f28ca7d1ea6e9a3e5b5993ed
commit: 8364e60b2b41c706f28ca7d1ea6e9a3e5b5993ed [4/4] rcu: Make shrinker to iterate only NOCB CPUs
config: x86_64-buildonly-randconfig-r002-20230320 (https://download.01.org/0day-ci/archive/20230321/202303210029.e3BTmJcH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?id=8364e60b2b41c706f28ca7d1ea6e9a3e5b5993ed
        git remote add frederic-dynticks https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
        git fetch --no-tags frederic-dynticks rcu/dev
        git checkout 8364e60b2b41c706f28ca7d1ea6e9a3e5b5993ed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210029.e3BTmJcH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:4956:
>> kernel/rcu/tree_nocb.h:1340:3: error: non-void function 'lazy_rcu_shrink_scan' should return a value [-Wreturn-type]
                   return;
                   ^
   1 error generated.


vim +/lazy_rcu_shrink_scan +1340 kernel/rcu/tree_nocb.h

  1331	
  1332	static unsigned long
  1333	lazy_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
  1334	{
  1335		int cpu;
  1336		unsigned long flags;
  1337		unsigned long count = 0;
  1338	
  1339		if (!cpumask_available(rcu_nocb_mask))
> 1340			return;
  1341		/*
  1342		 * Protect against concurrent (de-)offloading. Otherwise nocb locking
  1343		 * may be ignored or imbalanced.
  1344		 */
  1345		mutex_lock(&rcu_state.barrier_mutex);
  1346	
  1347		/* Snapshot count of all CPUs */
  1348		for_each_cpu(cpu, rcu_nocb_mask) {
  1349			struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
  1350			int _count;
  1351	
  1352			if (!rcu_rdp_is_offloaded(rdp))
  1353				continue;
  1354	
  1355			if (!READ_ONCE(rdp->lazy_len))
  1356				continue;
  1357	
  1358			rcu_nocb_lock_irqsave(rdp, flags);
  1359			/*
  1360			 * Recheck under the nocb lock. Since we are not holding the bypass
  1361			 * lock we may still race with increments from the enqueuer but still
  1362			 * we know for sure if there is at least one lazy callback.
  1363			 */
  1364			count = READ_ONCE(rdp->lazy_len);
  1365			if (!count) {
  1366				rcu_nocb_unlock_irqrestore(rdp, flags);
  1367				continue;
  1368			}
  1369			WARN_ON_ONCE(!rcu_nocb_flush_bypass(rdp, NULL, jiffies, false));
  1370			rcu_nocb_unlock_irqrestore(rdp, flags);
  1371			wake_nocb_gp(rdp, false);
  1372			sc->nr_to_scan -= _count;
  1373			count += _count;
  1374			if (sc->nr_to_scan <= 0)
  1375				break;
  1376		}
  1377	
  1378		mutex_unlock(&rcu_state.barrier_mutex);
  1379	
  1380		return count ? count : SHRINK_STOP;
  1381	}
  1382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
