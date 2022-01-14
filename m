Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7329CA
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 13:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642168150; x=1673704150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k6iPnGzDUUcdtMRiUl1y99z2KXez7zcf2T+HnGSIahw=;
  b=FXqcfhzIGR/w6uMTADnfYEDtzD2dRSD6A+KKZQ0bayR3G5GfXahnlJO3
   zhhY9S4lUzAbfGe/1NtGyL9wjxKmHtQplcyCKCaWAMWdu5pRP/3gHOQOz
   +T57AudRRE33AJqgxSpSVuxSyHDSZUhXDOicJbFfZNxFyBf3gzfoTv6Gv
   TDPHyZg9Ez6E5IE7o9FpaYSHK5AOufEcrSwKtFs43Ka+1j+G5E1XAORGl
   5Eps0tm8rSs15jyMBGh9m2PuPQeb2KyBh/x/WV6pt7u/Y1iw5hLXUHU6P
   VgB8wgowqLB7oLRajW8DyGWie6WaaxMCTO2Ixz1rG/aJxxh3YDuOx3kJu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244447597"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; 
   d="scan'208";a="244447597"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 05:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; 
   d="scan'208";a="765920045"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jan 2022 05:49:08 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8Mx0-0008cP-NK; Fri, 14 Jan 2022 13:49:06 +0000
Date: Fri, 14 Jan 2022 21:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 157/326] ERROR: modpost:
 "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!
Message-ID: <202201142131.Ms9Tqhl7-lkp@intel.com>
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
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220114/202201142131.Ms9Tqhl7-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
