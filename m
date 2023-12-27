Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A046547;
	Wed, 27 Dec 2023 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CttHErUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703701329; x=1735237329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rDVYTWEIWSA67HUVQTkiz/UazIBd9aewW7y/PDa0uRw=;
  b=CttHErUHrWGNEgtgkUNFNI3Z+md2eFPoaNnYWMsdxfS0w9yfsg8M7Nys
   H/A/3tiyxq+qAxc+Q2URlCcEfNCOe6MF36jpTYtIaz+fSMUWjHvfM7ofn
   2qA1UtK1s56MpszAOlNgeVx8OvFcOWCZ3yMHW1QsMGVHu7DQ+A87qsxnJ
   JvX4ljS65P6UcSyf2WrVX2K7CktdAA0sAP6LG5MGN1QEznvZvdrteUFNc
   Aj+xx7KUoYTQM5ITC0H/YVBCbz2pRiMaJdnF81AkamQLJh6NlcZqX1rxP
   t0SmkLlawZaPk/XEX4pfWklCxH1Zwyl9OjfW82hhxmyK7okI02WFadkJy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="15140583"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="15140583"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 10:20:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="848740867"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="848740867"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2023 10:20:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIYVv-000Ff5-2Z;
	Wed, 27 Dec 2023 18:20:19 +0000
Date: Thu, 28 Dec 2023 02:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kaixuxiakx <60962168+kaixuxiakx@users.noreply.github.com>,
	Ethan Zhao <Haifeng.Zhao@intel.com>
Subject: include/linux/instrumentation.h:8:9: warning:
 'instrumentation_begin' macro redefined
Message-ID: <202312280215.fO0m0Mqh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 6d928aeddfbb696e0e6ba46c43e48b3007bde5c6 compiler.h: Move instrumentation_begin()/end() to new <linux/instrumentation.h> header
date:   2 years, 4 months ago
config: x86_64-randconfig-004-20231228 (https://download.01.org/0day-ci/archive/20231228/202312280215.fO0m0Mqh-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312280215.fO0m0Mqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312280215.fO0m0Mqh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:13:
   In file included from include/linux/uuid.h:12:
   In file included from include/linux/string.h:20:
   In file included from arch/x86/include/asm/string.h:5:
   In file included from arch/x86/include/asm/string_64.h:6:
   In file included from include/linux/jump_label.h:250:
   In file included from include/linux/bug.h:5:
   In file included from arch/x86/include/asm/bug.h:6:
>> include/linux/instrumentation.h:8:9: warning: 'instrumentation_begin' macro redefined [-Wmacro-redefined]
       8 | #define instrumentation_begin() ({                                      \
         |         ^
   include/linux/compiler.h:139:9: note: previous definition is here
     139 | #define instrumentation_begin() ({                                      \
         |         ^
   1 warning generated.
   In file included from kernel/bounds.c:10:
   In file included from include/linux/page-flags.h:10:
   In file included from include/linux/bug.h:5:
   In file included from arch/x86/include/asm/bug.h:84:
   In file included from include/asm-generic/bug.h:5:
>> include/linux/compiler.h:139:9: warning: 'instrumentation_begin' macro redefined [-Wmacro-redefined]
     139 | #define instrumentation_begin() ({                                      \
         |         ^
   include/linux/instrumentation.h:8:9: note: previous definition is here
       8 | #define instrumentation_begin() ({                                      \
         |         ^
   1 warning generated.
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/bug.h:5:
   In file included from arch/x86/include/asm/bug.h:6:
>> include/linux/instrumentation.h:8:9: warning: 'instrumentation_begin' macro redefined [-Wmacro-redefined]
       8 | #define instrumentation_begin() ({                                      \
         |         ^
   include/linux/compiler.h:139:9: note: previous definition is here
     139 | #define instrumentation_begin() ({                                      \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
   In file included from include/linux/mm_types.h:10:
   include/linux/rbtree.h:84:2: error: implicit declaration of function 'rcu_dereference_sparse' [-Werror,-Wimplicit-function-declaration]
      84 |         rcu_assign_pointer(*rb_link, node);
         |         ^
   include/linux/rcupdate.h:379:2: note: expanded from macro 'rcu_assign_pointer'
     379 |         rcu_dereference_sparse(p, __rcu); \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
   In file included from include/linux/mm_types.h:10:
   include/linux/rbtree.h:84:2: error: expected expression
   include/linux/rcupdate.h:379:33: note: expanded from macro 'rcu_assign_pointer'
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
   In file included from include/linux/mm_types.h:10:
   include/linux/rbtree.h:84:2: error: expected expression
   include/linux/rcupdate.h:380:33: note: expanded from macro 'rcu_assign_pointer'
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:136:
   In file included from include/linux/kasan.h:15:
   In file included from arch/x86/include/asm/pgtable.h:26:
   In file included from arch/x86/include/asm/fpu/xstate.h:5:
   In file included from include/linux/uaccess.h:5:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   include/linux/rculist.h:75:2: error: implicit declaration of function 'rcu_dereference_sparse' [-Werror,-Wimplicit-function-declaration]
      75 |         rcu_assign_pointer(list_next_rcu(prev), new);
         |         ^
   include/linux/rcupdate.h:379:2: note: expanded from macro 'rcu_assign_pointer'
     379 |         rcu_dereference_sparse(p, __rcu); \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:136:
   In file included from include/linux/kasan.h:15:
   In file included from arch/x86/include/asm/pgtable.h:26:
   In file included from arch/x86/include/asm/fpu/xstate.h:5:
   In file included from include/linux/uaccess.h:5:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   include/linux/rculist.h:75:2: error: expected expression
   include/linux/rcupdate.h:379:33: note: expanded from macro 'rcu_assign_pointer'
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:136:
   In file included from include/linux/kasan.h:15:
   In file included from arch/x86/include/asm/pgtable.h:26:
   In file included from arch/x86/include/asm/fpu/xstate.h:5:
   In file included from include/linux/uaccess.h:5:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   include/linux/rculist.h:75:2: error: expected expression
   include/linux/rcupdate.h:380:33: note: expanded from macro 'rcu_assign_pointer'
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:136:
   In file included from include/linux/kasan.h:15:
   In file included from arch/x86/include/asm/pgtable.h:26:
   In file included from arch/x86/include/asm/fpu/xstate.h:5:
   In file included from include/linux/uaccess.h:5:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   include/linux/rculist.h:193:2: error: implicit declaration of function 'rcu_dereference_sparse' [-Werror,-Wimplicit-function-declaration]
     193 |         rcu_assign_pointer(list_next_rcu(new->prev), new);
         |         ^
   include/linux/rcupdate.h:379:2: note: expanded from macro 'rcu_assign_pointer'
     379 |         rcu_dereference_sparse(p, __rcu); \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:136:
   In file included from include/linux/kasan.h:15:
   In file included from arch/x86/include/asm/pgtable.h:26:
   In file included from arch/x86/include/asm/fpu/xstate.h:5:
   In file included from include/linux/uaccess.h:5:


vim +/instrumentation_begin +8 include/linux/instrumentation.h

     6	
     7	/* Begin/end of an instrumentation safe region */
   > 8	#define instrumentation_begin() ({					\
     9		asm volatile("%c0: nop\n\t"						\
    10			     ".pushsection .discard.instr_begin\n\t"		\
    11			     ".long %c0b - .\n\t"				\
    12			     ".popsection\n\t" : : "i" (__COUNTER__));		\
    13	})
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
