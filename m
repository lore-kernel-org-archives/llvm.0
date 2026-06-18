Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406B02DEA9D;
	Thu, 18 Jun 2026 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812228; cv=none; b=oGhKQX0QL9dbj3ZlP4jt7mVLG7lrnf7uVtC7TPWIH3Y29i2Yzw0HhBcLJmTExPV4pgqYCNDaH0I+Ulu5cdWRPOxRzjm5a58nDJPhgBcjDfL/aham9W/6vKNukr2HVKwB8kexAgrfEkbATxD9HL3XHsHcS9GPgpCtcwMQ+ufBoGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812228; c=relaxed/simple;
	bh=NBq8OmNOqvpBzS5jLW8OBdtDoV0vwk+sBfH4tQ3Ze0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k0N+dhNhfG2pYgDQinPF1+tn8ry86uXNLLqLuzZcdKbjUISpB7n3DMxXknDKehuRj5ZBBv4sVBMNiI9pnu3Zm0F2vTreM3FgOSO4W0Cyf25XI1qBWdAL43bPXUQr+MSXnGER6jdzqcnoi4et20eYFQ0Sj8EMadGQhP6iZ5G5v7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6otDZfl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6otDZfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781812227; x=1813348227;
  h=date:from:to:cc:subject:message-id;
  bh=NBq8OmNOqvpBzS5jLW8OBdtDoV0vwk+sBfH4tQ3Ze0U=;
  b=P6otDZflOIqh3DOd+j7BqqxHEVzz49qVRYeP1IOdPWf0/bemX+ZpL7WH
   nTOkYiIw8Q5jk13qgELiymV/2to+35gkaHgSP4ylX5aU7EZxB2nJJFwjT
   YoQ74alKxzcdxZsTArqlK+c2vDqzd/Xuh/rZpgwqRGm662iOPnajovbKO
   9uVosJ+G6J2XZoweKw+huHLKW4YeqhU1PwItQWzb78BJSw8aK9JNqZ+eX
   zt1r7k9cJl+NJl7/dU2/BGVwEeRK4btlJT33XiTwPd9TF8GTew5MPr1rA
   BXMIhvkt7XK5qFyPVLhbRn9VJCZYtKl7692ddKbYH+inop0weR6iE61Hz
   Q==;
X-CSE-ConnectionGUID: MYzKsIxyRpqqz+A1T6160A==
X-CSE-MsgGUID: 0Mxt8HhwSVOkMMPZuxqV3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="93310677"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="93310677"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 12:50:26 -0700
X-CSE-ConnectionGUID: KHtBg6j5SHqnPtf0dYhYIA==
X-CSE-MsgGUID: OFrFo4MFTXWXewPeZgTkqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="278633177"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Jun 2026 12:50:25 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waIko-000000005aT-3CNn;
	Thu, 18 Jun 2026 19:50:22 +0000
Date: Thu, 18 Jun 2026 21:49:59 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/dynamic_memslot_hashtable 7/7]
 arch/x86/kvm/x86.h:63:15: error: static assertion failed due to requirement
 '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 2) == (1024 * (1 + 1) *
 (1 + 1))': SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 +
 IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CON...
Message-ID: <202606182120.CIfEEL8K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/dynamic_memslot_hashtable
head:   e6c91f158091040c1e79a7dc9b8401235ae066b5
commit: e6c91f158091040c1e79a7dc9b8401235ae066b5 [7/7] KVM: Dynamically allocate memslot's id=>slot hash table
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260618/202606182120.CIfEEL8K-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606182120.CIfEEL8K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606182120.CIfEEL8K-lkp@intel.com/

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
