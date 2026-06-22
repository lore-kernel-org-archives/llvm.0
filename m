Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110A43B42CA;
	Mon, 22 Jun 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135669; cv=none; b=kwePZI+6EfukfS5NBF4awVR+eUAVNYDaPN+vfxxT67yEc07bi+XTecURHlEgJ6Qg1eLWY5AcLBOzpOx86/rlG7NKO99WkdfY2zAnnI0twvfwRQfL0DMdgicWTmZ142nxk8oRR9xDnbGo3Zb81U2h7yTFuGM4NgV/q3D+xbO51QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135669; c=relaxed/simple;
	bh=2N3RgQVJsVw+mqRytQVFh7mZ+E9KUlbExJZB7bnjzjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FEnfw9gSYAK70IpSXtFlEFhDEj4L3Z7afeAc6BnvND53Xd1KbCbZYfy2rolGBW+R1mBCr2nESpJv9oisPKrhiRpx8bTXaACUh4AeAfsSVCb1azznJLLSQXm2qDhoueNj3eKOX7bHQym77w8CEWWagFyhdjTUz3MqzTUYBorNVPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMvkruje; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMvkruje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782135668; x=1813671668;
  h=date:from:to:cc:subject:message-id;
  bh=2N3RgQVJsVw+mqRytQVFh7mZ+E9KUlbExJZB7bnjzjI=;
  b=GMvkrujepAbaYVY+/vCxtp7VqUvuA0S8M8uqwOGYojwOEN/fx5zA2Bs7
   AdtfDqTa8IFZv7OaOm7JL1+F6K22tvhQJxh+Bcm9llx6Ss2YNz9uCiaCD
   Gw6LQF7GCuUA3KAngJkpnFPjpjrSeRD9Ry93y0BOE1dDTM32UP3FtyjnI
   huRC/eXhv6zSdaN/knNk1yDop2Q/WAZ9Wo9E6JzE0HrWWyIqaHspbMRY8
   65OqCF/WeDqmAtYof9kLVu/0W/3PijeBCVGFcgiHLvI3CrwESp8WjIph5
   D4y9Xm81cXfMxn5/EEUpaO5vhBmb2ot1Sl/aSbGQOcME5q0lGecBeJVpo
   g==;
X-CSE-ConnectionGUID: bU9OOsHkREmZB8JqGxLzHA==
X-CSE-MsgGUID: mSLDImKJTKaIEiEq64pgmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86707660"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86707660"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 06:41:05 -0700
X-CSE-ConnectionGUID: YehD/vCHSnaPgx7MhFK7uA==
X-CSE-MsgGUID: X6OGDUQyQT+AlDmrdnUdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="287341146"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Jun 2026 06:41:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbetZ-000000001Fv-06rg;
	Mon, 22 Jun 2026 13:41:01 +0000
Date: Mon, 22 Jun 2026 21:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/dynamic_memslot_hashtable 7/7]
 arch/x86/kvm/x86.h:63:15: error: static assertion failed due to requirement
 '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 2) == (1024 * (1 + 1) *
 (1 + 1))': SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 +
 IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CON...
Message-ID: <202606222146.HB6mqh7k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/dynamic_memslot_hashtable
head:   e6c91f158091040c1e79a7dc9b8401235ae066b5
commit: e6c91f158091040c1e79a7dc9b8401235ae066b5 [7/7] KVM: Dynamically allocate memslot's id=>slot hash table
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260622/202606222146.HB6mqh7k-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222146.HB6mqh7k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222146.HB6mqh7k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/x86.c:21:
   In file included from arch/x86/kvm/irq.h:19:
   In file included from arch/x86/kvm/lapic.h:11:
   In file included from arch/x86/kvm/hyperv.h:25:
>> arch/x86/kvm/x86.h:63:15: error: static assertion failed due to requirement '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 2) == (1024 * (1 + 1) * (1 + 1))': SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      64 |               (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM))));
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.h:60:2: note: expanded from macro 'SIZE_OF_MEMSLOTS_HASHTABLE'
      60 |         (sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
         |         ^
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/kvm/x86.h:63:42: note: expression evaluates to '32 == 4096'
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
   In file included from arch/x86/kvm/x86.c:44:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from arch/x86/kvm/emulate.c:31:
>> arch/x86/kvm/x86.h:63:15: error: static assertion failed due to requirement '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 2) == (1024 * (1 + 1) * (1 + 1))': SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      64 |               (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM))));
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.h:60:2: note: expanded from macro 'SIZE_OF_MEMSLOTS_HASHTABLE'
      60 |         (sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
         |         ^
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/kvm/x86.h:63:42: note: expression evaluates to '32 == 4096'
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
--
   In file included from arch/x86/kvm/vmx/vmx.c:56:
   In file included from arch/x86/kvm/vmx/capabilities.h:7:
   In file included from arch/x86/kvm/vmx/../lapic.h:11:
   In file included from arch/x86/kvm/vmx/../hyperv.h:25:
>> arch/x86/kvm/vmx/../x86.h:63:15: error: static assertion failed due to requirement '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 2) == (1024 * (1 + 1) * (1 + 1))': SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      64 |               (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM))));
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/../x86.h:60:2: note: expanded from macro 'SIZE_OF_MEMSLOTS_HASHTABLE'
      60 |         (sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
         |         ^
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/kvm/vmx/../x86.h:63:42: note: expression evaluates to '32 == 4096'
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


vim +63 arch/x86/kvm/x86.h

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
