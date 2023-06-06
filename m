Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E544C394;
	Tue,  6 Jun 2023 03:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686020503; x=1717556503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/5ea8fiVa2RCDXE05YE8qcb7X862xBSrxkuQR03JqqU=;
  b=jrN/E+tvj5jlEuO3FzrBqHc3hthnbzHBCVzBX3ytCcuDSXTiaCZHKK8x
   vuTMdk7P4erY+EGs5jabJVsZop319+ctkUabS+vky4TQ0+FfUngLR9jNd
   WY7Uo/wqBNydlqH0A6N8Kp2LyvdcIJnAIU7otQD+1xQYPICi4VZ9B1ann
   ZOH6NPvc7K8Fo7sc9nn6xBj8Obwp31wYq1/4ZL7hJfSMIh5MPE5FiZ2zZ
   J7EUsjdZCwRPjymB2qo8KhHyxsIff9v/UvP6bvk0PAI7HFjDYhpiTZfLT
   QA/gztohd7IHktaQ6qy968Lz8xrZVf6ji1gYY9q4lMElpxHAvoj/r6irO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420094322"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="420094322"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 20:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="702995519"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="702995519"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Jun 2023 20:01:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Mx3-0004kZ-1Z;
	Tue, 06 Jun 2023 03:01:41 +0000
Date: Tue, 6 Jun 2023 11:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 54/61] arch/x86/kernel/signal_32.c:459:1:
 error: static assertion failed due to requirement 'sizeof ((((struct siginfo
 *)0)->_sifields._timer)) == 4 * sizeof(int)': sizeof_field(siginfo32_t,
 _sifields._timer) == 4*sizeof(int)
Message-ID: <202306061031.SNHAdqUm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   16a20adb1e0ae19ad42041a7d1b5583e4705ca0c
commit: 7980f85caabff6a355848d2d3cd50acbb38b44b3 [54/61] signal: Add sys_private_ptr to siginfo::timer
config: i386-buildonly-randconfig-r001-20230605 (https://download.01.org/0day-ci/archive/20230606/202306061031.SNHAdqUm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=7980f85caabff6a355848d2d3cd50acbb38b44b3
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel timers/posix
        git checkout 7980f85caabff6a355848d2d3cd50acbb38b44b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061031.SNHAdqUm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/signal_32.c:459:1: error: static assertion failed due to requirement 'sizeof ((((struct siginfo *)0)->_sifields._timer)) == 4 * sizeof(int)': sizeof_field(siginfo32_t, _sifields._timer) == 4*sizeof(int)
   CHECK_SI_SIZE  (_timer, 4*sizeof(int));
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/signal_32.c:447:2: note: expanded from macro 'CHECK_SI_SIZE'
           static_assert(sizeof_field(siginfo32_t, _sifields.name) == size)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   1 error generated.


vim +459 arch/x86/kernel/signal_32.c

f6e2a56c2bad10d Brian Gerst 2022-12-19  453  
f6e2a56c2bad10d Brian Gerst 2022-12-19  454  CHECK_SI_OFFSET(_timer);
f6e2a56c2bad10d Brian Gerst 2022-12-19  455  #ifdef CONFIG_COMPAT
f6e2a56c2bad10d Brian Gerst 2022-12-19  456  /* compat_siginfo_t doesn't have si_sys_private */
f6e2a56c2bad10d Brian Gerst 2022-12-19  457  CHECK_SI_SIZE  (_timer, 3*sizeof(int));
f6e2a56c2bad10d Brian Gerst 2022-12-19  458  #else
f6e2a56c2bad10d Brian Gerst 2022-12-19 @459  CHECK_SI_SIZE  (_timer, 4*sizeof(int));
f6e2a56c2bad10d Brian Gerst 2022-12-19  460  #endif
f6e2a56c2bad10d Brian Gerst 2022-12-19  461  static_assert(offsetof(siginfo32_t, si_tid)     == 0x0C);
f6e2a56c2bad10d Brian Gerst 2022-12-19  462  static_assert(offsetof(siginfo32_t, si_overrun) == 0x10);
f6e2a56c2bad10d Brian Gerst 2022-12-19  463  static_assert(offsetof(siginfo32_t, si_value)   == 0x14);
f6e2a56c2bad10d Brian Gerst 2022-12-19  464  

:::::: The code at line 459 was first introduced by commit
:::::: f6e2a56c2bad10dd4381d5ab021332ef70d81990 x86/signal: Move siginfo field tests

:::::: TO: Brian Gerst <brgerst@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
