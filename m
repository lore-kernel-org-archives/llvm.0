Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601E17D7;
	Sun, 30 Apr 2023 07:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682841564; x=1714377564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mUKJIhpHq4tFM4xyoPHDyYgr2rC3SmrqoKOKHevFuvU=;
  b=GUDvRLohNMrE1oFH10hv3DeHIvYCYrJ2t+QyjTzsvcbxJfChpV9lfgpJ
   nZWqcGzcuPdsRbxVihsXofV3XLxuasU0aCC8UTfzQzQWPR0WsZu4FdoIv
   5JG0BXU6MiHQA6LPSgQf/tDNlpmyYCSX51za5UF0RJDM2oUwFWlya591V
   FTFyzSr4dTDTkwCkZQnXz8IuVhsUCGa73e8TjBSgEiJsiwk0gV+0gUn1Y
   9yg8vrC7g3WNduzSLuEAKMaWqYOo3FQsw5fFpV25Q3iCR2yFPFFO2EPUt
   agiO6Om6Mcaufg3C2KToDnMMoIi1UDhuAhaspox/csIfj20Arksz8APik
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="348040100"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="348040100"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 00:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="672830179"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="672830179"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Apr 2023 00:59:22 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt1xp-0001Yn-1G;
	Sun, 30 Apr 2023 07:59:21 +0000
Date: Sun, 30 Apr 2023 15:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 312/338]
 arch/x86/kvm/mmu/mmu.c:713:5: warning: no previous prototype for function
 'kvm_mmu_topup_memory_cache_for_split'
Message-ID: <202304301502.tvxyjnae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   abaa3072a8763b7a6276df61d205bf33eb2f31a5
commit: 4c3e3b7ca8a13d21b2a77b77a0244c4d7b47b259 [312/338] [REVERTME] KVM: TDX, x86/tdp_mmu: Protect Secure-EPT page
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230430/202304301502.tvxyjnae-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/4c3e3b7ca8a13d21b2a77b77a0244c4d7b47b259
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 4c3e3b7ca8a13d21b2a77b77a0244c4d7b47b259
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304301502.tvxyjnae-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:713:5: warning: no previous prototype for function 'kvm_mmu_topup_memory_cache_for_split' [-Wmissing-prototypes]
   int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
       ^
   arch/x86/kvm/mmu/mmu.c:713:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
   ^
   static 
   1 warning generated.


vim +/kvm_mmu_topup_memory_cache_for_split +713 arch/x86/kvm/mmu/mmu.c

   712	
 > 713	int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
   714	{
   715		int r = 0;
   716	#ifdef CONFIG_INTEL_TDX_HOST_DEBUG_MEMORY_CORRUPT
   717		struct kvm_mmu_memory_cache *mc;
   718		int start, end, i;
   719	
   720		mutex_lock(&kvm->arch.private_spt_for_split_lock);
   721		mc = &kvm->arch.private_spt_for_split_cache;
   722		start = kvm_mmu_memory_cache_nr_free_objects(mc);
   723		r = kvm_mmu_topup_memory_cache(mc, KVM_MAX_HUGEPAGE_LEVEL *
   724					       kvm->created_vcpus);
   725		end = kvm_mmu_memory_cache_nr_free_objects(mc);
   726		for (i = start; i < end; i++)
   727			kvm_mmu_split_direct_map(virt_to_page(mc->objects[i]));
   728		mutex_unlock(&kvm->arch.private_spt_for_split_lock);
   729	#endif
   730		return r;
   731	}
   732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
