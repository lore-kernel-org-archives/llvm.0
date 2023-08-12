Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495681CCCC;
	Sat, 12 Aug 2023 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691865984; x=1723401984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34tRD8ohJc7MZ6k9xJhASxpxo0NGFJn8XECEPwq0ntw=;
  b=eDYmBYvTnDRXVTU5pbahXaV18CLrt6pSdyPdD4z4GRJWwBEWvXVtdn6Z
   hKICYL+i/qEO5cD+jlhN8jJX8OKDmPFvywnMUH4O9sXVRIBzBsjrdQZCo
   Ea6i5tImu93IhB4Gac1UH735vdqoxPEDPrSYgHriG1osg2Np5Yp3qBqHc
   XR8+3ou95JBqDNu9Lf9oH3ekLf8n57f2+IRhVxNCsDuVRQK7340YKDjig
   iQ0c7E0/N6ObHoiYem65EzA7LPjSEwYXQYGDYTtOiACT/HcyPpOrKdRti
   q1EjpLxkADuVKe1iZQGoth5SnqfWNu9T+FmVKEBsemz0WWG6FxKrFpDh+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="374609493"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="374609493"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 11:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="762505662"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="762505662"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Aug 2023 11:46:21 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUtcy-0008jY-1z;
	Sat, 12 Aug 2023 18:46:20 +0000
Date: Sun, 13 Aug 2023 02:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Plourde <gplourde@protonmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/173 1/1] drivers/iommu/Kconfig:10:error: recursive
 dependency detected!
Message-ID: <202308130255.xFTSvMMC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guillaume,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/AsahiLinux/linux pr/173
head:   1f19eaee9273fecb39d62f50b8f217580716c384
commit: 1f19eaee9273fecb39d62f50b8f217580716c384 [1/1] Update DRM_ASAHI deps
config: i386-randconfig-i013-20230812 (attached as .config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130255.xFTSvMMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130255.xFTSvMMC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/Kconfig:10:error: recursive dependency detected!
   drivers/iommu/Kconfig:10:	symbol IOMMU_SUPPORT is selected by DRM_ASAHI
   drivers/gpu/drm/asahi/Kconfig:16:	symbol DRM_ASAHI depends on OF
   drivers/of/Kconfig:5:	symbol OF is selected by X86_INTEL_CE
   arch/x86/Kconfig:601:	symbol X86_INTEL_CE depends on X86_IO_APIC
   arch/x86/Kconfig:1114:	symbol X86_IO_APIC depends on X86_LOCAL_APIC
   arch/x86/Kconfig:1109:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
   arch/x86/Kconfig:1084:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
   drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
   drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +10 drivers/iommu/Kconfig

68255b628776df Joerg Roedel    2011-06-14 @10  menuconfig IOMMU_SUPPORT
68255b628776df Joerg Roedel    2011-06-14  11  	bool "IOMMU Hardware Support"
e5144c93758519 Arnd Bergmann   2015-01-28  12  	depends on MMU
68255b628776df Joerg Roedel    2011-06-14  13  	default y
a7f7f6248d9740 Masahiro Yamada 2020-06-14  14  	help
68255b628776df Joerg Roedel    2011-06-14  15  	  Say Y here if you want to compile device drivers for IO Memory
68255b628776df Joerg Roedel    2011-06-14  16  	  Management Units into the kernel. These devices usually allow to
68255b628776df Joerg Roedel    2011-06-14  17  	  remap DMA requests and/or remap interrupts from other devices on the
68255b628776df Joerg Roedel    2011-06-14  18  	  system.
68255b628776df Joerg Roedel    2011-06-14  19  

:::::: The code at line 10 was first introduced by commit
:::::: 68255b628776dfafa7f67ca3afd66bd4ba377307 iommu: Move iommu Kconfig entries to submenu

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
