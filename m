Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6394320CA0;
	Thu, 10 Aug 2023 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691680831; x=1723216831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tzEuRhWA729lr0yZfUge3c1qE9pFYtSDbgpvbuhxtBI=;
  b=Za9Cxgk+CJwyTFkp61HTzTRbH2AiIeHEZcv0OW3Rms3oQcMxTfZ1p20n
   82PcVWNtben14sUNi19+Ppp04Szi17qgeOP++fVL1I/Vl305AEttIEejc
   qkyFgEHAvEEA9HlUosP0ETLIVIzcWCrERzo4ef2YwW3M+8UnDk43oInpq
   CYyuQBjtB+WyUJRR+hWbViq7cBD6CRdBbQ0pBSTKpqXNTqul/Hee11ugL
   Di6b3MxuyhwAvHa9E6gqTK3mYY8bLm27QvPWrhne5AjZDsPnZz3fSNlLL
   Orh4JFrur5bwDP64uIx4rxyEn69QNPmN/eIM6saKaq3WLLIfcGbPZ7yOr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361568405"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="361568405"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 08:20:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="761813165"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="761813165"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Aug 2023 08:20:12 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU7SO-00074q-03;
	Thu, 10 Aug 2023 15:20:12 +0000
Date: Thu, 10 Aug 2023 23:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/5] KVM: Unmap pages only when it's indeed
 protected for NUMA migration
Message-ID: <202308102307.MQAoNjsq-lkp@intel.com>
References: <20230810090218.26244-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810090218.26244-1-yan.y.zhao@intel.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on mst-vhost/linux-next linus/master v6.5-rc5 next-20230809]
[cannot apply to akpm-mm/mm-everything kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhao/mm-mmu_notifier-introduce-a-new-mmu-notifier-flag-MMU_NOTIFIER_RANGE_NUMA/20230810-172955
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230810090218.26244-1-yan.y.zhao%40intel.com
patch subject: [RFC PATCH v2 5/5] KVM: Unmap pages only when it's indeed protected for NUMA migration
config: riscv-randconfig-r023-20230810 (https://download.01.org/0day-ci/archive/20230810/202308102307.MQAoNjsq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308102307.MQAoNjsq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308102307.MQAoNjsq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:767:23: warning: pointer type mismatch ('bool (*)(struct kvm *, struct kvm_gfn_range *)' (aka '_Bool (*)(struct kvm *, struct kvm_gfn_range *)') and 'void *') [-Wpointer-type-mismatch]
     767 |                 .handler        = !is_numa ? kvm_unmap_gfn_range :
         |                                            ^ ~~~~~~~~~~~~~~~~~~~
     768 |                                   (void *)kvm_null_fn,
         |                                   ~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:770:25: warning: pointer type mismatch ('void (*)(struct kvm *)' and 'void *') [-Wpointer-type-mismatch]
     770 |                 .on_unlock      = !is_numa ? kvm_arch_guest_memory_reclaimed :
         |                                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     771 |                                   (void *)kvm_null_fn,
         |                                   ~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +767 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

   756	
   757	static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
   758						const struct mmu_notifier_range *range)
   759	{
   760		struct kvm *kvm = mmu_notifier_to_kvm(mn);
   761		bool is_numa = (range->event == MMU_NOTIFY_PROTECTION_VMA) &&
   762			       (range->flags & MMU_NOTIFIER_RANGE_NUMA);
   763		const struct kvm_hva_range hva_range = {
   764			.start		= range->start,
   765			.end		= range->end,
   766			.pte		= __pte(0),
 > 767			.handler	= !is_numa ? kvm_unmap_gfn_range :
   768					  (void *)kvm_null_fn,
   769			.on_lock	= kvm_mmu_invalidate_begin,
 > 770			.on_unlock	= !is_numa ? kvm_arch_guest_memory_reclaimed :
   771					  (void *)kvm_null_fn,
   772			.flush_on_ret	= !is_numa ? true : false,
   773			.may_block	= mmu_notifier_range_blockable(range),
   774		};
   775	
   776		trace_kvm_unmap_hva_range(range->start, range->end);
   777	
   778		/*
   779		 * Prevent memslot modification between range_start() and range_end()
   780		 * so that conditionally locking provides the same result in both
   781		 * functions.  Without that guarantee, the mmu_invalidate_in_progress
   782		 * adjustments will be imbalanced.
   783		 *
   784		 * Pairs with the decrement in range_end().
   785		 */
   786		spin_lock(&kvm->mn_invalidate_lock);
   787		kvm->mn_active_invalidate_count++;
   788		spin_unlock(&kvm->mn_invalidate_lock);
   789	
   790		/*
   791		 * Invalidate pfn caches _before_ invalidating the secondary MMUs, i.e.
   792		 * before acquiring mmu_lock, to avoid holding mmu_lock while acquiring
   793		 * each cache's lock.  There are relatively few caches in existence at
   794		 * any given time, and the caches themselves can check for hva overlap,
   795		 * i.e. don't need to rely on memslot overlap checks for performance.
   796		 * Because this runs without holding mmu_lock, the pfn caches must use
   797		 * mn_active_invalidate_count (see above) instead of
   798		 * mmu_invalidate_in_progress.
   799		 */
   800		gfn_to_pfn_cache_invalidate_start(kvm, range->start, range->end,
   801						  hva_range.may_block);
   802	
   803		__kvm_handle_hva_range(kvm, &hva_range);
   804	
   805		return 0;
   806	}
   807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
