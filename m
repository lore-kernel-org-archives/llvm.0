Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1EA937;
	Tue, 21 Feb 2023 23:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677023588; x=1708559588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQzPeA+j+XXlxZikjWKMvN3in0q6qkc4LZeAQ6b6oKk=;
  b=OemwUF1QcF3mXEG9EJurMK933bQSL2vzZUoMHJ4qvRcrwlVUhQaXESQH
   U4aqXPRNvC7SifFN6zr/8GSTYGIG93nNLDy0CJzBVsVo+SGco6FIvF05A
   1sS/xozzvqTKIHWsrBJFQeOMyX3Q1GmB/Dv2EMeZvOTKD2GmAT2Efoofp
   7GkntF6RjkUQE8PErHN+b2vm2A5mU/A6efTtl4jP7+E+r2SQqtlw1S1vN
   QfFV/qTzi+gWgPx18AFWBVlbBjuevJ041lAHJFDtPbuUdJhJH1EF5J0LD
   cX+N9GS0jqx4D4a+gL7RYnIvV2bHJdJxFYpNMCQOim8SsOe/+IOi9za8P
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="360265459"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="360265459"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 15:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="1000788659"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="1000788659"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2023 15:52:49 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUcRE-0000MT-2G;
	Tue, 21 Feb 2023 23:52:48 +0000
Date: Wed, 22 Feb 2023 07:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: [jpoimboe:objtool-noreturn 9/29] arch/mips/include/asm/smp.h:28:40:
 error: too many arguments provided to function-like macro invocation
Message-ID: <202302220755.HM8J8GOR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-noreturn
head:   12e73cfc57b438df95663a3664420e0e0564ad95
commit: ba2b054a29581e0ec0f23826524aa2c97b5efc96 [9/29] mips/cpu: Expose play_dead()'s prototype definition
config: mips-randconfig-r014-20230219 (https://download.01.org/0day-ci/archive/20230222/202302220755.HM8J8GOR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=ba2b054a29581e0ec0f23826524aa2c97b5efc96
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-noreturn
        git checkout ba2b054a29581e0ec0f23826524aa2c97b5efc96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220755.HM8J8GOR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/mips/kernel/smp-bmips.c:41:
>> arch/mips/include/asm/smp.h:28:40: error: too many arguments provided to function-like macro invocation
   static inline int raw_smp_processor_id(void)
                                          ^
   include/linux/smp.h:191:9: note: macro 'raw_smp_processor_id' defined here
   #define raw_smp_processor_id()                  0
           ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
>> arch/mips/include/asm/smp.h:28:8: error: 'inline' can only appear on functions
   static inline int raw_smp_processor_id(void)
          ^
   include/linux/compiler_types.h:162:16: note: expanded from macro 'inline'
   #define inline inline __gnu_inline __inline_maybe_unused notrace
                  ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
>> arch/mips/include/asm/smp.h:28:8: warning: '__gnu_inline__' attribute only applies to functions [-Wignored-attributes]
   include/linux/compiler_types.h:162:23: note: expanded from macro 'inline'
   #define inline inline __gnu_inline __inline_maybe_unused notrace
                         ^
   include/linux/compiler_attributes.h:174:56: note: expanded from macro '__gnu_inline'
   #define __gnu_inline                    __attribute__((__gnu_inline__))
                                                          ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
>> arch/mips/include/asm/smp.h:28:8: warning: '__no_instrument_function__' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
   include/linux/compiler_types.h:162:58: note: expanded from macro 'inline'
   #define inline inline __gnu_inline __inline_maybe_unused notrace
                                                            ^
   include/linux/compiler_types.h:144:34: note: expanded from macro 'notrace'
   #define notrace                 __attribute__((__no_instrument_function__))
                                                  ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
>> arch/mips/include/asm/smp.h:28:39: error: expected ';' after top level declarator
   static inline int raw_smp_processor_id(void)
                                         ^
                                         ;
>> arch/mips/include/asm/smp.h:38:9: warning: 'raw_smp_processor_id' macro redefined [-Wmacro-redefined]
   #define raw_smp_processor_id raw_smp_processor_id
           ^
   include/linux/smp.h:191:9: note: previous definition is here
   #define raw_smp_processor_id()                  0
           ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
>> arch/mips/include/asm/smp.h:69:20: error: redefinition of 'smp_send_reschedule'
   static inline void smp_send_reschedule(int cpu)
                      ^
   include/linux/smp.h:198:20: note: previous definition is here
   static inline void smp_send_reschedule(int cpu) { }
                      ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
>> arch/mips/include/asm/smp.h:73:8: error: incomplete definition of type 'struct plat_smp_ops'
           mp_ops->send_ipi_single(cpu, SMP_RESCHEDULE_YOURSELF);
           ~~~~~~^
   arch/mips/include/asm/smp-ops.h:57:8: note: forward declaration of 'struct plat_smp_ops'
   struct plat_smp_ops;
          ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
   arch/mips/include/asm/smp.h:128:8: error: incomplete definition of type 'struct plat_smp_ops'
           mp_ops->send_ipi_single(cpu, SMP_CALL_FUNCTION);
           ~~~~~~^
   arch/mips/include/asm/smp-ops.h:57:8: note: forward declaration of 'struct plat_smp_ops'
   struct plat_smp_ops;
          ^
   In file included from arch/mips/kernel/smp-bmips.c:41:
   arch/mips/include/asm/smp.h:135:8: error: incomplete definition of type 'struct plat_smp_ops'
           mp_ops->send_ipi_mask(mask, SMP_CALL_FUNCTION);
           ~~~~~~^
   arch/mips/include/asm/smp-ops.h:57:8: note: forward declaration of 'struct plat_smp_ops'
   struct plat_smp_ops;
          ^
>> arch/mips/kernel/smp-bmips.c:491:6: error: called object type 'int' is not a function or function pointer
           if (smp_processor_id() > 0) {
               ^~~~~~~~~~~~~~~~~~
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:51: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ~~~~~~~~~~~~~~~~~~~~^
   3 warnings and 8 errors generated.


vim +28 arch/mips/include/asm/smp.h

0ab7aefc4d43a6d include/asm-mips/smp.h      Ralf Baechle      2007-03-02  27  
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12 @28  static inline int raw_smp_processor_id(void)
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12  29  {
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12  30  #if defined(__VDSO__)
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12  31  	extern int vdso_smp_processor_id(void)
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12  32  		__compiletime_error("VDSO should not call smp_processor_id()");
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12  33  	return vdso_smp_processor_id();
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12  34  #else
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12  35  	return current_thread_info()->cpu;
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12  36  #endif
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12  37  }
351fdddd366245c arch/mips/include/asm/smp.h Paul Burton       2017-12-12 @38  #define raw_smp_processor_id raw_smp_processor_id
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  39  
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  40  /* Map from cpu id to sequential logical cpu number.  This will only
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  41     not be idempotent when cpus failed to come on-line.	*/
7820b84be844d8d arch/mips/include/asm/smp.h David Daney       2017-09-28  42  extern int __cpu_number_map[CONFIG_MIPS_NR_CPU_NR_MAP];
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  43  #define cpu_number_map(cpu)  __cpu_number_map[cpu]
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  44  
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  45  /* The reverse map from sequential logical cpu number to cpu id.  */
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  46  extern int __cpu_logical_map[NR_CPUS];
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  47  #define cpu_logical_map(cpu)  __cpu_logical_map[cpu]
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  48  
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  49  #define NO_PROC_ID	(-1)
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  50  
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  51  #define SMP_RESCHEDULE_YOURSELF 0x1	/* XXX braindead */
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  52  #define SMP_CALL_FUNCTION	0x2
ddcdb1b4a46915b arch/mips/include/asm/smp.h David Daney       2008-12-11  53  /* Octeon - Tell another core to flush its icache */
ddcdb1b4a46915b arch/mips/include/asm/smp.h David Daney       2008-12-11  54  #define SMP_ICACHE_FLUSH	0x4
c83c2eed67e5785 arch/mips/include/asm/smp.h Marcin Nowakowski 2016-12-02  55  #define SMP_ASK_C0COUNT		0x8
ddcdb1b4a46915b arch/mips/include/asm/smp.h David Daney       2008-12-11  56  
76306f4272e036e arch/mips/include/asm/smp.h Paul Burton       2014-02-14  57  /* Mask of CPUs which are currently definitely operating coherently */
76306f4272e036e arch/mips/include/asm/smp.h Paul Burton       2014-02-14  58  extern cpumask_t cpu_coherent_mask;
76306f4272e036e arch/mips/include/asm/smp.h Paul Burton       2014-02-14  59  
b745fcb949f9076 arch/mips/include/asm/smp.h Joe Perches       2017-07-12  60  extern asmlinkage void smp_bootstrap(void);
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  61  
826e99be6ab5189 arch/mips/include/asm/smp.h James Hogan       2016-07-13  62  extern void calculate_cpu_foreign_map(void);
826e99be6ab5189 arch/mips/include/asm/smp.h James Hogan       2016-07-13  63  
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  64  /*
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  65   * this function sends a 'reschedule' IPI to another CPU.
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  66   * it goes straight through and wastes no time serializing
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  67   * anything. Worst case is that we lose a reschedule ...
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  68   */
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16 @69  static inline void smp_send_reschedule(int cpu)
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  70  {
ff2c8252bfbf069 arch/mips/include/asm/smp.h Matt Redfearn     2017-07-19  71  	extern const struct plat_smp_ops *mp_ops;	/* private */
87353d8ac39c527 include/asm-mips/smp.h      Ralf Baechle      2007-11-19  72  
87353d8ac39c527 include/asm-mips/smp.h      Ralf Baechle      2007-11-19 @73  	mp_ops->send_ipi_single(cpu, SMP_RESCHEDULE_YOURSELF);
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  74  }
^1da177e4c3f415 include/asm-mips/smp.h      Linus Torvalds    2005-04-16  75  

:::::: The code at line 28 was first introduced by commit
:::::: 351fdddd366245c0fb4636f32edfb4198c8d6b8c MIPS: VDSO: Prevent use of smp_processor_id()

:::::: TO: Paul Burton <paul.burton@mips.com>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
