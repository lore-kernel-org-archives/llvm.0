Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CC02908;
	Sat, 22 Jul 2023 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690041713; x=1721577713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YfGvbN0i7aatojzv6WqrqSLEMGR2xut6etBWbuv2aHM=;
  b=ZmccOKjJGxxgQc3IlTwiKRvN/YdPUpgJrEH8Vw35x0SujLJ4/HgblX/u
   FCy9G/OIYc6oK6e410piI1lPPymhEPi0cx5wgYCrLskzO9LmXzuXQionZ
   elMfNa6CwhiOuQzh/1iYBh/iZuhpFaNqvfWfKNFvqcs0VMylL8wtZRolA
   uYkq5TQHgr1bldKfzKRpUNknkWIBSUTMIih1t945Gww1Oi5IWI9s9l75y
   sXc41jqgofQ6w+LYqLs2sudskTycvPx5ySCrcN9KQymcnw2x8rGw+zIV1
   2Ht50IlxIEfNDHooj2zHmaJQYw0jNfufmsS8SQzKh9lIEBrBqCrcGB+ii
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="369876631"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="369876631"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 09:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="971776685"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="971776685"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jul 2023 09:01:51 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNF2l-0008Ql-1Y;
	Sat, 22 Jul 2023 16:01:32 +0000
Date: Sat, 22 Jul 2023 23:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/apic 49/58] arch/x86/kernel/kvm.c:346:2: error: call
 to undeclared function 'apic_native_eoi'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202307222339.Kvu4frnJ-lkp@intel.com>
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
commit: 8eaa7b40314e88ec2a0fa15d3b6b2fd99edee9d1 [49/58] x86/apic: Wrap apic->native_eoi() into a helper
config: i386-randconfig-i016-20230720 (https://download.01.org/0day-ci/archive/20230722/202307222339.Kvu4frnJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307222339.Kvu4frnJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307222339.Kvu4frnJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/kvm.c:346:2: error: call to undeclared function 'apic_native_eoi'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           apic_native_eoi();
           ^
   arch/x86/kernel/kvm.c:346:2: note: did you mean 'apic_set_eoi'?
   arch/x86/include/asm/apic.h:404:20: note: 'apic_set_eoi' declared here
   static inline void apic_set_eoi(void (*eoi)(void)) {}
                      ^
   arch/x86/kernel/kvm.c:828:3: error: call to undeclared function 'apic_set_eoi_cb'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   apic_set_eoi_cb(kvm_guest_apic_eoi_write);
                   ^
   arch/x86/kernel/kvm.c:828:3: note: did you mean 'apic_set_eoi'?
   arch/x86/include/asm/apic.h:404:20: note: 'apic_set_eoi' declared here
   static inline void apic_set_eoi(void (*eoi)(void)) {}
                      ^
   2 errors generated.


vim +/apic_native_eoi +346 arch/x86/kernel/kvm.c

   334	
   335	static notrace void kvm_guest_apic_eoi_write(void)
   336	{
   337		/**
   338		 * This relies on __test_and_clear_bit to modify the memory
   339		 * in a way that is atomic with respect to the local CPU.
   340		 * The hypervisor only accesses this memory from the local CPU so
   341		 * there's no need for lock or memory barriers.
   342		 * An optimization barrier is implied in apic write.
   343		 */
   344		if (__test_and_clear_bit(KVM_PV_EOI_BIT, this_cpu_ptr(&kvm_apic_eoi)))
   345			return;
 > 346		apic_native_eoi();
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
