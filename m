Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549237485;
	Thu, 19 Jan 2023 15:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674140636; x=1705676636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/jmYwKB/Pimp+tNc+gKNHsoFeVQeHx30ZVEscbUBRrc=;
  b=JEGbMezy2c+8uvavVtCfm4p184+FlIxNp1Pja8xb/ohXtTFO8kkMdlGJ
   g+Nhpy549jUmQWiIuO1o7sYl+ymqUHcoLMfj97q9OGxu/XMQIwQgfD63J
   PPRBasdHxp1D1WzcnzEXc3Za3cauP4uz95oHeSwhXblLK6u639BasTzML
   vPc0Ddxg8Scof+pDVt7SMtHqbkKuGvG6MehTM35kZ5Z78/y5weKhw8XiO
   4DPGgagj8mbkoYckUB0i92sFAK++z7EsLnM8DmLoKtVEDungK02DGvwOn
   gBUCvuvr3eRHiex2YyieqzRAjOA78Zy9eTuD/znUeygCq4SOKds2tOeHD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326578174"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="326578174"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 06:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="610083166"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="610083166"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Jan 2023 06:28:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIVuQ-0001XM-2d;
	Thu, 19 Jan 2023 14:28:54 +0000
Date: Thu, 19 Jan 2023 22:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 5458/6276] idma64.c:undefined reference to
 `devm_platform_ioremap_resource'
Message-ID: <202301192229.wL7iPJxS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa5c49149a823599764e6953229b028e4bf6e9cc
commit: 4b23603a251d24022f2fa48ee67610eb245a4115 [5458/6276] dmaengine: drivers: Use devm_platform_ioremap_resource()
config: s390-randconfig-r044-20230119 (https://download.01.org/0day-ci/archive/20230119/202301192229.wL7iPJxS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4b23603a251d24022f2fa48ee67610eb245a4115
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4b23603a251d24022f2fa48ee67610eb245a4115
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/dma/idma64.o: in function `idma64_platform_probe':
>> idma64.c:(.text+0x6a): undefined reference to `devm_platform_ioremap_resource'
   s390x-linux-ld: drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0x3e): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: hidma.c:(.text+0x96): undefined reference to `devm_ioremap_resource'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
