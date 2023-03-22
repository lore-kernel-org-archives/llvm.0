Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DB215BA;
	Wed, 22 Mar 2023 03:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679457497; x=1710993497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IYvm3S30M+EXr7BIvrcgY+WXR6PqOirwxSYrdP5Frc=;
  b=cE1AmRy5GBRf/002HsYKDR3O11RVE1jn334D5TLKZ9qXWOLcuHFuTACW
   wbKKqv6N9n6uGBhUymB100UArPo82DspTpmiisBQp/PeFyl9XuR/uUG8G
   zM1gDbyDZp9iDbCJE1jXiTxk92zOrRxlvuF5eF7e82WcLig4B9fhSl/EO
   JpgoG3anm33Jom4UxrEMQI/sPdy0p527R99DvTkSqeTas0h5bxbRLbV0I
   iUzOBLaRE3o+5UZVntOCqaARVu3FJN7KmpC5TxyiJccPKxMRd4xkL9Lnf
   Wx+fSIZmnNDCDe3ig1iBT+O+xdm1ne3m0jJ3R3irwbZyVyWB8AjKBXZWc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337846125"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="337846125"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 20:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="770901493"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="770901493"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2023 20:58:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pepc7-000CqW-05;
	Wed, 22 Mar 2023 03:58:15 +0000
Date: Wed, 22 Mar 2023 11:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	fweisbec <fweisbec@localhost.localdomain>
Subject: [frederic-dynticks:rcu/dev 1/4] kernel/rcu/tree_nocb.h:1355:7:
 warning: variable '_count' is uninitialized when used here
Message-ID: <202303221136.n0Fd8NZa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   7f7c396422722db9db601852664a30597a4fc7df
commit: 9c1b4fd66a0ce529b431385e86693cd81f194e85 [1/4] rcu/nocb: Protect lazy shrinker against concurrent (de-)offloading
config: riscv-randconfig-r001-20230320 (https://download.01.org/0day-ci/archive/20230322/202303221136.n0Fd8NZa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?id=9c1b4fd66a0ce529b431385e86693cd81f194e85
        git remote add frederic-dynticks https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
        git fetch --no-tags frederic-dynticks rcu/dev
        git checkout 9c1b4fd66a0ce529b431385e86693cd81f194e85
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221136.n0Fd8NZa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:4956:
>> kernel/rcu/tree_nocb.h:1355:7: warning: variable '_count' is uninitialized when used here [-Wuninitialized]
                   if (_count == 0)
                       ^~~~~~
   kernel/rcu/tree_nocb.h:1348:13: note: initialize the variable '_count' to silence this warning
                   int _count;
                             ^
                              = 0
   1 warning generated.


vim +/_count +1355 kernel/rcu/tree_nocb.h

c945b4da7a448a9 Vineeth Pillai      2022-10-16  1331  
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1332  static unsigned long
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1333  lazy_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1334  {
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1335  	int cpu;
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1336  	unsigned long flags;
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1337  	unsigned long count = 0;
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1338  
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1339  	/*
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1340  	 * Protect against concurrent (de-)offloading. Otherwise nocb locking
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1341  	 * may be ignored or imbalanced.
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1342  	 */
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1343  	mutex_lock(&rcu_state.barrier_mutex);
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1344  
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1345  	/* Snapshot count of all CPUs */
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1346  	for_each_possible_cpu(cpu) {
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1347  		struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1348  		int _count;
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1349  
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1350  		if (!rcu_rdp_is_offloaded(rdp))
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1351  			continue;
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1352  
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1353  		count = READ_ONCE(rdp->lazy_len);
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1354  
c945b4da7a448a9 Vineeth Pillai      2022-10-16 @1355  		if (_count == 0)
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1356  			continue;
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1357  
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1358  		rcu_nocb_lock_irqsave(rdp, flags);
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1359  		WRITE_ONCE(rdp->lazy_len, 0);
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1360  		rcu_nocb_unlock_irqrestore(rdp, flags);
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1361  		wake_nocb_gp(rdp, false);
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1362  		sc->nr_to_scan -= _count;
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1363  		count += _count;
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1364  		if (sc->nr_to_scan <= 0)
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1365  			break;
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1366  	}
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1367  
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1368  	mutex_unlock(&rcu_state.barrier_mutex);
9c1b4fd66a0ce52 Frederic Weisbecker 2023-03-17  1369  
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1370  	return count ? count : SHRINK_STOP;
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1371  }
c945b4da7a448a9 Vineeth Pillai      2022-10-16  1372  

:::::: The code at line 1355 was first introduced by commit
:::::: c945b4da7a448a9a56becc5a8745d942b2b83d3c rcu: Shrinker for lazy rcu

:::::: TO: Vineeth Pillai <vineeth@bitbyteword.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
