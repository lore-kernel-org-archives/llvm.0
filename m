Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE40B7B;
	Fri,  7 Apr 2023 00:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680826294; x=1712362294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pP4+FshVJEgWwZdKzwCEFqeDE9IRI/YeH7ABqpTFAVM=;
  b=cHEK1nw5lHENVTJHmTtUOf+GJbcl2D1vx1J1mUkHMthCZqWpuMy40GcO
   k9S+Qm+5aifJqFDUqP5R+2c3e2JA2O0ajE0yQX2usIk9FCygfvP2dC1/W
   hvzC5bwy10+i+TufTmh3mxC9UOfJsjmJogmnxpSBcrs6i3KwI4XrVdoGn
   ntyf9DWglXUp6HgR3glthZrdDwHnsCyyf/La+Amr3YUqjYZ6fkWByjChT
   kb59UvqCuJpwSfbuBLzram973NndEOl1FjtyagK8Ma078bgLjSO6xNgG2
   yXMCqH5hYVJB6QXv/7bqN8hmgLT4AoS0X7ObsGI7KQ54CWQvN95Iafbb+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="429164966"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="429164966"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 17:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664697716"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="664697716"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 17:11:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkZhG-000RvK-0R;
	Fri, 07 Apr 2023 00:11:18 +0000
Date: Fri, 7 Apr 2023 08:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 312/335]
 arch/x86/kvm/mmu/mmu.c:713:5: warning: no previous prototype for function
 'kvm_mmu_topup_memory_cache_for_split'
Message-ID: <202304070850.Ellbx2T4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   9b1b005c63f21cbc8dc4f1691b05964c90240385
commit: 775207f6d101d7d963d98bf833323efcec435c4d [312/335] [REVERTME] KVM: TDX, x86/tdp_mmu: Protect Secure-EPT page
config: x86_64-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070850.Ellbx2T4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/775207f6d101d7d963d98bf833323efcec435c4d
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 775207f6d101d7d963d98bf833323efcec435c4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070850.Ellbx2T4-lkp@intel.com/

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
