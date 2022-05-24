Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B682569
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 17:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653412610; x=1684948610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mx3QA546r8/n2uO9HLARzYWOatD8S10c/ExqOVZtmhc=;
  b=k6hGob8UejI9443OHuWgOIKUIkQbdzv3a9vHOjQzODXqlswcU/ZCi/B6
   ResDuz69qX/HjGZHMD1xHsu88azcl8pVc0EdTr5+Ke9IHezhykEKd01tq
   fZwkxeWaHE5Ub/FfgmKmPQTJl15byhqUgy+5TaFIzteV+8iKEvM6T8YbT
   jcG2La3s40waosigBgVHvce2F2Li5ajPrm4j3Z7GbAHmAzwgSPj443kQu
   kc9DmyDOASOA5Vc9ynt36ghvWddyXsKtLehas4jDTHnjrCIuv/kOZC+tb
   p8jN7bV7O/nMlRDwRRioEWRRURe6HS5AZ/MYgyhtf3hmHsVJiKSi/3nnf
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="254092626"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="254092626"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 10:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="526487936"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 May 2022 10:16:48 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntY9H-0002Hq-OF;
	Tue, 24 May 2022 17:16:47 +0000
Date: Wed, 25 May 2022 01:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 405/1145] ERROR: modpost:
 "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!
Message-ID: <202205250143.gdtXIoZ1-lkp@intel.com>
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

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   a9ff6d0b21c8b2928d29ede9f74e1249fc953d44
commit: 9a7535b91e5a749ad7e26fade0820c4c847ff8e2 [405/1145] usb: xhci-plat: Add remote wakeup support for xilinx
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220525/202205250143.gdtXIoZ1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
