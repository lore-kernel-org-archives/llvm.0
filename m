Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E3A187B;
	Wed, 29 Mar 2023 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680093293; x=1711629293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gOq4FOBn9R97c2HIbWt3qjv95kzUO91BcyM7dhxAhSE=;
  b=JImKi9E/BICnaCvYc4TJuMwaIc9BzyzQ/If/NVmlZiK+kr9yTA9bKbqy
   y9mu6bUWqsUBVhGyQoupxB3+y2p6/9ruTzB4zoM7xD4LKTn8s1Q5la60i
   hET4TNR88lMUvwIpoiJo5ngyo8bU9MoKoubxoj/HQ0Y5SRA06JuAdFDj8
   CzlWmozbhjp8XBgvQ5Wow9ZqSStDc9t82Hr1w0rPau0Fqh0jLQ9zMijh1
   OxeH+klv6vh+l8b/quhFe3UFjBdcT9a1KtoCs+ECt1GfrjxHNkhzMPUug
   fI9q0QhyebekJBmmaTFJm6NlH4e5V0hxDLnTGosF1rsES6lcfJ52m9Na7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="329330488"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="329330488"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 05:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="634455337"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="634455337"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Mar 2023 05:34:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phV0r-000JWa-19;
	Wed, 29 Mar 2023 12:34:49 +0000
Date: Wed, 29 Mar 2023 20:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/test 12/12] arch/riscv/kernel/setup.c:62:35: warning:
 tentative definition of variable with internal linkage has incomplete
 non-array type 'typeof(struct cpu)' (aka 'struct cpu')
Message-ID: <202303292006.fwmTI7WT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/test
head:   2b813ce156bb4f39aae9c92bddaf6e47019fc280
commit: 2b813ce156bb4f39aae9c92bddaf6e47019fc280 [12/12] of: Drop cpu.h include from of_device.h
config: riscv-buildonly-randconfig-r006-20230329 (https://download.01.org/0day-ci/archive/20230329/202303292006.fwmTI7WT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=2b813ce156bb4f39aae9c92bddaf6e47019fc280
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/test
        git checkout 2b813ce156bb4f39aae9c92bddaf6e47019fc280
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303292006.fwmTI7WT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/setup.c:62:35: warning: tentative definition of variable with internal linkage has incomplete non-array type 'typeof(struct cpu)' (aka 'struct cpu') [-Wtentative-definition-incomplete-type]
   static DEFINE_PER_CPU(struct cpu, cpu_devices);
                                     ^
   arch/riscv/kernel/setup.c:62:30: note: forward declaration of 'struct cpu'
   static DEFINE_PER_CPU(struct cpu, cpu_devices);
                                ^
   arch/riscv/kernel/setup.c:313:22: error: arithmetic on a pointer to an incomplete type 'typeof(struct cpu)' (aka 'struct cpu')
                   struct cpu *cpu = &per_cpu(cpu_devices, i);
                                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PERCPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:52: note: expanded from macro '__verify_pcpu_ptr'
           const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
                                                       ~~~~~ ^
   arch/riscv/kernel/setup.c:62:30: note: forward declaration of 'struct cpu'
   static DEFINE_PER_CPU(struct cpu, cpu_devices);
                                ^
   arch/riscv/kernel/setup.c:315:6: error: incomplete definition of type 'struct cpu'
                   cpu->hotpluggable = cpu_has_hotplug(i);
                   ~~~^
   arch/riscv/kernel/setup.c:62:30: note: forward declaration of 'struct cpu'
   static DEFINE_PER_CPU(struct cpu, cpu_devices);
                                ^
   arch/riscv/kernel/setup.c:316:9: error: call to undeclared function 'register_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = register_cpu(cpu, i);
                         ^
   arch/riscv/kernel/setup.c:62:35: error: tentative definition has type 'typeof(struct cpu)' (aka 'struct cpu') that is never completed
   static DEFINE_PER_CPU(struct cpu, cpu_devices);
                                     ^
   arch/riscv/kernel/setup.c:62:30: note: forward declaration of 'struct cpu'
   static DEFINE_PER_CPU(struct cpu, cpu_devices);
                                ^
   1 warning and 4 errors generated.


vim +62 arch/riscv/kernel/setup.c

76d2a0493a17d4 Palmer Dabbelt 2017-07-10  50  
aff7783392e0c0 Zong Li        2020-02-04  51  /*
aff7783392e0c0 Zong Li        2020-02-04  52   * The lucky hart to first increment this variable will boot the other cores.
aff7783392e0c0 Zong Li        2020-02-04  53   * This is used before the kernel initializes the BSS so it can't be in the
aff7783392e0c0 Zong Li        2020-02-04  54   * BSS.
aff7783392e0c0 Zong Li        2020-02-04  55   */
44c922572952d8 Vitaly Wool    2021-04-13  56  atomic_t hart_lottery __section(".sdata")
44c922572952d8 Vitaly Wool    2021-04-13  57  #ifdef CONFIG_XIP_KERNEL
44c922572952d8 Vitaly Wool    2021-04-13  58  = ATOMIC_INIT(0xC001BEEF)
44c922572952d8 Vitaly Wool    2021-04-13  59  #endif
44c922572952d8 Vitaly Wool    2021-04-13  60  ;
f99fb607fb2bc0 Atish Patra    2018-10-02  61  unsigned long boot_cpu_hartid;
f1e58583b9c7ce Atish Patra    2020-03-17 @62  static DEFINE_PER_CPU(struct cpu, cpu_devices);
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  63  

:::::: The code at line 62 was first introduced by commit
:::::: f1e58583b9c7ceae7f11646e9edf2561d67f29c9 RISC-V: Support cpu hotplug

:::::: TO: Atish Patra <atish.patra@wdc.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
