Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50667E4;
	Tue,  6 Jun 2023 23:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686093863; x=1717629863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bS8+LPNAzSkkuMeDOOKbjmK9t6jI1KPWH2K50C2E05k=;
  b=QujqaY/u5TjulJso9s5UCQIgz4EuPCqGC8Wk4m3bedZEpwKTKJK9aEOb
   diypwLmyoMEfEldV/DZ0qko0SdW+csPD8IXdZv2cvIX4m6B+UPOFzYuY2
   wH7yZ8SKdegcmxw1gGrzT0DzWs8BacnfE8aoS7c4hgCePrizaY+u9N0/T
   Ui501LnbHNxGU04Li0FPyaf8nlhcBILHXfG1PKIbFhHqDut5+EgJ7jkw0
   Vpfgf5iheH68zpYp7Sgg57vXBmJArRitK2grQm5seVlXVSzsgPo30bLvP
   OcGQvKeatGa7sPdI+ylWxfL/ltn8qQllCrVr/hLWfMewpoXV4FcZi/dTl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="355677336"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="355677336"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 16:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="833432184"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="833432184"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Jun 2023 16:24:20 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6g2F-0005rP-2n;
	Tue, 06 Jun 2023 23:24:19 +0000
Date: Wed, 7 Jun 2023 07:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: William Qiu <william.qiu@starfivetech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [broonie-ci:v2_20230602_william_qiu_add_initialization_of_clock_for_starfive_jh7110_soc
 24/25] drivers/spi/spi-cadence-quadspi.c:1873:3: warning: ignoring return
 value of function declared with 'warn_unused_result' attribute
Message-ID: <202306070721.Sxi9bH0c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20230602_william_qiu_add_initialization_of_clock_for_starfive_jh7110_soc
head:   f14f4e2369847daadb4f776484172385545dd6d0
commit: 646d067b9269079d8913cea3b19b7626848405ec [24/25] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
config: i386-randconfig-i016-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070721.Sxi9bH0c-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=646d067b9269079d8913cea3b19b7626848405ec
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci v2_20230602_william_qiu_add_initialization_of_clock_for_starfive_jh7110_soc
        git checkout 646d067b9269079d8913cea3b19b7626848405ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070721.Sxi9bH0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-cadence-quadspi.c:1873:3: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
                   clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
                   ^~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/warn_unused_result +1873 drivers/spi/spi-cadence-quadspi.c

  1865	
  1866	static int cqspi_resume(struct device *dev)
  1867	{
  1868		struct cqspi_st *cqspi = dev_get_drvdata(dev);
  1869		struct spi_master *master = dev_get_drvdata(dev);
  1870	
  1871		clk_prepare_enable(cqspi->clk);
  1872		if (of_device_is_compatible(dev->of_node, "starfive,jh7110-qspi"))
> 1873			clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
  1874		cqspi_wait_idle(cqspi);
  1875		cqspi_controller_init(cqspi);
  1876	
  1877		cqspi->current_cs = -1;
  1878		cqspi->sclk = 0;
  1879	
  1880		return spi_master_resume(master);
  1881	}
  1882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
