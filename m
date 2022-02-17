Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285F43B48
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645081626; x=1676617626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aIAIHiSYFQs1OHO8vn3EML5N+RuWuBiMvLCuRRsbiQw=;
  b=bsnwByORsjByS9SwMaYeQl+Q5bwoXxZvOCdfrr0/kA7YNFG+FDR+4KPp
   vnmFr/Rht36sp8oV/mXW41swW3GN+hbVB7u7sX+nAMje75jZmNLdluZ66
   /kSnM9K8cur59FCt4CJLaBw9/fQgCQnbmQixETNaT7EmJZUfceVW97aT+
   7MCvrgnYn35Cvxqw1eFqfvpV7pLLN+svB7BNfADozN6BvvyUSKzuPB1mR
   16MFAHHZ421yYJSjkjGNLU1Bs5P03tEvw5SXkioQ/pNw9peSXPcqLOGyW
   MdHcsQgH1LEtLxRQVAPjT7+zgphOtOgDUFVIpHmqZ4s6geDZMWsC/MWQq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="314079846"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="314079846"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 23:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="776955949"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2022 23:07:03 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKasZ-000BYK-1x; Thu, 17 Feb 2022 07:07:03 +0000
Date: Thu, 17 Feb 2022 15:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Bornyakov <i.bornyakov@metrotek.ru>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: drivers/fpga/microchip-spi.c:341:34: warning: unused variable
 'mpf_of_ids'
Message-ID: <202202171552.gFz6PXXK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20220217-002021/Ivan-Bornyakov/fpga-microsemi-spi-add-Microsemi-FPGA-manager/20220214-222923
head:   6acf97cc27bd55298cb9d6a365b078b09e2b6acf
commit: 6acf97cc27bd55298cb9d6a365b078b09e2b6acf fpga: microchip-spi: add Microchip FPGA manager
date:   15 hours ago
config: mips-randconfig-r006-20220217 (https://download.01.org/0day-ci/archive/20220217/202202171552.gFz6PXXK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/6acf97cc27bd55298cb9d6a365b078b09e2b6acf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review UPDATE-20220217-002021/Ivan-Bornyakov/fpga-microsemi-spi-add-Microsemi-FPGA-manager/20220214-222923
        git checkout 6acf97cc27bd55298cb9d6a365b078b09e2b6acf
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/fpga/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/fpga/microchip-spi.c:341:34: warning: unused variable 'mpf_of_ids' [-Wunused-const-variable]
   static const struct of_device_id mpf_of_ids[] = {
                                    ^
   1 warning generated.


vim +/mpf_of_ids +341 drivers/fpga/microchip-spi.c

   340	
 > 341	static const struct of_device_id mpf_of_ids[] = {
   342		{ .compatible = "microchip,mpf-spi-fpga-mgr" },
   343		{},
   344	};
   345	MODULE_DEVICE_TABLE(of, mpf_of_ids);
   346	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
