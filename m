Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695CA4D;
	Sat, 18 Mar 2023 09:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679130762; x=1710666762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rRiuetUfFAqBEb1lUHnFknwi+Y5KlZ2doe/5hkfsZiI=;
  b=BM4q0QkL0nqBpDFme6i//YgQunNNBUOryRTol1d0mxlsaGSzQ07/ORJl
   Gzq4auuTowQGyrOSD/75M4l9gvaNh7hTfIUIRIGtYs4EbNVM/Z9BKxyTd
   KYnU14K4Mo98BxuP8BHZJXHu1pfucG1BBcNyx1Y3jKgtXsA8Jgt7C5Dzc
   ycRUXR+HHKYjCz3vwG5sIfYf2tUg1bzF8PAp0HdaTq7zsX10TGLccOBcb
   cjOYso+AwR1khLx/J2wPKZYziuhyyFMpp3zbEIrhr0G5xIwt0GuW3+YaD
   n/Sr+75FAkoVh1BDglAowpbrRswaEc062WshBAA6ovYYXPl1Fk1dEDsfc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="366127465"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="366127465"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 02:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630554556"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="630554556"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Mar 2023 02:12:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdScB-0009xy-2h;
	Sat, 18 Mar 2023 09:12:39 +0000
Date: Sat, 18 Mar 2023 17:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Gardon <bgardon@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/formalize_shadow_mmu 33/39]
 arch/x86/kvm/mmu/shadow_mmu.c:3316:6: warning: no previous prototype for
 function 'slot_rmap_write_protect'
Message-ID: <202303181726.MCWgSIxq-lkp@intel.com>
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
commit: 35f2a3e85c12f85d138998cc783213c29f73d1d4 [33/39] KVM: x86/MMU: Remove unneeded exports from shadow_mmu.c
config: x86_64-randconfig-a011-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181726.MCWgSIxq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sean-jc/linux/commit/35f2a3e85c12f85d138998cc783213c29f73d1d4
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/formalize_shadow_mmu
        git checkout 35f2a3e85c12f85d138998cc783213c29f73d1d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181726.MCWgSIxq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/mmu/shadow_mmu.c:50:8: error: redefinition of 'pte_list_desc'
   struct pte_list_desc {
          ^
   arch/x86/kvm/mmu/shadow_mmu.h:29:8: note: previous definition is here
   struct pte_list_desc {
          ^
   arch/x86/kvm/mmu/shadow_mmu.c:535:9: error: no member named 'tail_count' in 'struct pte_list_desc'
                   desc->tail_count = 0;
                   ~~~~  ^
   arch/x86/kvm/mmu/shadow_mmu.c:541:17: error: no member named 'tail_count' in 'struct pte_list_desc'
                   count = desc->tail_count + desc->spte_count;
                           ~~~~  ^
   arch/x86/kvm/mmu/shadow_mmu.c:551:10: error: no member named 'tail_count' in 'struct pte_list_desc'
                           desc->tail_count = count;
                           ~~~~  ^
   arch/x86/kvm/mmu/shadow_mmu.c:673:15: error: no member named 'tail_count' in 'struct pte_list_desc'
           return desc->tail_count + desc->spte_count;
                  ~~~~  ^
   arch/x86/kvm/mmu/shadow_mmu.c:811:3: error: implicit declaration of function 'kvm_flush_remote_tlbs_sptep' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   kvm_flush_remote_tlbs_sptep(kvm, sptep);
                   ^
   arch/x86/kvm/mmu/shadow_mmu.c:905:13: error: static declaration of 'kvm_zap_rmap' follows non-static declaration
   static bool kvm_zap_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
               ^
   arch/x86/kvm/mmu/shadow_mmu.h:41:6: note: previous declaration is here
   bool kvm_zap_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:912:13: error: static declaration of 'kvm_set_pte_rmap' follows non-static declaration
   static bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
               ^
   arch/x86/kvm/mmu/shadow_mmu.h:44:6: note: previous declaration is here
   bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:1025:29: error: static declaration of 'kvm_handle_gfn_range' follows non-static declaration
   static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
                               ^
   arch/x86/kvm/mmu/shadow_mmu.h:51:6: note: previous declaration is here
   bool kvm_handle_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:1040:13: error: static declaration of 'kvm_age_rmap' follows non-static declaration
   static bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
               ^
   arch/x86/kvm/mmu/shadow_mmu.h:54:6: note: previous declaration is here
   bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:1054:13: error: static declaration of 'kvm_test_age_rmap' follows non-static declaration
   static bool kvm_test_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
               ^
   arch/x86/kvm/mmu/shadow_mmu.h:57:6: note: previous declaration is here
   bool kvm_test_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:1866:3: error: implicit declaration of function 'kvm_flush_remote_tlbs_sptep' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   kvm_flush_remote_tlbs_sptep(vcpu->kvm, sptep);
                   ^
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2960:
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: warning: no previous prototype for function 'ept_sync_spte' [-Wmissing-prototypes]
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
       ^
   arch/x86/kvm/mmu/paging_tmpl.h:54:22: note: expanded from macro 'FNAME'
           #define FNAME(name) ept_##name
                               ^
   <scratch space>:266:1: note: expanded from here
   ept_sync_spte
   ^
   arch/x86/kvm/mmu/paging_tmpl.h:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
   ^
   static 
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2964:
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: warning: no previous prototype for function 'paging64_sync_spte' [-Wmissing-prototypes]
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
       ^
   arch/x86/kvm/mmu/paging_tmpl.h:27:22: note: expanded from macro 'FNAME'
           #define FNAME(name) paging##64_##name
                               ^
   <scratch space>:194:1: note: expanded from here
   paging64_sync_spte
   ^
   arch/x86/kvm/mmu/paging_tmpl.h:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
   ^
   static 
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2968:
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: warning: no previous prototype for function 'paging32_sync_spte' [-Wmissing-prototypes]
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
       ^
   arch/x86/kvm/mmu/paging_tmpl.h:40:22: note: expanded from macro 'FNAME'
           #define FNAME(name) paging##32_##name
                               ^
   <scratch space>:114:1: note: expanded from here
   paging32_sync_spte
   ^
   arch/x86/kvm/mmu/paging_tmpl.h:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
   ^
   static 
>> arch/x86/kvm/mmu/shadow_mmu.c:3316:6: warning: no previous prototype for function 'slot_rmap_write_protect' [-Wmissing-prototypes]
   bool slot_rmap_write_protect(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:3316:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool slot_rmap_write_protect(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
   ^
   static 
   arch/x86/kvm/mmu/shadow_mmu.c:3525:5: error: implicit declaration of function 'kvm_flush_remote_tlbs_sptep' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                   kvm_flush_remote_tlbs_sptep(kvm, sptep);
                                   ^
   4 warnings and 13 errors generated.


vim +/slot_rmap_write_protect +3316 arch/x86/kvm/mmu/shadow_mmu.c

6b83197856f485 Ben Gardon 2023-02-02  3315  
6b83197856f485 Ben Gardon 2023-02-02 @3316  bool slot_rmap_write_protect(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
6b83197856f485 Ben Gardon 2023-02-02  3317  			     const struct kvm_memory_slot *slot)
6b83197856f485 Ben Gardon 2023-02-02  3318  {
6b83197856f485 Ben Gardon 2023-02-02  3319  	return rmap_write_protect(rmap_head, false);
6b83197856f485 Ben Gardon 2023-02-02  3320  }
6b83197856f485 Ben Gardon 2023-02-02  3321  

:::::: The code at line 3316 was first introduced by commit
:::::: 6b83197856f485c960da6f39a01d447f0589aa1b KVM: x86/MMU: Move the Shadow MMU implementation to shadow_mmu.c

:::::: TO: Ben Gardon <bgardon@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
