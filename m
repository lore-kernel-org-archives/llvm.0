Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B8237F0E0;
	Thu, 22 Jan 2026 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072874; cv=none; b=YT027YdImA8VA0Z7KyoANd7wKKemCGVLGiQmsCJ9BbuU+vfsFtLzo0GS2L5Mk7JHY5LuI9PeLDS8Ee6QeRC9ciRf36YOZQ9rFrJC9XYyDjePgYq0iNJfdqvYSpWd1v3qQXKkx58n+qsaMln98R9U7uZfvwUvtYn+L0x0kP99rN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072874; c=relaxed/simple;
	bh=7xTqs/0dapIM6kDHYscGgK124LjU4lscLumCrFNgjog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GYAMt2w8Bd7Tmy6++F+SiRK7Yfa+3w3DLavDmDe+5RrNB16nAHigc6PICraKlaHIpVHC01A5HqBhebzLmmMUYZDPGjwCtdt5IN1GbxAiql3YXRFvz+VQovt+1FvjuTZ/b52INVSHW6t/3gbKkYU2zmDDW2KkdPDi9kHTP6vt844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLU0wJuz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLU0wJuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769072872; x=1800608872;
  h=date:from:to:cc:subject:message-id;
  bh=7xTqs/0dapIM6kDHYscGgK124LjU4lscLumCrFNgjog=;
  b=RLU0wJuzU51KdEf3in1Vc7ugCndgtbYLpNdxsS/EpISG/eOHbPY880gV
   58R1bM7xOtWkJmHdaBZE3boL/+LowAWZbPniFYNFCSoVfNtBxXZlULMjo
   op42AtxKVOcIzpyW2/1U1HU6LimTkmpWbROJey/Td+4B1MfzAilB1LeZ8
   3Akw718sY/bhzxs04C5zqUXGb7eTRdaz93kU0OITdHCVRlJOwW2P0hIc6
   YKjqMnxaBSTj8MfXU7Ij3s3Tz8TgcliIJbl+PH3jPNnw7B+12k6Pqiwyg
   YiWF1/+pvRO7nqUzLjGlXnJSN2KxhoGNfXcNfDs7IloalH1H4XVfr/4q0
   g==;
X-CSE-ConnectionGUID: rZWVjndcTYql45ag3PshhA==
X-CSE-MsgGUID: VxKOBmX2RuGVjrVVDQmauQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70211806"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="70211806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 01:07:52 -0800
X-CSE-ConnectionGUID: W29UfsZCRBudxydA/YkF3g==
X-CSE-MsgGUID: 6226kKlSTX2NWDBcAsYdqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="205807069"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jan 2026 01:07:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viqfL-00000000Seg-0Qub;
	Thu, 22 Jan 2026 09:07:47 +0000
Date: Thu, 22 Jan 2026 17:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/tdx_huge_sept 79/79]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:2551:13: warning: result of
 comparison of constant 0 with expression of type 'bool' (aka '_Bool') is
 always false
Message-ID: <202601221714.XGRGaA0T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   491d01f5d2ac33f4da9d302ff18cdcb57c0d967b
commit: 491d01f5d2ac33f4da9d302ff18cdcb57c0d967b [79/79] KVM: x86: Split cross-boundary mirror leafs for KVM_SET_MEMORY_ATTRIBUTES
config: x86_64-buildonly-randconfig-006-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221714.XGRGaA0T-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221714.XGRGaA0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221714.XGRGaA0T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2551:13: warning: result of comparison of constant 0 with expression of type 'bool' (aka '_Bool') is always false [-Wtautological-constant-compare]
    2551 |         return ret < 0 ? ret : 0;
         |                ~~~ ^ ~
   1 warning generated.


vim +2551 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  2499	
  2500	static __always_inline int kvm_handle_gfn_range(struct kvm *kvm,
  2501							struct kvm_mmu_notifier_range *range)
  2502	{
  2503		struct kvm_gfn_range gfn_range;
  2504		struct kvm_memory_slot *slot;
  2505		struct kvm_memslots *slots;
  2506		struct kvm_memslot_iter iter;
  2507		bool found_memslot = false;
  2508		bool ret = false;
  2509		int i;
  2510	
  2511		gfn_range.arg = range->arg;
  2512		gfn_range.may_block = range->may_block;
  2513	
  2514		/*
  2515		 * If/when KVM supports more attributes beyond private .vs shared, this
  2516		 * _could_ set KVM_FILTER_{SHARED,PRIVATE} appropriately if the entire target
  2517		 * range already has the desired private vs. shared state (it's unclear
  2518		 * if that is a net win).  For now, KVM reaches this point if and only
  2519		 * if the private flag is being toggled, i.e. all mappings are in play.
  2520		 */
  2521	
  2522		for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
  2523			slots = __kvm_memslots(kvm, i);
  2524	
  2525			kvm_for_each_memslot_in_gfn_range(&iter, slots, range->start, range->end) {
  2526				slot = iter.slot;
  2527				gfn_range.slot = slot;
  2528	
  2529				gfn_range.start = max(range->start, slot->base_gfn);
  2530				gfn_range.end = min(range->end, slot->base_gfn + slot->npages);
  2531				if (gfn_range.start >= gfn_range.end)
  2532					continue;
  2533	
  2534				if (!found_memslot) {
  2535					found_memslot = true;
  2536					KVM_MMU_LOCK(kvm);
  2537					if (!IS_KVM_NULL_FN(range->on_lock))
  2538						range->on_lock(kvm);
  2539				}
  2540	
  2541				ret |= range->handler(kvm, &gfn_range);
  2542			}
  2543		}
  2544	
  2545		if (range->flush_on_ret && ret)
  2546			kvm_flush_remote_tlbs(kvm);
  2547	
  2548		if (found_memslot)
  2549			KVM_MMU_UNLOCK(kvm);
  2550	
> 2551		return ret < 0 ? ret : 0;
  2552	}
  2553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
