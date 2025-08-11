Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C50296BC7;
	Mon, 11 Aug 2025 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944226; cv=none; b=kv1psWy9WHMCKg3low06Y+dhVfViiHEzmOJTJn3BVmUTalZOZK3Ldyiisijmdtcv06H49X5WRMMXdEketvBFAptdg8RPA1/85vHy/brkV24tXl8MsHSsZbPbqUlLLheqNKXQdcTjAZ+29DLK9yGiMEmBxP1j6ipNluZOSS29cUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944226; c=relaxed/simple;
	bh=tyB1z7RypJ7LHBDqbxI2KGeOCExRGOX0P9jrKJyF73g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/rjOHAUgvEmQq6SSxF/aAAl2hYJDP9j+ycXQzIE+wtD012fR3QPEe/oDwyVhssF++oe2ZYRc7cczIwgiloWrzBCiJr53f4RWzHGHCLRxJJamv9GXPcnsWY2nGkGC0OUfzPhCGDDeHYCTZic9+354aNWg7MiWHncNot1+nHSx1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrPd1Mz/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrPd1Mz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754944225; x=1786480225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tyB1z7RypJ7LHBDqbxI2KGeOCExRGOX0P9jrKJyF73g=;
  b=NrPd1Mz/HCf/9khfewa31kTgN+f4BeTAUr28WMABGzfOj4O4V7OyMZHl
   3bSW4mbh1bfR3wywe31koJLMnROyq1TJl/0XbHbWydKtEXDoTt5SSjpCa
   TsczmGazkEhXu3EkT9+zUZkQ5JbfjBXK60O1/b4Re5TH4HgnSZ4zHGfk+
   YklEPEE9+9jH8jLV3b/imo2kwrBx1dooHgVJjEJi+QZHmp3VEjq74s89N
   TOuronyLHPaR6fJpCeTrSIVcFBWTFTJ0h1CpdYOsB/r6JGmJQfSHiqYab
   IVeBVZ/9sdu3O+NlRafV+7z/Jf2ubRt38hMN39J3VoYjGQofYob4d8Cnp
   g==;
X-CSE-ConnectionGUID: C/zaVKYeTFyLj9i/nbr0hA==
X-CSE-MsgGUID: 6eQiiZffRoW/COqoacA7qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68662604"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68662604"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:30:24 -0700
X-CSE-ConnectionGUID: iX+AyHdnTP2pHwFxsrnY0Q==
X-CSE-MsgGUID: Sxz4Jj8LSSmjlSm24uaHXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166805514"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Aug 2025 13:30:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulZ9w-0006Cq-2C;
	Mon, 11 Aug 2025 20:30:20 +0000
Date: Tue, 12 Aug 2025 04:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_iommu_irqbypass_v1 35/40]
 arch/riscv/kvm/aia_imsic.c:772:5: error: conflicting types for
 'kvm_arch_update_irqfd_routing'
Message-ID: <202508120410.nrakcgKl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v1
head:   8fd5b5fd22d805ce6174ce2c76cb8340bbebea58
commit: 6d3ca4bfa0419b498e6f877bb13313d1c5ae3544 [35/40] RISC-V: KVM: Add irqbypass skeleton
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250812/202508120410.nrakcgKl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120410.nrakcgKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120410.nrakcgKl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/aia_imsic.c:772:5: error: conflicting types for 'kvm_arch_update_irqfd_routing'
     772 | int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
         |     ^
   include/linux/kvm_host.h:2395:6: note: previous declaration is here
    2395 | void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
         |      ^
   1 error generated.
--
   arch/riscv/kvm/vm.c:62:6: warning: no previous prototype for function 'kvm_arch_start_assignment' [-Wmissing-prototypes]
      62 | void kvm_arch_start_assignment(struct kvm *kvm)
         |      ^
   arch/riscv/kvm/vm.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | void kvm_arch_start_assignment(struct kvm *kvm)
         | ^
         | static 
   arch/riscv/kvm/vm.c:68:6: warning: no previous prototype for function 'kvm_arch_end_assignment' [-Wmissing-prototypes]
      68 | void kvm_arch_end_assignment(struct kvm *kvm)
         |      ^
   arch/riscv/kvm/vm.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | void kvm_arch_end_assignment(struct kvm *kvm)
         | ^
         | static 
   arch/riscv/kvm/vm.c:74:14: warning: no previous prototype for function 'kvm_arch_has_assigned_device' [-Wmissing-prototypes]
      74 | bool noinstr kvm_arch_has_assigned_device(struct kvm *kvm)
         |              ^
   arch/riscv/kvm/vm.c:74:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      74 | bool noinstr kvm_arch_has_assigned_device(struct kvm *kvm)
         | ^
         | static 
>> arch/riscv/kvm/vm.c:94:73: error: too many arguments to function call, expected 3, have 4
      94 |         ret = kvm_arch_update_irqfd_routing(irqfd->kvm, prod->irq, irqfd->gsi, true);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                    ^~~~
   include/linux/kvm_host.h:2395:6: note: 'kvm_arch_update_irqfd_routing' declared here
    2395 | void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
         |      ^                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2396 |                                    struct kvm_kernel_irq_routing_entry *old,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2397 |                                    struct kvm_kernel_irq_routing_entry *new);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vm.c:111:73: error: too many arguments to function call, expected 3, have 4
     111 |         ret = kvm_arch_update_irqfd_routing(irqfd->kvm, prod->irq, irqfd->gsi, false);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                    ^~~~~
   include/linux/kvm_host.h:2395:6: note: 'kvm_arch_update_irqfd_routing' declared here
    2395 | void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
         |      ^                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2396 |                                    struct kvm_kernel_irq_routing_entry *old,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2397 |                                    struct kvm_kernel_irq_routing_entry *new);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vm.c:114:20: error: no member named 'token' in 'struct irq_bypass_consumer'
     114 |                         irqfd->consumer.token, ret);
         |                         ~~~~~~~~~~~~~~~ ^
   include/linux/printk.h:587:34: note: expanded from macro 'pr_info'
     587 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~
   include/linux/printk.h:514:60: note: expanded from macro 'printk'
     514 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:486:19: note: expanded from macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   3 warnings and 3 errors generated.


vim +/kvm_arch_update_irqfd_routing +772 arch/riscv/kvm/aia_imsic.c

   771	
 > 772	int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
   773					  uint32_t guest_irq, bool set)
   774	{
   775		return -ENXIO;
   776	}
   777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
