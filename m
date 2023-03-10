Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92595848C;
	Fri, 10 Mar 2023 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678458033; x=1709994033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uxbeE3FAZbOOcKU8f7Pwu/IY2hjOdxGpCVrvdRTHmSI=;
  b=WGb0B/WhX+nvzwxi+Tlhe38r+u1c2Qe2S8BeyKoTq++lO/bnK67nrcAm
   egjVI89ErhUDzAtahaPbzZfIsKG3vogGeOzuGt1aHVURMDuvWhe+ILU42
   X0YR6BTx+FEQEiR4lHAhOUkJ5qhi85Cptnh9Qqe4AkcML3+T3GtmlwCF1
   y2VpKAVh3EyNsGhdIpvy+x/dnuO1tJpGhbOTnx6przp5OCq7dVKkQztfw
   9f/QalLYvTO06gxnPypuzTnNysZ4h+bbH21WnZWZXokt1UoJIJIfx9aAp
   AQC/uIBj429BueQ+uOkD0fXE7CUuRD3d0wZM4Z2xlMj3U4FA/pMQPCYju
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401595265"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="401595265"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 06:20:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="671095624"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="671095624"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Mar 2023 06:20:20 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1padbY-0003uN-0h;
	Fri, 10 Mar 2023 14:20:20 +0000
Date: Fri, 10 Mar 2023 22:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 172/432]
 arch/x86/include/asm/tdx.h:114:49: error: shift count >= width of type
Message-ID: <202303102255.bbPxT7IW-lkp@intel.com>
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
commit: e83792bfbe07a14fa2c616e2aad763434062b3c0 [172/432] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230310/202303102255.bbPxT7IW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/e83792bfbe07a14fa2c616e2aad763434062b3c0
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout e83792bfbe07a14fa2c616e2aad763434062b3c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102255.bbPxT7IW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/kvm-asm-offsets.c:10:
   In file included from arch/x86/kvm/vmx/vmx.h:5:
   In file included from include/linux/kvm_host.h:42:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:37:
   In file included from arch/x86/include/asm/kvm_para.h:10:
>> arch/x86/include/asm/tdx.h:114:49: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                                struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
                                                                        ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:24:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:20:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:19:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   1 error generated.


vim +114 arch/x86/include/asm/tdx.h

   102	
   103	#ifdef CONFIG_INTEL_TDX_HOST
   104	bool platform_tdx_enabled(void);
   105	int tdx_cpu_enable(void);
   106	int tdx_enable(void);
   107	u64 __seamcall(u64 op, u64 rcx, u64 rdx, u64 r8, u64 r9,
   108		       struct tdx_module_output *out);
   109	#else	/* !CONFIG_INTEL_TDX_HOST */
   110	static inline bool platform_tdx_enabled(void) { return false; }
   111	static inline int tdx_cpu_enable(void) { return -EINVAL; }
   112	static inline int tdx_enable(void)  { return -EINVAL; }
   113	static inline u64 __seamcall(u64 op, u64 rcx, u64 rdx, u64 r8, u64 r9,
 > 114				     struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
   115	#endif	/* CONFIG_INTEL_TDX_HOST */
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
