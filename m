Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1036C6A
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645624836; x=1677160836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/qSSnpLUbfFX9a8BtfSTz8AVBbrGO9SgUmwHWt9iN4=;
  b=FTxmvAaT2XmdW4mepa2KmF2ruuf1Pk7Y08PXuKF5FmpjNJT8Om9CD6VM
   bplAhg0iLwzKuNOfwtMgjZnU6O8hENmhY0E6cw6tkFzU9PTuB+ER8aqgE
   S1+UNXXIB+wCi5WU6EPNBhLKGL67tO6ndO3QQ12o/Uw7UEKuxfCD8c0Bi
   ygNoQhuzufEd+lEWTh2qVvPB+u6QsPxLg2n5yarRx8/rcxne1L1BcSuu3
   Iowfkp4lZpEHRl+GVDham6mUb/sSYH376/Br15mkcZ0wxLFX8Nb77SOK1
   h2agSO1TLNzgs27Ibp1sUvvw3YnTJIY3qzBYVGQOdeZ67Q41wELP8Iggc
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232588218"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="232588218"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="543322353"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Feb 2022 06:00:34 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMsC1-0001WJ-Vw; Wed, 23 Feb 2022 14:00:34 +0000
Date: Wed, 23 Feb 2022 22:00:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [lee-mfd:for-mfd-next 21/25] drivers/mfd/sprd-sc27xx-spi.c:255:35:
 error: redefinition of 'sprd_pmic_spi_ids'
Message-ID: <202202232155.xqGC3omU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   557bf686f1c6f8825ae44db732d42a60ad3b1437
commit: 6fc90b92e9c7ef3488e3ff7b6fa71f51a5272019 [21/25] mfd: sprd: Add SPI device ID table
config: riscv-randconfig-r042-20220221 (https://download.01.org/0day-ci/archive/20220223/202202232155.xqGC3omU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=6fc90b92e9c7ef3488e3ff7b6fa71f51a5272019
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch --no-tags lee-mfd for-mfd-next
        git checkout 6fc90b92e9c7ef3488e3ff7b6fa71f51a5272019
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mfd/sprd-sc27xx-spi.c:255:35: error: redefinition of 'sprd_pmic_spi_ids'
   static const struct spi_device_id sprd_pmic_spi_ids[] = {
                                     ^
   drivers/mfd/sprd-sc27xx-spi.c:242:35: note: previous definition is here
   static const struct spi_device_id sprd_pmic_spi_ids[] = {
                                     ^
   1 error generated.


vim +/sprd_pmic_spi_ids +255 drivers/mfd/sprd-sc27xx-spi.c

25ca4ae43466a4 Baolin Wang 2017-11-01  254  
c5c7f067710705 Mark Brown  2021-09-24 @255  static const struct spi_device_id sprd_pmic_spi_ids[] = {
c5c7f067710705 Mark Brown  2021-09-24  256  	{ .name = "sc2731", .driver_data = (unsigned long)&sc2731_data },
c5c7f067710705 Mark Brown  2021-09-24  257  	{},
c5c7f067710705 Mark Brown  2021-09-24  258  };
c5c7f067710705 Mark Brown  2021-09-24  259  MODULE_DEVICE_TABLE(spi, sprd_pmic_spi_ids);
c5c7f067710705 Mark Brown  2021-09-24  260  

:::::: The code at line 255 was first introduced by commit
:::::: c5c7f0677107052060037583b9c8c15d818afb04 mfd: sprd: Add SPI device ID table

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Lee Jones <lee.jones@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
