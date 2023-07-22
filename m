Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D01658;
	Sat, 22 Jul 2023 22:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690063770; x=1721599770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IbbooA24BW3DRb8EsvFDa0DpiGBuTapv6jp4b++QZ/E=;
  b=MzIMOtxnExJFYc1KQMfvU/270Cck8XVuSXn8hlkyEwSLj/cW9iEq+1ob
   SJ/puXNFMqtikSSreJWrXjNQBKh0IAkEN5mkuCx43tJs533p3n1n14Ime
   tiIYd5SKrCOD4rFMTq883et4ke+JdYI8uhVRhPcQjtFdELVEhmtCyddjK
   h4+hZF2Ca07cdirsyoqYRYjBXASgfu79rjxGg2l9a1x+ydNdtJuagwFaU
   Dd8BEgBVQ3PVxvFKU8ZSXp/0SaImo2UqgTXljoIFQsPFMdK3qC8asaqWX
   0mxWwEJHj88JsB1VXP+FfHWurp4v+2hJ3WtIEJc/iCBudqEhuw39l505q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="346832660"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="346832660"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 15:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="702426943"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="702426943"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Jul 2023 15:09:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNKn0-0008e5-1j;
	Sat, 22 Jul 2023 22:09:26 +0000
Date: Sun, 23 Jul 2023 06:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/apic 52/58] arch/x86/kernel/kvm.c:828:3: error: call
 to undeclared function 'apic_update_callback'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202307230549.ceKGSBc8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/apic
head:   11f85db0679f4f37798c648f3028126b6f7c6163
commit: 55cbab9af9e540fbbac9e7235315d03e8b654713 [52/58] x86/apic: Replace acpi_wake_cpu_handler_update() and apic_set_eoi_cb()
config: i386-randconfig-i016-20230720 (https://download.01.org/0day-ci/archive/20230723/202307230549.ceKGSBc8-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230549.ceKGSBc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230549.ceKGSBc8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/kvm.c:346:2: error: call to undeclared function 'apic_native_eoi'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           apic_native_eoi();
           ^
   arch/x86/kernel/kvm.c:346:2: note: did you mean 'apic_set_eoi'?
   arch/x86/include/asm/apic.h:429:20: note: 'apic_set_eoi' declared here
   static inline void apic_set_eoi(void (*eoi)(void)) {}
                      ^
>> arch/x86/kernel/kvm.c:828:3: error: call to undeclared function 'apic_update_callback'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   apic_update_callback(eoi, kvm_guest_apic_eoi_write);
                   ^
>> arch/x86/kernel/kvm.c:828:24: error: use of undeclared identifier 'eoi'; did you mean 'efi'?
                   apic_update_callback(eoi, kvm_guest_apic_eoi_write);
                                        ^~~
                                        efi
   include/linux/efi.h:671:3: note: 'efi' declared here
   } efi;
     ^
   3 errors generated.


vim +/apic_update_callback +828 arch/x86/kernel/kvm.c

   809	
   810	static void __init kvm_guest_init(void)
   811	{
   812		int i;
   813	
   814		paravirt_ops_setup();
   815		register_reboot_notifier(&kvm_pv_reboot_nb);
   816		for (i = 0; i < KVM_TASK_SLEEP_HASHSIZE; i++)
   817			raw_spin_lock_init(&async_pf_sleepers[i].lock);
   818	
   819		if (kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
   820			has_steal_clock = 1;
   821			static_call_update(pv_steal_clock, kvm_steal_clock);
   822	
   823			pv_ops.lock.vcpu_is_preempted =
   824				PV_CALLEE_SAVE(__kvm_vcpu_is_preempted);
   825		}
   826	
   827		if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
 > 828			apic_update_callback(eoi, kvm_guest_apic_eoi_write);
   829	
   830		if (kvm_para_has_feature(KVM_FEATURE_ASYNC_PF_INT) && kvmapf) {
   831			static_branch_enable(&kvm_async_pf_enabled);
   832			alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, asm_sysvec_kvm_asyncpf_interrupt);
   833		}
   834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
