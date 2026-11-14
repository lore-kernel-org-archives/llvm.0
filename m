Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630555;
	b=dQeMDNYye4Q3Yr9yf1qn+1T6Ayma+HHNvioyvOK4XHRX4JszZxIQ27wuwx9GeL2D1U85
	 PI+e1Grvju2W1ct/14/A91zjkEKlUGuwcHv7d4Xh5uIHIWjMMt1XHjX475Da9b4sfcUeh
	 7staM2uwVorKqHMb2u++2p53UiXEMNMpQMrJB/k0tIbJPP0t1BEjMig+dDxR3zSA893Bl
	 qiIvUftdHPh19txdSFuG4idkpW+NkEDerXCIyyXFjZzBPT/BVhCDR+B0btXH6leALJgZi
	 UWucIwQ1syQcu8RtuKSzbncGAUOg1nZL2yZRSmwJr6TFpvg2zzRaibHWmQs7XR7kkbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630555;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6Acm+Rhd/CEUDlOJ4jq6yZN41ineq8/enPco0K/H6EA=;
	b=mmPgBCJ2csFFVsfUuOoLCQFsd1ZPzQBvUI1ArRyJ5tBRO3srOhiabPF5wjg2Ee7iJtX5
	 fPSZ+WRSOwxcxjk8HRvQj9sxZmEuaG0Q7LMaPE5V9G90rKURFUV8OqIH76eFRz1/+2+dS
	 SniXciUKAPxWeCXQOSTGZSFF+2vKqFGEu0fcYIEujyi3qwRMw0HCYUwV8/4WOiQKwOk65
	 tucQTOHLpXBs+Ua445iEuWL78hs5xoW2JwCYb3J/u9KXKQSIxWnHyHnebjUvadbhyRd3f
	 6VUDdfsWUaD5w40wrzX9C0IA5Zx21RQJ8EuFuRqk9xjv8jtiA3TreS510j0O+wjoq9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kb0SJgdM;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A92606A32E;
	Sat, 14 Nov 2026 04:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A92606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kb0SJgdM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794630553; x=1826166553;
  h=date:from:to:cc:subject:message-id;
  bh=i1v0WfSHxszlD89GCa8HXvo9GJ90cCJlyxZR8+J4ajU=;
  b=Kb0SJgdMYoUCXVKqz54HlZ77AlcLwbi6lbSuA1N6EE696uUdjOK9iWgl
   2Aq0PvZgEKx8PD/n1gEfxZ66FBPwkVnGSDfiAF8l80vO2zgZoy6+IS5/X
   wbobsSqregOQl21kYw5O0NOpGHI2ci2MsZcccHrj2UvSj/iz+1GHURiAk
   5sS/Ss6vgNRN/Tg/4WfhLs9cRazM7rMp5rD5YH+jydaLLHZWQUobeY70o
   O+LlYn+dmsQs+BRuybKWNuA7QL4ujaJejtKpeZD5vcBFEV7wfNVMd4zN2
   fKFERkff9bkD9uosQCYUXvyew6x+QWEzg5u8rXL5V/KGhsROpMhMTKpJl
   g==;
X-CSE-ConnectionGUID: +yqXCGXvRe6Ivnhr0iiZ/g==
X-CSE-MsgGUID: z1W1BK2kQie6DgyS0MygIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3351056"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3351056"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 20:29:12 -0800
X-CSE-ConnectionGUID: rgtdGTTtSx2c/OjA1CeoAA==
X-CSE-MsgGUID: mdxhctsUQ1SumLDk5FgK8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8928913"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2026 20:29:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS5O0-000000014rf-414Z;
	Sat, 14 Nov 2026 04:29:08 +0000
Date: Sat, 14 Nov 2026 12:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 166/438]
 arch/arm/include/asm/dma.h:47:1: warning: raw_spinlock 'dma_spin_lock' is
 still held at the end of function
Message-ID: <202611141131.QrGNpihR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   8ea0e62cf4d68a895e3152c92a5f6ead6d5c9554
commit: 168b4aaec8dbafcb498d7d9d8db6157600743709 [166/438] kbuild: clang: Enable thread-safety checking for arch/ header files
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20261114/202611141131.QrGNpihR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1b1fed44d3dcca649a9877915d57c3357a98124e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141131.QrGNpihR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141131.QrGNpihR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/bdev.c:31:
   In file included from block/blk.h:9:
   In file included from include/linux/memblock.h:13:
>> arch/arm/include/asm/dma.h:47:1: warning: raw_spinlock 'dma_spin_lock' is still held at the end of function [-Wthread-safety-analysis]
      47 | }
         | ^
   arch/arm/include/asm/dma.h:45:2: note: raw_spinlock acquired here
      45 |         raw_spin_lock_irqsave(&dma_spin_lock, flags);
         |         ^
   include/linux/spinlock.h:268:3: note: expanded from macro 'raw_spin_lock_irqsave'
     268 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                 ^
   include/linux/spinlock_api_up.h:82:45: note: expanded from macro '_raw_spin_lock_irqsave'
      82 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                 ^
   include/linux/spinlock_api_up.h:43:31: note: expanded from macro '__LOCK_IRQSAVE'
      43 |   do { local_irq_save(flags); __LOCK(lock, ##__VA_ARGS__); } while (0)
         |                               ^
   include/linux/spinlock_api_up.h:34:27: note: expanded from macro '__LOCK'
      34 |   do { preempt_disable(); ___LOCK_##__VA_ARGS__(lock); } while (0)
         |                           ^
   include/linux/spinlock_api_up.h:28:8: note: expanded from macro '___LOCK_'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-context-analysis.h:375:23: note: expanded from macro '__acquire'
     375 | #define __acquire(x)            __acquire_ctx_lock(x)
         |                                 ^
   In file included from block/bdev.c:31:
   In file included from block/blk.h:9:
   In file included from include/linux/memblock.h:13:
>> arch/arm/include/asm/dma.h:51:2: warning: releasing raw_spinlock 'dma_spin_lock' that was not held [-Wthread-safety-analysis]
      51 |         raw_spin_unlock_irqrestore(&dma_spin_lock, flags);
         |         ^
   include/linux/spinlock.h:286:3: note: expanded from macro 'raw_spin_unlock_irqrestore'
     286 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/spinlock_api_up.h:153:6: note: expanded from macro '_raw_spin_unlock_irqrestore'
     153 |                                         __UNLOCK_IRQRESTORE(lock, flags)
         |                                         ^
   include/linux/spinlock_api_up.h:65:34: note: expanded from macro '__UNLOCK_IRQRESTORE'
      65 |   do { local_irq_restore(flags); __UNLOCK(lock, ##__VA_ARGS__); } while (0)
         |                                  ^
   include/linux/spinlock_api_up.h:55:26: note: expanded from macro '__UNLOCK'
      55 |   do { preempt_enable(); ___UNLOCK_##__VA_ARGS__(lock); } while (0)
         |                          ^
   include/linux/spinlock_api_up.h:49:8: note: expanded from macro '___UNLOCK_'
      49 |   do { __release(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-context-analysis.h:383:23: note: expanded from macro '__release'
     383 | #define __release(x)            __release_ctx_lock(x)
         |                                 ^
   2 warnings generated.


vim +/dma_spin_lock +47 arch/arm/include/asm/dma.h

^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  41  
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  42  static inline unsigned long claim_dma_lock(void)
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  43  {
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  44  	unsigned long flags;
bd31b85960a7fcb arch/arm/include/asm/dma.h Thomas Gleixner 2009-07-03  45  	raw_spin_lock_irqsave(&dma_spin_lock, flags);
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  46  	return flags;
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16 @47  }
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  48  
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  49  static inline void release_dma_lock(unsigned long flags)
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  50  {
bd31b85960a7fcb arch/arm/include/asm/dma.h Thomas Gleixner 2009-07-03 @51  	raw_spin_unlock_irqrestore(&dma_spin_lock, flags);
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  52  }
^1da177e4c3f415 include/asm-arm/dma.h      Linus Torvalds  2005-04-16  53  

:::::: The code at line 47 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
