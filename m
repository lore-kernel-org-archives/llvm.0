Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B84138F5
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 19:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647460126; x=1678996126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w6HTcuQU7kuBsWFPMo2uk0m+iZu9BqIdqJFSj1qd4Qc=;
  b=QD6R7Mm9XppznX2M5X7+oT/KP0Nl3IbwvOJFDByh/nWVAtVXWWoTxCOE
   ApVLgwmDnTNN8q/09AHGfl+hGl8El3ItsFxohiX5rY0Wwkx4VAz7QPIC6
   4tOGnEAu2oSVAFbwuaelJE9Kx5nPIDdf2iGHp8R7GbWu9C4R5IDknjirs
   Z8b8s4UaZcNHqQp4I3sTyNK7a7wbzO/kNo5poCHaj8dW6sjVwYaxppWpp
   xcfB3QHegKvtq1VuYBHF2tsaWsJThmigk6BES8jnMvE5wXMYMGSi/mrHe
   EHeQp0HLbRNvr78gc8F+jqSACDH/LWoQCKqgwKMHTVh+Jlvw+tym0wcgN
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="343133589"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="343133589"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 12:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="714748115"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Mar 2022 12:48:44 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUZdT-000CpF-VI; Wed, 16 Mar 2022 19:48:43 +0000
Date: Thu, 17 Mar 2022 03:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 2011/2335] arch/s390/include/asm/smp.h:20:30:
 error: expected ';' after top level declarator
Message-ID: <202203170304.AksZVl8r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: 4f65f03071d3f05b9768f9999f35a95978daab34 [2011/2335] headers/deps: locking/lockdep: Split <linux/lockep.h> into <linux/lockep_types.h> and <linux/lockep_api.h>
config: s390-randconfig-r002-20220313 (https://download.01.org/0day-ci/archive/20220317/202203170304.AksZVl8r-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=4f65f03071d3f05b9768f9999f35a95978daab34
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout 4f65f03071d3f05b9768f9999f35a95978daab34
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hashtable_api.h:16:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:23:
   In file included from include/linux/lockdep_api.h:27:
   In file included from include/linux/smp_api.h:15:
>> arch/s390/include/asm/smp.h:20:30: error: expected ';' after top level declarator
   extern __vector128 __initdata boot_cpu_vector_save_area[__NUM_VXRS];
                                ^
                                ;
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hashtable_api.h:16:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:35:
   include/linux/sched/per_task.h:48:11: fatal error: 'generated/asm-offsets.h' file not found
   # include <generated/asm-offsets.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
   make[2]: *** [scripts/Makefile.build:121: arch/s390/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1191: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +20 arch/s390/include/asm/smp.h

^1da177e4c3f41 include/asm-s390/smp.h      Linus Torvalds     2005-04-16  16  
dbd70fb499952d include/asm-s390/smp.h      Heiko Carstens     2008-04-17  17  extern struct mutex smp_cpu_state_mutex;
10ad34bc76dfbc arch/s390/include/asm/smp.h Martin Schwidefsky 2015-01-14  18  extern unsigned int smp_cpu_mt_shift;
10ad34bc76dfbc arch/s390/include/asm/smp.h Martin Schwidefsky 2015-01-14  19  extern unsigned int smp_cpu_mtid;
1a36a39e225d35 arch/s390/include/asm/smp.h Martin Schwidefsky 2015-10-29 @20  extern __vector128 __initdata boot_cpu_vector_save_area[__NUM_VXRS];
a052096bdd6809 arch/s390/include/asm/smp.h Sven Schnelle      2021-08-27  21  extern cpumask_t cpu_setup_mask;
8b646bd759086f arch/s390/include/asm/smp.h Martin Schwidefsky 2012-03-11  22  

:::::: The code at line 20 was first introduced by commit
:::::: 1a36a39e225d3558fb3776a3d3d7736cf1ec9f60 s390/dump: rework CPU register dump code

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
