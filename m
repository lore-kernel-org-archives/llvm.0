Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D19881F;
	Wed, 29 Mar 2023 21:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680125006; x=1711661006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PMUtGNlEn+RzS0WzdKvONqItA4qAznQYzEdeg/FztH0=;
  b=OMo8kNP+vaY/FJP0lXbtl73mNhG4GuZlU4F3388xmBi+lzb1e3x56wh0
   OXJgsOCggHqbGMxX1+anJKkH3EGAUK1QYrV6266X40AnbVa+H/5FMPdEB
   wGC83dzYniu6XqtkyiXHdskcvA+DXonPbbmjNcXIM4F/cQGPMsMs2JbSL
   gEzScj7RNbXP+nalP8pI0YXKB/nTxBqrjNXxyhysk3GClme6jpIJw8H98
   0srh8QENoU6OFGr6ygT0xhvogaRGan0r/sjpqnbBCvSmjw7lbLi+DJkmr
   TwBR3tgPlAAhjCOn4meZa5kVm30B4FSTuUHQtOiT7b7YZ5S1J7IrkwuUh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="341021056"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="341021056"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 14:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="808383728"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="808383728"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2023 14:23:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phdGD-000Jy0-0m;
	Wed, 29 Mar 2023 21:23:13 +0000
Date: Thu, 30 Mar 2023 05:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 308/328]
 arch/x86/kvm/mmu/mmu.c:713:5: error: no previous prototype for function
 'kvm_mmu_topup_memory_cache_for_split'
Message-ID: <202303300540.FAqmMv7i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   694338d50183e3371330efb5291e044153c7c615
commit: 7653c3c86b593d6f11fe78a5cc493330e1f230a8 [308/328] [REVERTME] KVM: TDX, x86/tdp_mmu: Protect Secure-EPT page
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230330/202303300540.FAqmMv7i-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/7653c3c86b593d6f11fe78a5cc493330e1f230a8
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 7653c3c86b593d6f11fe78a5cc493330e1f230a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300540.FAqmMv7i-lkp@intel.com/

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
