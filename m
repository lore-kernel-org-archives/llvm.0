Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D802113;
	Mon, 27 Feb 2023 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677496615; x=1709032615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJjoeRmeE9RWwYA9krCWyrlTlNdnFnOEWx0mnaDpuqA=;
  b=Odg2WfzWaSqqVdpprd1W1vRPczZQ/I/osGvEuOfvx/2m+dhgaW5k5ALn
   I585N+h1LtfQW92YYtK4GXMq+k4cGtihe4phGa5gdRSwS+M2OBlvAyXcY
   Z45O5pfhVNlAAqqAIe1wjsYeHVwuSuo2h7ci53TAJvCIuwuFKgvSPTiab
   imFZHocfZh9cRJ9ztk3cfPyjzGlUwm4Cc/gR0I2SLcV1IUV1S5j6C1la+
   lHTDmvAbnek/unkP4efSdLWBKT2lxbp7dVk4t+NM3Gke8knvAcH3pUkdb
   snDfzrz2SaWCEZMCgaZRVOgyJpBrSvm4QtVwCElwiVxUf1+sGR0JM4W6k
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="314261389"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="314261389"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 03:16:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="762668602"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="762668602"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2023 03:16:38 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWbUj-0004Lr-1Y;
	Mon, 27 Feb 2023 11:16:37 +0000
Date: Mon, 27 Feb 2023 19:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 435/440]
 include/linux/mman.h:154:9: warning: division by zero is undefined
Message-ID: <202302271913.0BlNhi6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   6960696b1b5b8d8074bf2724321ff73782e42e6c
commit: b7377b41927c4fa035228a4eb3fb6151d64bf749 [435/440] perf, KVM: introduce software event on enter/exit to/from guest
config: riscv-randconfig-r042-20230226 (https://download.01.org/0day-ci/archive/20230227/202302271913.0BlNhi6f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel/tdx/commit/b7377b41927c4fa035228a4eb3fb6151d64bf749
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b7377b41927c4fa035228a4eb3fb6151d64bf749
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271913.0BlNhi6f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:18:
   include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
           ^
   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:41:
>> include/linux/mman.h:154:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:132:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:67:
   In file included from include/trace/events/kvm.h:510:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:10:
   include/linux/perf_event.h:1666:20: error: static declaration of 'perf_event_guest_enter_exit' follows non-static declaration
   static inline void perf_event_guest_enter_exit(bool enter) {}
                      ^
   include/linux/kvm_host.h:429:2: note: previous implicit declaration is here
           perf_event_guest_enter_exit(true);
           ^
   1 warning and 3 errors generated.
--
   In file included from arch/riscv/kvm/vcpu_insn.c:8:
   include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
           ^
>> arch/riscv/kvm/vcpu_insn.c:238:3: warning: shift count is negative [-Wshift-count-negative]
                   SET_RD(insn, &vcpu->arch.guest_context,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:129:35: note: expanded from macro 'SET_RD'
   #define SET_RD(insn, regs, val) (*REG_PTR(insn, SH_RD, regs) = (val))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:119:29: note: expanded from macro 'REG_PTR'
           ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
                                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:116:3: note: expanded from macro 'REG_OFFSET'
           (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:110:18: note: expanded from macro 'SHIFT_RIGHT'
           ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
                           ^  ~~~~
   arch/riscv/kvm/vcpu_insn.c:252:18: warning: shift count is negative [-Wshift-count-negative]
           ulong rs1_val = GET_RS1(insn, &vcpu->arch.guest_context);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:123:31: note: expanded from macro 'GET_RS1'
   #define GET_RS1(insn, regs)     (*REG_PTR(insn, SH_RS1, regs))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:119:29: note: expanded from macro 'REG_PTR'
           ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
                                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:116:3: note: expanded from macro 'REG_OFFSET'
           (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:110:18: note: expanded from macro 'SHIFT_RIGHT'
           ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
                           ^  ~~~~
   arch/riscv/kvm/vcpu_insn.c:610:9: warning: shift count is negative [-Wshift-count-negative]
           data = GET_RS2(insn, &vcpu->arch.guest_context);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:124:31: note: expanded from macro 'GET_RS2'
   #define GET_RS2(insn, regs)     (*REG_PTR(insn, SH_RS2, regs))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:119:29: note: expanded from macro 'REG_PTR'
           ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
                                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:116:3: note: expanded from macro 'REG_OFFSET'
           (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:110:18: note: expanded from macro 'SHIFT_RIGHT'
           ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
                           ^  ~~~~
   arch/riscv/kvm/vcpu_insn.c:634:12: warning: shift count is negative [-Wshift-count-negative]
                   data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:126:32: note: expanded from macro 'GET_RS2S'
   #define GET_RS2S(insn, regs)    (*REG_PTR(RVC_RS2S(insn), 0, regs))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:119:29: note: expanded from macro 'REG_PTR'
           ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
                                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:116:3: note: expanded from macro 'REG_OFFSET'
           (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:110:34: note: expanded from macro 'SHIFT_RIGHT'
           ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
                                           ^  ~~~
   arch/riscv/kvm/vcpu_insn.c:724:3: warning: shift count is negative [-Wshift-count-negative]
                   SET_RD(insn, &vcpu->arch.guest_context,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:129:35: note: expanded from macro 'SET_RD'
   #define SET_RD(insn, regs, val) (*REG_PTR(insn, SH_RD, regs) = (val))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:119:29: note: expanded from macro 'REG_PTR'
           ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
                                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:116:3: note: expanded from macro 'REG_OFFSET'
           (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:110:18: note: expanded from macro 'SHIFT_RIGHT'
           ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
                           ^  ~~~~
   arch/riscv/kvm/vcpu_insn.c:729:3: warning: shift count is negative [-Wshift-count-negative]
                   SET_RD(insn, &vcpu->arch.guest_context,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:129:35: note: expanded from macro 'SET_RD'
   #define SET_RD(insn, regs, val) (*REG_PTR(insn, SH_RD, regs) = (val))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:119:29: note: expanded from macro 'REG_PTR'
           ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
                                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:116:3: note: expanded from macro 'REG_OFFSET'
           (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:110:18: note: expanded from macro 'SHIFT_RIGHT'
           ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
                           ^  ~~~~
   arch/riscv/kvm/vcpu_insn.c:734:3: warning: shift count is negative [-Wshift-count-negative]
                   SET_RD(insn, &vcpu->arch.guest_context,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:129:35: note: expanded from macro 'SET_RD'
   #define SET_RD(insn, regs, val) (*REG_PTR(insn, SH_RD, regs) = (val))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:119:29: note: expanded from macro 'REG_PTR'
           ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
                                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:116:3: note: expanded from macro 'REG_OFFSET'
           (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)


vim +154 include/linux/mman.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  145  
^1da177e4c3f41 Linus Torvalds  2005-04-16  146  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  147   * Combine the mmap "flags" argument into "vm_flags" used internally.
^1da177e4c3f41 Linus Torvalds  2005-04-16  148   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  149  static inline unsigned long
^1da177e4c3f41 Linus Torvalds  2005-04-16  150  calc_vm_flag_bits(unsigned long flags)
^1da177e4c3f41 Linus Torvalds  2005-04-16  151  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  152  	return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
b6fb293f2497a9 Jan Kara        2017-11-01  153  	       _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
b3fbbea4c00220 Kevin Brodsky   2019-11-25 @154  	       _calc_vm_trans(flags, MAP_SYNC,	     VM_SYNC      ) |
b3fbbea4c00220 Kevin Brodsky   2019-11-25  155  	       arch_calc_vm_flag_bits(flags);
^1da177e4c3f41 Linus Torvalds  2005-04-16  156  }
00619bcc44d6b7 Jerome Marchand 2013-11-12  157  

:::::: The code at line 154 was first introduced by commit
:::::: b3fbbea4c00220f62e6f7e2514466e6ee81f7f60 mm: Introduce arch_calc_vm_flag_bits()

:::::: TO: Kevin Brodsky <Kevin.Brodsky@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
