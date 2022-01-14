Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34768168
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642174271; x=1673710271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bSAWpk5exUrvJwtynC+kso0YpwfyiIgSS+oWwpLGr6U=;
  b=lkLrYJnY68XgB5Kc38EeVor4zCvBBFznVd+hbyPYGALIfDgN1V29WgXL
   dMtwEDsM/Yfo/N9X24/zbvdGLKoawk9aQKz29vzCBvDeolHEQf+y2G3ic
   FkpFjJaBqJgW4jDv8TjjAV0JjQ8AGPA2WivS5McLzeTV9xizYKU1j4v6y
   +shRQBtJ8pEQFpCkvUXYwfOhN8EZMDMS6I5MyvUT+mPtgTC9wCOkk58s7
   ZiQYGsk6dmtOkQLYLL42nefWbHk89xbGuJ3a23So9Ba02QgFsnujF5814
   HaZPpe2fVeZjkPr+COGisAE/cL7epaXwIj4h2feOe3nkeaQDpxqxKj1c+
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244060158"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="244060158"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 07:31:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="594068436"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jan 2022 07:31:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8OXk-0008gv-Lg; Fri, 14 Jan 2022 15:31:08 +0000
Date: Fri, 14 Jan 2022 23:30:08 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 157/326] ld.lld: error: undefined symbol:
 dwc3_host_wakeup_capable
Message-ID: <202201142314.1HlCefr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx master
head:   6a698dbaaf0e6caa053476c2f661b36885a0ce30
commit: 5b2efd9328312427b7830d41ce3c8dfec63457eb [157/326] usb: xhci-plat: Add remote wakeup support for xilinx
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220114/202201142314.1HlCefr5-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/5b2efd9328312427b7830d41ce3c8dfec63457eb
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 5b2efd9328312427b7830d41ce3c8dfec63457eb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_host_wakeup_capable
   >>> referenced by xhci-plat.c:94 (drivers/usb/host/xhci-plat.c:94)
   >>>               usb/host/xhci-plat.o:(xhci_plat_probe) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
