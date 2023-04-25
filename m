Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C4E7B;
	Tue, 25 Apr 2023 01:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682387112; x=1713923112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/jXleI9GwmcqLtXgfL/7yjD2FtE4H3Yr7AA1nGry5mk=;
  b=S9hs83JlW58q2P5P3TMMAjthpi5ZXBH0K4iIzytzcCRyy14UekrR7Rqn
   SmbtaR0Yl/nuj07n8uPy8dRyyMqL//9T6nOZx2nK5MNEpKD/YbqLCYLD7
   IrAaracpl3zx0WSUSO2o3ymCQqayWzFGZjrmXsm8VZK94mVMzxCZ3ikTL
   AsGyroKqVX3lJD0xCZuhZoHRe4cDQBKp5fSS9X/tG5hbA5rvCVwKP7XsS
   z5ZqdbRlB+UFsDxrLGubAdo63dvW4lyquudBgvuj/wyO6KKiNZBSCyJFA
   Z3WJ2kLvFpiqr4y9YixSl7OjCl77r+1Z0rSe1fD+XWOIuyUw+kvTFP8lw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326928500"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="326928500"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 18:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693296619"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="693296619"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Apr 2023 18:45:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr7jx-000ipc-17;
	Tue, 25 Apr 2023 01:45:09 +0000
Date: Tue, 25 Apr 2023 09:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 312/338]
 arch/x86/kvm/mmu/mmu.c:713:5: error: no previous prototype for function
 'kvm_mmu_topup_memory_cache_for_split'
Message-ID: <202304250958.VKhY2Q7l-lkp@intel.com>
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
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230425/202304250958.VKhY2Q7l-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250958.VKhY2Q7l-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/mmu/mmu.c:19:
   In file included from arch/x86/kvm/irq.h:15:
   In file included from include/linux/kvm_host.h:42:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:37:
   In file included from arch/x86/include/asm/kvm_para.h:10:
   arch/x86/include/asm/tdx.h:189:49: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                                struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
                                                                        ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:26:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:21:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:20:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(TDX_ERROR_BIT)
                                           ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
>> arch/x86/kvm/mmu/mmu.c:713:5: error: no previous prototype for function 'kvm_mmu_topup_memory_cache_for_split' [-Werror,-Wmissing-prototypes]
   int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
       ^
   arch/x86/kvm/mmu/mmu.c:713:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
   ^
   static 
   2 errors generated.


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
