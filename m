Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC742CA7
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 05:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639720012; x=1671256012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rOzT3Jibg732gAKGPZtXH/imJT5RQv5h8jK/n78H17s=;
  b=l4p3QQVBmrlq3YTmf7MufmKvq7rzeLEvxhsZ+9vWCFLT9KPe/qXqseb7
   5y6CmWP0AB9BjBVDTu9N8gslPoG/ZCySVj+EMkW5WaYhsZzZKRxgfgtgA
   EG2w7AO+mujlsWuihdbHSwDDvI/kSmxlwam2gW52k8kotRj8j1BUYD1tm
   ckvsYPwceqivYAP+bTtHvZ5D9w+mlbO4saPMIf2GiBm8nthAVHoqNqxDO
   FCHhrhRUI/2BmlUZZOHypOQNmMA/00/uaG0z9jECZoBOlNkOc7dg+1vCs
   YvChQZvRqBVuJCuBzSO+P+AjX7qxZY9QV9XcP/f+bXVqJXrqSPmGBTuzv
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239909356"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="239909356"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 21:46:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="546284672"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2021 21:46:48 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1my64t-0004H4-L1; Fri, 17 Dec 2021 05:46:47 +0000
Date: Fri, 17 Dec 2021 13:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [intel-tdx:kvm-upstream 116/152] arch/x86/kvm/vmx/tdx_stubs.c:17:6:
 warning: no previous prototype for function 'tdx_handle_exit_irqoff'
Message-ID: <202112171316.zV7lPxFK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   bdfe06c17daab60c196ff80c1d98467a1d3734fa
commit: 23fe81f995e342b4152daa56cad4105a72277d4f [116/152] KVM: TDX: Add a place holder to handle TDX VM exit
config: x86_64-randconfig-a013-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171316.zV7lPxFK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/23fe81f995e342b4152daa56cad4105a72277d4f
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream
        git checkout 23fe81f995e342b4152daa56cad4105a72277d4f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kvm/vmx/tdx_stubs.c:4:13: warning: no previous prototype for function 'tdx_pre_kvm_init' [-Wmissing-prototypes]
   void __init tdx_pre_kvm_init(unsigned int *vcpu_size,
               ^
   arch/x86/kvm/vmx/tdx_stubs.c:4:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init tdx_pre_kvm_init(unsigned int *vcpu_size,
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:6:12: warning: no previous prototype for function 'tdx_hardware_setup' [-Wmissing-prototypes]
   int __init tdx_hardware_setup(struct kvm_x86_ops *x86_ops) { return -EOPNOTSUPP; }
              ^
   arch/x86/kvm/vmx/tdx_stubs.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init tdx_hardware_setup(struct kvm_x86_ops *x86_ops) { return -EOPNOTSUPP; }
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:7:6: warning: no previous prototype for function 'tdx_hardware_enable' [-Wmissing-prototypes]
   void tdx_hardware_enable(void) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:7:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_hardware_enable(void) {}
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:8:6: warning: no previous prototype for function 'tdx_hardware_disable' [-Wmissing-prototypes]
   void tdx_hardware_disable(void) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_hardware_disable(void) {}
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:10:5: warning: no previous prototype for function 'tdx_vcpu_create' [-Wmissing-prototypes]
   int tdx_vcpu_create(struct kvm_vcpu *vcpu) { return -EOPNOTSUPP; }
       ^
   arch/x86/kvm/vmx/tdx_stubs.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_vcpu_create(struct kvm_vcpu *vcpu) { return -EOPNOTSUPP; }
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:11:6: warning: no previous prototype for function 'tdx_vcpu_free' [-Wmissing-prototypes]
   void tdx_vcpu_free(struct kvm_vcpu *vcpu) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_vcpu_free(struct kvm_vcpu *vcpu) {}
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:12:6: warning: no previous prototype for function 'tdx_vcpu_reset' [-Wmissing-prototypes]
   void tdx_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:12:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event) {}
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:13:12: warning: no previous prototype for function 'tdx_vcpu_run' [-Wmissing-prototypes]
   fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu) { return EXIT_FASTPATH_NONE; }
              ^
   arch/x86/kvm/vmx/tdx_stubs.c:13:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu) { return EXIT_FASTPATH_NONE; }
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:14:6: warning: no previous prototype for function 'tdx_vcpu_load' [-Wmissing-prototypes]
   void tdx_vcpu_load(struct kvm_vcpu *vcpu, int cpu) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_vcpu_load(struct kvm_vcpu *vcpu, int cpu) {}
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:15:6: warning: no previous prototype for function 'tdx_vcpu_put' [-Wmissing-prototypes]
   void tdx_vcpu_put(struct kvm_vcpu *vcpu) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:15:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_vcpu_put(struct kvm_vcpu *vcpu) {}
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:16:6: warning: no previous prototype for function 'tdx_prepare_switch_to_guest' [-Wmissing-prototypes]
   void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:16:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu) {}
   ^
   static 
>> arch/x86/kvm/vmx/tdx_stubs.c:17:6: warning: no previous prototype for function 'tdx_handle_exit_irqoff' [-Wmissing-prototypes]
   void tdx_handle_exit_irqoff(struct kvm_vcpu *vcpu) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_handle_exit_irqoff(struct kvm_vcpu *vcpu) {}
   ^
   static 
>> arch/x86/kvm/vmx/tdx_stubs.c:18:5: warning: no previous prototype for function 'tdx_handle_exit' [-Wmissing-prototypes]
   int tdx_handle_exit(struct kvm_vcpu *vcpu,
       ^
   arch/x86/kvm/vmx/tdx_stubs.c:18:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_handle_exit(struct kvm_vcpu *vcpu,
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:21:6: warning: no previous prototype for function 'tdx_apicv_post_state_restore' [-Wmissing-prototypes]
   void tdx_apicv_post_state_restore(struct kvm_vcpu *vcpu) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:21:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_apicv_post_state_restore(struct kvm_vcpu *vcpu) {}
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:22:5: warning: no previous prototype for function 'tdx_deliver_posted_interrupt' [-Wmissing-prototypes]
   int tdx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector) { return 0; }
       ^
   arch/x86/kvm/vmx/tdx_stubs.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector) { return 0; }
   ^
   static 
>> arch/x86/kvm/vmx/tdx_stubs.c:23:6: warning: no previous prototype for function 'tdx_get_exit_info' [-Wmissing-prototypes]
   void tdx_get_exit_info(struct kvm_vcpu *vcpu, u32 *reason,
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_get_exit_info(struct kvm_vcpu *vcpu, u32 *reason,
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:26:5: warning: no previous prototype for function 'tdx_dev_ioctl' [-Wmissing-prototypes]
   int tdx_dev_ioctl(void __user *argp) { return -EOPNOTSUPP; }
       ^
   arch/x86/kvm/vmx/tdx_stubs.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_dev_ioctl(void __user *argp) { return -EOPNOTSUPP; }
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:27:5: warning: no previous prototype for function 'tdx_vm_ioctl' [-Wmissing-prototypes]
   int tdx_vm_ioctl(struct kvm *kvm, void __user *argp) { return -EOPNOTSUPP; }
       ^
   arch/x86/kvm/vmx/tdx_stubs.c:27:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_vm_ioctl(struct kvm *kvm, void __user *argp) { return -EOPNOTSUPP; }
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:28:72: error: use of undeclared identifier 'ENOPNOTSUPP'
   int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp) { return -ENOPNOTSUPP; }
                                                                          ^
   arch/x86/kvm/vmx/tdx_stubs.c:28:5: warning: no previous prototype for function 'tdx_vcpu_ioctl' [-Wmissing-prototypes]
   int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp) { return -ENOPNOTSUPP; }
       ^
   arch/x86/kvm/vmx/tdx_stubs.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp) { return -ENOPNOTSUPP; }
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:30:6: warning: no previous prototype for function 'tdx_flush_tlb' [-Wmissing-prototypes]
   void tdx_flush_tlb(struct kvm_vcpu *vcpu) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_flush_tlb(struct kvm_vcpu *vcpu) {}
   ^
   static 
   arch/x86/kvm/vmx/tdx_stubs.c:31:6: warning: no previous prototype for function 'tdx_load_mmu_pgd' [-Wmissing-prototypes]
   void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int root_level) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int root_level) {}
   ^
   static 
   21 warnings and 1 error generated.


vim +/tdx_handle_exit_irqoff +17 arch/x86/kvm/vmx/tdx_stubs.c

     9	
    10	int tdx_vcpu_create(struct kvm_vcpu *vcpu) { return -EOPNOTSUPP; }
    11	void tdx_vcpu_free(struct kvm_vcpu *vcpu) {}
    12	void tdx_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event) {}
    13	fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu) { return EXIT_FASTPATH_NONE; }
    14	void tdx_vcpu_load(struct kvm_vcpu *vcpu, int cpu) {}
    15	void tdx_vcpu_put(struct kvm_vcpu *vcpu) {}
    16	void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu) {}
  > 17	void tdx_handle_exit_irqoff(struct kvm_vcpu *vcpu) {}
  > 18	int tdx_handle_exit(struct kvm_vcpu *vcpu,
    19			enum exit_fastpath_completion fastpath) { return 0; }
    20	
    21	void tdx_apicv_post_state_restore(struct kvm_vcpu *vcpu) {}
    22	int tdx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector) { return 0; }
  > 23	void tdx_get_exit_info(struct kvm_vcpu *vcpu, u32 *reason,
    24			u64 *info1, u64 *info2, u32 *intr_info, u32 *error_code) {}
    25	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
