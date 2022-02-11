Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DDA7E
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 19:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644607929; x=1676143929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iyW30ZO7r4Fd21o5Ux+VD7Pk0FrFgMzRvP+brrRqTm8=;
  b=mG+dvx/TarVIi6BBHPVxQ/g0r8IvuU3f6vJAWYWZ1nyH8mkDei4igS4S
   jF2IE3nvqGUzztwLGvKtgkBPwnaWg/oB5z+2dhQNPVE+qf6i9ePo8KH9J
   GQTqvS8TKeTZaimrsktVyDZplpStr59R+8VbW7ZW9W/WqknTschU1ylhR
   spoRdqphpWXceJi4kGt24uuV7nTqGhHdFhWoR0rgzq/eSyfY2whLqL/Ia
   pQNB2xe68VNBPoNGMSaZ46Jx4FBc+XjlNfufhFDDlXBJm3U0em0m+IdHY
   15aABfdNxxf8PeYON+EYYbSrCdBXq+mPUMXihtlGvEh2Sbsic/mVPgH6C
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="229761760"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="229761760"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 11:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="527073405"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Feb 2022 11:32:05 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIbeH-00055L-2D; Fri, 11 Feb 2022 19:32:05 +0000
Date: Sat, 12 Feb 2022 03:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Subject: Re: [PATCH v2 3/3] spi: amd: Add support for version AMDI0062
Message-ID: <202202120307.tqHogZDg-lkp@intel.com>
References: <20220211143155.75513-4-andrealmeid@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220211143155.75513-4-andrealmeid@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "André,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andr-Almeida/spi-amd-Add-support-for-new-controller-version/20220211-223438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
config: arm64-randconfig-r015-20220211 (https://download.01.org/0day-ci/archive/20220212/202202120307.tqHogZDg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/f9ba9fa1166540cf4dbf3ffbddb96b55699479b5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andr-Almeida/spi-amd-Add-support-for-new-controller-version/20220211-223438
        git checkout f9ba9fa1166540cf4dbf3ffbddb96b55699479b5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-amd.c:296:21: warning: cast to smaller integer type 'enum amd_spi_versions' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           amd_spi->version = (enum amd_spi_versions) device_get_match_data(dev);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-amd.c:333:23: error: use of undeclared identifier 'spi_acpi_match'
                   .acpi_match_table = spi_acpi_match,
                                       ^
   1 warning and 1 error generated.


vim +296 drivers/spi/spi-amd.c

   272	
   273	static int amd_spi_probe(struct platform_device *pdev)
   274	{
   275		struct device *dev = &pdev->dev;
   276		struct spi_master *master;
   277		struct amd_spi *amd_spi;
   278		int err = 0;
   279	
   280		/* Allocate storage for spi_master and driver private data */
   281		master = spi_alloc_master(dev, sizeof(struct amd_spi));
   282		if (!master) {
   283			dev_err(dev, "Error allocating SPI master\n");
   284			return -ENOMEM;
   285		}
   286	
   287		amd_spi = spi_master_get_devdata(master);
   288		amd_spi->io_remap_addr = devm_platform_ioremap_resource(pdev, 0);
   289		if (IS_ERR(amd_spi->io_remap_addr)) {
   290			err = PTR_ERR(amd_spi->io_remap_addr);
   291			dev_err(dev, "error %d ioremap of SPI registers failed\n", err);
   292			goto err_free_master;
   293		}
   294		dev_dbg(dev, "io_remap_address: %p\n", amd_spi->io_remap_addr);
   295	
 > 296		amd_spi->version = (enum amd_spi_versions) device_get_match_data(dev);
   297	
   298		/* Initialize the spi_master fields */
   299		master->bus_num = 0;
   300		master->num_chipselect = 4;
   301		master->mode_bits = 0;
   302		master->flags = SPI_MASTER_HALF_DUPLEX;
   303		master->setup = amd_spi_master_setup;
   304		master->transfer_one_message = amd_spi_master_transfer;
   305	
   306		/* Register the controller with SPI framework */
   307		err = devm_spi_register_master(dev, master);
   308		if (err) {
   309			dev_err(dev, "error %d registering SPI controller\n", err);
   310			goto err_free_master;
   311		}
   312	
   313		return 0;
   314	
   315	err_free_master:
   316		spi_master_put(master);
   317	
   318		return err;
   319	}
   320	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
