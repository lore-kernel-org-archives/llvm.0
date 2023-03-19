Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4D01398;
	Sun, 19 Mar 2023 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679231109; x=1710767109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZ01iO1sb0NRVsuNxqUxurGmdwGQTJHvVSMY3++A4ss=;
  b=AEy1OIDRVlqjDZpBarTEV8HhMTp/kDpcXdT8uTFijvgqWmLoZz0ySTXa
   j8fR7HJYf8DSVqJwc/XayTFkZnIKCwkqmN8SWg0CLrXTpbrLJl+iAb5FB
   +ry7/zc5c8Xvk4Y4V0L1pisKPHXfsvM1+hG1p10OtCD8YXvBZz0GtMgn/
   l8gzfZvwPebDSa5v6ao4aE3KLholM4a8UM3EmYLzBLf2MVdu6rdadrEk0
   M7IC6CpbO6dfPYiG8cJWHlTaai0TukiTvjRulOV4wjiUT/Vuprc9BRGOr
   /S5G0iwn62ZIj1NoRhun9/I9wG2exB/3Aubut60ODJB2RMgwNiH1INNVB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="338530963"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="338530963"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 06:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="749792729"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="749792729"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2023 06:05:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdsig-000AWw-2A;
	Sun, 19 Mar 2023 13:05:06 +0000
Date: Sun, 19 Mar 2023 21:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Gardon <bgardon@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/formalize_shadow_mmu 29/39]
 arch/x86/kvm/mmu/mmu.c:3178:15: error: no previous prototype for function
 'mmu_shrink_scan'
Message-ID: <202303192012.JgXNu15n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/formalize_shadow_mmu
head:   dd395c7174581183cd66020ac5a784bdf2e79cd1
commit: 65d06e1aa5898de35579978883d1d71dad826347 [29/39] KVM: x86/MMU: Cleanup shrinker interface with Shadow MMU
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230319/202303192012.JgXNu15n-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sean-jc/linux/commit/65d06e1aa5898de35579978883d1d71dad826347
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/formalize_shadow_mmu
        git checkout 65d06e1aa5898de35579978883d1d71dad826347
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303192012.JgXNu15n-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/mmu/mmu.c:758:1: error: version control conflict marker in file
   <<<<<<< HEAD
   ^
   arch/x86/kvm/mmu/mmu.c:2129:23: error: use of undeclared identifier 'paging64_sync_spte'; did you mean 'paging64_sync_page'?
           context->sync_spte = paging64_sync_spte;
                                ^~~~~~~~~~~~~~~~~~
                                paging64_sync_page
   arch/x86/kvm/mmu/shadow_mmu.h:132:5: note: 'paging64_sync_page' declared here
   int paging64_sync_page(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp);
       ^
   arch/x86/kvm/mmu/mmu.c:2136:23: error: use of undeclared identifier 'paging32_sync_spte'; did you mean 'paging32_sync_page'?
           context->sync_spte = paging32_sync_spte;
                                ^~~~~~~~~~~~~~~~~~
                                paging32_sync_page
   arch/x86/kvm/mmu/shadow_mmu.h:131:5: note: 'paging32_sync_page' declared here
   int paging32_sync_page(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp);
       ^
   arch/x86/kvm/mmu/mmu.c:2355:24: error: use of undeclared identifier 'ept_sync_spte'; did you mean 'ept_sync_page'?
                   context->sync_spte = ept_sync_spte;
                                        ^~~~~~~~~~~~~
                                        ept_sync_page
   arch/x86/kvm/mmu/shadow_mmu.h:133:5: note: 'ept_sync_page' declared here
   int ept_sync_page(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp);
       ^
   arch/x86/kvm/mmu/mmu.c:2576:34: error: variable has incomplete type 'struct kvm_shadow_walk_iterator'
           struct kvm_shadow_walk_iterator iterator;
                                           ^
   arch/x86/kvm/mmu/mmu.c:2576:9: note: forward declaration of 'struct kvm_shadow_walk_iterator'
           struct kvm_shadow_walk_iterator iterator;
                  ^
   arch/x86/kvm/mmu/mmu.c:2584:2: error: implicit declaration of function 'for_each_shadow_entry_using_root' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           for_each_shadow_entry_using_root(vcpu, root_hpa, addr, iterator) {
           ^
>> arch/x86/kvm/mmu/mmu.c:3178:15: error: no previous prototype for function 'mmu_shrink_scan' [-Werror,-Wmissing-prototypes]
   unsigned long mmu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
                 ^
   arch/x86/kvm/mmu/mmu.c:3178:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long mmu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
   ^
   static 
   7 errors generated.


vim +/mmu_shrink_scan +3178 arch/x86/kvm/mmu/mmu.c

  3177	
> 3178	unsigned long mmu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
  3179	{
  3180		struct kvm *kvm;
  3181		int nr_to_scan = sc->nr_to_scan;
  3182		unsigned long freed = 0;
  3183	
  3184		mutex_lock(&kvm_lock);
  3185	
  3186		list_for_each_entry(kvm, &vm_list, vm_list) {
  3187			/*
  3188			 * Never scan more than sc->nr_to_scan VM instances.
  3189			 * Will not hit this condition practically since we do not try
  3190			 * to shrink more than one VM and it is very unlikely to see
  3191			 * !n_used_mmu_pages so many times.
  3192			 */
  3193			if (!nr_to_scan--)
  3194				break;
  3195	
  3196			/*
  3197			 * n_used_mmu_pages is accessed without holding kvm->mmu_lock
  3198			 * here. We may skip a VM instance errorneosly, but we do not
  3199			 * want to shrink a VM that only started to populate its MMU
  3200			 * anyway.
  3201			 */
  3202			if (!kvm->arch.n_used_mmu_pages &&
  3203			    !kvm_shadow_mmu_has_zapped_obsolete_pages(kvm))
  3204				continue;
  3205	
  3206			freed = kvm_shadow_mmu_shrink_scan(kvm, sc->nr_to_scan);
  3207	
  3208			/*
  3209			 * unfair on small ones
  3210			 * per-vm shrinkers cry out
  3211			 * sadness comes quickly
  3212			 */
  3213			list_move_tail(&kvm->vm_list, &vm_list);
  3214			break;
  3215		}
  3216	
  3217		mutex_unlock(&kvm_lock);
  3218		return freed;
  3219	}
  3220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
