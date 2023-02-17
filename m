Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8D945D;
	Fri, 17 Feb 2023 20:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676664710; x=1708200710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9LUN89DSZ1QfQP+Q9DsmorlWjxFUk997aD0KYbzvtQ=;
  b=Ju8bmMD0AlNT7i5ns4cXfyW4TVvzahTsucka8h+tJEUXE95cPbn2acTU
   i7h+bMcBMfaEKzSOLQIMLPjCJU9aKnFIbwTqr4YWBczuCYij7TLTZxErQ
   +VVpEq0l1CJpvZ+6F+7YNPmYvRWbbT47/tPAKFeUw4L6shB4VdfLogFGz
   VntRwOYDIxttO2mHfwsHteYfPpEwABx/X6Zkpd4Ec+cR7Y1894ieyfyoH
   Tv4krtyRJukM207bScEyCa7qElM6KUOZCWDVWzJ+7AqYqM+hPKV8yNjO3
   s4xg9V839UqF+0IWHUv5shrwgLwQ+nvO14WmSHixmEwWz1+H2pfr1d/WX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332085870"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="332085870"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 12:11:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="703051666"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="703051666"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Feb 2023 12:11:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT74u-000BmJ-1z;
	Fri, 17 Feb 2023 20:11:32 +0000
Date: Sat, 18 Feb 2023 04:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 174/615]
 ld.lld: error: undefined symbol: dw_edma_probe
Message-ID: <202302180421.a4BgV2ML-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
head:   04e5048badb91c86b22993d0d9fd1bf8b79c0d91
commit: bd02af3b08bb2461727a50b38ea4fcd0f337a795 [174/615] PCI: dwc: Add DW eDMA engine support
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230218/202302180421.a4BgV2ML-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/bd02af3b08bb2461727a50b38ea4fcd0f337a795
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout bd02af3b08bb2461727a50b38ea4fcd0f337a795
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180421.a4BgV2ML-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dw_edma_probe
   >>> referenced by pcie-designware.c:953 (drivers/pci/controller/dwc/pcie-designware.c:953)
   >>>               vmlinux.o:(dw_pcie_edma_detect)
   >>> did you mean: dw_dma_probe
   >>> defined in: vmlinux.o
--
>> ld.lld: error: undefined symbol: dw_edma_remove
   >>> referenced by pcie-designware.c:968 (drivers/pci/controller/dwc/pcie-designware.c:968)
   >>>               vmlinux.o:(dw_pcie_edma_remove)
   >>> did you mean: dw_dma_remove
   >>> defined in: vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
