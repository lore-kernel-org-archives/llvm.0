Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B381C5D57;
	Sat, 14 Feb 2026 00:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771028577; cv=none; b=RR1lIBazOlNnA7ZsE44bzC2Bh8aPYq/h+GrEiKoo5NEXhyKZWm/xLsnYlJ2mbZTMhobkwGQUfowfgVj/HfuZOYj9nixiSG2ck9uU4GVmYHWzqGsA6c7LjSmCVwM7S1YqK8vsfyIa33jQpAbSJ2RucC0z0+pYZcDad1r/cwBkq70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771028577; c=relaxed/simple;
	bh=6x8d9PqZ+a0hJoDwGYCjnuPJ/as9exif8b51lAJ2gxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=duS7/8ZfBjcnucPdYiGKcCnNVHa/ODlskLwKPWrlLfR5ChMzC0Fe+KYvqR0v1cj8WPjD7fPRq5i3ngEgbCUQDcIiu2R+tujLZWeBrwQDN77I8k+oj8MUqAfbOzsune5ubBCiS8Rqm3HCo4Y2jjORETDKqz0F96xFydU01SZQNlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbR/M2m+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbR/M2m+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771028575; x=1802564575;
  h=date:from:to:cc:subject:message-id;
  bh=6x8d9PqZ+a0hJoDwGYCjnuPJ/as9exif8b51lAJ2gxE=;
  b=FbR/M2m+CBvXqk9Gc0xHmp2uX85xMX6bbt6j2G9zpsFlqQX9PQaWss+l
   RdF7qfDmUGae5Chwv5cQAJ3zdeM+qtQlAx4kUm/Ayn3p4WePnT9LFl3K8
   uLfaq1VaKLlJQFpJfWF8BnQdhce2Ez1CjEFvWDleQkGv3BNAdqHPWI5DI
   9jg+Xen5qgsxdkOkUIh+NmNWi6INApBwVRO76VkWHXu8TvimbvWRywnvf
   xo8R2VDlalw9XTlKNOKrlTE81E1IujP1+T//cj+Zo5YHEl8C9G4qerKO8
   rO8HZ2Vfw+jZt7sLXCAQUjAoVwaa34kYTAdYliw7uRzgCOsE1vrtUVBec
   Q==;
X-CSE-ConnectionGUID: 0C1hCaSjQ6C1Vm9d+0x5MA==
X-CSE-MsgGUID: 1WeZi0ziT06Y5AgYidM8qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72310448"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72310448"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 16:22:54 -0800
X-CSE-ConnectionGUID: fbvnhimVQzWDZW08w5REhw==
X-CSE-MsgGUID: ccSKI7yRT7+EhNv8YQDZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="211719738"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 16:22:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr3Qx-00000000vxC-136m;
	Sat, 14 Feb 2026 00:22:51 +0000
Date: Sat, 14 Feb 2026 08:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 80/84]
 arch/mips/include/asm/dma.h:165:1: warning: spinlock 'dma_spin_lock' is still
 held at the end of function
Message-ID: <202602140803.EIUsW6LY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   d4418ddb34578f2e04647ee7cc4f35c86975bffc
commit: 56a98354252fe670d1fffba44fe4c453bdb8c47e [80/84] kbuild: clang: Enable thread-safety checking for all kernel headers
config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20260214/202602140803.EIUsW6LY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140803.EIUsW6LY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140803.EIUsW6LY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:91:
   In file included from kernel/sched/sched.h:46:
   In file included from include/linux/memblock.h:13:
>> arch/mips/include/asm/dma.h:165:1: warning: spinlock 'dma_spin_lock' is still held at the end of function [-Wthread-safety-analysis]
     165 | }
         | ^
   arch/mips/include/asm/dma.h:163:2: note: spinlock acquired here
     163 |         spin_lock_irqsave(&dma_spin_lock, flags);
         |         ^
   include/linux/spinlock.h:378:35: note: expanded from macro 'spin_lock_irqsave'
     378 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-context-analysis.h:361:23: note: expanded from macro '__acquire'
     361 | #define __acquire(x)            __acquire_ctx_lock(x)
         |                                 ^
   In file included from kernel/sched/core.c:91:
   In file included from kernel/sched/sched.h:46:
   In file included from include/linux/memblock.h:13:
>> arch/mips/include/asm/dma.h:169:2: warning: releasing spinlock 'dma_spin_lock' that was not held [-Wthread-safety-analysis]
     169 |         spin_unlock_irqrestore(&dma_spin_lock, flags);
         |         ^
   2 warnings generated.


vim +/dma_spin_lock +165 arch/mips/include/asm/dma.h

^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  159  
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  160  static __inline__ unsigned long claim_dma_lock(void)
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  161  {
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  162  	unsigned long flags;
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  163  	spin_lock_irqsave(&dma_spin_lock, flags);
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  164  	return flags;
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16 @165  }
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  166  
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  167  static __inline__ void release_dma_lock(unsigned long flags)
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  168  {
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16 @169  	spin_unlock_irqrestore(&dma_spin_lock, flags);
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  170  }
^1da177e4c3f41 include/asm-mips/dma.h Linus Torvalds 2005-04-16  171  

:::::: The code at line 165 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
