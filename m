Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A11846;
	Sun, 19 Mar 2023 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679244615; x=1710780615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Xt77oeHuhZbkOogjuq/VtxbVEXINfNh+uOBAvNUHDQ=;
  b=QBylquI50XzhACZc3IW/48CpPVVpX5z+sc4wwmH8WEBlwwSP7h4I9W+d
   q0Cl+7NoHHxmWtnvUCQuqVgRKqFaWPVKGpwlbckNv3tDaeic3WkaHFDO3
   VnOw8e57qJ98vVc1UgScAfAInv/brXyxpBPKqxSd35M4JuAKXXpYJhsN3
   PwIFAoXeS4fwe+M2E3VosKMNLV5Oa79/7F+AVlY5EbkizvwjAf+nDOMU3
   /WnRbCRhcbRa20LqC4fTsK5X3Sbe+/gr1LFKAluGmF+HqQU2yeHzzWOuz
   76mRKdG7fa/eikSmYMIettzSqCI4RsbO6jmCx9Z40NCCcLEERSdzhDtix
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="318177714"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="318177714"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 09:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="926732378"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="926732378"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Mar 2023 09:50:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdwEV-000Aaa-2A;
	Sun, 19 Mar 2023 16:50:11 +0000
Date: Mon, 20 Mar 2023 00:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Gardon <bgardon@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/formalize_shadow_mmu 31/39]
 arch/x86/kvm/mmu/paging_tmpl.h:883:5: error: no previous prototype for
 function 'paging32_sync_spte'
Message-ID: <202303200050.cCtWopvT-lkp@intel.com>
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
commit: bff40285dce0728f87ca18d9370b99f064f1a69d [31/39] KVM: x86/MMU: Fix naming on prepare / commit zap page functions
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230320/202303200050.cCtWopvT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sean-jc/linux/commit/bff40285dce0728f87ca18d9370b99f064f1a69d
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/formalize_shadow_mmu
        git checkout bff40285dce0728f87ca18d9370b99f064f1a69d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303200050.cCtWopvT-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   arch/x86/kvm/mmu/shadow_mmu.h:46:6: note: previous declaration is here
   bool kvm_zap_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:912:13: error: static declaration of 'kvm_set_pte_rmap' follows non-static declaration
   static bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
               ^
   arch/x86/kvm/mmu/shadow_mmu.h:49:6: note: previous declaration is here
   bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:1025:29: error: static declaration of 'kvm_handle_gfn_range' follows non-static declaration
   static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
                               ^
   arch/x86/kvm/mmu/shadow_mmu.h:56:6: note: previous declaration is here
   bool kvm_handle_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:1040:13: error: static declaration of 'kvm_age_rmap' follows non-static declaration
   static bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
               ^
   arch/x86/kvm/mmu/shadow_mmu.h:59:6: note: previous declaration is here
   bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:1054:13: error: static declaration of 'kvm_test_age_rmap' follows non-static declaration
   static bool kvm_test_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
               ^
   arch/x86/kvm/mmu/shadow_mmu.h:62:6: note: previous declaration is here
   bool kvm_test_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:1866:3: error: implicit declaration of function 'kvm_flush_remote_tlbs_sptep' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   kvm_flush_remote_tlbs_sptep(vcpu->kvm, sptep);
                   ^
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2960:
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: error: no previous prototype for function 'ept_sync_spte' [-Werror,-Wmissing-prototypes]
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
       ^
   arch/x86/kvm/mmu/paging_tmpl.h:54:22: note: expanded from macro 'FNAME'
           #define FNAME(name) ept_##name
                               ^
   <scratch space>:197:1: note: expanded from here
   ept_sync_spte
   ^
   arch/x86/kvm/mmu/paging_tmpl.h:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
   ^
   static 
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2964:
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: error: no previous prototype for function 'paging64_sync_spte' [-Werror,-Wmissing-prototypes]
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
       ^
   arch/x86/kvm/mmu/paging_tmpl.h:27:22: note: expanded from macro 'FNAME'
           #define FNAME(name) paging##64_##name
                               ^
   <scratch space>:115:1: note: expanded from here
   paging64_sync_spte
   ^
   arch/x86/kvm/mmu/paging_tmpl.h:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
   ^
   static 
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2968:
>> arch/x86/kvm/mmu/paging_tmpl.h:883:5: error: no previous prototype for function 'paging32_sync_spte' [-Werror,-Wmissing-prototypes]
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
       ^
   arch/x86/kvm/mmu/paging_tmpl.h:40:22: note: expanded from macro 'FNAME'
           #define FNAME(name) paging##32_##name
                               ^
   <scratch space>:30:1: note: expanded from here
   paging32_sync_spte
   ^
   arch/x86/kvm/mmu/paging_tmpl.h:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
   ^
   static 
   arch/x86/kvm/mmu/shadow_mmu.c:3204:29: error: static declaration of 'walk_slot_rmaps' follows non-static declaration
   static __always_inline bool walk_slot_rmaps(struct kvm *kvm,
                               ^
   arch/x86/kvm/mmu/shadow_mmu.h:97:6: note: previous declaration is here
   bool walk_slot_rmaps(struct kvm *kvm, const struct kvm_memory_slot *slot,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:3215:29: error: static declaration of 'walk_slot_rmaps_4k' follows non-static declaration
   static __always_inline bool walk_slot_rmaps_4k(struct kvm *kvm,
                               ^
   arch/x86/kvm/mmu/shadow_mmu.h:100:6: note: previous declaration is here
   bool walk_slot_rmaps_4k(struct kvm *kvm, const struct kvm_memory_slot *slot,
        ^
   arch/x86/kvm/mmu/shadow_mmu.c:3525:5: error: implicit declaration of function 'kvm_flush_remote_tlbs_sptep' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                   kvm_flush_remote_tlbs_sptep(kvm, sptep);
                                   ^
   18 errors generated.


vim +/paging32_sync_spte +883 arch/x86/kvm/mmu/paging_tmpl.h

6539e738f65a8f arch/x86/kvm/paging_tmpl.h     Joerg Roedel        2010-09-10  871  
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  872  /*
6a97575d5cffb7 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2022-06-22  873   * Using the information in sp->shadowed_translation (kvm_mmu_page_get_gfn()) is
6a97575d5cffb7 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2022-06-22  874   * safe because:
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  875   * - The spte has a reference to the struct page, so the pfn for a given gfn
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  876   *   can't change unless all sptes pointing to it are nuked first.
c3e5e415bc1e6c arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2021-09-18  877   *
c3e5e415bc1e6c arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2021-09-18  878   * Returns
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  879   * < 0: failed to sync spte
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  880   *   0: the spte is synced and no tlb flushing is required
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  881   * > 0: the spte is synced and tlb flushing is required
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  882   */
47e60247f1c316 arch/x86/kvm/mmu/paging_tmpl.h Ben Gardon          2023-02-02 @883  int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  884  {
9bdbba13b88688 arch/x86/kvm/paging_tmpl.h     Lai Jiangshan       2010-11-19  885  	bool host_writable;
51fb60d81b483a arch/x86/kvm/paging_tmpl.h     Gui Jianfeng        2010-04-16  886  	gpa_t first_pte_gpa;
4758d47e0d685c arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-17  887  	u64 *sptep, spte;
53597858dbf8da arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2021-08-17  888  	struct kvm_memory_slot *slot;
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  889  	unsigned pte_access;
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  890  	pt_element_t gpte;
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  891  	gpa_t pte_gpa;
f55c3f419ab1f0 arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2010-05-13  892  	gfn_t gfn;
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  893  
19ace7d6ca15a4 arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-17  894  	if (WARN_ON_ONCE(!sp->spt[i]))
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  895  		return 0;
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  896  
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  897  	first_pte_gpa = FNAME(get_level1_sp_gpa)(sp);
51fb60d81b483a arch/x86/kvm/paging_tmpl.h     Gui Jianfeng        2010-04-16  898  	pte_gpa = first_pte_gpa + i * sizeof(pt_element_t);
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  899  
54bf36aac52031 arch/x86/kvm/paging_tmpl.h     Paolo Bonzini       2015-04-08  900  	if (kvm_vcpu_read_guest_atomic(vcpu, pte_gpa, &gpte,
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  901  				       sizeof(pt_element_t)))
c3e5e415bc1e6c arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2021-09-18  902  		return -1;
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  903  
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  904  	if (FNAME(prefetch_invalid_gpte)(vcpu, sp, &sp->spt[i], gpte))
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  905  		return 1;
407c61c6bd6a51 arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2010-11-23  906  
ce88decffd17bf arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2011-07-12  907  	gfn = gpte_to_gfn(gpte);
ce88decffd17bf arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2011-07-12  908  	pte_access = sp->role.access;
42522d08cdba6d arch/x86/kvm/paging_tmpl.h     Peter Xu            2018-07-18  909  	pte_access &= FNAME(gpte_access)(gpte);
44dd3ffa7bb311 arch/x86/kvm/paging_tmpl.h     Vitaly Kuznetsov    2018-10-08  910  	FNAME(protect_clean_gpte)(vcpu->arch.mmu, &pte_access, gpte);
ce88decffd17bf arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2011-07-12  911  
c3e5e415bc1e6c arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2021-09-18  912  	if (sync_mmio_spte(vcpu, &sp->spt[i], gfn, pte_access))
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  913  		return 0;
ce88decffd17bf arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2011-07-12  914  
9fb3565743d583 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-05-13  915  	/*
9fb3565743d583 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-05-13  916  	 * Drop the SPTE if the new protections would result in a RWX=0
9fb3565743d583 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-05-13  917  	 * SPTE or if the gfn is changing.  The RWX=0 case only affects
9fb3565743d583 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-05-13  918  	 * EPT with execute-only support, i.e. EPT without an effective
9fb3565743d583 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-05-13  919  	 * "present" bit, as all other paging modes will create a
9fb3565743d583 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-05-13  920  	 * read-only SPTE if pte_access is zero.
9fb3565743d583 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-05-13  921  	 */
6a97575d5cffb7 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2022-06-22  922  	if ((!pte_access && !shadow_present_mask) ||
6a97575d5cffb7 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2022-06-22  923  	    gfn != kvm_mmu_page_get_gfn(sp, i)) {
c37079586f317d arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2011-07-12  924  		drop_spte(vcpu->kvm, &sp->spt[i]);
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  925  		return 1;
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  926  	}
e6722d9211b2aa arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  927  	/*
e6722d9211b2aa arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  928  	 * Do nothing if the permissions are unchanged.  The existing SPTE is
e6722d9211b2aa arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  929  	 * still, and prefetch_invalid_gpte() has verified that the A/D bits
e6722d9211b2aa arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  930  	 * are set in the "new" gPTE, i.e. there is no danger of missing an A/D
e6722d9211b2aa arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  931  	 * update due to A/D bits being set in the SPTE but not the gPTE.
e6722d9211b2aa arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  932  	 */
e6722d9211b2aa arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  933  	if (kvm_mmu_page_get_access(sp, i) == pte_access)
e6722d9211b2aa arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  934  		return 0;
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  935  
6a97575d5cffb7 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2022-06-22  936  	/* Update the shadowed access bits in case they changed. */
6a97575d5cffb7 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2022-06-22  937  	kvm_mmu_page_set_access(sp, i, pte_access);
6a97575d5cffb7 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2022-06-22  938  
4758d47e0d685c arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-17  939  	sptep = &sp->spt[i];
4758d47e0d685c arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-17  940  	spte = *sptep;
4758d47e0d685c arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-17  941  	host_writable = spte & shadow_host_writable_mask;
53597858dbf8da arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2021-08-17  942  	slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
53597858dbf8da arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2021-08-17  943  	make_spte(vcpu, sp, slot, pte_access, gfn,
4758d47e0d685c arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-17  944  		  spte_to_pfn(spte), spte, true, false,
7158bee4b47519 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-17  945  		  host_writable, &spte);
f8e453b00cf1d9 arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2010-12-23  946  
c3c6c9fc5d24bc arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-16  947  	return mmu_spte_update(sptep, spte);
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  948  }
e8bc217aef67d4 arch/x86/kvm/paging_tmpl.h     Marcelo Tosatti     2008-09-23  949  

:::::: The code at line 883 was first introduced by commit
:::::: 47e60247f1c316484333b71439780fd37a2c1014 KVM: x86/MMU: Move paging_tmpl.h includes to shadow_mmu.c

:::::: TO: Ben Gardon <bgardon@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
