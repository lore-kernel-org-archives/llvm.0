Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D7168
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639679542; x=1671215542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i78bw1EveTIZHhwlVV38va56hcYFifYuMFI2oKImpqI=;
  b=JUL+5CBfF3SvisD9pC/J76CJIy7UN2QyR8oOAgN0GPcA2JBf3l7VxJNT
   sGABCGVOjldbKAxi6W0bVYvKu2Uui45lNo1MkXOQcjsc9H+bBNrCk07Np
   e3sdUj67arJnEKpiYCuX4zCx/hLknnBr57Q9AvoucNxGbDavMqJMHX8cv
   6HVv6by33IkMr639pHmpiZFBuwwKfKoI9XfeahqLrrzvVvH1M2ni72wHU
   EdK5m3Pw/YwdggLoLH2TZn4xRFGu+fcRqbs8XdE4tRLRu5DxdOMdoTd3f
   5KlTOxHVtbswv74fmaTHO2vwxXAUQKGTZk4doOsX5QdjWpN4l9Fng/zNr
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239790181"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="239790181"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 10:32:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="464792619"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Dec 2021 10:32:18 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxvY9-0003ev-DL; Thu, 16 Dec 2021 18:32:17 +0000
Date: Fri, 17 Dec 2021 02:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Huang <tonyhuang.sunplus@gmail.com>, robh+dt@kernel.org,
	devicetree@vger.kernel.org, linuxkernel@vger.kernel.org,
	derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com, arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, wells.lu@sunplus.com,
	tonyhuang@sunplus.com, Tony Huang <tonyhuang.sunplus@gmail.com>
Subject: Re: [PATCH v4 2/2] misc: Add iop driver for Sunplus SP7021
Message-ID: <202112170208.xrabSwww-lkp@intel.com>
References: <c3a3b64c38807b2f344c3df500eb4c60b885eadf.1639557112.git.tonyhuang.sunplus@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3a3b64c38807b2f344c3df500eb4c60b885eadf.1639557112.git.tonyhuang.sunplus@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tony,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on robh/for-next soc/for-next linus/master v5.16-rc5 next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tony-Huang/Add-iop-driver-for-Sunplus-SP7021/20211216-093835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git af40d16042d674442db8cf5fd654fabcd45fea44
config: hexagon-randconfig-r011-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170208.xrabSwww-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/916d31a2d28c9f0ad7d7073d7943b9cf656038f5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tony-Huang/Add-iop-driver-for-Sunplus-SP7021/20211216-093835
        git checkout 916d31a2d28c9f0ad7d7073d7943b9cf656038f5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/misc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/misc/sunplus_iop.c:475:34: warning: unused variable 'sp_iop_of_match' [-Wunused-const-variable]
   static const struct of_device_id sp_iop_of_match[] = {
                                    ^
   1 warning generated.


vim +/sp_iop_of_match +475 drivers/misc/sunplus_iop.c

   474	
 > 475	static const struct of_device_id sp_iop_of_match[] = {
   476		{ .compatible = "sunplus,sp7021-iop" },
   477		{ /* sentinel */ },
   478	};
   479	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
