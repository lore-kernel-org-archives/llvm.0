Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09933FC
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649279867; x=1680815867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrpQ5ezVMod0EZ7kEBCjwgbdqTfIjM1UY/64zPPWcg4=;
  b=ABB1bS1jHuIQ81wTq+xQXm8DlnPeaDrrWm9yZdPRl+ecuI26MCC7wfOJ
   uodJTeI3evArxLDDVNzpfprHUYboDIKuSdQRGSgHtUs9Xu8oeI3T4QDDf
   PknVxxHJYaRAzEobS0e2hq8DxQaPuGZe3Ew1qlNBK1seXfJ8hC4VTUA5d
   F5CKa/F3pWmG1dUPgZ7JtNL8G6TF/XCn/nXp2yLbQiCmKJBH17sLFHIaI
   2AeBUa3PA2THl2Ec9EAbNja+7aWPzGIrRPDBQF9UoQz8TyyANGBBAOIXK
   YKtZWSCN4zx7S7hGX3/eqvXLCyWxYlpxvI8yGNUhXuyz7JBwJhRyGl/++
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347599141"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="347599141"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 14:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="505887734"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 06 Apr 2022 14:17:44 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncD28-0004m3-8E;
	Wed, 06 Apr 2022 21:17:44 +0000
Date: Thu, 7 Apr 2022 05:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 405/1080] ERROR: modpost:
 "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!
Message-ID: <202204070559.RZ0OAIGv-lkp@intel.com>
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
head:   6474115d882fd9e82731ac2473875dc3e8ac9acc
commit: 9a7535b91e5a749ad7e26fade0820c4c847ff8e2 [405/1080] usb: xhci-plat: Add remote wakeup support for xilinx
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220407/202204070559.RZ0OAIGv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout 9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
