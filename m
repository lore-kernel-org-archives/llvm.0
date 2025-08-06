Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24401A08BC;
	Wed,  6 Aug 2025 02:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754445989; cv=none; b=Bt8C16yR4x9SBohhLOW8xi+4JHerGGnfR7aHgwcZ7Jo8ZgueJbn6P0tJpmrXNZgfx5Oz9VvG68AYwUbY+a+5jG03XA6/wEZ9QnGjmZ+zt292HRftYInLIY4HNEtbXmWLgjNzP8HSUGGvmOdN+7aNRXYAnk7sqMlL/16XvvjZl9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754445989; c=relaxed/simple;
	bh=doJHwaQJm3YDsPP8EXSxidBobEtgGTe9WX+woZYs2bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eV0BFw/NI/Iak9h23C07vpO8xjotmBnqLNyK7ppTGz5lKnMxFX4xuxB6XD1ZwrW3QWmTN9o9v4oEJGQ5A+jPsYbGJgbYLE5kXzjcHha0X8x1DU37TH2erZc2EfITu5//721t/gPzEnqHjIbXqnUnnYBE8E04TA4Gl7yb4pcLj+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAp4fVf0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAp4fVf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754445986; x=1785981986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=doJHwaQJm3YDsPP8EXSxidBobEtgGTe9WX+woZYs2bQ=;
  b=CAp4fVf0wTW6xrnMYviijKwcUfwaJnRBWnWxSFqZc0vjXSx3Pvna/qdX
   WOXHa2u765miwx19/qmJr0WyW8AFdhyEpKuKG5Fhq7LL25ayVC1hsMM4f
   vqcI/pxiZZCciP9i4JNV6b+3/eL7FTUSc+r4XqwLKId6XValXaXOp9Ly5
   6diLvCil1dVcnqdgpLEQ0vCf0JRpqHwFqf0J+tUgqCo2J57smKHkFSHJ0
   lxalKhzC0Tbcue22aKcfmXr68qS63OAxOGcjdVRqz4tP09hCrhyy/gona
   T627h/MoIbdGv+O/+NHvd2ygPqfh7KvcWo3a2zNtZXLI9KDBHMbQdy/T2
   Q==;
X-CSE-ConnectionGUID: FFxo1OYjQDeSc/kto6HdFA==
X-CSE-MsgGUID: 52cBw924S+SvjjsypuARoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56716444"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56716444"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 19:06:25 -0700
X-CSE-ConnectionGUID: /JI4ibeCSVqsP/BqhYuCaA==
X-CSE-MsgGUID: v/aF6a0UR1OgfVpdZBSolQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="195613640"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Aug 2025 19:06:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujTXp-0000v0-32;
	Wed, 06 Aug 2025 02:06:21 +0000
Date: Wed, 6 Aug 2025 10:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/invept_on_pcpus 5/5] arch/x86/kvm/vmx/vmx.c:3273:34:
 error: no member named 'cpu_flushed_mask' in 'struct kvm_mmu_page'
Message-ID: <202508060937.Uys2jdqo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/invept_on_pcpus
head:   ca798b2e1de4d0975ee808108c7514fe738f0898
commit: 86ddd2f5b10d582a4cfd94f4a911c9d0dfe7645b [5/5] KVM: VMX: Sketch in possible framework for eliding TLB flushes on pCPU migration
config: x86_64-buildonly-randconfig-005-20250806 (https://download.01.org/0day-ci/archive/20250806/202508060937.Uys2jdqo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060937.Uys2jdqo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060937.Uys2jdqo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:3273:34: error: no member named 'cpu_flushed_mask' in 'struct kvm_mmu_page'
    3273 |             test_and_set_bit(cpu, root->cpu_flushed_mask))
         |                                   ~~~~  ^
   1 error generated.
--
>> arch/x86/kvm/mmu/mmu.c:3858:3: error: use of undeclared identifier '__SCK__kvm_x86_alloc_root_cpu_mask'
    3858 |                 kvm_x86_call(alloc_root_cpu_mask)(root);
         |                 ^
   arch/x86/include/asm/kvm_host.h:1973:28: note: expanded from macro 'kvm_x86_call'
    1973 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^
   include/linux/static_call_types.h:90:27: note: expanded from macro 'static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^
   include/linux/static_call_types.h:57:2: note: expanded from macro '__static_call'
      57 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:43:1: note: expanded from here
      43 | __SCK__kvm_x86_alloc_root_cpu_mask
         | ^
>> arch/x86/kvm/mmu/mmu.c:3858:3: error: use of undeclared identifier '__SCT__kvm_x86_alloc_root_cpu_mask'
   arch/x86/include/asm/kvm_host.h:1973:28: note: expanded from macro 'kvm_x86_call'
    1973 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^
   include/linux/static_call_types.h:90:27: note: expanded from macro 'static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^
   include/linux/static_call_types.h:58:2: note: expanded from macro '__static_call'
      58 |         __raw_static_call(name);                                        \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:48:1: note: expanded from here
      48 | __SCT__kvm_x86_alloc_root_cpu_mask
         | ^
>> arch/x86/kvm/mmu/mmu.c:3858:37: error: use of undeclared identifier 'root'
    3858 |                 kvm_x86_call(alloc_root_cpu_mask)(root);
         |                                                   ^
   3 errors generated.
--
>> arch/x86/kvm/mmu/tdp_mmu.c:296:2: error: use of undeclared identifier '__SCK__kvm_x86_alloc_root_cpu_mask'
     296 |         kvm_x86_call(alloc_root_cpu_mask)(root);
         |         ^
   arch/x86/include/asm/kvm_host.h:1973:28: note: expanded from macro 'kvm_x86_call'
    1973 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^
   include/linux/static_call_types.h:90:27: note: expanded from macro 'static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^
   include/linux/static_call_types.h:57:2: note: expanded from macro '__static_call'
      57 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:18:1: note: expanded from here
      18 | __SCK__kvm_x86_alloc_root_cpu_mask
         | ^
>> arch/x86/kvm/mmu/tdp_mmu.c:296:2: error: use of undeclared identifier '__SCT__kvm_x86_alloc_root_cpu_mask'
   arch/x86/include/asm/kvm_host.h:1973:28: note: expanded from macro 'kvm_x86_call'
    1973 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^
   include/linux/static_call_types.h:90:27: note: expanded from macro 'static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^
   include/linux/static_call_types.h:58:2: note: expanded from macro '__static_call'
      58 |         __raw_static_call(name);                                        \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:23:1: note: expanded from here
      23 | __SCT__kvm_x86_alloc_root_cpu_mask
         | ^
   2 errors generated.


vim +3273 arch/x86/kvm/vmx/vmx.c

  3263	
  3264	static void __vmx_flush_ept_on_pcpu_migration(hpa_t root_hpa, int cpu)
  3265	{
  3266		struct kvm_mmu_page *root;
  3267	
  3268		if (!VALID_PAGE(root_hpa))
  3269			return;
  3270	
  3271		root = root_to_sp(root_hpa);
  3272		if (!WARN_ON_ONCE(!root) &&
> 3273		    test_and_set_bit(cpu, root->cpu_flushed_mask))
  3274			return;
  3275	
  3276		vmx_flush_tlb_ept_root(root_hpa);
  3277	}
  3278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
