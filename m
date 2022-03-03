Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C93F33C7
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646308974; x=1677844974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lXtvB9t1j0bXqhZKa+njnqV4AMQsEuLXHq1KuXyGMV8=;
  b=EEx3A6MbHJaKb/j2xEtpSCuD17R8AmrEVSIS/XLyEpOv2AqPzmrcyrIt
   zpp9rWDA8tbF0YZNeGWaaYiI8dR50+c/4/qcAoaH7weCE9eFKlh86vs9D
   0CJ06DIn+23a/H0CLF9Th7OwPpwqchtdqZwLydq7/vvOoZ/OcnKX2/Yds
   ilFxpfTMEIVcU6bl01hS+FVeBOgmDObJ+m8kC4H44bDA/uzFoUFH8TidO
   6H0nBiSlngREXi9nGfeuQMZmMw0X2SedHriZ65YfPBuNTudUdF1yOmyDL
   zMMJ6O7gD7LVhA52+GGOblpqVjkpW3n9arkuQXblTrEKtsmDjYb0My09W
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="234269109"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="234269109"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 04:02:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="642093133"
Received: from lkp-server01.sh.intel.com (HELO ccb16ba0ecc3) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Mar 2022 04:02:52 -0800
Received: from kbuild by ccb16ba0ecc3 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPkAV-0000St-G6; Thu, 03 Mar 2022 12:02:51 +0000
Date: Thu, 3 Mar 2022 20:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 05/10] spi: aspeed: Add support for direct mapping
Message-ID: <202203031902.e9vpKoAW-lkp@intel.com>
References: <20220302173114.927476-6-clg@kaod.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302173114.927476-6-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Cédric,

I love your patch! Yet something to improve:

[auto build test ERROR on mtd/spi-nor/next]
[also build test ERROR on joel-aspeed/for-next v5.17-rc6 next-20220302]
[cannot apply to broonie-spi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/C-dric-Le-Goater/spi-spi-mem-Add-driver-for-Aspeed-SMC-controllers/20220303-013538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: arm64-randconfig-r023-20220303 (https://download.01.org/0day-ci/archive/20220303/202203031902.e9vpKoAW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/a107d6ec2c4377b805efb71d3ab7921d7a7e61a2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review C-dric-Le-Goater/spi-spi-mem-Add-driver-for-Aspeed-SMC-controllers/20220303-013538
        git checkout a107d6ec2c4377b805efb71d3ab7921d7a7e61a2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/spi/spi-aspeed-smc.c:474:17: error: incompatible function pointer types initializing 'ssize_t (*)(struct spi_mem_dirmap_desc *, u64, size_t, void *)' (aka 'long (*)(struct spi_mem_dirmap_desc *, unsigned long long, unsigned long, void *)') with an expression of type 'int (struct spi_mem_dirmap_desc *, u64, size_t, void *)' (aka 'int (struct spi_mem_dirmap_desc *, unsigned long long, unsigned long, void *)') [-Werror,-Wincompatible-function-pointer-types]
           .dirmap_read = aspeed_spi_dirmap_read,
                          ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +474 drivers/spi/spi-aspeed-smc.c

   468	
   469	static const struct spi_controller_mem_ops aspeed_spi_mem_ops = {
   470		.supports_op = aspeed_spi_supports_op,
   471		.exec_op = aspeed_spi_exec_op,
   472		.get_name = aspeed_spi_get_name,
   473		.dirmap_create = aspeed_spi_dirmap_create,
 > 474		.dirmap_read = aspeed_spi_dirmap_read,
   475	};
   476	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
