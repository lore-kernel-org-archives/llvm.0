Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6357A
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 20:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655152983; x=1686688983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rQ9Lb1cz7/cScF4fg0LjwP19CrGz5y2aMB46aFaxk4=;
  b=W7YuoGnwMqaBa717n/lYsmCt5AUnegVnnN3t2Wffl86izQ2VOxXzoA6A
   mRFoZrBYKd1WBflKswGX0qNSPtqlFGDKVPhBZenbMwrVSX7XgIW+FCqDY
   dM8JaWhRn7z5xfb+7DakA1+RdFsp6KqaAcEOshK0m3MPnpSaZucjAqSnV
   D1N1pR8x4uIOSTv2Ey+b3vp9LThtVinMmL7IAiDudQ/C+KGfYcjPI2K2n
   gEwQG4m2sF+cFznydxKgnq2vgQCusAXGUMrAhUUI6JhA3n5CMUACApyqB
   neGKY0cPlVSkKnLpSZ17VH4TfevEFxnvuHnDPlb4bPhWTRkgAHves7O0d
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="364737353"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="364737353"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 13:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="582390100"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jun 2022 13:43:00 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0qtn-000L85-SN;
	Mon, 13 Jun 2022 20:42:59 +0000
Date: Tue, 14 Jun 2022 04:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 405/1105] ld.lld:
 error: undefined symbol: dwc3_host_wakeup_capable
Message-ID: <202206140426.QJU2g12T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piyush,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   0c564e7f31bf9e1d81376cb7562df7468a2e9cab
commit: 9a7535b91e5a749ad7e26fade0820c4c847ff8e2 [405/1105] usb: xhci-plat: Add remote wakeup support for xilinx
config: i386-randconfig-a003-20220613 (https://download.01.org/0day-ci/archive/20220614/202206140426.QJU2g12T-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout 9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_host_wakeup_capable
   >>> referenced by xhci-plat.c:104 (drivers/usb/host/xhci-plat.c:104)
   >>>               usb/host/xhci-plat.o:(xhci_plat_probe) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
