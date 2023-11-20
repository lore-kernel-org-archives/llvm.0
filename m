Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2542F3B2B8;
	Mon, 20 Nov 2023 23:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThPn1wwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700523667; x=1732059667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=on1VkK/ckQrjQ7/gZOs2HBXM/dnxe8jUZZQUZoBRg2k=;
  b=ThPn1wwHxKmNXMC0i4wquu7Tc9mXOVln2Fl9ps4VZnzbAt6FoZYY4VNz
   o7xuVvjkqUZWtCboob+OLAp3zC19AnuvZqyZGHYMpkKrtWxiF0ztK2uFp
   GmEWSWXNUfPpT6Taf/Z1vk25fP75E4XMhcbqBPV2E1Ib9iSxy3r+Azho1
   ujqgj/G94Pq1d0B54P5aXBF40Zrt/fKAILGr1zcNmW+v8wRSHM3QJqAYO
   4xX+3V9Z8Tf1slaKz/6C4/arDcrWgPhpGKOxNsFm5vxEuUuTI62o2JtZM
   BkCIFx60mYUtP1CCBgszAyBE6SRQSkj2dm/HYbblRReJJZT/oblRCN17H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371067953"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="371067953"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 15:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="910280036"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="910280036"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2023 15:41:00 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Dsw-00074R-0T;
	Mon, 20 Nov 2023 23:40:58 +0000
Date: Tue, 21 Nov 2023 07:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v10_20231118_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
 1/2] sound/pci/hda/cs35l56_hda_spi.c:32:42: error: incompatible pointer to
 integer conversion passing 'u8[4]' (aka 'unsigned char[4]') to parameter of
 type 'int'
Message-ID: <202311210744.QdYLCBZT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v10_20231118_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
head:   28c84457d889d997b2cfefd7f6967dc919bdf628
commit: eb12970007184e2e5c6eae6ef1b32eee13480811 [1/2] spi: Add multi-cs memories support in SPI core
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311210744.QdYLCBZT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210744.QdYLCBZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210744.QdYLCBZT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/hda/cs35l56_hda_spi.c:32:42: error: incompatible pointer to integer conversion passing 'u8[4]' (aka 'unsigned char[4]') to parameter of type 'int' [-Wint-conversion]
           ret = cs35l56_hda_common_probe(cs35l56, spi->chip_select);
                                                   ^~~~~~~~~~~~~~~~
   sound/pci/hda/cs35l56_hda.h:45:63: note: passing argument to parameter 'id' here
   int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id);
                                                                 ^
   1 error generated.
--
>> drivers/mfd/tps6594-spi.c:101:11: error: incompatible pointer to integer conversion assigning to 'unsigned short' from 'u8[4]' (aka 'unsigned char[4]') [-Wint-conversion]
           tps->reg = spi->chip_select;
                    ^ ~~~~~~~~~~~~~~~~
   1 error generated.


vim +32 sound/pci/hda/cs35l56_hda_spi.c

73cfbfa9caea8ed Simon Trimmer 2023-07-21  13  
73cfbfa9caea8ed Simon Trimmer 2023-07-21  14  static int cs35l56_hda_spi_probe(struct spi_device *spi)
73cfbfa9caea8ed Simon Trimmer 2023-07-21  15  {
73cfbfa9caea8ed Simon Trimmer 2023-07-21  16  	struct cs35l56_hda *cs35l56;
73cfbfa9caea8ed Simon Trimmer 2023-07-21  17  	int ret;
73cfbfa9caea8ed Simon Trimmer 2023-07-21  18  
73cfbfa9caea8ed Simon Trimmer 2023-07-21  19  	cs35l56 = devm_kzalloc(&spi->dev, sizeof(*cs35l56), GFP_KERNEL);
73cfbfa9caea8ed Simon Trimmer 2023-07-21  20  	if (!cs35l56)
73cfbfa9caea8ed Simon Trimmer 2023-07-21  21  		return -ENOMEM;
73cfbfa9caea8ed Simon Trimmer 2023-07-21  22  
73cfbfa9caea8ed Simon Trimmer 2023-07-21  23  	cs35l56->base.dev = &spi->dev;
73cfbfa9caea8ed Simon Trimmer 2023-07-21  24  	cs35l56->base.regmap = devm_regmap_init_spi(spi, &cs35l56_regmap_spi);
73cfbfa9caea8ed Simon Trimmer 2023-07-21  25  	if (IS_ERR(cs35l56->base.regmap)) {
73cfbfa9caea8ed Simon Trimmer 2023-07-21  26  		ret = PTR_ERR(cs35l56->base.regmap);
73cfbfa9caea8ed Simon Trimmer 2023-07-21  27  		dev_err(cs35l56->base.dev, "Failed to allocate register map: %d\n",
73cfbfa9caea8ed Simon Trimmer 2023-07-21  28  			ret);
73cfbfa9caea8ed Simon Trimmer 2023-07-21  29  		return ret;
73cfbfa9caea8ed Simon Trimmer 2023-07-21  30  	}
73cfbfa9caea8ed Simon Trimmer 2023-07-21  31  
73cfbfa9caea8ed Simon Trimmer 2023-07-21 @32  	ret = cs35l56_hda_common_probe(cs35l56, spi->chip_select);
73cfbfa9caea8ed Simon Trimmer 2023-07-21  33  	if (ret)
73cfbfa9caea8ed Simon Trimmer 2023-07-21  34  		return ret;
73cfbfa9caea8ed Simon Trimmer 2023-07-21  35  	ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
73cfbfa9caea8ed Simon Trimmer 2023-07-21  36  	if (ret < 0)
73cfbfa9caea8ed Simon Trimmer 2023-07-21  37  		cs35l56_hda_remove(cs35l56->base.dev);
73cfbfa9caea8ed Simon Trimmer 2023-07-21  38  
73cfbfa9caea8ed Simon Trimmer 2023-07-21  39  	return ret;
73cfbfa9caea8ed Simon Trimmer 2023-07-21  40  }
73cfbfa9caea8ed Simon Trimmer 2023-07-21  41  

:::::: The code at line 32 was first introduced by commit
:::::: 73cfbfa9caea8eda54b4c6e49a9555533660aa1e ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier

:::::: TO: Simon Trimmer <simont@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
