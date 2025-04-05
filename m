Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A56C8E0;
	Sat,  5 Apr 2025 03:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743822219; cv=none; b=TWbIkk/sHwyR9rWZVrqCnukQ3rCXodAuBkfwL/mCuFeyWAVoX3dl7TpjjmPZAQPawRutgAY0+YxL5bH+KGXoeGpyO7OWnmZipLnajxdTgCfMxcxRn5q/MVAEOmQPfd/kCdAyoHUIH2ABLSHNIWtu8L9F2958sVz5D/JTMRTcwOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743822219; c=relaxed/simple;
	bh=B1FugkSXkXDMy0C2GMXHIWlZMX8/S12S2oc6CTuFG+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ObXy3SC6EQ45WUJxpDwVAO/NHQY7BYhcSiwmrTX4IQGs1mqwFKKg4+Ivjy6x93q/06adPusGT/M5HyuqTtnTzy1NoVcTTYT2xZqek/l2eFMwemaj1UkpVrbEPTUjuVqhJgfK3MCTBhE/dZJP6oDXD+YE4O0asXrgu0KMQ8Pul00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ya1WrvbD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ya1WrvbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743822214; x=1775358214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1FugkSXkXDMy0C2GMXHIWlZMX8/S12S2oc6CTuFG+Y=;
  b=Ya1WrvbDQovq9I85WljYXURgbErPkY/e6H4at2OvJi7KcE5+Vk0XSU2y
   Ar0ZmZ97MPrdaH8vx8ECe/7Afals8hduG9n5hWqLjf2Mbf7d3o2kxz7zo
   vUrAb5gW/Ijknagb4u42esGNpybs47HSpYvrCH/u3KgcOp6bKxsTbY1qG
   hZbtMNtQZhGL0qJZkUYAtYahIvH2E5jXSwWbj3DiWPaAYwkdT70IvBHzV
   2KBeDmfc8WQJfeXI7rCZv8GcrKaTjObdjsuz6ytTYI9Fma/bEPT5qbMbH
   A4Dzr9DBMkS/Ew8tZd/Sg3Ye2+qWcRz+1794043nSsQHHgVUNsdrtG6ql
   g==;
X-CSE-ConnectionGUID: zg32octVSn67582dCUOUYA==
X-CSE-MsgGUID: t7Z/N/j+Qr6SwB5YfyrGfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45161174"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="45161174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 20:03:34 -0700
X-CSE-ConnectionGUID: 3vDXZsKUTIGY0MxM88jXPg==
X-CSE-MsgGUID: h/coWtMGTZ6ryeoEB071/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="127223619"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Apr 2025 20:03:33 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0tog-0001lL-1P;
	Sat, 05 Apr 2025 03:03:30 +0000
Date: Sat, 5 Apr 2025 11:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 6/7] lib/klist.c:197:3: error: unknown
 directive
Message-ID: <202504051040.3ld1HgNc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   d9200f830505ef0415720e0bd90fe183e62222c5
commit: 31eabb43d04f7a788da11c3c06cb00ace7e6bd2e [6/7] x86/alternative: Improve code generation readability
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250405/202504051040.3ld1HgNc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051040.3ld1HgNc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051040.3ld1HgNc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/klist.c:197:3: error: unknown directive
     197 |                 mb();
         |                 ^
   arch/x86/um/asm/barrier.h:15:14: note: expanded from macro 'mb'
      15 | #define mb()    alternative("lock; addl $0,0(%%esp)", "mfence", X86_FEATURE_XMM2)
         |                 ^
   arch/x86/include/asm/alternative.h:228:22: note: expanded from macro 'alternative'
     228 |         asm_inline volatile(ALTERNATIVE(oldinstr, newinstr, ft_flags) : : : "memory")
         |                             ^
   arch/x86/include/asm/alternative.h:193:2: note: expanded from macro 'ALTERNATIVE'
     193 |         __ALTERNATIVE("\t" oldinstr, newinstr, ft_flags) "\n"
         |         ^
   arch/x86/include/asm/alternative.h:175:2: note: expanded from macro '__ALTERNATIVE'
     175 |         OLDINSTR(oldinstr)                                              \
         |         ^
   arch/x86/include/asm/alternative.h:157:3: note: expanded from macro 'OLDINSTR'
     157 |         "773: "
         |          ^
   <inline asm>:6:131: note: instantiated into assembly here
       6 | 773: .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte ( 0*32+26);  .byte 773b-771b;  .byte 775f-774f; .popsection.pushsection .altinstr_replacement, "ax"
         |                                                                                                                                   ^
   1 error generated.


vim +197 lib/klist.c

210272a28465a7 Matthew Wilcox 2008-10-16  182  
9a19fea4361606 Patrick Mochel 2005-03-21  183  static void klist_release(struct kref *kref)
9a19fea4361606 Patrick Mochel 2005-03-21  184  {
210272a28465a7 Matthew Wilcox 2008-10-16  185  	struct klist_waiter *waiter, *tmp;
9a19fea4361606 Patrick Mochel 2005-03-21  186  	struct klist_node *n = container_of(kref, struct klist_node, n_ref);
7e9f4b2d3e21e8 Alan Stern     2006-09-18  187  
a1ed5b0cffe4b1 Tejun Heo      2008-08-25  188  	WARN_ON(!knode_dead(n));
9a19fea4361606 Patrick Mochel 2005-03-21  189  	list_del(&n->n_node);
210272a28465a7 Matthew Wilcox 2008-10-16  190  	spin_lock(&klist_remove_lock);
210272a28465a7 Matthew Wilcox 2008-10-16  191  	list_for_each_entry_safe(waiter, tmp, &klist_remove_waiters, list) {
210272a28465a7 Matthew Wilcox 2008-10-16  192  		if (waiter->node != n)
210272a28465a7 Matthew Wilcox 2008-10-16  193  			continue;
210272a28465a7 Matthew Wilcox 2008-10-16  194  
ac5a2962b02f57 wang, biao     2013-05-16  195  		list_del(&waiter->list);
210272a28465a7 Matthew Wilcox 2008-10-16  196  		waiter->woken = 1;
210272a28465a7 Matthew Wilcox 2008-10-16 @197  		mb();
210272a28465a7 Matthew Wilcox 2008-10-16  198  		wake_up_process(waiter->process);
210272a28465a7 Matthew Wilcox 2008-10-16  199  	}
210272a28465a7 Matthew Wilcox 2008-10-16  200  	spin_unlock(&klist_remove_lock);
a1ed5b0cffe4b1 Tejun Heo      2008-08-25  201  	knode_set_klist(n, NULL);
9a19fea4361606 Patrick Mochel 2005-03-21  202  }
9a19fea4361606 Patrick Mochel 2005-03-21  203  

:::::: The code at line 197 was first introduced by commit
:::::: 210272a28465a7a31bcd580d2f9529f924965aa5 driver core: Remove completion from struct klist_node

:::::: TO: Matthew Wilcox <matthew@wil.cx>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
