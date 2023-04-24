Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F27470;
	Mon, 24 Apr 2023 22:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682376367; x=1713912367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gkVOv+IXqynqB9kY6WiS6cDq6RDlE18HHF+7Fnwbt2M=;
  b=jEyOGHKDGOdz+MISJ+AWTenrBgIcfEX2alFnMuTLuZRmArgFgrttad8+
   NbT4Cx9gbV0wI8a+xEYauj3etURjXArlk+KNXhGxowJPw68lNe+xdJSz9
   RzSEFG8wuxs4MXHKqNgJ1GgAILYz3LgpgxvuC0fhlobkRCaV2UQOIe9cE
   96nI7K0OnAYAwEf945KzdsIS/s5EblkqdfP0cTG/dH+kpFzwI/hHTiW28
   S7vtSEPaqObwXOoT8J9LpQsKx18V0u43uvBAkKCL53/N03EEnkV2HtBlP
   kM9YYqOFi5w7yIEJp5ZARAY23x1q9YcehogBSu+LGotXGB88Eg1tCVnEn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="411872777"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="411872777"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 15:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693253778"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="693253778"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Apr 2023 15:46:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr4wc-000ih8-2i;
	Mon, 24 Apr 2023 22:46:02 +0000
Date: Tue, 25 Apr 2023 06:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 312/338]
 arch/x86/kvm/mmu/mmu.c:713:5: warning: no previous prototype for function
 'kvm_mmu_topup_memory_cache_for_split'
Message-ID: <202304250651.Pftd0rsh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   5217810067c6f32309d1473fc94649608330885c
commit: a51188903783ebbcbc6cd13b599fc53b3d5e6695 [312/338] [REVERTME] KVM: TDX, x86/tdp_mmu: Protect Secure-EPT page
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230425/202304250651.Pftd0rsh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/a51188903783ebbcbc6cd13b599fc53b3d5e6695
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout a51188903783ebbcbc6cd13b599fc53b3d5e6695
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250651.Pftd0rsh-lkp@intel.com/

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
