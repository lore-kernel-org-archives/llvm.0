Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE3B101E1;
	Mon,  3 Jul 2023 17:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688405120; x=1719941120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qB0M/UxMptx5ZGchVdDoi+8zk5iR+pMU7fN7C+gn2Zg=;
  b=fYGmz4Z3Iz4i8qwC5oaLjOZtvXSOmzYcNe+v9YcJOJ3tWk56shMkpHNy
   3A4HsuFIMxhn/BTgBbupOHM0gHvnPVLc89FB8maDydZeUW/ylAPtRq0eT
   Uix19llR1p8Tw37Ln+V2ZjmkpbLPJEYJVDMc7xnqO3oUo0qoOxLSRNLBY
   d1NQEW0z52ECk4s3WHKnFBEIQOsWrJ9YuHeDv8uGkqwLwCetu2Pq4z6Ke
   VhFB4XlQ/tXr5J4jl4E4bV/3WrikwO02Y6RkAb76Dy0sNlTlzagyMinff
   abLNH4uNiLlF26BlCK76nGymwGfckdCAcWnODOYcg1DZI0cKg2god1Yku
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="428974468"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="428974468"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 10:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="863147898"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="863147898"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2023 10:25:17 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGNIa-000HWJ-29;
	Mon, 03 Jul 2023 17:25:16 +0000
Date: Tue, 4 Jul 2023 01:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 62/89] include/linux/kexec.h:41:2: error:
 KEXEC_SOURCE_MEMORY_LIMIT not defined
Message-ID: <202307040131.41upArk4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f30ee81787a5abee6c7c72b0fcc30d428319c449
commit: c717f7a0e6b98a52da146e1c09e4c5d92934ca41 [62/89] arm/kexec: refactor for kernel/Kconfig.kexec
config: arm-randconfig-r032-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040131.41upArk4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040131.41upArk4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040131.41upArk4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/vmcore.c:22:
   In file included from include/linux/crash_dump.h:5:
>> include/linux/kexec.h:41:2: error: KEXEC_SOURCE_MEMORY_LIMIT not defined
      41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
         |  ^
>> include/linux/kexec.h:45:2: error: KEXEC_DESTINATION_MEMORY_LIMIT not defined
      45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
         |  ^
>> include/linux/kexec.h:49:2: error: KEXEC_CONTROL_MEMORY_LIMIT not defined
      49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
         |  ^
>> include/linux/kexec.h:57:2: error: KEXEC_CONTROL_PAGE_SIZE not defined
      57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
         |  ^
>> include/linux/kexec.h:61:2: error: KEXEC_ARCH not defined
      61 | #error KEXEC_ARCH not defined
         |  ^
   5 errors generated.
--
   In file included from kernel/kexec_core.c:15:
>> include/linux/kexec.h:41:2: error: KEXEC_SOURCE_MEMORY_LIMIT not defined
      41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
         |  ^
>> include/linux/kexec.h:45:2: error: KEXEC_DESTINATION_MEMORY_LIMIT not defined
      45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
         |  ^
>> include/linux/kexec.h:49:2: error: KEXEC_CONTROL_MEMORY_LIMIT not defined
      49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
         |  ^
>> include/linux/kexec.h:57:2: error: KEXEC_CONTROL_PAGE_SIZE not defined
      57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
         |  ^
>> include/linux/kexec.h:61:2: error: KEXEC_ARCH not defined
      61 | #error KEXEC_ARCH not defined
         |  ^
>> kernel/kexec_core.c:179:15: error: use of undeclared identifier 'KEXEC_DESTINATION_MEMORY_LIMIT'
     179 |                 if (mend >= KEXEC_DESTINATION_MEMORY_LIMIT)
         |                             ^
>> kernel/kexec_core.c:388:17: error: use of undeclared identifier 'KEXEC_CONTROL_MEMORY_LIMIT'
     388 |                 if ((epfn >= (KEXEC_CONTROL_MEMORY_LIMIT >> PAGE_SHIFT)) ||
         |                               ^
   kernel/kexec_core.c:454:18: error: use of undeclared identifier 'KEXEC_CONTROL_MEMORY_LIMIT'
     454 |                 if (hole_end > KEXEC_CRASH_CONTROL_MEMORY_LIMIT)
         |                                ^
   include/linux/kexec.h:65:42: note: expanded from macro 'KEXEC_CRASH_CONTROL_MEMORY_LIMIT'
      65 | #define KEXEC_CRASH_CONTROL_MEMORY_LIMIT KEXEC_CONTROL_MEMORY_LIMIT
         |                                          ^
>> kernel/kexec_core.c:721:6: error: use of undeclared identifier 'KEXEC_SOURCE_MEMORY_LIMIT'
     721 |                                 (KEXEC_SOURCE_MEMORY_LIMIT >> PAGE_SHIFT)) {
         |                                  ^
>> kernel/kexec_core.c:1061:4: error: call to undeclared function 'crash_setup_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1061 |                         crash_setup_regs(&fixed_regs, regs);
         |                         ^
   10 errors generated.
--
   In file included from security/security.c:23:
   In file included from include/linux/ima.h:13:
>> include/linux/kexec.h:41:2: error: KEXEC_SOURCE_MEMORY_LIMIT not defined
      41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
         |  ^
>> include/linux/kexec.h:45:2: error: KEXEC_DESTINATION_MEMORY_LIMIT not defined
      45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
         |  ^
>> include/linux/kexec.h:49:2: error: KEXEC_CONTROL_MEMORY_LIMIT not defined
      49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
         |  ^
>> include/linux/kexec.h:57:2: error: KEXEC_CONTROL_PAGE_SIZE not defined
      57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
         |  ^
>> include/linux/kexec.h:61:2: error: KEXEC_ARCH not defined
      61 | #error KEXEC_ARCH not defined
         |  ^
   In file included from security/security.c:26:
   include/linux/mman.h:154:9: warning: division by zero is undefined [-Wdivision-by-zero]
     154 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:132:21: note: expanded from macro '_calc_vm_trans'
     132 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   1 warning and 5 errors generated.


vim +41 include/linux/kexec.h

dc009d92435f99 Eric W. Biederman  2005-06-25  39  
dc009d92435f99 Eric W. Biederman  2005-06-25  40  #ifndef KEXEC_SOURCE_MEMORY_LIMIT
dc009d92435f99 Eric W. Biederman  2005-06-25 @41  #error KEXEC_SOURCE_MEMORY_LIMIT not defined
dc009d92435f99 Eric W. Biederman  2005-06-25  42  #endif
dc009d92435f99 Eric W. Biederman  2005-06-25  43  
dc009d92435f99 Eric W. Biederman  2005-06-25  44  #ifndef KEXEC_DESTINATION_MEMORY_LIMIT
dc009d92435f99 Eric W. Biederman  2005-06-25 @45  #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
dc009d92435f99 Eric W. Biederman  2005-06-25  46  #endif
dc009d92435f99 Eric W. Biederman  2005-06-25  47  
dc009d92435f99 Eric W. Biederman  2005-06-25  48  #ifndef KEXEC_CONTROL_MEMORY_LIMIT
dc009d92435f99 Eric W. Biederman  2005-06-25 @49  #error KEXEC_CONTROL_MEMORY_LIMIT not defined
dc009d92435f99 Eric W. Biederman  2005-06-25  50  #endif
dc009d92435f99 Eric W. Biederman  2005-06-25  51  
7e01b5acd88b3f Martin Schwidefsky 2015-04-16  52  #ifndef KEXEC_CONTROL_MEMORY_GFP
dc5cccacf4272d Russell King       2016-08-02  53  #define KEXEC_CONTROL_MEMORY_GFP (GFP_KERNEL | __GFP_NORETRY)
7e01b5acd88b3f Martin Schwidefsky 2015-04-16  54  #endif
7e01b5acd88b3f Martin Schwidefsky 2015-04-16  55  
163f6876f5c3ff Huang Ying         2008-08-15  56  #ifndef KEXEC_CONTROL_PAGE_SIZE
163f6876f5c3ff Huang Ying         2008-08-15 @57  #error KEXEC_CONTROL_PAGE_SIZE not defined
dc009d92435f99 Eric W. Biederman  2005-06-25  58  #endif
dc009d92435f99 Eric W. Biederman  2005-06-25  59  
dc009d92435f99 Eric W. Biederman  2005-06-25  60  #ifndef KEXEC_ARCH
dc009d92435f99 Eric W. Biederman  2005-06-25 @61  #error KEXEC_ARCH not defined
dc009d92435f99 Eric W. Biederman  2005-06-25  62  #endif
dc009d92435f99 Eric W. Biederman  2005-06-25  63  

:::::: The code at line 41 was first introduced by commit
:::::: dc009d92435f99498cbc579ce76bf28e837e2c14 [PATCH] kexec: add kexec syscalls

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
