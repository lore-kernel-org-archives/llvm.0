Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820461B914;
	Fri, 16 Jun 2023 19:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686942295; x=1718478295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1TfEzcUbojNghVVm/GpXjNXv2VKSOR6h4VURdK/67E=;
  b=JC6Xpu40ZcZiGst8nZ8Zyr6stFB7p1Nunupb+wGzOrAojiyPtOtD8KKa
   T96irG+hqbeyPZcV56W4BFZNXUqQa2avbpWwIdVHgXgQ1OF4VxOrMgDGk
   7pvVq5+5lAWn7UTSR+dfaKj0yGc/38wE68jbjqRVr0UQntrjhxPZrVs8r
   LffN6gvQg+s8ORH/yCgdTYO6Hg//UwVQb7kein6Nhe9hT59tRthbiN4nZ
   i2jj402S5ljUxKZLEVbClTvth2VYWFEbdb2rYtGpD03A4zW8mk/DLEQKy
   dRtnhAOZ4eW0EElPDkmmJUmMgZLOTjNdX9oX1wkfVbqxlEbQIT2V0O64P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="425228756"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="425228756"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="825844107"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="825844107"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2023 12:04:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAEkc-0001jI-13;
	Fri, 16 Jun 2023 19:04:50 +0000
Date: Sat, 17 Jun 2023 03:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:x86/boot 13/17] arch/x86/mm/mem_encrypt.c:79:6: warning:
 attribute declaration must precede definition
Message-ID: <202306170247.eQtCJPE8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
head:   b81fac906a8f9e682e513ddd95697ec7a20878d4
commit: 439e17576eb47f26b78c5bbc72e344d4206d2327 [13/17] init, x86: Move mem_encrypt_init() into arch_cpu_finalize_init()
config: x86_64-randconfig-a005-20230616 (https://download.01.org/0day-ci/archive/20230617/202306170247.eQtCJPE8-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170247.eQtCJPE8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306170247.eQtCJPE8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/mem_encrypt.c:79:6: warning: attribute declaration must precede definition [-Wignored-attributes]
   void __init mem_encrypt_init(void)
        ^
   include/linux/init.h:52:17: note: expanded from macro '__init'
   #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
                           ^
   include/linux/compiler_attributes.h:303:56: note: expanded from macro '__section'
   #define __section(section)              __attribute__((__section__(section)))
                                                          ^
   arch/x86/include/asm/mem_encrypt.h:88:20: note: previous definition is here
   static inline void mem_encrypt_init(void) { }
                      ^
>> arch/x86/mm/mem_encrypt.c:79:6: warning: attribute declaration must precede definition [-Wignored-attributes]
   void __init mem_encrypt_init(void)
        ^
   include/linux/init.h:52:41: note: expanded from macro '__init'
   #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
                                                   ^
   include/linux/compiler_types.h:104:34: note: expanded from macro '__cold'
   #define __cold                          __attribute__((__cold__))
                                                          ^
   arch/x86/include/asm/mem_encrypt.h:88:20: note: previous definition is here
   static inline void mem_encrypt_init(void) { }
                      ^
   arch/x86/mm/mem_encrypt.c:79:13: error: redefinition of 'mem_encrypt_init'
   void __init mem_encrypt_init(void)
               ^
   arch/x86/include/asm/mem_encrypt.h:88:20: note: previous definition is here
   static inline void mem_encrypt_init(void) { }
                      ^
   2 warnings and 1 error generated.


vim +79 arch/x86/mm/mem_encrypt.c

20f07a044a76ae Kirill A. Shutemov 2021-12-06  77  
20f07a044a76ae Kirill A. Shutemov 2021-12-06  78  /* Architecture __weak replacement functions */
20f07a044a76ae Kirill A. Shutemov 2021-12-06 @79  void __init mem_encrypt_init(void)

:::::: The code at line 79 was first introduced by commit
:::::: 20f07a044a76aebaaa0603038857229b5c460d69 x86/sev: Move common memory encryption code to mem_encrypt.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
