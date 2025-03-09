Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E84A0C;
	Sun,  9 Mar 2025 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741520286; cv=none; b=fP7cyS9EMd4H6js6RnSVoHYcSo21gbdnYpm+MDRnZ0++1OMZLlHzMh17c1f9yeWuMJ5tJvDnhHBjGass08Y//9/Q02vukJOZAyiUV3eeJt9tX3Bz1rZ3YhZsQizYWlj2sX37Vppx1X6cM192h36N93lPbMcGoeLUk4rpcxz8eoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741520286; c=relaxed/simple;
	bh=jjHW1xVbJVe7Vu9Yib+s3kJLGOmCalV98kQ8V7HP3aY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DP+oBbbbKez6ag7FfdQf4NinwN6+abYI39DZrfWb6gVDF8Ovae5bJdEN8zmEVCRITP0yJOuv7ZX7eWmYus1N/Kse9XmL7BymKSUSpzexoonq0eHGoqrqZMtmXyocIK5R4eAhaj0KB5mJm8kApwHCgucPhDqRTQLaW4HbisCgx9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUjdX0Oo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUjdX0Oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741520284; x=1773056284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jjHW1xVbJVe7Vu9Yib+s3kJLGOmCalV98kQ8V7HP3aY=;
  b=fUjdX0OobQ2NXjLtyTxufkyP01XJW7mfH2tTPEgSDfwQnXRcwj4O7CWP
   26T7JUpKVV3hn6C06V9WAFlxJwMts2SYhFJxO2Z3MqqT6gv1KPgK1fg+A
   ayaWQBBPfa+ZYEs+nGQBSHRwTChXycWWzduyRQ54HS+RFaQ4YL3H1nWqU
   b7J4KDZpBhx2W5pVOVDPcyT3MwDuEQNInI7utty203LP47uukMbJbZz79
   D5r6XykPwqnhGitWyLqaO0Feg81og29hfSMmipmfJWErTtwbL2rlSpuhh
   nsf681cFF3zgPjsHNbl5iiKI1qnSDdl/omkls8zew5XqAvD37Z/R+Ykis
   Q==;
X-CSE-ConnectionGUID: Xdq0WxpgQ4ChQO0AyCNXGg==
X-CSE-MsgGUID: aAoj2bW+RFyoNDJer9875Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="30100060"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="30100060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 04:38:03 -0700
X-CSE-ConnectionGUID: S1dkXO7pQ4meau80IynLBg==
X-CSE-MsgGUID: yv0XtjKdToax/AgZ6SGRaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="119710153"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2025 04:38:01 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trEyl-00033K-1x;
	Sun, 09 Mar 2025 11:37:59 +0000
Date: Sun, 9 Mar 2025 19:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call 33/42]
 arch/x86/include/asm/xen/hypercall.h:270:9: error: expected ';' after asm
 statement
Message-ID: <202503091928.NPL4UWrM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call
head:   44613874d65bd54453e4f3c595459870cf4a8c9c
commit: 96d3258b6cb6c042087f728a1aff88caaf36cfe4 [33/42] x86/xen: Use asm_call() in __hypercall*()
config: x86_64-buildonly-randconfig-006-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091928.NPL4UWrM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091928.NPL4UWrM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091928.NPL4UWrM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/xen/features.c:14:
>> arch/x86/include/asm/xen/hypercall.h:270:9: error: expected ';' after asm statement
     270 |         return _hypercall4(int, mmu_update, req, count, success_count, domid);
         |                ^
   arch/x86/include/asm/xen/hypercall.h:207:25: note: expanded from macro '_hypercall4'
     207 |                  __HYPERCALL_CLOBBER4));                                \
         |                                       ^
   arch/x86/include/asm/xen/hypercall.h:277:9: error: expected ';' after asm statement
     277 |         return _hypercall4(int, mmuext_op, op, count, success_count, domid);
         |                ^
   arch/x86/include/asm/xen/hypercall.h:207:25: note: expanded from macro '_hypercall4'
     207 |                  __HYPERCALL_CLOBBER4));                                \
         |                                       ^
   2 errors generated.
--
   In file included from drivers/xen/gntdev.c:44:
   In file included from include/xen/events.h:12:
>> arch/x86/include/asm/xen/hypercall.h:270:9: error: expected ';' after asm statement
     270 |         return _hypercall4(int, mmu_update, req, count, success_count, domid);
         |                ^
   arch/x86/include/asm/xen/hypercall.h:207:25: note: expanded from macro '_hypercall4'
     207 |                  __HYPERCALL_CLOBBER4));                                \
         |                                       ^
   arch/x86/include/asm/xen/hypercall.h:277:9: error: expected ';' after asm statement
     277 |         return _hypercall4(int, mmuext_op, op, count, success_count, domid);
         |                ^
   arch/x86/include/asm/xen/hypercall.h:207:25: note: expanded from macro '_hypercall4'
     207 |                  __HYPERCALL_CLOBBER4));                                \
         |                                       ^
   In file included from drivers/xen/gntdev.c:49:
   In file included from drivers/xen/gntdev-common.h:15:
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
     160 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   drivers/xen/gntdev.c:600:46: warning: shift count >= width of type [-Wshift-count-overflow]
     600 |         dma_coerce_mask_and_coherent(priv->dma_dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   3 warnings and 2 errors generated.
--
   In file included from drivers/xen/mem-reservation.c:13:
>> arch/x86/include/asm/xen/hypercall.h:270:9: error: expected ';' after asm statement
     270 |         return _hypercall4(int, mmu_update, req, count, success_count, domid);
         |                ^
   arch/x86/include/asm/xen/hypercall.h:207:25: note: expanded from macro '_hypercall4'
     207 |                  __HYPERCALL_CLOBBER4));                                \
         |                                       ^
   arch/x86/include/asm/xen/hypercall.h:277:9: error: expected ';' after asm statement
     277 |         return _hypercall4(int, mmuext_op, op, count, success_count, domid);
         |                ^
   arch/x86/include/asm/xen/hypercall.h:207:25: note: expanded from macro '_hypercall4'
     207 |                  __HYPERCALL_CLOBBER4));                                \
         |                                       ^
   In file included from drivers/xen/mem-reservation.c:16:
   In file included from include/xen/mem-reservation.h:16:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/xen/mem-reservation.c:16:
   In file included from include/xen/mem-reservation.h:16:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/xen/mem-reservation.c:16:
   In file included from include/xen/mem-reservation.h:16:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/xen/mem-reservation.c:16:
   In file included from include/xen/mem-reservation.h:16:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/xen/mem-reservation.c:16:
   In file included from include/xen/mem-reservation.h:16:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/xen/mem-reservation.c:16:
   In file included from include/xen/mem-reservation.h:16:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/xen/mem-reservation.c:16:
   In file included from include/xen/mem-reservation.h:16:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here


vim +270 arch/x86/include/asm/xen/hypercall.h

a42089dd358a76 include/asm-i386/xen/hypercall.h Jeremy Fitzhardinge 2007-07-17  265  
a42089dd358a76 include/asm-i386/xen/hypercall.h Jeremy Fitzhardinge 2007-07-17  266  static inline int
a42089dd358a76 include/asm-i386/xen/hypercall.h Jeremy Fitzhardinge 2007-07-17  267  HYPERVISOR_mmu_update(struct mmu_update *req, int count,
a42089dd358a76 include/asm-i386/xen/hypercall.h Jeremy Fitzhardinge 2007-07-17  268  		      int *success_count, domid_t domid)
a42089dd358a76 include/asm-i386/xen/hypercall.h Jeremy Fitzhardinge 2007-07-17  269  {
a42089dd358a76 include/asm-i386/xen/hypercall.h Jeremy Fitzhardinge 2007-07-17 @270  	return _hypercall4(int, mmu_update, req, count, success_count, domid);
a42089dd358a76 include/asm-i386/xen/hypercall.h Jeremy Fitzhardinge 2007-07-17  271  }
a42089dd358a76 include/asm-i386/xen/hypercall.h Jeremy Fitzhardinge 2007-07-17  272  

:::::: The code at line 270 was first introduced by commit
:::::: a42089dd358a7673a0a23126589a9029e57c2049 xen: Add Xen interface header files

:::::: TO: Jeremy Fitzhardinge <jeremy@xensource.com>
:::::: CC: Jeremy Fitzhardinge <jeremy@goop.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
