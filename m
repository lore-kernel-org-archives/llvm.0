Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A8282F16;
	Sun,  3 May 2026 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777799359; cv=none; b=nEQxscwbewnBgYM72nnM6Eupnya6h94llQMUBKeZ+caTHab6IIEBHKXGV5p2Kxl41I+YYVTO5YVJrTmfJAZwx2WUerX0Z5KsRZ8spZKUVLIzEAMYR0L2NAMGcMqCeRjB8G5xGhevoMiHT2xdGslucwgwdJB+eEF5VQyTp6rx2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777799359; c=relaxed/simple;
	bh=IWqwaypOHCfBrNgrDcmE2EA6HyyKcoKgXyemtXcWeoQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TORJy/gvYIp3FWmyNnEpD07tVHwFkXVebqdEaVk+SB1SfaMLM6G/dOeqSsXVaPIoid8Rm7WRwjy1wtTeDLAja0ohe6bFRz3zJlv6Tus84dzDugGvAH8nEKP2qdm13rYznayVtZMwG1upEhiuw2p9aunLSKAiOkE7sdr+GmPk2dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbyF0b2N; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbyF0b2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777799358; x=1809335358;
  h=date:from:to:cc:subject:message-id;
  bh=IWqwaypOHCfBrNgrDcmE2EA6HyyKcoKgXyemtXcWeoQ=;
  b=IbyF0b2NMXFWghDfvdl3bYJojj4rpHe0Ioi2ktDCMYYelwKpbjfFiwiA
   /cyVlIUOPUNSJncy2pSvoEwnY4K5AYwa9JUnUtua0d23ox+VLxfNS2wWo
   IRONen79MjZ0kzdpktxS4QHjzizHAAycpUqaJ3IaM5eJWdlQiwK7Acm0M
   aiNw5KrR3XpznsL7IUBi0citJ0iu/j1MpJ2CqNToGuPbR+4oG2SdiX1AX
   XfgI/9hhggLO7NU07sh3DpqQ1QvbegON6f5806k+H+vJe6xbj84+cni/j
   oBSdGjbHRDRl6P1LVhO5/JNHzkVzy9R6+iQXy0ejO7CNlgiz68SQWSPBe
   g==;
X-CSE-ConnectionGUID: aly2F54ERFKJARdUFB0RCg==
X-CSE-MsgGUID: oB7KO0+BRGiF8FWgqeKZfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82561620"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="82561620"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 02:09:17 -0700
X-CSE-ConnectionGUID: 4ObbVpwVR7CjDMSRMKAEdA==
X-CSE-MsgGUID: +L8EmJpjS3aAEFqJHwGLaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="230893008"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 May 2026 02:09:16 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJSp8-000000005VZ-0jgH;
	Sun, 03 May 2026 09:09:14 +0000
Date: Sun, 03 May 2026 11:08:58 +0200
From: kernel test robot <lkp@intel.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: ld.lld: error: duplicate symbol: hv_build_devid_type_pci
Message-ID: <202605031145.isCXrMkx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mukesh-R/iommu-hyperv-rename-hyperv-iommu-c-to-hyperv-irq-c/20260503-090312
head:   f5351a96a6b1fd376b752c66714c4ae3b7598e18
commit: 28dd2164538308ef48df1f61c05c3cd1f6296c5f PCI: hv: Build device id for a VMBus device, export PCI devid function
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260503/202605031145.isCXrMkx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031145.isCXrMkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031145.isCXrMkx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/x86.c:80:
>> arch/x86/include/asm/mshyperv.h:277:5: warning: no previous prototype for function 'hv_build_devid_type_pci' [-Wmissing-prototypes]
     277 | u64 hv_build_devid_type_pci(struct pci_dev *pdev) { return 0; }
         |     ^
   arch/x86/include/asm/mshyperv.h:277:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     277 | u64 hv_build_devid_type_pci(struct pci_dev *pdev) { return 0; }
         | ^
         | static 
   1 warning generated.
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/vmx.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/hyperv.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/vmx.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/main.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/vmx.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/posted_intr.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/vmx.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/nested.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/vmx.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/vmx/pmu_intel.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/x86.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            arch/x86/kvm/hyperv.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            ./vmx/vmx.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            ./vmx/hyperv.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            ./vmx/vmx.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            ./vmx/main.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            ./vmx/vmx.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            ./vmx/posted_intr.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: hv_build_devid_type_pci
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            ./vmx/vmx.o:(hv_build_devid_type_pci)
   >>> defined at mshyperv.h:277 (arch/x86/include/asm/mshyperv.h:277)
   >>>            ./vmx/nested.o:(.text+0x10)
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
