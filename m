Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C567C2D3;
	Sat,  8 Apr 2023 05:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680931897; x=1712467897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/LYeyFsXqvORZJLlT+nzpX9FMrn9jcR1VIBaRG2zbf8=;
  b=CAU0GS5Szqiy9FUlZWKOAp+QXMCxsWAnzCKnpYt2i2gfddCznXAToR2n
   8gz1iJ11hA5ZyCH805gJkF0T8q/b45Clwh6g4yPS2Hp2aHVHhSJ0NrHCQ
   ZR5G+Jzj2Fpco3IFlopWcbpC36ANsJrIuBpcCKE7+oeRKpDoAzu0M6zDD
   aS7FMaX8BSQfiZPPTw+0IHN638QDWpRECMew3y4GzR/EDXHfQmBxomKfL
   ZtLgBEcRBo5NEJ0b/yjS/d6y6YKrOo4eu6Gbh0Qb8b99yLh4h24/82M2F
   TlaLAiInijHzZ8D4Hv4BPTHyJzmUxKn8D75g8nqvtae40zPmdvQCi0ReM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="429400781"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="429400781"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 22:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="665103064"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="665103064"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2023 22:31:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl1Ai-000TNj-2o;
	Sat, 08 Apr 2023 05:31:32 +0000
Date: Sat, 8 Apr 2023 13:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
	srinivas.pandruvada@linux.intel.com, irenic.rajneesh@gmail.com,
	david.e.box@intel.com, hdegoede@redhat.com, markgross@kernel.org,
	rjw@rjwysocki.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/pmc/mtl: Put GNA/IPU/VPU devices in D3
Message-ID: <202304081356.jXr7C3fH-lkp@intel.com>
References: <20230408022629.727721-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408022629.727721-1-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4f59630a5ed0a4e7d275bd7e5d253a8f5a425c5a]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-pmc-mtl-Put-GNA-IPU-VPU-devices-in-D3/20230408-102651
base:   4f59630a5ed0a4e7d275bd7e5d253a8f5a425c5a
patch link:    https://lore.kernel.org/r/20230408022629.727721-1-david.e.box%40linux.intel.com
patch subject: [PATCH] platform/x86/intel/pmc/mtl: Put GNA/IPU/VPU devices in D3
config: i386-randconfig-a003-20230403 (https://download.01.org/0day-ci/archive/20230408/202304081356.jXr7C3fH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/04453d42ee1b0c97f9fa68644c6234f7b9e2d14a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-E-Box/platform-x86-intel-pmc-mtl-Put-GNA-IPU-VPU-devices-in-D3/20230408-102651
        git checkout 04453d42ee1b0c97f9fa68644c6234f7b9e2d14a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/intel/pmc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081356.jXr7C3fH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel/pmc/mtl.c:52:6: warning: no previous prototype for function 'mtl_set_device_d3' [-Wmissing-prototypes]
   void mtl_set_device_d3(unsigned int device)
        ^
   drivers/platform/x86/intel/pmc/mtl.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtl_set_device_d3(unsigned int device)
   ^
   static 
   1 warning generated.


vim +/mtl_set_device_d3 +52 drivers/platform/x86/intel/pmc/mtl.c

    48	
    49	#define MTL_GNA_PCI_DEV	0x7e4c
    50	#define MTL_IPU_PCI_DEV	0x7d19
    51	#define MTL_VPU_PCI_DEV	0x7d1d
  > 52	void mtl_set_device_d3(unsigned int device)
    53	{
    54		struct pci_dev *pcidev;
    55	
    56		pcidev = pci_get_device(PCI_VENDOR_ID_INTEL, device, NULL);
    57		if (pcidev) {
    58			if (!device_trylock(&pcidev->dev)) {
    59				pci_dev_put(pcidev);
    60				return;
    61			}
    62			if (!pcidev->dev.driver) {
    63				dev_info(&pcidev->dev, "Setting to D3hot\n");
    64				pci_set_power_state(pcidev, PCI_D3hot);
    65			}
    66			device_unlock(&pcidev->dev);
    67			pci_dev_put(pcidev);
    68		}
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
