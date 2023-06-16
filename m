Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742526AA4;
	Fri, 16 Jun 2023 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686953518; x=1718489518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FUSZ9horQxc+bj5NVltTkcgs/MiR9Xn7J5udMibuLIo=;
  b=Ssi0OoF4bjLPo19nDGODyMPcsTtAPMVepQKYnXACuE9VW4azm+pntl7x
   +YlyOvORkEelrlNDWc3kjoPmfsmW2XVq0iBhAO4JaL5lhkEFGH6TwT0fa
   hM8zkMXt11KwbpxdQrdDBtTt4iaU3zxxTnLJRM+QOU76k+5LDsC1nP0aQ
   rVtdi8jYhLKTtAODrdKHvkdZylEZ7/GYyOvxADZ6CXSBW8XkUcZEZ5FbD
   OOGeXEpp5R7ZVtNT4iacHGdRSbXQF1Qw2wWNUdtpQCjHmoyWBZVbLwjeF
   x8HjZCYAP8MlSpGI3yjw3vzPPPV5I/gKiqTkhsx+HCsqSl3fXphYB8kWl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="422979312"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="422979312"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 15:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="663335426"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="663335426"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Jun 2023 15:11:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAHff-0001rA-13;
	Fri, 16 Jun 2023 22:11:55 +0000
Date: Sat, 17 Jun 2023 06:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:x86/boot 13/18] arch/x86/mm/mem_encrypt.c:79:13: error:
 redefinition of 'mem_encrypt_init'
Message-ID: <202306170650.aCZUuxjD-lkp@intel.com>
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
commit: 439e17576eb47f26b78c5bbc72e344d4206d2327 [13/18] init, x86: Move mem_encrypt_init() into arch_cpu_finalize_init()
config: x86_64-randconfig-a005-20230616 (https://download.01.org/0day-ci/archive/20230617/202306170650.aCZUuxjD-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170650.aCZUuxjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306170650.aCZUuxjD-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/mem_encrypt.c:79:6: warning: attribute declaration must precede definition [-Wignored-attributes]
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
   arch/x86/mm/mem_encrypt.c:79:6: warning: attribute declaration must precede definition [-Wignored-attributes]
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
>> arch/x86/mm/mem_encrypt.c:79:13: error: redefinition of 'mem_encrypt_init'
   void __init mem_encrypt_init(void)
               ^
   arch/x86/include/asm/mem_encrypt.h:88:20: note: previous definition is here
   static inline void mem_encrypt_init(void) { }
                      ^
   2 warnings and 1 error generated.


vim +/mem_encrypt_init +79 arch/x86/mm/mem_encrypt.c

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
