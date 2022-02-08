Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1459D2F24
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 06:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644302180; x=1675838180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R2EpC7L9HPvI7a+HCeFp0P2eZxbITzHSWO9wr9DWlXk=;
  b=JKu6z3JPkp8W5JKLVMKXpalttlrV33HPHrL0oTzdVhp2SdfruuNKGuq0
   0Qv9zjhJi7XwXXaI1d/w20jEOCSCb/E4tPPURNmNVI3rGTdymqMnG6ST+
   tryZX6IWkWumrCUAj7R0pOMaq4g5L3nJpktFMhdr6+SKDkqoT0P9bbUFB
   WEDUr9ecENcNQbgo0oAqVjO82eE8kV9RsDzCkD0Fy1ixTG5M/Cf22iw7N
   PySXupjboCq3Sio9MJ8sZN/H/0GGAk6UrWsU0xwqxCSxSIG6NcOLGE7dc
   0CFlSsPRS1YDzlT/FeUVv5DrOGe4cCUJ+p+8eAoVUC/USKUzMsusqobYW
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="228853295"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="228853295"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 22:36:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="481842077"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2022 22:36:17 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHK6q-0001Rz-OR; Tue, 08 Feb 2022 06:36:16 +0000
Date: Tue, 8 Feb 2022 14:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 405/872] ld.lld: error: undefined
 symbol: dwc3_host_wakeup_capable
Message-ID: <202202081418.PWppIke1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: 9a7535b91e5a749ad7e26fade0820c4c847ff8e2 [405/872] usb: xhci-plat: Add remote wakeup support for xilinx
config: i386-randconfig-a005-20220207 (https://download.01.org/0day-ci/archive/20220208/202202081418.PWppIke1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout 9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_host_wakeup_capable
   >>> referenced by xhci-plat.c:104 (drivers/usb/host/xhci-plat.c:104)
   >>>               usb/host/xhci-plat.o:(xhci_plat_probe) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
