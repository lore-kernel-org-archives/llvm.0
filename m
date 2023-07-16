Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0272715B6;
	Sun, 16 Jul 2023 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689476417; x=1721012417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6gmXWzouvLsNKnD81a1Yd4aov6VvLpGnEHIRYmb5P3A=;
  b=QEoYR+oEOkJesKbopChPVhhKLILBP1fMbsLC6uU17a1DgDl6/otmCDyH
   7kKr9QBEbhqUekAHd9oTrz9CQ6nz+eBZz7xS7SuTzBqjbRLLJmIlkpuk6
   e9OTWvhH6ufhS+E5LVqpwK/6VjMjl7NO1t75FYkCscEwV0U+YEpgv94Lf
   G+aXC6migwdPGxcp2loX0fShxxxGZyrQe56i+YCHp6R0pajiZENdRSl4+
   8xD7ZMuL8pB5VwHvkw9DssB3zJDvcpoawhXc7Ivh6F2qO6uN3tupnFHoE
   fp1JxM69BK9yGrnOR60siAeeJjVyjpC8dCxlTyb7GXDuOAiNFfTE0efvB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="364595519"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="364595519"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846879211"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="846879211"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 20:00:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrzW-0008VA-1A;
	Sun, 16 Jul 2023 03:00:10 +0000
Date: Sun, 16 Jul 2023 11:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 121/365]
 arch/x86/kvm/vmx/main.c:185:3: error: call to undeclared function
 'tdx_flush_tlb_current'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202307161021.ySLyEkqH-lkp@intel.com>
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
commit: 5f81f9f172b39f1502e95ae8e9120d71b7673e7e [121/365] KVM: TDX: TDP MMU TDX support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230716/202307161021.ySLyEkqH-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161021.ySLyEkqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161021.ySLyEkqH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/main.c:4:
   In file included from arch/x86/kvm/vmx/x86_ops.h:5:
   include/linux/kvm_host.h:2370:6: warning: no previous prototype for function 'kvm_arch_gmem_invalidate' [-Wmissing-prototypes]
   void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
        ^
   include/linux/kvm_host.h:2370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
   ^
   static 
>> arch/x86/kvm/vmx/main.c:185:3: error: call to undeclared function 'tdx_flush_tlb_current'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   tdx_flush_tlb_current(vcpu);
                   ^
   arch/x86/kvm/vmx/main.c:185:3: note: did you mean 'vmx_flush_tlb_current'?
   arch/x86/kvm/vmx/x86_ops.h:99:6: note: 'vmx_flush_tlb_current' declared here
   void vmx_flush_tlb_current(struct kvm_vcpu *vcpu);
        ^
   1 warning and 1 error generated.


vim +/tdx_flush_tlb_current +185 arch/x86/kvm/vmx/main.c

   181	
   182	static void vt_flush_tlb_current(struct kvm_vcpu *vcpu)
   183	{
   184		if (is_td_vcpu(vcpu)) {
 > 185			tdx_flush_tlb_current(vcpu);
   186			return;
   187		}
   188	
   189		vmx_flush_tlb_current(vcpu);
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
