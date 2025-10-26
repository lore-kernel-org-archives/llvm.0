Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B92E18C02E;
	Sun, 26 Oct 2025 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761479326; cv=none; b=bha33BGEXGTHFHZfLXvhdx90lUbw2SGdSvBJVsYSxIJ/ftEDQgE/X6Zvb/mEdyeqpVHWg3uQ4+GjK4JuPaCvQeXZhZWO/mx2Cx17Y2cCtGMTr0l/7fNc3bS3wTmbnOXk2TdDBxPf/5hgWqsCQQf5aNU8+k64qUuzPcHRYUSoX4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761479326; c=relaxed/simple;
	bh=bPokUJNaWwgJrXoqX6TIhW/y5j9hKAWraBg2ZCuMPFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rkw1hNc02o5Fub1/e2i16VSPZRx7B1bVE+GjV8BfLuH3VT8impPvp7PlX+7QqA3tY2SPdOTwmAeihEmk6IJSJr/yLKP6QOCFJplJcppwARX485bBn0hU+Cz83Wvm5lUgbZrvKcvSwiDgil/RFKukGwYs8GvGDfrIcR0c17W7mc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEQjKC8y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEQjKC8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761479324; x=1793015324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPokUJNaWwgJrXoqX6TIhW/y5j9hKAWraBg2ZCuMPFg=;
  b=AEQjKC8yhn3enEe6Ftjr3fszxXRGMStNU6URNQSp0q7tvjCdlVwpVtiK
   oIiloLvjLibnHDQLKGp6AEgZoIvJC6cnkvztGwwgkAOnCpfdpIZDZ6IlP
   jlFBLlv7+1YJKHiSTtVWn85A9pmkrMTbHwucVHCQQNA4aEGftZ4MJLQw1
   CfQkMYsUboF+e8VHUYdYuBA0G5KODMSsb2lOE2qV+V65BoWRDU/NmMkWt
   oyHna2nz9Coy9WagobqsSAHH3hI7xTWWIsBJZ6gIk7flqOCz88zz1aGu3
   Da0Ak71nJVntl/rV824tB249h3lsMC2TPM0UMBDOg4a26EYroaORnkfwl
   g==;
X-CSE-ConnectionGUID: rEh1Axw9Q52dOiMHRhtnyw==
X-CSE-MsgGUID: gOOLpkLuTBOJ/d5ZScaBDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75028021"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="75028021"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 04:48:43 -0700
X-CSE-ConnectionGUID: lBBX9JpaTf20Xz1iLe/sqQ==
X-CSE-MsgGUID: AKe5EqlnQLOdEGruko0omg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="188859990"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Oct 2025 04:48:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCzEl-000G5l-1m;
	Sun, 26 Oct 2025 11:48:39 +0000
Date: Sun, 26 Oct 2025 19:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [sean-jc:vmx/tdx_populate_cleanups 5/28]
 arch/x86/kvm/mmu/mmu.c:5026:33: error: incompatible pointer types passing
 'struct file **' to parameter of type 'const struct file *'; remove &
Message-ID: <202510261903.dDW3ZMtf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/tdx_populate_cleanups
head:   3953e46cd4d0caddb7962096b0c1b55da11dee41
commit: 0af292fb1de0ccf09271d5fa752cdaf67f958055 [5/28] KVM: x86/mmu: Add dedicated API to map guest_memfd pfn into TDP MMU
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251026/202510261903.dDW3ZMtf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261903.dDW3ZMtf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261903.dDW3ZMtf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:5026:33: error: incompatible pointer types passing 'struct file **' to parameter of type 'const struct file *'; remove & [-Werror,-Wincompatible-pointer-types]
    5026 |         lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:33: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                                        ^
   include/linux/lockdep.h:252:47: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                        ^~~~
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                                       ^~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/fs.h:1302:59: note: passing argument to parameter 'f' here
    1302 | static inline struct inode *file_inode(const struct file *f)
         |                                                           ^
>> arch/x86/kvm/mmu/mmu.c:5026:2: error: member reference type 'struct rw_semaphore' is not a pointer; did you mean to use '.'?
    5026 |         lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:52: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:5026:2: error: cannot take the address of an rvalue of type 'struct lockdep_map'
    5026 |         lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:45: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:5026:79: error: expected ';' after do/while statement
    5026 |         lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
         |                                                                                      ^
         |                                                                                      ;
   4 errors generated.


vim +5026 arch/x86/kvm/mmu/mmu.c

  5016	
  5017	#ifdef CONFIG_KVM_GUEST_MEMFD
  5018	static void kvm_assert_gmem_invalidate_lock_held(struct kvm_memory_slot *slot)
  5019	{
  5020	#ifdef CONFIG_PROVE_LOCKING
  5021		if (WARN_ON_ONCE(!kvm_slot_has_gmem(slot)) ||
  5022		    WARN_ON_ONCE(!slot->gmem.file) ||
  5023		    WARN_ON_ONCE(!file_count(slot->gmem.file)))
  5024			return;
  5025	
> 5026		lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
  5027	#endif
  5028	}
  5029	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
