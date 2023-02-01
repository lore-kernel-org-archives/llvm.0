Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7967E5;
	Wed,  1 Feb 2023 04:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675225305; x=1706761305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pe1mz0D+7SpYqUUlom7aOrcvhIE5GiG96eScF9hl0SU=;
  b=CfNsKaaFsKe2seZq4qLhymJDeJjGfPCP9gP50JdDatidxFJ5foYH/VlZ
   5dVKhBqCmLZMWqrMD0neeNtyY7pdYjy/8bLDlFGwRukPsV27hol/ershP
   nVhIci3IFlk2sxJ9kH9vyeMDdb1GsMy1zXiA74JhFMjmPg4bEw/WisI0m
   ZQXbwq3GN+ACjy1yYTp5oj5J+gO2XKQY+u6gUKchVtYZatOb5394UYJAe
   KqyOQPWE+TgYDYdmsNdPaFSb0dYcXxHGYQjI15R33f6tpjBzcjbvrXVmx
   Zk5ANLiDfXEjilc8YTBJIchMkZR4wlph57trsIoyC36KyPFfrb4k6xMot
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="392591438"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="392591438"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 20:21:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="838631759"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="838631759"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2023 20:21:44 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN4cx-00053y-1C;
	Wed, 01 Feb 2023 04:21:43 +0000
Date: Wed, 1 Feb 2023 12:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 371/371]
 include/linux/kvm_host.h:429:2: error: call to undeclared function
 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202302011230.TOfpRZxa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   236af3da84d067f3af446ccf2211937cd9ddc42f
commit: 236af3da84d067f3af446ccf2211937cd9ddc42f [371/371] perf, KVM: introduce software event on enter/exit to/from guest
config: riscv-randconfig-r014-20230129 (https://download.01.org/0day-ci/archive/20230201/202302011230.TOfpRZxa-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel/tdx/commit/236af3da84d067f3af446ccf2211937cd9ddc42f
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 236af3da84d067f3af446ccf2211937cd9ddc42f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:18:
>> include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
           ^
   include/linux/kvm_host.h:1987:55: error: use of undeclared identifier 'INVALID_GPA'
                   if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
                                                                       ^
   include/linux/kvm_host.h:1988:39: error: use of undeclared identifier 'INVALID_GPA'
                                    kvm->mmu_invalidate_range_end == INVALID_GPA))
                                                                     ^
   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:41:
   include/linux/mman.h:154:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:132:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:526:37: error: use of undeclared identifier 'INVALID_GPA'
                   kvm->mmu_invalidate_range_start = INVALID_GPA;
                                                     ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:527:35: error: use of undeclared identifier 'INVALID_GPA'
                   kvm->mmu_invalidate_range_end = INVALID_GPA;
                                                   ^
   1 warning and 6 errors generated.
--
   In file included from arch/riscv/kvm/../../../virt/kvm/eventfd.c:12:
>> include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
           ^
   include/linux/kvm_host.h:1987:55: error: use of undeclared identifier 'INVALID_GPA'
                   if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
                                                                       ^
   include/linux/kvm_host.h:1988:39: error: use of undeclared identifier 'INVALID_GPA'
                                    kvm->mmu_invalidate_range_end == INVALID_GPA))
                                                                     ^
   In file included from arch/riscv/kvm/../../../virt/kvm/eventfd.c:16:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1666:20: error: static declaration of 'perf_event_guest_enter_exit' follows non-static declaration
   static inline void perf_event_guest_enter_exit(bool enter) {}
                      ^
   include/linux/kvm_host.h:429:2: note: previous implicit declaration is here
           perf_event_guest_enter_exit(true);
           ^
   5 errors generated.
--
   In file included from arch/riscv/kvm/../../../virt/kvm/binary_stats.c:8:
>> include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
           ^
   include/linux/kvm_host.h:1987:55: error: use of undeclared identifier 'INVALID_GPA'
                   if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
                                                                       ^
   include/linux/kvm_host.h:1988:39: error: use of undeclared identifier 'INVALID_GPA'
                                    kvm->mmu_invalidate_range_end == INVALID_GPA))
                                                                     ^
   4 errors generated.
--
   In file included from arch/riscv/kvm/vcpu_insn.c:8:
>> include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
           ^
   include/linux/kvm_host.h:1987:55: error: use of undeclared identifier 'INVALID_GPA'
                   if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
                                                                       ^
   include/linux/kvm_host.h:1988:39: error: use of undeclared identifier 'INVALID_GPA'
                                    kvm->mmu_invalidate_range_end == INVALID_GPA))
                                                                     ^
   arch/riscv/kvm/vcpu_insn.c:238:3: warning: shift count is negative [-Wshift-count-negative]
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
   arch/riscv/kvm/vcpu_insn.c:626:12: warning: shift count is negative [-Wshift-count-negative]
                   data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
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
   arch/riscv/kvm/vcpu_insn.c:630:12: warning: shift count is negative [-Wshift-count-negative]
                   data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:127:32: note: expanded from macro 'GET_RS2C'
   #define GET_RS2C(insn, regs)    (*REG_PTR(insn, SH_RS2C, regs))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:119:29: note: expanded from macro 'REG_PTR'
           ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
                                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:116:3: note: expanded from macro 'REG_OFFSET'
           (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_insn.c:110:34: note: expanded from macro 'SHIFT_RIGHT'
           ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
                                           ^  ~~~
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


vim +/perf_event_guest_enter_exit +429 include/linux/kvm_host.h

   418	
   419	/*
   420	 * Enter guest context and enter an RCU extended quiescent state.
   421	 *
   422	 * Between guest_context_enter_irqoff() and guest_context_exit_irqoff() it is
   423	 * unsafe to use any code which may directly or indirectly use RCU, tracing
   424	 * (including IRQ flag tracing), or lockdep. All code in this period must be
   425	 * non-instrumentable.
   426	 */
   427	static __always_inline void guest_context_enter_irqoff(void)
   428	{
 > 429		perf_event_guest_enter_exit(true);
   430		/*
   431		 * KVM does not hold any references to rcu protected data when it
   432		 * switches CPU into a guest mode. In fact switching to a guest mode
   433		 * is very similar to exiting to userspace from rcu point of view. In
   434		 * addition CPU may stay in a guest mode for quite a long time (up to
   435		 * one time slice). Lets treat guest mode as quiescent state, just like
   436		 * we do with user-mode execution.
   437		 */
   438		if (!context_tracking_guest_enter()) {
   439			instrumentation_begin();
   440			rcu_virt_note_context_switch();
   441			instrumentation_end();
   442		}
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
