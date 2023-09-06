Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721410954;
	Wed,  6 Sep 2023 20:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694030944; x=1725566944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4zbbsbp2M3N6rp1vVer/mw6eN3apx+wIABk1HQsL0yM=;
  b=aEzub9cSF/+EvP5fpUaYgMdYBjCMm3lshhr1SbwJCvA2hw0oLIo9vxUA
   MSeUZbVgVh+/8RYFWN8NfhB2yRsy6WOyKxtbi8ThP+xKLat1RLMOXjL0g
   fHHNtRMMyE+Dd1M48yX+edE2k5B8ZZfa7qUwq1tAVLUfm55IFV/1KBMWJ
   UVBYYcaPwNL7ZOAqyqJbRZRlIug8ygtTU95e8csBXMo3QScKNsjF84hHf
   KDt8evqDDDmG0Mrlklo4gZ9UCjB4efxomu/j5KEE2Jhl8HhL+sx6gSAnM
   GLmhbBg6Yw5PuuwIPePbV7WntzKHWPwlwSGHdpzyMsjbPqjhzkmPh3tMx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="463547342"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="463547342"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 13:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856600049"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="856600049"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 13:09:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdype-0000Yh-16;
	Wed, 06 Sep 2023 20:08:58 +0000
Date: Thu, 7 Sep 2023 04:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 7/9] include/linux/rcutree.h:119:25:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int
Message-ID: <202309070437.lfDlvu65-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   748148886e34351abeb1ba226107d86437bda722
commit: 38b6f851c89d305fdbbcf2ec53aa3033e1870678 [7/9] rcu: Conditionally build CPU-hotplug down related functions
config: mips-randconfig-r026-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070437.lfDlvu65-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070437.lfDlvu65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070437.lfDlvu65-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:15:
   In file included from include/linux/workqueue.h:16:
   In file included from include/linux/rcupdate.h:261:
   include/linux/rcutree.h:119:1: error: unknown type name 'define'
     119 | define rcutree_dead_cpu NULL
         | ^
>> include/linux/rcutree.h:119:25: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     119 | define rcutree_dead_cpu NULL
         |                         ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:15:
   In file included from include/linux/workqueue.h:16:
   In file included from include/linux/rcupdate.h:261:
>> include/linux/rcutree.h:119:25: error: expected ')'
   include/linux/stddef.h:8:23: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |                       ^
   include/linux/rcutree.h:119:25: note: to match this '('
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:15:
   In file included from include/linux/workqueue.h:16:
   In file included from include/linux/rcupdate.h:261:
>> include/linux/rcutree.h:120:1: error: expected function body after function declarator
     120 | define rcutree_dying_cpu NULL
         | ^
   4 errors generated.
   make[3]: *** [scripts/Makefile.build:116: arch/mips/kernel/asm-offsets.s] Error 1 shuffle=2807344482
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=2807344482
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2807344482
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2807344482
   make: Target 'prepare' not remade because of errors.


vim +/int +119 include/linux/rcutree.h

   113	
   114	#ifdef CONFIG_HOTPLUG_CPU
   115	int rcutree_dead_cpu(unsigned int cpu);
   116	int rcutree_dying_cpu(unsigned int cpu);
   117	int rcutree_offline_cpu(unsigned int cpu);
   118	#else
 > 119	define rcutree_dead_cpu NULL
 > 120	define rcutree_dying_cpu NULL
   121	define rcutree_offline_cpu NULL
   122	#endif
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
