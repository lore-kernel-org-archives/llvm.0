Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5C366
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 04:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645502873; x=1677038873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sIg6rHCpyaGgX3nasthW2UeeCFofFiz4fYa70nm7zjQ=;
  b=KEgUoJqGu7xRgiMYgRbWHs3LlXcvuWKqbusAAgQSH3lCK9f/tIDfiD73
   SfiuUQwql0+AmNUwNCn5kQFEV5fp1LttePNLnx3N1KnX5iuSArC7PTgHm
   hKOcByhqNUWUiErqkc93xfWm34lVRWT0MYLtaJO/q/P6Ss2koHxm12c2P
   3u8K+mHoxxeeLHRm6kNk5IC3K0t0s+npNwegU2r2oNhLB80PFzjFKHbDf
   U0WiTAS7i42Szjk6gYVgrdYZz5+5fwNi0+2rXDazxMfyBtAz37lRurzpz
   XP38G5Sk24kddkYJ67+qSyXWi1uDZxexeGX+jYqDHZ5xHsY+Z5UpgW88T
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251559252"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="251559252"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 20:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="542804030"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2022 20:07:51 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMMSs-0002JC-CG; Tue, 22 Feb 2022 04:07:50 +0000
Date: Tue, 22 Feb 2022 12:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2011/2541]
 drivers/infiniband/ulp/srp/ib_srp.c:75:9: warning:
 'DEFINE_DYNAMIC_DEBUG_METADATA' macro redefined
Message-ID: <202202221244.iiBnlXUy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   601144c0da5edfa67a9654158370da19c67e17e2
commit: 851f9d758cf215ebf131c634c6ec7bf12e91f19f [2011/2541] headers/deps: Optimize <linux/jump_label.h>, remove the <linux/atomic_api.h> inclusion in the CONFIG_JUMP_LABEL=y case
config: i386-randconfig-a012-20220221 (https://download.01.org/0day-ci/archive/20220222/202202221244.iiBnlXUy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=851f9d758cf215ebf131c634c6ec7bf12e91f19f
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 851f9d758cf215ebf131c634c6ec7bf12e91f19f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/infiniband/ulp/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/infiniband/ulp/srp/ib_srp.c:75:9: warning: 'DEFINE_DYNAMIC_DEBUG_METADATA' macro redefined [-Wmacro-redefined]
   #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
           ^
   include/linux/dynamic_debug.h:90:9: note: previous definition is here
   #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)                \
           ^
>> drivers/infiniband/ulp/srp/ib_srp.c:76:9: warning: 'DYNAMIC_DEBUG_BRANCH' macro redefined [-Wmacro-redefined]
   #define DYNAMIC_DEBUG_BRANCH(descriptor) false
           ^
   include/linux/dynamic_debug.h:125:9: note: previous definition is here
   #define DYNAMIC_DEBUG_BRANCH(descriptor) \
           ^
   2 warnings generated.


vim +/DEFINE_DYNAMIC_DEBUG_METADATA +75 drivers/infiniband/ulp/srp/ib_srp.c

aef9ec39c47f0c Roland Dreier   2005-11-02  73  
1a1faf7a8a251d Bart Van Assche 2016-11-21  74  #if !defined(CONFIG_DYNAMIC_DEBUG)
1a1faf7a8a251d Bart Van Assche 2016-11-21 @75  #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
1a1faf7a8a251d Bart Van Assche 2016-11-21 @76  #define DYNAMIC_DEBUG_BRANCH(descriptor) false
1a1faf7a8a251d Bart Van Assche 2016-11-21  77  #endif
1a1faf7a8a251d Bart Van Assche 2016-11-21  78  

:::::: The code at line 75 was first introduced by commit
:::::: 1a1faf7a8a251d134d375b7783a614ee79e932f2 IB/srp: Fix CONFIG_DYNAMIC_DEBUG=n build

:::::: TO: Bart Van Assche <bart.vanassche@sandisk.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
