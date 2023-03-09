Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDED807;
	Thu,  9 Mar 2023 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678348697; x=1709884697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZfHHT2bb8la7dD8H3H4V81h1OOjZmgGMkaB3rgZ+bcE=;
  b=OvLsjbTSpm3xdOs2zlKaVBPFGnTMR9MUBw+odzlOoVs4fHJEpvhyJj6c
   uyjaTITj9qRDV+q1HL0DGXdxNJ7ROP+s0VgGuraiEspEEC4KjJDrIE6Gy
   ykQmqpYewqkpkTWKzjZeUxLCy/HfbSoe+7bOedLBQGnHP+M7Bt4aLLC6U
   rC9cQGszMERdcsk4fsRGTlb5gQAueuo1jjK96gPUpw/xdgIqDor/4Ly4j
   itluuNa6/GnYK63GBr9snb6ZG/AxQvIS5nKrRw4cb7IqnYHkzwtSyAmCx
   iKazzfiw2wogemc0aOLU61Vozf9cs7wv3BlU79EJHv09GAA5ktYVvp2gZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398961084"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="398961084"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="677281041"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="677281041"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Mar 2023 23:58:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paBAE-0002lP-1U;
	Thu, 09 Mar 2023 07:58:14 +0000
Date: Thu, 9 Mar 2023 15:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:palmer/linux/for-next 2/2]
 arch/riscv/include/asm/hwcap.h:53:13: error: use of undeclared identifier
 'RISCV_ISA_EXT_NAME_LEN_MAX'
Message-ID: <202303091527.UXtPo7vd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/for-next
head:   b5cd1d196c7c3b8d1b9d6636ac1c1c5c6b5184a4
commit: b5cd1d196c7c3b8d1b9d6636ac1c1c5c6b5184a4 [2/2] Merge patch series "riscv, mm: detect svnapot cpu support at runtime"
config: riscv-randconfig-r042-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091527.UXtPo7vd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/b5cd1d196c7c3b8d1b9d6636ac1c1c5c6b5184a4
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block palmer/linux/for-next
        git checkout b5cd1d196c7c3b8d1b9d6636ac1c1c5c6b5184a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091527.UXtPo7vd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:108:
   In file included from arch/riscv/include/asm/tlbflush.h:12:
   In file included from arch/riscv/include/asm/errata_list.h:8:
   In file included from arch/riscv/include/asm/alternative.h:20:
>> arch/riscv/include/asm/hwcap.h:53:13: error: use of undeclared identifier 'RISCV_ISA_EXT_NAME_LEN_MAX'
           char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
                      ^
>> arch/riscv/include/asm/hwcap.h:61:27: error: use of undeclared identifier 'RISCV_ISA_EXT_MAX'
           compiletime_assert(ext < RISCV_ISA_EXT_MAX,
                                    ^
   arch/riscv/include/asm/hwcap.h:79:27: error: use of undeclared identifier 'RISCV_ISA_EXT_MAX'
           compiletime_assert(ext < RISCV_ISA_EXT_MAX,
                                    ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                        ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
--
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:162:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_BINOP(sigandnsets, _sig_andn)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:3: note: expanded from macro '_SIG_SET_BINOP'
                   r->sig[3] = op(a3, b3);                                 \
                   ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:162:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_BINOP(sigandnsets, _sig_andn)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:3: note: expanded from macro '_SIG_SET_BINOP'
                   r->sig[2] = op(a2, b2);                                 \
                   ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:27: note: expanded from macro '_SIG_SET_OP'
           case 4: set->sig[3] = op(set->sig[3]);                          \
                                    ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
   #define _sig_not(x)     (~(x))
                              ^
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:10: note: expanded from macro '_SIG_SET_OP'
           case 4: set->sig[3] = op(set->sig[3]);                          \
                   ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:20: note: expanded from macro '_SIG_SET_OP'
                   set->sig[2] = op(set->sig[2]);                          \
                                    ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
   #define _sig_not(x)     (~(x))
                              ^
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
   _SIG_SET_OP(signotset, _sig_not)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:3: note: expanded from macro '_SIG_SET_OP'
                   set->sig[2] = op(set->sig[2]);                          \
                   ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
>> arch/riscv/include/asm/kvm_host.h:167:22: error: use of undeclared identifier 'RISCV_ISA_EXT_MAX'; did you mean 'KVM_RISCV_ISA_EXT_MAX'?
           DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
                               ^~~~~~~~~~~~~~~~~
                               KVM_RISCV_ISA_EXT_MAX
   include/linux/types.h:11:35: note: expanded from macro 'DECLARE_BITMAP'
           unsigned long name[BITS_TO_LONGS(bits)]
                                            ^
   include/linux/bitops.h:19:49: note: expanded from macro 'BITS_TO_LONGS'
   #define BITS_TO_LONGS(nr)       __KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
                                                         ^
   include/uapi/linux/const.h:34:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                          ^
   arch/riscv/include/uapi/asm/kvm.h:108:2: note: 'KVM_RISCV_ISA_EXT_MAX' declared here
           KVM_RISCV_ISA_EXT_MAX,
           ^
   28 warnings and 4 errors generated.
   make[2]: *** [scripts/Makefile.build:114: arch/riscv/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/RISCV_ISA_EXT_NAME_LEN_MAX +53 arch/riscv/include/asm/hwcap.h

c360cbec351103 Jisheng Zhang 2022-05-22  50  
a9b202606c6931 Atish Patra   2022-03-14  51  struct riscv_isa_ext_data {
a9b202606c6931 Atish Patra   2022-03-14  52  	/* Name of the extension displayed to userspace via /proc/cpuinfo */
a9b202606c6931 Atish Patra   2022-03-14 @53  	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
a9b202606c6931 Atish Patra   2022-03-14  54  	/* The logical ISA extension ID */
a9b202606c6931 Atish Patra   2022-03-14  55  	unsigned int isa_ext_id;
a9b202606c6931 Atish Patra   2022-03-14  56  };
a9b202606c6931 Atish Patra   2022-03-14  57  
bdda5d554e43f2 Jisheng Zhang 2023-01-29  58  static __always_inline bool
bdda5d554e43f2 Jisheng Zhang 2023-01-29  59  riscv_has_extension_likely(const unsigned long ext)
c360cbec351103 Jisheng Zhang 2022-05-22  60  {
bdda5d554e43f2 Jisheng Zhang 2023-01-29 @61  	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
bdda5d554e43f2 Jisheng Zhang 2023-01-29  62  			   "ext must be < RISCV_ISA_EXT_MAX");
bdda5d554e43f2 Jisheng Zhang 2023-01-29  63  
bdda5d554e43f2 Jisheng Zhang 2023-01-29  64  	asm_volatile_goto(
bdda5d554e43f2 Jisheng Zhang 2023-01-29  65  	ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
bdda5d554e43f2 Jisheng Zhang 2023-01-29  66  	:
bdda5d554e43f2 Jisheng Zhang 2023-01-29  67  	: [ext] "i" (ext)
bdda5d554e43f2 Jisheng Zhang 2023-01-29  68  	:
bdda5d554e43f2 Jisheng Zhang 2023-01-29  69  	: l_no);
bdda5d554e43f2 Jisheng Zhang 2023-01-29  70  
bdda5d554e43f2 Jisheng Zhang 2023-01-29  71  	return true;
bdda5d554e43f2 Jisheng Zhang 2023-01-29  72  l_no:
bdda5d554e43f2 Jisheng Zhang 2023-01-29  73  	return false;
c360cbec351103 Jisheng Zhang 2022-05-22  74  }
bdda5d554e43f2 Jisheng Zhang 2023-01-29  75  

:::::: The code at line 53 was first introduced by commit
:::::: a9b202606c69312cdaa4db187837820ebf7213b2 RISC-V: Improve /proc/cpuinfo output for ISA extensions

:::::: TO: Atish Patra <atishp@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
