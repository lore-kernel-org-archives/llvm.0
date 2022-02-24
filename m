Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1F07B
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 01:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645666078; x=1677202078;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nZoyXBEkZHnaqFDqTU7Y57leJ+5wkh6rallh9FFXIug=;
  b=WR1XN857jrImIgD/zltXxgC1FbrbGonFozrDF8wqrBvp1weMdVcRGd+O
   LA4p+mlgAewq5jxGIanIcEAXp5aCbRRgHHlHTJYpiJemHQZc0u6AA7Yff
   40OKY1nb1IcupBXOob92nfT+hFFXJsedkCap76ZIR+HDypG0BzP8r+Vl6
   4Av/8/AyeE2QdWvk8pkWV0rivflRtdfzWVPI51bFmkJfnV83jaGOvll93
   gT7gJeZZRH2lbtAV6+StBSDz843sK5lR9zNcyvZtCI5oJcx9vRTyWkzNn
   nXYpyXdQEOhMpc40o2Vw0/J7YOfKVanEPLJuBFgdnvjl+Zgd04r+ENkLG
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="276747749"
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="276747749"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 17:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="491417490"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2022 17:27:56 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN2vD-00024W-FV; Thu, 24 Feb 2022 01:27:55 +0000
Date: Thu, 24 Feb 2022 09:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 5015/7526] drivers/spi/spi-amd.c:296:21: warning:
 cast to smaller integer type 'enum amd_spi_versions' from 'const void *'
Message-ID: <202202240908.Oxy0WRXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi André,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   196d330d7fb1e7cc0d85641c89ce4602cb36f12e
commit: 209043554915d7c51ac112a668ad1a255e1bea61 [5015/7526] spi: amd: Add support for version AMDI0062
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220224/202202240908.Oxy0WRXe-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=209043554915d7c51ac112a668ad1a255e1bea61
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 209043554915d7c51ac112a668ad1a255e1bea61
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-amd.c:296:21: warning: cast to smaller integer type 'enum amd_spi_versions' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           amd_spi->version = (enum amd_spi_versions) device_get_match_data(dev);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


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
