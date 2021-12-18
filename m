Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE4168
	for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639838751; x=1671374751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkI1pnYDwa7m5gmUV5F7UzkWeSxPqkjb00XRLwdB0DU=;
  b=B/0gPFw7QYS2hwhO6ofkUA/jjeuljtguzNBUvdI8coHd588ziY0wdZek
   Gs28VGRnBPndv5TXFfqYHbE2mM9AdmvfV/x3fmDI0bv8NnzLeJhUzjnjv
   4oFwUSa1Py/lG6xPMpaxGFs6mgtKlOSdG7KRDZr8atpk0aeGPHxXN/81a
   e0gfp0SavwzLurjjnmqkX86tVr8dKRlAS4J4gLgXTZs2UF3tIyLSCAYR/
   2T6JDt7lUQbRIurGrL8mIi22xJuBtiQjA8C1pg3CddgCBjQ78NYU/OwnA
   /5b1i+5Tf2X/aqiVfVqnm1YOk3/DgzMreCiZzNuErtT66H4QFl+MdkUTp
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="238672524"
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="238672524"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2021 06:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="606187060"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2021 06:45:49 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myay4-00067w-EP; Sat, 18 Dec 2021 14:45:48 +0000
Date: Sat, 18 Dec 2021 22:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 1948/1981] ERROR: modpost:
 "dwc3_host_wakeup_capable" [drivers/usb/host/xhci-plat-hcd.ko] undefined!
Message-ID: <202112182246.5LteTDlT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: 492604057b5bb83840750d2f6d7bee1a4ed04462 [1948/1981] usb: xhci-plat: Add remote wakeup support for xilinx
config: x86_64-randconfig-a006-20211217 (https://download.01.org/0day-ci/archive/20211218/202112182246.5LteTDlT-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31a4814592bbda7153833e46728dc7b21100)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/492604057b5bb83840750d2f6d7bee1a4ed04462
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.10
        git checkout 492604057b5bb83840750d2f6d7bee1a4ed04462
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
