Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F662F3E;
	Sat, 10 May 2025 21:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746912508; cv=none; b=Q9n5bP0kZHXbMHo68edgLD6Wm7ukqi4BSJDDUu3RJzdMB5EwObF1WtqzYcDN4oHZonLDL87AY55XgRvw9gg34vwmOJhuNLV8jRmgH0bnJ9v/PwvZ5i5HYUTZHh9d+WrzRdLuhxxZFoH18TIaQjehLX35awKO2M3Rwau4nsvTA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746912508; c=relaxed/simple;
	bh=EqttRVPWiilLuRAgRd1dkjrwGVYsgB0TXvKRO8aoVNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o7mfxH5atAAIS8FhIpG+cTB1H/8/vHdf018+ifPS+cBfaSBsjPos8Je0Lo4Q5SJxcYb17083r2W7mM5qEsEVvJ1SuHn6sbYZjGee0l4mORyfAzX9BOqLJsZ3XxS35g97CDmx1bi33X0zVC+Q3jE1DbPEq1WLc+qRQn0WX7gJ3cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUdr6gOx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUdr6gOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746912507; x=1778448507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EqttRVPWiilLuRAgRd1dkjrwGVYsgB0TXvKRO8aoVNs=;
  b=EUdr6gOxATvPcEGlmV8lpNjd30htn6MW+ugL7PVg8FZwEwhni43IB34z
   HATCA8vkGOxcTqiC9RqnEtiDraq+uiP03N0shYnUwwF60g2O9mKiJX1Tc
   jfPtLgEfsyY3Upk8U+gTJyUi/bGLgIxetfwn75bvH1ocQ+Xh/C/zY7gVm
   qLt+NlGvvPRoUsRd63HOiss8vg08Xe/E9e9Y1cF3EHWRzgOHNki+NEHFA
   HDbKLz9rEuhz5Sxl7/aNWQ2kiumKnqlEAKwHNl6xTQvCCuA1Vv3YmhJ23
   LBD+GNO5ocS0TQ2HYI+7Bmw9PNibKxuwkFDkuUFaf78zQ+V081gt3rETq
   w==;
X-CSE-ConnectionGUID: F7ruPoKDT3eO1TIfa4htlg==
X-CSE-MsgGUID: npWGW1zOTYa+4oLfZf1E5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48422866"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48422866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 14:28:26 -0700
X-CSE-ConnectionGUID: T1IgCC3YTyaqTJ8COeyo1w==
X-CSE-MsgGUID: +/Uso9fJQFCrumJPJXnRYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="141928092"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 May 2025 14:28:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDrk6-000DOn-0k;
	Sat, 10 May 2025 21:28:22 +0000
Date: Sun, 11 May 2025 05:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/dynamic_mmu_page_hash 65/66] arch/x86/kvm/x86.h:61:15:
 error: static assertion failed due to requirement '(sizeof (((struct
 kvm_memslots *)0)->id_hash) * 2 * 1) == 2048 * (1 + 0)':
 SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM))
Message-ID: <202505110508.7KHGHZAA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/dynamic_mmu_page_hash
head:   d828b30b070f9e2007facb2a2cd6fe453d3dba1e
commit: 52f79fe55637526ff07ae355247de566ec036653 [65/66] KVM: x86: Use kvzalloc() to allocate VM struct
config: i386-randconfig-013-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110508.7KHGHZAA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110508.7KHGHZAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110508.7KHGHZAA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/mmu/mmu.c:19:
   In file included from arch/x86/kvm/irq.h:19:
   In file included from arch/x86/kvm/lapic.h:9:
   In file included from arch/x86/kvm/hyperv.h:25:
>> arch/x86/kvm/x86.h:61:15: error: static assertion failed due to requirement '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 1) == 2048 * (1 + 0)': SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM))
      61 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM)));
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.h:59:2: note: expanded from macro 'SIZE_OF_MEMSLOTS_HASHTABLE'
      59 |         (sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
         |         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/kvm/x86.h:61:42: note: expression evaluates to '1024 == 2048'
      61 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM)));
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.
--
   In file included from arch/x86/kvm/x86.c:21:
   In file included from arch/x86/kvm/irq.h:19:
   In file included from arch/x86/kvm/lapic.h:9:
   In file included from arch/x86/kvm/hyperv.h:25:
>> arch/x86/kvm/x86.h:61:15: error: static assertion failed due to requirement '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 1) == 2048 * (1 + 0)': SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM))
      61 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM)));
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.h:59:2: note: expanded from macro 'SIZE_OF_MEMSLOTS_HASHTABLE'
      59 |         (sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
         |         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/kvm/x86.h:61:42: note: expression evaluates to '1024 == 2048'
      61 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM)));
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   In file included from arch/x86/kvm/x86.c:44:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from arch/x86/kvm/vmx/hyperv_evmcs.c:7:
   In file included from arch/x86/kvm/vmx/hyperv_evmcs.h:11:
   In file included from arch/x86/kvm/vmx/capabilities.h:7:
   In file included from arch/x86/kvm/vmx/../lapic.h:9:
   In file included from arch/x86/kvm/vmx/../hyperv.h:25:
>> arch/x86/kvm/vmx/../x86.h:61:15: error: static assertion failed due to requirement '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 1) == 2048 * (1 + 0)': SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM))
      61 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM)));
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/../x86.h:59:2: note: expanded from macro 'SIZE_OF_MEMSLOTS_HASHTABLE'
      59 |         (sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
         |         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/kvm/vmx/../x86.h:61:42: note: expression evaluates to '1024 == 2048'
      61 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM)));
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.
--
   In file included from arch/x86/kvm/svm/hyperv.c:7:
   In file included from arch/x86/kvm/svm/hyperv.h:11:
   In file included from arch/x86/kvm/svm/../hyperv.h:25:
>> arch/x86/kvm/svm/../x86.h:61:15: error: static assertion failed due to requirement '(sizeof (((struct kvm_memslots *)0)->id_hash) * 2 * 1) == 2048 * (1 + 0)': SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM))
      61 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM)));
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/../x86.h:59:2: note: expanded from macro 'SIZE_OF_MEMSLOTS_HASHTABLE'
      59 |         (sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
         |         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/kvm/svm/../x86.h:61:42: note: expression evaluates to '1024 == 2048'
      61 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM)));
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +61 arch/x86/kvm/x86.h

    57	
    58	#define SIZE_OF_MEMSLOTS_HASHTABLE \
    59		(sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
    60	
  > 61	static_assert(SIZE_OF_MEMSLOTS_HASHTABLE == 2048 * (1 + IS_ENABLED(CONFIG_KVM_SMM)));
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
