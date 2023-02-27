Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4758A33C5;
	Mon, 27 Feb 2023 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677538267; x=1709074267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FeDbSotC03c+VCxqwromkLklNRr+4rEBWpd8thJ/JnQ=;
  b=S9EU2RYhLxFofH/cybpdeD+UYGpmvEPEeWBLOwVhJa17JkSQV1jZUxO/
   jNrn2LYRG8TWCecbYB9WThs2xlCOLt5KyifeQVqXvsipGRqENtmqya4DS
   j90LwK4hIXhvj3VS9hfd51EnpaMCpiFY7Yv3NLW0RG/HM6aLAdS+1APGE
   ekdL0KYHzVDmUkHxOw4gNniLC1Mu9/eVr8FDaEJmUyfKitqz2+dxTXST+
   A+3o1XnSH4q+Novp2HZBWhyP9ZLYTI/1TqqmUmyEz7THH2qRiu3lpOtAB
   3Mlf7td7XNZD1IPfrZyaNJA8PFkS3yJAWv3jXp0MN3BUoHYJma9g8A5Ee
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336273004"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="336273004"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 14:51:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="676051698"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="676051698"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2023 14:51:05 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWmKm-0004r1-0o;
	Mon, 27 Feb 2023 22:51:04 +0000
Date: Tue, 28 Feb 2023 06:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 435/440]
 include/linux/kvm_host.h:429:2: error: call to undeclared function
 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202302280605.4Qh7ZZL2-lkp@intel.com>
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
config: riscv-randconfig-r042-20230226 (https://download.01.org/0day-ci/archive/20230228/202302280605.4Qh7ZZL2-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280605.4Qh7ZZL2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/../../../virt/kvm/binary_stats.c:8:
>> include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
           ^
   2 errors generated.
--
   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:18:
>> include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
           ^
   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:41:
   include/linux/mman.h:154:9: warning: division by zero is undefined [-Wdivision-by-zero]
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
>> include/linux/perf_event.h:1666:20: error: static declaration of 'perf_event_guest_enter_exit' follows non-static declaration
   static inline void perf_event_guest_enter_exit(bool enter) {}
                      ^
   include/linux/kvm_host.h:429:2: note: previous implicit declaration is here
           perf_event_guest_enter_exit(true);
           ^
   1 warning and 3 errors generated.
--
   In file included from arch/riscv/kvm/vcpu_insn.c:8:
>> include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
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
--
   In file included from arch/riscv/kvm/../../../virt/kvm/eventfd.c:12:
>> include/linux/kvm_host.h:429:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(true);
           ^
   include/linux/kvm_host.h:494:2: error: call to undeclared function 'perf_event_guest_enter_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           perf_event_guest_enter_exit(false);
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
   3 errors generated.


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
