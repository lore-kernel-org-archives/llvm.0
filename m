Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD76629;
	Thu, 11 May 2023 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683819152; x=1715355152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJ/KXKey+MForJ+KvlFh17iPEYXRJ+7tgAXrXnWw4CY=;
  b=KL2PUHvmbG9+OWQlS5u3NHXPCgec1MlFHrUld7rqp08wSbdWJE579mnK
   4ckfA/fMHQacybAguip2xxIqM8Qhzb3Eo3mEnY2gMfjqxUNIt5bLPu4OW
   Ckhpdpi9m7GciNwMoVR4rr8002RDweqjk3j+tl1s4IPb0UNHQkCdXJ/24
   7T1yqV82l47hu5mR/05hllD942YINS6dX+qHwsxd6fG0oBKFFR1HTu6EX
   3S9cZmEtyRmd/LaMZq3PXJ3Q5dQNxT0vOGsDR1kAzwX4o4p9cedq/9SsY
   KJapicA8kEFIGDar4znC4uKCtaBv5um/KVXTMPxBuakRPbfTf0CEF05aE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="339833325"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="339833325"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 08:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="693850167"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="693850167"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 May 2023 08:32:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px8HN-00045E-2p;
	Thu, 11 May 2023 15:32:29 +0000
Date: Thu, 11 May 2023 23:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 20/37] kernel/cpu.c:304:20: error: incompatible
 pointer types passing 'atomic_t **' to parameter of type 'atomic_t *';
 remove &
Message-ID: <202305112311.qSBPUoSu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git hotplug
head:   33940aaa057c4488b11b5de90abf994ffed76eac
commit: 1507da72e88398f36d93398556ab865e98b4618a [20/37] x86/smpboot: Switch to hotplug core state synchronization
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230511/202305112311.qSBPUoSu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=1507da72e88398f36d93398556ab865e98b4618a
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout 1507da72e88398f36d93398556ab865e98b4618a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305112311.qSBPUoSu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cpu.c:304:20: error: incompatible pointer types passing 'atomic_t **' to parameter of type 'atomic_t *'; remove & [-Werror,-Wincompatible-pointer-types]
           (void)atomic_xchg(&st, state);
                             ^~~
   include/linux/atomic/atomic-instrumented.h:470:23: note: passing argument to parameter 'v' here
   atomic_xchg(atomic_t *v, int i)
                         ^
   1 error generated.


vim +304 kernel/cpu.c

2dcac02ca74e74 Thomas Gleixner 2023-05-08  291  
2dcac02ca74e74 Thomas Gleixner 2023-05-08  292  #ifdef CONFIG_HOTPLUG_CORE_SYNC
2dcac02ca74e74 Thomas Gleixner 2023-05-08  293  /**
2dcac02ca74e74 Thomas Gleixner 2023-05-08  294   * cpuhp_ap_update_sync_state - Update synchronization state during bringup/teardown
2dcac02ca74e74 Thomas Gleixner 2023-05-08  295   * @state:	The synchronization state to set
2dcac02ca74e74 Thomas Gleixner 2023-05-08  296   *
2dcac02ca74e74 Thomas Gleixner 2023-05-08  297   * No synchronization point. Just update of the synchronization state, but implies
2dcac02ca74e74 Thomas Gleixner 2023-05-08  298   * a full barrier so that the AP changes are visible before the control CPU proceeds.
2dcac02ca74e74 Thomas Gleixner 2023-05-08  299   */
2dcac02ca74e74 Thomas Gleixner 2023-05-08  300  static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
2dcac02ca74e74 Thomas Gleixner 2023-05-08  301  {
2dcac02ca74e74 Thomas Gleixner 2023-05-08  302  	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
2dcac02ca74e74 Thomas Gleixner 2023-05-08  303  
2dcac02ca74e74 Thomas Gleixner 2023-05-08 @304  	(void)atomic_xchg(&st, state);
2dcac02ca74e74 Thomas Gleixner 2023-05-08  305  }
2dcac02ca74e74 Thomas Gleixner 2023-05-08  306  

:::::: The code at line 304 was first introduced by commit
:::::: 2dcac02ca74e74a493ea41b4add310ca7c9e096c cpu/hotplug: Add CPU state tracking and synchronization

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
