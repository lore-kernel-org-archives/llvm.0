Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605D8539A
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647683178; x=1679219178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DznSXBW6WgwlRAPV7HhQaITcP1YKuLYmvBI2OudQVVg=;
  b=Uist/Z7ZuSI3GrqpxL5WmA+5oLuzewOLIWcPwH1wgHUuVwXIfJXm4VrT
   Gt4xh9kBlfR4bnxJXW8LytYNeD29ZryXHLqvPtwIoLE3K7Ywq6pM3JjDc
   WeKxIHVJX+M4Pr3u9tQqUKtf4cdqyb3aO4pj1pIMRva8PltyLpF0Kxd4b
   bYE3FW6mEAWIgv0KYmDKWJ/B1ZQYFkfO7rlC7arBW3WRNP5LxR6j006SC
   q8/edQoHV/jjPwyQgRiZE+Fvxbvx2SqUiBysAcatIUGynTUej9jAp2kfu
   cKwA3NKu558FjII4olXWkwVk3l3ZhxnRBFWME4mcTGXYlVCnuXXvnPho1
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="257012059"
X-IronPort-AV: E=Sophos;i="5.90,194,1643702400"; 
   d="scan'208";a="257012059"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 02:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,194,1643702400"; 
   d="scan'208";a="715841992"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Mar 2022 02:46:16 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVVf5-000Fqk-O3; Sat, 19 Mar 2022 09:46:15 +0000
Date: Sat, 19 Mar 2022 17:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 357/1007] ld.lld: error:
 undefined symbol: dwc3_gadget_exit_hibernation
Message-ID: <202203191751.mRZQaJ1I-lkp@intel.com>
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
head:   452ffbe114c20f1d744fda914d163c0a21b78d1a
commit: abcfc28b4d344d18ab4e5100b96045ebc203259c [357/1007] usb: dwc3: gadget: Add hibernation support when operating in gadget mode
config: arm-randconfig-r025-20220317 (https://download.01.org/0day-ci/archive/20220319/202203191751.mRZQaJ1I-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/abcfc28b4d344d18ab4e5100b96045ebc203259c
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout abcfc28b4d344d18ab4e5100b96045ebc203259c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_gadget_exit_hibernation
   >>> referenced by core.c
   >>>               usb/dwc3/core.o:(dwc3_remove) in archive drivers/built-in.a
   >>> referenced by core.c
   >>>               usb/dwc3/core.o:(dwc3_suspend) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
