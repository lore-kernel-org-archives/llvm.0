Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0003749F6;
	Fri, 12 Jun 2026 21:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301435; cv=none; b=PanMuNfY6l1uDZyRDvtqbkbJ0I+39fvSr1O7s9H2nBkimU9hhIoa1OTCzU319Xt3eYfqjNv7OQ33nirVKkLdTf8HLesaVZ9ER5X0kCPpQ1f67iW5G18CdqgW41N9oWv7y7ikA4mZTZXMR+6nxgfQssz3wHvyx8p1Mzj+EzipHc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301435; c=relaxed/simple;
	bh=rkWRQF2MwggELgEggWVQcOZZbG+gTHs8IKvasz1ychw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pq5e6fQlgYiuQzeD7kTQOTIT9wzoKL+sPTvD5wq6liIG37OFRB2dc0q0gAfRgyIHVBQr7cGfoB19Rw1eAKEn7DLqzOUiYf4Nyeh2SLvEgPQoxwQLWk96JFeB0KLxzSV6bXSUjV4VN5GG1cndGhRS+FAQHCpPMhy0sXCrTM+PbT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwukzVQd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwukzVQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781301433; x=1812837433;
  h=date:from:to:cc:subject:message-id;
  bh=rkWRQF2MwggELgEggWVQcOZZbG+gTHs8IKvasz1ychw=;
  b=WwukzVQdAmhD9Yw7YpGHsj4h86Xfj7xOMmrx7eaOf4kRB+9xMdYk+qYJ
   N8jEZFdvP/Y8BDgu81YYQKZMDgW7aP3TcNjBg+VNpMpHRq97370XHPhVl
   Dk+C/44vMWojSjVOMgRKsgYIOOscL6kkOe3rzzx3ORCTIL6c8LxkbFIeq
   va3IvwJLAMfAR/83/2JF5R3WDKOZmbMoI0Qe6uADOGsL0KagM1WJp5o4Q
   AmpDBkiTMKKtKY3bBX7caMLtnS08Qx0WCsdtUQvO3AmsVjeC1cn4H1DRn
   qATW9TflxWh83jVPLsUgIPTVHbxC4W2FBCYUotBoO3vnG0a1dV/fE9BI2
   g==;
X-CSE-ConnectionGUID: Tn2FT9OgQIyimY2pO66EGA==
X-CSE-MsgGUID: oY3hSbq1QzKTX9cyqKW0Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81987370"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="81987370"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:57:13 -0700
X-CSE-ConnectionGUID: 3DJDsBTzQBe3sSGy0RDCMQ==
X-CSE-MsgGUID: 2f9ETatwT/WBYvHy9mBErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="251206337"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2026 14:57:11 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY9sD-000000004KT-0FLV;
	Fri, 12 Jun 2026 21:57:09 +0000
Date: Fri, 12 Jun 2026 23:56:15 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_unsync_for_nested_tdp 28/28]
 arch/x86/kvm/mmu/mmu.c:2270:6: warning: unused variable 'ret'
Message-ID: <202606122335.OYh5wFfm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/no_unsync_for_nested_tdp
head:   cf61c0380b4809886b14ce509549f68bf59338d3
commit: cf61c0380b4809886b14ce509549f68bf59338d3 [28/28] KVM: x86/mmu: Add Kconfig option to disable legacy (non-TDP) shadow paging
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260612/202606122335.OYh5wFfm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122335.OYh5wFfm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606122335.OYh5wFfm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:2270:6: warning: unused variable 'ret' [-Wunused-variable]
    2270 |         int ret;
         |             ^~~
>> arch/x86/kvm/mmu/mmu.c:6743:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
    6743 | }
         | ^
   arch/x86/kvm/mmu/mmu.c:1501:13: warning: unused function 'kvm_vcpu_write_protect_gfn' [-Wunused-function]
    1501 | static bool kvm_vcpu_write_protect_gfn(struct kvm_vcpu *vcpu, u64 gfn)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:5295:13: warning: unused function 'sync_mmio_spte' [-Wunused-function]
    5295 | static bool sync_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, gfn_t gfn,
         |             ^~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:5952:13: warning: unused function 'kvm_init_shadow_mmu' [-Wunused-function]
    5952 | static void kvm_init_shadow_mmu(struct kvm_vcpu *vcpu,
         |             ^~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/ret +2270 arch/x86/kvm/mmu/mmu.c

a30f47cb150dd8 arch/x86/kvm/mmu.c     Xiao Guangrong      2011-09-22  2256  
cbd858b17e379f arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2257  /*
cbd858b17e379f arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2258   * The vCPU is required when finding indirect shadow pages; the shadow
cbd858b17e379f arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2259   * page may already exist and syncing it needs the vCPU pointer in
cbd858b17e379f arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2260   * order to read guest page tables.  Direct shadow pages are never
cbd858b17e379f arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2261   * unsync, thus @vcpu can be NULL if @role.direct is true.
cbd858b17e379f arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2262   */
3cc736b35799ab arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2263  static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
3cc736b35799ab arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2264  						     struct kvm_vcpu *vcpu,
94c8136448c804 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2265  						     gfn_t gfn,
94c8136448c804 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2266  						     struct hlist_head *sp_list,
2e65e842c57d72 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2267  						     union kvm_mmu_page_role role)
cea0f0e7ea5475 drivers/kvm/mmu.c      Avi Kivity          2007-01-05  2268  {
9f1a122f970dbe arch/x86/kvm/mmu.c     Xiao Guangrong      2010-05-24  2269  	struct kvm_mmu_page *sp;
8d5678a76689ac arch/x86/kvm/mmu/mmu.c Hou Wenlong         2022-03-15 @2270  	int ret;
f3414bc7741946 arch/x86/kvm/mmu.c     David Matlack       2016-12-20  2271  	int collisions = 0;
2a74003ae818cf arch/x86/kvm/mmu.c     Paolo Bonzini       2016-02-24  2272  	LIST_HEAD(invalid_list);
cea0f0e7ea5475 drivers/kvm/mmu.c      Avi Kivity          2007-01-05  2273  
3cc736b35799ab arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2274  	for_each_valid_sp(kvm, sp, sp_list) {
f3414bc7741946 arch/x86/kvm/mmu.c     David Matlack       2016-12-20  2275  		if (sp->gfn != gfn) {
f3414bc7741946 arch/x86/kvm/mmu.c     David Matlack       2016-12-20  2276  			collisions++;
f3414bc7741946 arch/x86/kvm/mmu.c     David Matlack       2016-12-20  2277  			continue;
f3414bc7741946 arch/x86/kvm/mmu.c     David Matlack       2016-12-20  2278  		}
f3414bc7741946 arch/x86/kvm/mmu.c     David Matlack       2016-12-20  2279  
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2280  		if (sp->role.word != role.word) {
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  2281  #ifdef CONFIG_KVM_LEGACY_SHADOW_PAGING
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2282  			/*
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2283  			 * If the guest is creating an upper-level page, zap
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2284  			 * unsync pages for the same gfn.  While it's possible
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2285  			 * the guest is using recursive page tables, in all
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2286  			 * likelihood the guest has stopped using the unsync
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2287  			 * page and is installing a completely unrelated page.
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2288  			 * Unsync pages must not be left as is, because the new
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2289  			 * upper-level page will be write-protected.
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2290  			 */
2e65e842c57d72 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2291  			if (role.level > PG_LEVEL_4K && sp->unsync)
3cc736b35799ab arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2292  				kvm_mmu_prepare_zap_page(kvm, sp,
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2293  							 &invalid_list);
cf61c0380b4809 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2026-06-12  2294  #endif
4731d4c7a07769 arch/x86/kvm/mmu.c     Marcelo Tosatti     2008-09-23  2295  			continue;
ddc16abbbae9cd arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2296  		}
4731d4c7a07769 arch/x86/kvm/mmu.c     Marcelo Tosatti     2008-09-23  2297  
bb924ca69f71b4 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2298  		/* unsync and write-flooding only apply to indirect SPs. */
bb924ca69f71b4 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2299  		if (sp->role.direct)
94c8136448c804 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  2300  			goto out;
fb58a9c345f645 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-23  2301  

:::::: The code at line 2270 was first introduced by commit
:::::: 8d5678a76689acbf91245a3791fe853ab773090f KVM: x86/mmu: Don't rebuild page when the page is synced and no tlb flushing is required

:::::: TO: Hou Wenlong <houwenlong.hwl@antgroup.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
