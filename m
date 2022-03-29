Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD7210B
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648572441; x=1680108441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x4xW1iXRBcEzrcljd+0udoAqP1+SV1rmh/C3f2hHDFI=;
  b=e3SJQrQbPUp9601A9JhBFPsWSR5uZzDDaQ3ni+4Bou4Z8X1JsbfPgbrF
   NHwT1f8kJ89NYdATdImCALTb+L11QefkSapUe4DyLEdnj9i1w2BA2+RQ9
   PfRuLx/rGTLNst5RPRiz25C0QVgE2pVMmToHHAEHyIn5ZkC8CHtL+LOUR
   Q2DD+PkhNOSYEogmuh5QAyX1I8IV6IMD2QwW0uSH5kqg5YRCITzNov/xI
   xsmH4/LqjWtZdAm859rsAX2sU/fsu+PsTDpjXfpfqVGSfMv0ouCI63bPn
   xcr1RydHef8fozQiL+bHyOG57WU9Jp9c3Ii+vwqtBI8gCywSpPwyiCKay
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="258134343"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="258134343"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 09:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="546463690"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Mar 2022 09:45:55 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZEyg-0000Sy-N4; Tue, 29 Mar 2022 16:45:54 +0000
Date: Wed, 30 Mar 2022 00:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 404/1039] ERROR: modpost:
 "dwc3_host_wakeup_register" [drivers/usb/dwc3/dwc3-xilinx.ko] undefined!
Message-ID: <202203300053.z8AXCMv8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   ea33365bd1a8cf667a122498e8f551df05609f92
commit: db6b55a74c709a27fdf6d175f890568dc8945424 [404/1039] usb: dwc3: Added remote wake-up in xilinx glue driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220330/202203300053.z8AXCMv8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/db6b55a74c709a27fdf6d175f890568dc8945424
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout db6b55a74c709a27fdf6d175f890568dc8945424
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_host_wakeup_register" [drivers/usb/dwc3/dwc3-xilinx.ko] undefined!
--
>> drivers/usb/dwc3/dwc3-xilinx.c:508:6: warning: no previous prototype for function 'dwc3_xilinx_wakeup_capable' [-Wmissing-prototypes]
void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
^
drivers/usb/dwc3/dwc3-xilinx.c:508:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
void dwc3_xilinx_wakeup_capable(struct device *dev, bool wakeup)
^
static
1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
