Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0D963B5;
	Fri, 10 Mar 2023 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678450640; x=1709986640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Ad7ii7tyzRlxU/vh5cqDRQ4FCKOtByrnf3BkBgW9w8=;
  b=DFRyiSQk44dNKP7ZU0xqHT0ear9BPFHnXCCveDvbuxdH9eK1i88sMd51
   4NKe7HSEvPfMiSL861ZLyl2Khurnlqz84GVexitTOK6SaRTWqqPUvxWh2
   y2hT3wsa816m8TavQHrPlkG9Ez4anw8LqLUBKOPrZHz4etgw2NbsJd418
   Y4UaU8y8V5DPNdzSTD15b2pSbYjLN4K8dznK5yY4p8y+lFL+ZU3RyQpoR
   G0Ggq8sEC/wug4RtPKA+S5HQSoM3zY12RRbGX+jeTrQPxBL/ThT0C+rtE
   eO6Src9PLlg1yuBVvPzdLO9ZJl9SBuhEC5cWOfRRZs3Fs1L2ic9XMD+tn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="339079377"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="339079377"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 04:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="821025625"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="821025625"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2023 04:17:18 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pabgT-0003qB-2k;
	Fri, 10 Mar 2023 12:17:17 +0000
Date: Fri, 10 Mar 2023 20:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 425/432]
 arch/x86/kvm/mmu/mmu.c:701:5: warning: no previous prototype for function
 'kvm_mmu_topup_memory_cache_for_split'
Message-ID: <202303102045.OKoBkP89-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   b4a08c4cd3ed29e3977509b24adc2c59e39825c1
commit: 40b0194e911eba584f34f1ff407cb2abf1844656 [425/432] [REVERTME] KVM: TDX, x86/tdp_mmu: Protect Secure-EPT page
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230310/202303102045.OKoBkP89-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/40b0194e911eba584f34f1ff407cb2abf1844656
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 40b0194e911eba584f34f1ff407cb2abf1844656
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102045.OKoBkP89-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:701:5: warning: no previous prototype for function 'kvm_mmu_topup_memory_cache_for_split' [-Wmissing-prototypes]
   int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
       ^
   arch/x86/kvm/mmu/mmu.c:701:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
   ^
   static 
   1 warning generated.


vim +/kvm_mmu_topup_memory_cache_for_split +701 arch/x86/kvm/mmu/mmu.c

   700	
 > 701	int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
   702	{
   703		int r = 0;
   704	#ifdef CONFIG_INTEL_TDX_HOST_DEBUG_MEMORY_CORRUPT
   705		struct kvm_mmu_memory_cache *mc;
   706		int start, end, i;
   707	
   708		mutex_lock(&kvm->arch.private_spt_for_split_lock);
   709		mc = &kvm->arch.private_spt_for_split_cache;
   710		start = kvm_mmu_memory_cache_nr_free_objects(mc);
   711		r = kvm_mmu_topup_memory_cache(mc, KVM_MAX_HUGEPAGE_LEVEL *
   712					       kvm->created_vcpus);
   713		end = kvm_mmu_memory_cache_nr_free_objects(mc);
   714		for (i = start; i < end; i++)
   715			kvm_mmu_split_direct_map(virt_to_page(mc->objects[i]));
   716		mutex_unlock(&kvm->arch.private_spt_for_split_lock);
   717	#endif
   718		return r;
   719	}
   720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
