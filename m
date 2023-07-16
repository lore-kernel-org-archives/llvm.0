Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F200185F;
	Sun, 16 Jul 2023 04:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689480316; x=1721016316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GGeANEBZw3MGUFWmx190LPQoMGrftxQu+BmTYNdQnEE=;
  b=MfnPcMPeeucI6QkqPPxMEiGj2bLt5Cx8g2zRPKvdiSaL5YKpCkSKrkwg
   NSLwXeFI9QFX7oNei7GXPVeQVTJBcnaN/vsg+H8Pmz3S2+tb4bYQ7Cm0d
   vcaPIAG3bNnPvD4oJsQe5vKGM3et0ZQKQj8a9mC4W5jI6urEI03PdYEPj
   kEFfJUJ/7TSOhCB8fh1oMuWoUmOlrDmA/C5PTbz9VNsLv7LcfLSb3RAET
   Y9/2+VZGZDFSAbD+9TXRkE/SoqDKIUwV7/Q+/+IjRyfD/cZ4vN187O2qD
   UBOYc/dcMghWezd7eLHJvcufEfmkAgbBp1GNQp9dzv7CEJUtVlXdU84+8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="452100830"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="452100830"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="673137838"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="673137838"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Jul 2023 21:05:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKt0T-0008Yj-0Z;
	Sun, 16 Jul 2023 04:05:13 +0000
Date: Sun, 16 Jul 2023 12:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 122/365]
 arch/x86/kvm/vmx/main.c:247:6: warning: no previous prototype for function
 'vt_set_memory_attributes'
Message-ID: <202307161113.f3EF293Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: 7ead2f69626501b5fc9041b2c111f6d082e23bc4 [122/365] KVM: TDX: implement set_memory_attributes() callback
config: x86_64-randconfig-x004-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161113.f3EF293Q-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161113.f3EF293Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161113.f3EF293Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/main.c:4:
   In file included from arch/x86/kvm/vmx/x86_ops.h:5:
   include/linux/kvm_host.h:2370:6: warning: no previous prototype for function 'kvm_arch_gmem_invalidate' [-Wmissing-prototypes]
   void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
        ^
   include/linux/kvm_host.h:2370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
   ^
   static 
   arch/x86/kvm/vmx/main.c:185:3: error: call to undeclared function 'tdx_flush_tlb_current'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   tdx_flush_tlb_current(vcpu);
                   ^
   arch/x86/kvm/vmx/main.c:185:3: note: did you mean 'vmx_flush_tlb_current'?
   arch/x86/kvm/vmx/x86_ops.h:99:6: note: 'vmx_flush_tlb_current' declared here
   void vmx_flush_tlb_current(struct kvm_vcpu *vcpu);
        ^
>> arch/x86/kvm/vmx/main.c:247:6: warning: no previous prototype for function 'vt_set_memory_attributes' [-Wmissing-prototypes]
   bool vt_set_memory_attributes(struct kvm *kvm, struct kvm_gfn_range *range)
        ^
   arch/x86/kvm/vmx/main.c:247:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool vt_set_memory_attributes(struct kvm *kvm, struct kvm_gfn_range *range)
   ^
   static 
   2 warnings and 1 error generated.


vim +/vt_set_memory_attributes +247 arch/x86/kvm/vmx/main.c

   246	
 > 247	bool vt_set_memory_attributes(struct kvm *kvm, struct kvm_gfn_range *range)
   248	{
   249		if (is_td(kvm))
   250			return tdx_set_memory_attributes(kvm, range);
   251	
   252		if (kvm->arch.vm_type == KVM_X86_PROTECTED_VM)
   253			return kvm_unmap_gfn_range(kvm, range);
   254		return false;
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
