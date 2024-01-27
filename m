Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC639944D;
	Sat, 27 Jan 2024 01:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706320323; cv=none; b=l3WcYhMxe/cbkVA4hnd4LPBx9YXuBcn8jMU1rjj9SBYQfeVuRoyB2l3TiOLri61qvFgI1n6+2FmDiNnbtqriPLUWuw07dNHoPVfbVrA36zlv96nqGCrYE66lbKVGaOiTxRXINlSJMMx5WxIILCTfk+ZczedKlc2ZsyGiht2jen0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706320323; c=relaxed/simple;
	bh=4FmnSpbhjn1RyT2Gu8ZUb+1Q/YGDDisAdIbsYbN4V00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvWCM0lpM9eKaeLfOtxgoJfG13xhckV8KG7ZC0F3+J0tj+IjkJkTxSdacrG6ThvayqfBafgRQMo4UaKGbl2bxcINE+o1jxY1NHdEi0K2qIMb6766wMBvMiq4JnLHsFpJMuXgoTHYgu2b1YvGvkUdP+n7AuWD6mXIJVhDiuekb/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RliKPGV9; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RliKPGV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706320320; x=1737856320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4FmnSpbhjn1RyT2Gu8ZUb+1Q/YGDDisAdIbsYbN4V00=;
  b=RliKPGV9i7twvgqF4AHowTQtjBjdWaGIIo8UEPuHSMfS4qCzsIbMQqvJ
   uqRCuGRKg4Yuk6C7SjI0Pi9IC2INCQ/DGTjTiSl4lF6/mdVIKCcuNcZio
   uHuyH/9DqdDBK8b00KeKVYlkAhr0iotq/TONNaOQz3P+pv1wBjbxvcYbO
   IrN7yUxY6DZ26fcvmS+7K2g4QYUNtV7fcN3sgEr0HqFwPr1HwPgEbKpNB
   PfgqTCWKQIIiRcF/Z6boly3pFEbLv/ogWQPUbEF0FiTycIFMNi409NoZC
   /6V5qWvGAAqRl2AWGAM811UPjMBzPBxOo1tMG3WDJTObJQRor5IIEIHz/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="433786337"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="433786337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 17:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="960374051"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="960374051"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2024 17:51:58 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTXrQ-0001YM-0B;
	Sat, 27 Jan 2024 01:51:56 +0000
Date: Sat, 27 Jan 2024 09:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:master 1/1] arch/x86/kernel/ptrace.c:245:2: error: call to
 '__compiletime_assert_364' declared with 'error' attribute: BUILD_BUG_ON
 failed: offsetof(struct pt_regs, r15) != 0
Message-ID: <202401270930.gM767yEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git master
head:   80997c8b66fd8d73a96cd681a473bacaf75b7d98
commit: 80997c8b66fd8d73a96cd681a473bacaf75b7d98 [1/1] x86/ptrace: move down unused registers
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240127/202401270930.gM767yEo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270930.gM767yEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270930.gM767yEo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/ptrace.c:245:2: error: call to '__compiletime_assert_364' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
     245 |         BUILD_BUG_ON(offsetof(struct pt_regs, r15) != 0);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:147:1: note: expanded from here
     147 | __compiletime_assert_364
         | ^
>> arch/x86/kernel/ptrace.c:245:2: error: call to '__compiletime_assert_364' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:147:1: note: expanded from here
     147 | __compiletime_assert_364
         | ^
>> arch/x86/kernel/ptrace.c:245:2: error: call to '__compiletime_assert_364' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:147:1: note: expanded from here
     147 | __compiletime_assert_364
         | ^
   3 errors generated.


vim +245 arch/x86/kernel/ptrace.c

2047b08be67b70 Roland McGrath 2008-01-30  242  
2047b08be67b70 Roland McGrath 2008-01-30  243  static unsigned long *pt_regs_access(struct pt_regs *regs, unsigned long offset)
2047b08be67b70 Roland McGrath 2008-01-30  244  {
2047b08be67b70 Roland McGrath 2008-01-30 @245  	BUILD_BUG_ON(offsetof(struct pt_regs, r15) != 0);
2047b08be67b70 Roland McGrath 2008-01-30  246  	return &regs->r15 + (offset / sizeof(regs->r15));
2047b08be67b70 Roland McGrath 2008-01-30  247  }
2047b08be67b70 Roland McGrath 2008-01-30  248  

:::::: The code at line 245 was first introduced by commit
:::::: 2047b08be67b70875d8765fc81d34ce28041bec3 x86: x86 ptrace getreg/putreg merge

:::::: TO: Roland McGrath <roland@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
