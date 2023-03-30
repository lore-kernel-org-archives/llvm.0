Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C510E7;
	Thu, 30 Mar 2023 21:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680212174; x=1711748174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYEn5fuMRSerKxyXH/IgoD/mD/3FPoyujdFJN3fcWG4=;
  b=LWPMXw9xsBO56BwMZGnBlC5UGP6aX/H1FtS4O15+tNmQo4xnQq0O49Oe
   PuHNK4STbVl0uDbQtHST6GRoxcbsWzW7Ihidc4VklIbYtjOsTHy++FxZZ
   FaQO1aPHDgE2y94HkU2CuVAgx2jMfhZ9gGjgK9xLIv91RSkz6dd3EMRQw
   Vllc0WZCBqkoUSYhtGYEStMJ+RYhTRKG9o631NnTul7ETM3Xu9bCZMFoL
   7rBw0pqOTj5iyhtIytvw5GAq3F2v9PvzFJjujQCkbQ4Wfp/dm0w6KI3xN
   9jVP7FTf+FCBhNqXp9pObWkgIiUepbfYTmSmgeAvFUNEZjoIotzJvGSPf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321677396"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="321677396"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 14:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="808793195"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="808793195"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Mar 2023 14:36:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phzwJ-000LEU-0f;
	Thu, 30 Mar 2023 21:36:11 +0000
Date: Fri, 31 Mar 2023 05:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:tglx-parallel-2 22/25] kernel/cpu.c:1797:30: error: too many
 arguments to function call, expected 0, have 1
Message-ID: <202303310506.d1NWrFlp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux tglx-parallel-2
head:   553f41a50ed7c3097c465e96d5c41522a1fae23e
commit: c8f7cb6d0895e48171b3fc33201e9244ac0e5970 [22/25] cpu/hotplug: Allow "parallel" bringup up to CPUHP_BP_KICK_AP_STATE
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230331/202303310506.d1NWrFlp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 tglx-parallel-2
        git checkout c8f7cb6d0895e48171b3fc33201e9244ac0e5970
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310506.d1NWrFlp-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cpu.c:436:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret = 0;
               ^
>> kernel/cpu.c:1797:30: error: too many arguments to function call, expected 0, have 1
           cpuhp_bringup_cpus_parallel(setup_max_cpus);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~
   kernel/cpu.c:652:20: note: 'cpuhp_bringup_cpus_parallel' declared here
   static inline void cpuhp_bringup_cpus_parallel(void) { }
                      ^
   1 warning and 1 error generated.


vim +1797 kernel/cpu.c

  1791	
  1792	void bringup_nonboot_cpus(unsigned int setup_max_cpus)
  1793	{
  1794		unsigned int cpu;
  1795	
  1796		/* If enabled, run the "parallel" bringup states first. */
> 1797		cpuhp_bringup_cpus_parallel(setup_max_cpus);
  1798	
  1799		/* Do the per CPU serialized bringup to ONLINE state */
  1800		for_each_present_cpu(cpu) {
  1801			if (num_online_cpus() >= setup_max_cpus)
  1802				break;
  1803	
  1804			if (!cpu_online(cpu)) {
  1805				struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
  1806				int ret = cpu_up(cpu, CPUHP_ONLINE);
  1807	
  1808				/*
  1809				 * If parallel bringup is enabled, then the online
  1810				 * attempt has only rolled back to CPUHP_BP_KICK_AP.
  1811				 * Do the remaining cleanups. NOOP for the non
  1812				 * parallel case.
  1813				 */
  1814				if (ret && can_rollback_cpu(st))
  1815					WARN_ON(cpuhp_invoke_callback_range(false, cpu, st, CPUHP_OFFLINE));
  1816			}
  1817		}
  1818	}
  1819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
