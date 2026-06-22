Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE483ADBA1;
	Mon, 22 Jun 2026 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135667; cv=none; b=Kb681pZh6UCp8Nr1xrvbVmbKUwMOjYObjRSwqCkRFXAFzPsR819KpYgDD5oNYYKkukxVt9wAYugZZJBIfYkAZEmn7E15KSY76aYJE3wKuSK5Zob4QTfM5FRH7iDaQDpJbUrhLVj38x2AP6hG/RokhDytEkZfvP6X+4m93dzvWcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135667; c=relaxed/simple;
	bh=twrzsripxzrqEAzLvQMQdIRLDPkGLCjWAJIOl1RTKXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iLLspZsxCjHLuuYQ6hfc8Um7XtQ2VjgaRxnRo/Vy1W2eGWVqb0HFZ6s5radLF24xNW0Br6CraqdLSHqdGycFm3RrzeGizuhBusZoICP3IJJkIThTrq6osxuGN30g/LcICya+qkR9zCQBny0yzFWNHMOb/UCY2yxbUP+CVvf6LRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NABo7hjD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NABo7hjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782135666; x=1813671666;
  h=date:from:to:cc:subject:message-id;
  bh=twrzsripxzrqEAzLvQMQdIRLDPkGLCjWAJIOl1RTKXg=;
  b=NABo7hjDqzjyQxygBq1iC3JBP6Yoqhaued5yho6+zVneQWhq5XW299U1
   e7anteLdGGhjFoqVtM/lX42pGUKnuh8ufvhMvqf5pDJaFUVBJFF3rK28l
   HMhn3VrRoJDROL0lSUQoEKJbp2csAw5y55YQYFm1+eBHjwsMBd3Yetkm6
   JpypfkhVFvkXV0DOlUWrgLhkCDGQu2fO134VDyWgJeY+xyKWmVxMpgyR/
   ufLv+3amgYpjbY7/86tDEafd1qZpg8ZHwjf688Lig7XvB852MCqACFX2G
   3Zr1eKpXpAqT8Tdjz1eQQ12K3N9vsAh9EeDgDl3ulvai28npb6/zMTmlS
   Q==;
X-CSE-ConnectionGUID: LZFjXmbzS36fMoZf2S+jOQ==
X-CSE-MsgGUID: Rw3ngmrnTTOpz8IzUPw7+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86707658"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86707658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 06:41:05 -0700
X-CSE-ConnectionGUID: TmuDUmEHQ26Ce9IvWvMdEQ==
X-CSE-MsgGUID: DJ6bmeBpS6aWe4qT7oSyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="287341143"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Jun 2026 06:41:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbetZ-000000001Ft-01Xd;
	Mon, 22 Jun 2026 13:41:01 +0000
Date: Mon, 22 Jun 2026 21:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/dynamic_memslot_hashtable 7/7]
 arch/x86/kvm/svm/../x86.h:63:15: error: static assertion failed due to
 requirement '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 1) == (1024
 * (1 + 1) * (1 + 0))': SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 +
 IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENAB...
Message-ID: <202606222127.xp8KJ1Bg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/dynamic_memslot_hashtable
head:   e6c91f158091040c1e79a7dc9b8401235ae066b5
commit: e6c91f158091040c1e79a7dc9b8401235ae066b5 [7/7] KVM: Dynamically allocate memslot's id=>slot hash table
config: x86_64-buildonly-randconfig-001-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222127.xp8KJ1Bg-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222127.xp8KJ1Bg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222127.xp8KJ1Bg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:25:
>> arch/x86/kvm/svm/../x86.h:63:15: error: static assertion failed due to requirement '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 1) == (1024 * (1 + 1) * (1 + 0))': SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      64 |               (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM))));
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/../x86.h:60:2: note: expanded from macro 'SIZE_OF_MEMSLOTS_HASHTABLE'
      60 |         (sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
         |         ^
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/kvm/svm/../x86.h:63:42: note: expression evaluates to '16 == 2048'
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
      64 |               (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM))));
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +63 arch/x86/kvm/svm/../x86.h

65297341d8e15b Uros Bizjak         2021-08-09  58  
ac777fbf064f81 Sean Christopherson 2025-05-22  59  #define SIZE_OF_MEMSLOTS_HASHTABLE \
ac777fbf064f81 Sean Christopherson 2025-05-22  60  	(sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
ac777fbf064f81 Sean Christopherson 2025-05-22  61  
ac777fbf064f81 Sean Christopherson 2025-05-22  62  /* Sanity check the size of the memslot hash tables. */
ac777fbf064f81 Sean Christopherson 2025-05-22 @63  static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
ac777fbf064f81 Sean Christopherson 2025-05-22  64  	      (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM))));
ac777fbf064f81 Sean Christopherson 2025-05-22  65  

:::::: The code at line 63 was first introduced by commit
:::::: ac777fbf064f81b30e21f6d7023b6d0342a3fe1b KVM: x86: Use kvzalloc() to allocate VM struct

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
