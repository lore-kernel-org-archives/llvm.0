Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFDA882C;
	Fri, 10 Mar 2023 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678462416; x=1709998416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Mp5akE/ISTwieZ/580iRYwIhZzKBTLLo6Uloy3SLA8=;
  b=nCyUAnlkLhXsaZM5tWquggp7bKrUIl94u2eqA95WKw4+V2XvbKvZ9zm2
   76AFaC73UHNnXFXEl51POnOZnsOAbKaVn5EyMAWYy7Ti2Ce23xGXCMduX
   ayU7wumq9R8GzDGkQs6NJNPV8M3K80lYBTvn5NoHAqlSBrZ5ZG+7N08dQ
   KXNcm5LLKluMtUP8QwNhtcItH2sWTBkAk/UkZ8aCq4LcIVXm8q88+AtoT
   fl/WurNdZ9xJDsV3jU6ymVi6Yx041f7mmwk41ylgs0G/iEGKVs51YFUAE
   UpCcYjfrO1E6QsgMgcwsy8tzxxAiVJ7tyhUEwyZpTEq3lXej5LMc8OQDb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="339116053"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="339116053"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 07:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="710313439"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="710313439"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Mar 2023 07:33:22 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paekD-0003xP-32;
	Fri, 10 Mar 2023 15:33:21 +0000
Date: Fri, 10 Mar 2023 23:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 425/432]
 arch/x86/kvm/mmu/mmu.c:701:5: error: no previous prototype for function
 'kvm_mmu_topup_memory_cache_for_split'
Message-ID: <202303102326.ExMJk6LL-lkp@intel.com>
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
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230310/202303102326.ExMJk6LL-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102326.ExMJk6LL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/mmu/mmu.c:19:
   In file included from arch/x86/kvm/irq.h:15:
   In file included from include/linux/kvm_host.h:42:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:37:
   In file included from arch/x86/include/asm/kvm_para.h:10:
   arch/x86/include/asm/tdx.h:184:49: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
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
>> arch/x86/kvm/mmu/mmu.c:701:5: error: no previous prototype for function 'kvm_mmu_topup_memory_cache_for_split' [-Werror,-Wmissing-prototypes]
   int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
       ^
   arch/x86/kvm/mmu/mmu.c:701:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
   ^
   static 
   2 errors generated.


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
