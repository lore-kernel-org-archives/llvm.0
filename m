Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000A27B
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 09:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651050756; x=1682586756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lswIE0qDBgRPXTxgOcmdXmYU1FBWk9mNzYqp3iZo3yI=;
  b=hkYCPZckXhG10n0uAUq41BoSO4nayKVcaEwMqmNPm55NA/lvPcvGpYvR
   VQaJ0zTCpOs9YVt7tFl5WzAuli7RUNb+jl5hX4H8Ecx5ZxPyxeTp5lBhY
   pBjb3FBb6oxltDpL2OXJX4i4AXcHrdnNP5dUfG3S155AXkcBOOYJNUx3H
   bFz+C9d/xTnBdDJwg9MAVbpoonV6a38ufuAbVdtfEXwRLl8ztv9BToTmW
   4SoFj5l9gy66pwOKeWBComqgRKYMClrj/0so4em72JbwLrGrq+jBd/nUm
   6KxIXeYSbIn9e7nt+x7bjWnzwTTNf/8dmiRk6rl4TwbCJUcTj5BY5wXiv
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291020232"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="291020232"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 02:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="650611167"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2022 02:12:35 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njdis-0004Xi-JS;
	Wed, 27 Apr 2022 09:12:34 +0000
Date: Wed, 27 Apr 2022 17:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Potapenko <glider@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 12/46] kmsan: add KMSAN runtime core
Message-ID: <202204271730.igwpZeHZ-lkp@intel.com>
References: <20220426164315.625149-13-glider@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426164315.625149-13-glider@google.com>

Hi Alexander,

I love your patch! Yet something to improve:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/x86/mm linus/master v5.18-rc4 next-20220427]
[cannot apply to hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20220427-004851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 203d8919a9eda5d1bc68ac3cd7637588334c9dc1
config: arm64-randconfig-r001-20220425 (https://download.01.org/0day-ci/archive/20220427/202204271730.igwpZeHZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/e646a4336193785fdd3120ed4a6b60ffb8860b1d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20220427-004851
        git checkout e646a4336193785fdd3120ed4a6b60ffb8860b1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:22:
   In file included from include/linux/stat.h:6:
   In file included from arch/arm64/include/asm/stat.h:13:
   In file included from arch/arm64/include/asm/compat.h:19:
   In file included from include/linux/sched.h:17:
   In file included from include/linux/kmsan.h:16:
   In file included from include/linux/vmalloc.h:13:
   In file included from arch/arm64/include/asm/vmalloc.h:5:
   In file included from arch/arm64/include/asm/pgtable.h:12:
>> arch/arm64/include/asm/mte.h:107:11: error: incomplete definition of type 'struct task_struct'
               (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
                ~~~~^
   arch/arm64/include/asm/current.h:9:8: note: forward declaration of 'struct task_struct'
   struct task_struct;
          ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:22:
   In file included from include/linux/stat.h:6:
   In file included from arch/arm64/include/asm/stat.h:13:
   In file included from arch/arm64/include/asm/compat.h:19:
   In file included from include/linux/sched.h:17:
   In file included from include/linux/kmsan.h:16:
   In file included from include/linux/vmalloc.h:13:
   In file included from arch/arm64/include/asm/vmalloc.h:5:
>> arch/arm64/include/asm/pgtable.h:299:19: error: incomplete definition of type 'struct task_struct'
           if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
                     ~~~~~~~^
   arch/arm64/include/asm/current.h:9:8: note: forward declaration of 'struct task_struct'
   struct task_struct;
          ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]


vim +107 arch/arm64/include/asm/mte.h

637ec831ea4f09 Vincenzo Frascino   2019-09-16   90  
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18   91  static inline void mte_disable_tco_entry(struct task_struct *task)
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18   92  {
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18   93  	if (!system_supports_mte())
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18   94  		return;
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18   95  
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18   96  	/*
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18   97  	 * Re-enable tag checking (TCO set on exception entry). This is only
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18   98  	 * necessary if MTE is enabled in either the kernel or the userspace
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18   99  	 * task in synchronous or asymmetric mode (SCTLR_EL1.TCF0 bit 0 is set
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  100  	 * for both). With MTE disabled in the kernel and disabled or
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  101  	 * asynchronous in userspace, tag check faults (including in uaccesses)
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  102  	 * are not reported, therefore there is no need to re-enable checking.
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  103  	 * This is beneficial on microarchitectures where re-enabling TCO is
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  104  	 * expensive.
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  105  	 */
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  106  	if (kasan_hw_tags_enabled() ||
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18 @107  	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  108  		asm volatile(SET_PSTATE_TCO(0));
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  109  }
38ddf7dafaeaf3 Peter Collingbourne 2022-02-18  110  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
