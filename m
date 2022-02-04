Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65D2F29
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 15:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643990254; x=1675526254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JPwpRS21AtpS7G52dTYDaQ+oac3H8lMvMGp+3z9cyPk=;
  b=GNLcqyrAXWkrgvaNLo1CvCVyHoRX33AiTG4zr4Q2EWroBed0U8eH2UUn
   z4/1Fn/g8/KsEnckorHAjHdfBu87l3I31PKJ+oPP9Vb/zYjl9qKDXngoc
   vhIqtdhfK3hxzu0Nf7GJNq218dSh6MAxbkhW4JDAWWVQtECyTdVeZFOSs
   9P9Y/FEn8OmP88axIOGgCnXnf4o+7w1rGPQFBWIzLyEIq5fP9OFQo0CZs
   iCDSsPY1a2FCLWThKoyUi9dC2Fkf6XNaoLP05Foo9hhAm5vGCNYZWD9Np
   UxIp51eQmF6T06XbIPCqKbfpAk5PoI+us1tUpvQ49bnTdcwYMgOokxcNS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248150380"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="248150380"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 07:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="535569119"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Feb 2022 07:57:32 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nG0xn-000Xpv-RP; Fri, 04 Feb 2022 15:57:31 +0000
Date: Fri, 4 Feb 2022 23:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 1/6] spi: tegra210-quad: use device_reset method
Message-ID: <202202042322.4epfxv0U-lkp@intel.com>
References: <1643970576-31503-2-git-send-email-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643970576-31503-2-git-send-email-kyarlagadda@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Krishna,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on v5.17-rc2 next-20220204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Krishna-Yarlagadda/Tegra-QUAD-SPI-combined-sequence-mode/20220204-183224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
config: hexagon-randconfig-r045-20220131 (https://download.01.org/0day-ci/archive/20220204/202202042322.4epfxv0U-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6bd51e7b07329b4ee4e90f5bc5aa8372ef26c999
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Krishna-Yarlagadda/Tegra-QUAD-SPI-combined-sequence-mode/20220204-183224
        git checkout 6bd51e7b07329b4ee4e90f5bc5aa8372ef26c999
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-tegra210-quad.c:950:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
           device_reset(tqspi->dev);
           ^~~~~~~~~~~~ ~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1270:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
           device_reset(tqspi->dev);
           ^~~~~~~~~~~~ ~~~~~~~~~~
   2 warnings generated.


vim +/warn_unused_result +950 drivers/spi/spi-tegra210-quad.c

   944	
   945	static void tegra_qspi_handle_error(struct tegra_qspi *tqspi)
   946	{
   947		dev_err(tqspi->dev, "error in transfer, fifo status 0x%08x\n", tqspi->status_reg);
   948		tegra_qspi_dump_regs(tqspi);
   949		tegra_qspi_flush_fifos(tqspi, true);
 > 950		device_reset(tqspi->dev);
   951	}
   952	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
