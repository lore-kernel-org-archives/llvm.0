Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5FB2CA3
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643099934; x=1674635934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHLvk2Fxtqipkr7bYbTQ1H648fwihIa5MUSjSjqjR/Q=;
  b=Ffzle4vVgao7LhSrPlg/w4UHX4sdIqaTBhr2yoM5Y1+Cw4EslWA3pkyq
   dKWNm0hnsBYCIm6CufndHU0QMbgoN3C6WM+y3oJmfpkQTaQq5HJcoeSYq
   pm/AcecTcnEZ+4c65U+oIq+FpIBAQwZzgMiLrhxypzWj7MTFdIJg7d8zV
   PpoSMs90+NmKK95N/qysgmHQ77EEAbK55s31qvJdJF5oGKsARVE8HTXOF
   SmWsGueX5rWi0latdbybdFwDAizweCN0u1x5/mrx13v6+XipkKSxpKic0
   M5v9qc/7HRcTjWJCv7H9XyM/2BXG/ayAwzvriPWG8W5zMVYrplY0+2L8j
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="332608158"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="332608158"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 00:38:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="477032902"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2022 00:38:32 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCHLT-000JaE-Hl; Tue, 25 Jan 2022 08:38:31 +0000
Date: Tue, 25 Jan 2022 16:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-workaround 155/162]
 arch/x86/kvm/mmu/tdp_mmu.c:774:32: warning: operator '?:' has lower
 precedence than '|'; '|' will be evaluated first
Message-ID: <202201251603.34lAUK9o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   9ba9d8e36b0fa25f5f20109a0ae61619a421f550
commit: 6d8632a26d7060510bfe4fbb3011c2d6e2d2f079 [155/162] KVM, x86/tdp_mmu: optimize remote tlb flush
config: x86_64-randconfig-a015-20220124 (https://download.01.org/0day-ci/archive/20220125/202201251603.34lAUK9o-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/6d8632a26d7060510bfe4fbb3011c2d6e2d2f079
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 6d8632a26d7060510bfe4fbb3011c2d6e2d2f079
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/tdp_mmu.c:774:32: warning: operator '?:' has lower precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-parentheses]
                   is_large_pte(iter->old_spte) ? PT_PAGE_SIZE_MASK : 0;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/mmu/tdp_mmu.c:774:32: note: place parentheses around the '|' expression to silence this warning
                   is_large_pte(iter->old_spte) ? PT_PAGE_SIZE_MASK : 0;
                                                ^
                                               )
   arch/x86/kvm/mmu/tdp_mmu.c:774:32: note: place parentheses around the '?:' expression to evaluate it first
                   is_large_pte(iter->old_spte) ? PT_PAGE_SIZE_MASK : 0;
                                                ^
                   (                                                   )
   1 warning generated.


vim +774 arch/x86/kvm/mmu/tdp_mmu.c

   745	
   746	#define tdp_root_for_each_pte(_iter, _root, _start, _end) \
   747		for_each_tdp_pte(_iter, _root->spt, _root->role.level, _start, _end)
   748	
   749	/*
   750	 * Note temporarily blocked private SPTE is consider as valid leaf,
   751	 * although !is_shadow_present_pte() returns true for it, since the
   752	 * target page (which the mapping maps to ) is still there.
   753	 */
   754	#define tdp_root_for_each_leaf_pte(_iter, _root, _start, _end)	\
   755		tdp_root_for_each_pte(_iter, _root, _start, _end)		\
   756			if ((!is_shadow_present_pte(_iter.old_spte) &&		\
   757				!is_zapped_private_pte(_iter.old_spte)) ||	\
   758			    !is_last_spte(_iter.old_spte, _iter.level))		\
   759				continue;					\
   760			else
   761	
   762	#define tdp_mmu_for_each_pte(_iter, _mmu, _private, _start, _end)	\
   763		for_each_tdp_pte(_iter,						\
   764			__va((_private) ? _mmu->private_root_hpa : _mmu->root_hpa),	\
   765			 _mmu->shadow_root_level, _start, _end)
   766	
   767	static u64 zapped_private_spte(struct kvm *kvm, const struct tdp_iter *iter)
   768	{
   769		if (!kvm_gfn_stolen_mask(kvm))
   770			return shadow_init_value;
   771	
   772		return shadow_init_value | SPTE_PRIVATE_ZAPPED |
   773			(spte_to_pfn(iter->old_spte) << PAGE_SHIFT) |
 > 774			is_large_pte(iter->old_spte) ? PT_PAGE_SIZE_MASK : 0;
   775	}
   776	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
