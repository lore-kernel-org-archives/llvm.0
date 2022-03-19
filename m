Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997EB17CB
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 02:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647656279; x=1679192279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z4Cs0ow1M4JthoY8HqDsc9XZW1awCZDbzJDMivL0Mh4=;
  b=Wykcp+uNKZ22VajUtEBHjyARuJy+XXrRw2VSqyuE3mABegyY/cym8zGy
   tbtox7yTiLV0rNBjPxX7yVeIElmxq9K6/K6bZnIxNMy5Dip85cgetlVmC
   U2S0wwWy4KQ0icHNADyqIKm6HstrYYqvYri/6DV0lhetFxFpYvqVP47Lv
   SeZAzsUfr3eG7B/gmdRIWLFrNQ4tiMX4VxD5BsL9TQtmyjlXjN7Uxqg0q
   r0XR8mpSWCPbzQpdNA+hGkqbTOm08nEnsHyTaWaKEP4cvS2EFIQW388YP
   W4segB+JD6VDid5d60TFuF8knigez9aIxYstavJV5ABKAsCtqFJ8UeAMf
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="239426439"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="239426439"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 19:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="499458160"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Mar 2022 19:17:57 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVOfE-000FR5-Tr; Sat, 19 Mar 2022 02:17:56 +0000
Date: Sat, 19 Mar 2022 10:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [ammarfaizi2-block:rostedt/linux-trace/ftrace/core 53/57]
 arch/arm64/kernel/probes/rethook.c:11:22: warning: no previous prototype for
 function 'arch_rethook_trampoline_callback'
Message-ID: <202203191007.YShhz8AJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block rostedt/linux-trace/ftrace/core
head:   03cd03b5c3f9836e625a99fa603b4683dc1ebb47
commit: 6b142311f91040c847702773bdf441afdc658984 [53/57] fprobe: Add exit_handler support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220319/202203191007.YShhz8AJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/6b142311f91040c847702773bdf441afdc658984
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block rostedt/linux-trace/ftrace/core
        git checkout 6b142311f91040c847702773bdf441afdc658984
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/probes/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/probes/rethook.c:11:22: warning: no previous prototype for function 'arch_rethook_trampoline_callback' [-Wmissing-prototypes]
   unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
                        ^
   arch/arm64/kernel/probes/rethook.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
   ^
   static 
   1 warning generated.


vim +/arch_rethook_trampoline_callback +11 arch/arm64/kernel/probes/rethook.c

371ce29069762d9 Masami Hiramatsu 2022-03-15   9  
371ce29069762d9 Masami Hiramatsu 2022-03-15  10  /* This is called from arch_rethook_trampoline() */
371ce29069762d9 Masami Hiramatsu 2022-03-15 @11  unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
371ce29069762d9 Masami Hiramatsu 2022-03-15  12  {
371ce29069762d9 Masami Hiramatsu 2022-03-15  13  	return rethook_trampoline_handler(regs, regs->regs[29]);
371ce29069762d9 Masami Hiramatsu 2022-03-15  14  }
371ce29069762d9 Masami Hiramatsu 2022-03-15  15  NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
371ce29069762d9 Masami Hiramatsu 2022-03-15  16  

:::::: The code at line 11 was first introduced by commit
:::::: 371ce29069762d992f8dcaa9ecabb6ff78a73f22 arm64: rethook: Add arm64 rethook implementation

:::::: TO: Masami Hiramatsu <mhiramat@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
