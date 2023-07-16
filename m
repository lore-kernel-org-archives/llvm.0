Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB93915C2;
	Sun, 16 Jul 2023 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689476415; x=1721012415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZD+H0j2jc7YR1kJ0CmEhksETu+KFI+Hg8yxmZF5cZaI=;
  b=MQB7+v1FzYITwKoM/xU9PthjsAST5acEdaY99dmFjPGp88iaSGwfnamJ
   hmjv5pXvKtuALUtnVh5rnbzE6um3yfjnER5Yhta1+fR6LYYmLbEoxpwPi
   XKXNhgb5z/SkCBRckiTszPl//yvOtuJw9Up+tfGrC/nolb+hWEuRjNfQB
   Q02YDps7ueRoex37sfMrY+fHjzw3s2D2tc1AZE1cGBTeC1rQGwhAaxRkj
   1D29HOLFkTwFnTjQ+1UYhfO+R3/gN+AvsHPUI8Wz8z/7JWe7w5jAN+p2v
   1M8jpKNYe2UyeYGzcyzoNJvDUG8noppbA/EtudfXFN/5mH31t8seeLy0e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="350592464"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="350592464"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="673126051"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="673126051"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Jul 2023 20:00:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrzW-0008VC-1E;
	Sun, 16 Jul 2023 03:00:10 +0000
Date: Sun, 16 Jul 2023 11:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 41/365]
 include/linux/kvm_host.h:2369: multiple definition of
 `kvm_arch_gmem_invalidate';
 arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
Message-ID: <202307161032.J05sxPMz-lkp@intel.com>
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
commit: f3918645dc85801290d3e7cf1c2ce9e19b1d8489 [41/365] KVM: x86: Add gmem hook for invalidating private memory
config: s390-randconfig-r044-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161032.J05sxPMz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161032.J05sxPMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161032.J05sxPMz-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: virt/kvm/kvm_main.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: virt/kvm/eventfd.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: virt/kvm/binary_stats.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: virt/kvm/vfio.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: virt/kvm/async_pf.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: virt/kvm/irqchip.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/intercept.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/interrupt.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/priv.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/sigp.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/diag.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/gaccess.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/guestdbg.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/vsie.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/kvm/pv.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: arch/s390/pci/pci_kvm_hook.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here
   s390x-linux-ld: drivers/vfio/vfio_main.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/s390/kernel/nmi.o:include/linux/kvm_host.h:2369: first defined here


vim +2369 include/linux/kvm_host.h

  2368	
> 2369	void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
  2370	#endif /* CONFIG_KVM_PRIVATE_MEM */
  2371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
