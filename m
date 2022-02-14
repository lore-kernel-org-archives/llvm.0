Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044807A
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644849431; x=1676385431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6LOK4VVNnkh4NqshkBZRVXh25R9/25K4xECHUcNdZ8I=;
  b=b338rXFggUHZ6Epj9c1xP461PsIkEzMRoELCFUgahew4xBBt34wNmGox
   +PWAHJprDPEOn/KEJNz/4v51Y4N4jXZxI1nDm2QZcOmQ4JGumhUp+Qqnz
   1nREyQ29aPZbCPRQXckBcrRbFu48giRI8uWDFKBZlgV6s1NUEfURaLav5
   GbOJo2BYoPlgkc3nI0pmlUGBwrJEMxOngW2xtexxS9grJ5zNbwxCLHXC/
   QfiNVyVP5b9Gy5diTKi+8v8WW3jEzOsnK05KrgjTigAWiSzgj3qWxoVHy
   5pgp7AsbzsL2Pn8EuIot5g3/V7fdaWfof8WM9AavCPa2kzKqzj7ei/ZdO
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="249849537"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="249849537"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 06:37:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="495683768"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 06:37:09 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJcTU-0008ed-CQ; Mon, 14 Feb 2022 14:37:08 +0000
Date: Mon, 14 Feb 2022 22:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: kernel/time/hrtimer.c:650:19: warning: unused function
 'hrtimer_hres_active'
Message-ID: <202202142217.xTcn7mgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   754e0b0e35608ed5206d6a67a791563c631cec07
commit: 9482fd71dbb8f0d1a61821a83e467dc0a9d7b429 hrtimer: Use raw_cpu_ptr() in clock_was_set()
date:   6 months ago
config: mips-randconfig-r033-20220213 (https://download.01.org/0day-ci/archive/20220214/202202142217.xTcn7mgj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9482fd71dbb8f0d1a61821a83e467dc0a9d7b429
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9482fd71dbb8f0d1a61821a83e467dc0a9d7b429
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/ kernel/time/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/time/hrtimer.c:120:21: warning: initializer overrides prior initialization of this subobject
   = HRTIMER_BASE_REALTIME,
   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
   [0 ... MAX_CLOCKS - 1] = HRTIMER_MAX_CLOCK_BASES,
   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:22: warning: initializer overrides prior initialization of this subobject
   = HRTIMER_BASE_MONOTONIC,
   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
   [0 ... MAX_CLOCKS - 1] = HRTIMER_MAX_CLOCK_BASES,
   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:21: warning: initializer overrides prior initialization of this subobject
   = HRTIMER_BASE_BOOTTIME,
   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
   [0 ... MAX_CLOCKS - 1] = HRTIMER_MAX_CLOCK_BASES,
   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:17: warning: initializer overrides prior initialization of this subobject
   = HRTIMER_BASE_TAI,
   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
   [0 ... MAX_CLOCKS - 1] = HRTIMER_MAX_CLOCK_BASES,
   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:1648:7: warning: variable 'expires_in_hardirq' set but not used
   bool expires_in_hardirq;
   ^
   kernel/time/hrtimer.c:276:20: warning: unused function 'is_migration_base'
   static inline bool is_migration_base(struct hrtimer_clock_base
   ^
>> kernel/time/hrtimer.c:650:19: warning: unused function 'hrtimer_hres_active'
   static inline int hrtimer_hres_active(void)
   ^
   kernel/time/hrtimer.c:1887:20: warning: unused function '__hrtimer_peek_ahead_timers'
   static inline void __hrtimer_peek_ahead_timers(void) { }
   ^
   fatal error: error in backend: Nested variants found in inline asm string: ' .set push
   .set mips64r2
   .if ( 0x00 ) != -1)) 0x00 ) != -1)) : ($( static struct ftrace_branch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_branch"))) __if_trace = $( .func = __func__, .file = "arch/mips/include/asm/bitops.h", .line = 105, $); 0x00 ) != -1)) : $))) ) && ( 0 ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $0, $1
   or $0, $2
   sc $0, $1
   beqz $0, 1b
   .set pop
   '
   clang-15: error: clang frontend command failed with exit code 70 (use -v to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
   Target: mips-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-ea071884b0/bin
   clang-15: note: diagnostic msg:
   Makefile arch block certs crypto drivers fs include init ipc kernel lib mm scripts security sound source usr virt


vim +/hrtimer_hres_active +650 kernel/time/hrtimer.c

28bfd18bf3daa5 Anna-Maria Gleixner 2017-12-21  649  
28bfd18bf3daa5 Anna-Maria Gleixner 2017-12-21 @650  static inline int hrtimer_hres_active(void)
28bfd18bf3daa5 Anna-Maria Gleixner 2017-12-21  651  {
28bfd18bf3daa5 Anna-Maria Gleixner 2017-12-21  652  	return __hrtimer_hres_active(this_cpu_ptr(&hrtimer_bases));
28bfd18bf3daa5 Anna-Maria Gleixner 2017-12-21  653  }
28bfd18bf3daa5 Anna-Maria Gleixner 2017-12-21  654  

:::::: The code at line 650 was first introduced by commit
:::::: 28bfd18bf3daa5db8bb3422ea7138c8b7d2444ac hrtimer: Make the hrtimer_cpu_base::hres_active field unconditional, to simplify the code

:::::: TO: Anna-Maria Gleixner <anna-maria@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
