Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5C30F54C;
	Wed, 22 Oct 2025 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124127; cv=none; b=D4sessFUCcTM0Hez2wsqvd+PfRgUhRCQbgDElRzhlN4rid7f1fH7AXxa9qRXb41ArdSvBQa/X3I12Lj4tESQ1DiC2A3JAS706ddeHr0jSDSLVJaq8X1x7utmg4IKBSwJiDSSzlwZPcUI9Qh2Mjgl3cqwjZPa6/F4aP+LAfx6fCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124127; c=relaxed/simple;
	bh=LCO0C96luvGKrKtvHFdcvTHWZXFH2iocHPWf7TaeFWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o3ZBM0eDqIfqTpn57kULhesyR4ASU/3Y3ou3iS3jZyY6+J3c6zKKMn0ClRAaFK+Vou75QbwKIHY6gruEo0wrVAI9Th7aitzCxQ2Mgqo7QWQPrxf/3io2i/MohjJaDr4ltEDocmuZo2/M9JRnjCAmhPF1LzLqQkdlZoLEEFnF0VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4vnpRHJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4vnpRHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761124126; x=1792660126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LCO0C96luvGKrKtvHFdcvTHWZXFH2iocHPWf7TaeFWM=;
  b=g4vnpRHJhHPxelCEkbgsleril56BkITDBQf9LKx+94aaJV9G0yEfRlRO
   rBN0uXOmyA6zHol3QUNQ3sojyQbngO8lUtY0HWgTSMgzMqJ4Xjpdt+FKR
   WQSE55a0tq4f+gp8RnT4Ru31ioTVjlQhEzbCbbrEntNOuZfs/04T/PSmz
   6LRFrFyZUsCgAKe9zjtX+o9jKrSscmj5vZBkMtSUE+VTP1BTuUjN4oV6b
   DSXS0kpCn8jvLTVT+M1auhhvsoRPBdwIzq/ZGFglTi2nJsHsKv4rPc0+n
   aib8c8ZxCQ3qWZf9yGhBk7jM2GgyCG3ZFWs24vdAfXe0+NorRQuqM84lM
   w==;
X-CSE-ConnectionGUID: eJxGj5eiRjORy8FOVfq1tA==
X-CSE-MsgGUID: tVghfwiUQqmqPVltmpLGAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63361338"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63361338"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 02:08:45 -0700
X-CSE-ConnectionGUID: bcjkD15CTvqVqodpLHMdXA==
X-CSE-MsgGUID: /lJIO8KIQ8Goy0vOXfXsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183031605"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2025 02:08:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBUpk-000CAz-2a;
	Wed, 22 Oct 2025 09:08:40 +0000
Date: Wed, 22 Oct 2025 17:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [sean-jc:vmx/tdx_populate_cleanups 5/26]
 arch/x86/kvm/mmu/mmu.c:5021:26: error: no member named 'gmem' in 'struct
 kvm_memory_slot'
Message-ID: <202510221928.ikBXHGCf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/tdx_populate_cleanups
head:   7298dd9bb6d2003af41f75bf1839c8e298a32b13
commit: d9d7775e7dd7525e235db52a3ea99f1e41cdc72e [5/26] KVM: x86/mmu: Add dedicated API to map guest_memfd pfn into TDP MMU
config: i386-buildonly-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221928.ikBXHGCf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221928.ikBXHGCf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221928.ikBXHGCf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:5021:26: error: no member named 'gmem' in 'struct kvm_memory_slot'
    5021 |             WARN_ON_ONCE(!slot->gmem.file) ||
         |                           ~~~~  ^
   include/asm-generic/bug.h:184:41: note: expanded from macro 'WARN_ON_ONCE'
     184 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                         ^~~~~~~~~
   include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:5022:37: error: no member named 'gmem' in 'struct kvm_memory_slot'
    5022 |             WARN_ON_ONCE(!file_count(slot->gmem.file)))
         |                                      ~~~~  ^
   include/linux/fs.h:1270:39: note: expanded from macro 'file_count'
    1270 | #define file_count(f)   file_ref_read(&(f)->f_ref)
         |                                         ^
   include/asm-generic/bug.h:184:41: note: expanded from macro 'WARN_ON_ONCE'
     184 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                         ^~~~~~~~~
   include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:5025:40: error: no member named 'gmem' in 'struct kvm_memory_slot'
    5025 |         lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
         |                                         ~~~~  ^
   include/linux/lockdep.h:285:33: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                                        ^
   include/linux/lockdep.h:252:47: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                        ^~~~
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                                       ^~~~
   include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:5025:79: error: expected ';' after do/while statement
    5025 |         lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
         |                                                                                      ^
         |                                                                                      ;
   4 errors generated.


vim +5021 arch/x86/kvm/mmu/mmu.c

  5016	
  5017	static void kvm_assert_gmem_invalidate_lock_held(struct kvm_memory_slot *slot)
  5018	{
  5019	#ifdef CONFIG_PROVE_LOCKING
  5020		if (WARN_ON_ONCE(!kvm_slot_has_gmem(slot)) ||
> 5021		    WARN_ON_ONCE(!slot->gmem.file) ||
  5022		    WARN_ON_ONCE(!file_count(slot->gmem.file)))
  5023			return;
  5024	
> 5025		lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
  5026	#endif
  5027	}
  5028	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
