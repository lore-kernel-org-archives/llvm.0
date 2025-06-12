Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF55414A8B;
	Thu, 12 Jun 2025 06:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708985; cv=none; b=S7XjtA8RMbFAC07umjrXptrZFKOMFV9T5CjmujCMM6lw0avoq0JeMJKgAbJ1Mwv7LWRyu/Gq7EVHI3d5/5B8gbETpnD7Qkt+oeMZMlkjmlVLjJ/lvCCy7PAv9hSieZErSpeJm3qBXbhIMQEYSFnbOe1rXVhWpZuNNrbfL6YpvTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708985; c=relaxed/simple;
	bh=X/61lWTuUq6sXz6ih75vVOSfAxpdgkAoSrIQ5x3rmDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDr1o73cyldfDQhW38v7/FAJZhWPY7oFMGqHwA5hEBAcN5oSaurbEA9n38/gcF8p1axo7FPUlhFT27V3gn7xXQSIa+xXtR98CK1EsNwo2xXpFXwUc2tQJVTLLopf5BmVwxf/buQ2wYXJxnqDSK/Nxqi6zBuf3uc5wKJ7xQvgFoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWz465Cd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWz465Cd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749708984; x=1781244984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=X/61lWTuUq6sXz6ih75vVOSfAxpdgkAoSrIQ5x3rmDw=;
  b=fWz465CdyDJn50+mAzWF3TvFZP5lgvXz+RWahS32Csinfz8pwkHUdwez
   Gxtr/9U4eUIiro3Aixb+Lj44GUb0Wdphqq1YjA0ijGz+Bd5ldaYwG8cbW
   47y5+x7h+h65QedvMt3ZYyyRlHpSEWjsNsWdPjSkccFXWLOZiOXCcZOad
   i6Cz9IvKgi5hhN1kCe+Zs+t3vL/j+mcwKGDwTNxTHfp1qEVwralfyKOt+
   DyNdPFopCHClU05MZ28pamI+GuKwQUwUuCmEdOUzF92qN5cWFjA9dkL+I
   GJeatWzFKe3sqhqGZEblkvS6RiJKL63NyKoFsL+ZLRbg7GniBlcaBEO1e
   w==;
X-CSE-ConnectionGUID: ERUORYBXRNWNls8B+WQtWA==
X-CSE-MsgGUID: r+2bX2NzRmSLbZvZDVapVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51740938"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="51740938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:16:21 -0700
X-CSE-ConnectionGUID: vXvrm4AnQseEzJjhQsQxvQ==
X-CSE-MsgGUID: utpPMpXiRiauBNSfxWtEbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="151227580"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2025 23:16:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPbEX-000BC4-1a;
	Thu, 12 Jun 2025 06:16:17 +0000
Date: Thu, 12 Jun 2025 14:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Da Xue <da@libre.computer>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] spi: expand bits_per_word_mask to 64 bits
Message-ID: <202506121333.aBBVT88v-lkp@intel.com>
References: <20250611000516.1383268-1-da@libre.computer>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611000516.1383268-1-da@libre.computer>

Hi Da,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on jic23-iio/togreg staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Da-Xue/spi-expand-bits_per_word_mask-to-64-bits/20250611-104431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20250611000516.1383268-1-da%40libre.computer
patch subject: [RFC] spi: expand bits_per_word_mask to 64 bits
config: arm-randconfig-004-20250612 (https://download.01.org/0day-ci/archive/20250612/202506121333.aBBVT88v-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121333.aBBVT88v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121333.aBBVT88v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-altera-dfl.c:150:25: warning: format specifies type 'unsigned int' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     149 |         dev_dbg(dev, "%s cs %u bpm 0x%x mode 0x%x\n", __func__,
         |                                      ~~
         |                                      %llx
     150 |                 host->num_chipselect, host->bits_per_word_mask,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:171:49: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:139:35: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +150 drivers/spi/spi-altera-dfl.c

ba2fc167e94475 Matthew Gerlach    2021-04-16  123  
ba2fc167e94475 Matthew Gerlach    2021-04-16  124  static int dfl_spi_altera_probe(struct dfl_device *dfl_dev)
ba2fc167e94475 Matthew Gerlach    2021-04-16  125  {
4f45f340496010 Martin Hundebøll   2021-07-16  126  	struct spi_board_info board_info = { 0 };
ba2fc167e94475 Matthew Gerlach    2021-04-16  127  	struct device *dev = &dfl_dev->dev;
ec168190c1cace Yang Yingliang     2022-12-29  128  	struct spi_controller *host;
ba2fc167e94475 Matthew Gerlach    2021-04-16  129  	struct altera_spi *hw;
ba2fc167e94475 Matthew Gerlach    2021-04-16  130  	void __iomem *base;
8e3ca32f46994e Christophe JAILLET 2022-05-29  131  	int err;
ba2fc167e94475 Matthew Gerlach    2021-04-16  132  
ec168190c1cace Yang Yingliang     2022-12-29  133  	host = devm_spi_alloc_host(dev, sizeof(struct altera_spi));
ec168190c1cace Yang Yingliang     2022-12-29  134  	if (!host)
ba2fc167e94475 Matthew Gerlach    2021-04-16  135  		return -ENOMEM;
ba2fc167e94475 Matthew Gerlach    2021-04-16  136  
ec168190c1cace Yang Yingliang     2022-12-29  137  	host->bus_num = -1;
ba2fc167e94475 Matthew Gerlach    2021-04-16  138  
ec168190c1cace Yang Yingliang     2022-12-29  139  	hw = spi_controller_get_devdata(host);
ba2fc167e94475 Matthew Gerlach    2021-04-16  140  
ba2fc167e94475 Matthew Gerlach    2021-04-16  141  	hw->dev = dev;
ba2fc167e94475 Matthew Gerlach    2021-04-16  142  
ba2fc167e94475 Matthew Gerlach    2021-04-16  143  	base = devm_ioremap_resource(dev, &dfl_dev->mmio_res);
ba2fc167e94475 Matthew Gerlach    2021-04-16  144  
532259bfd1c12d Zou Wei            2021-05-11  145  	if (IS_ERR(base))
ba2fc167e94475 Matthew Gerlach    2021-04-16  146  		return PTR_ERR(base);
ba2fc167e94475 Matthew Gerlach    2021-04-16  147  
ec168190c1cace Yang Yingliang     2022-12-29  148  	config_spi_host(base, host);
ba2fc167e94475 Matthew Gerlach    2021-04-16  149  	dev_dbg(dev, "%s cs %u bpm 0x%x mode 0x%x\n", __func__,
ec168190c1cace Yang Yingliang     2022-12-29 @150  		host->num_chipselect, host->bits_per_word_mask,
ec168190c1cace Yang Yingliang     2022-12-29  151  		host->mode_bits);
ba2fc167e94475 Matthew Gerlach    2021-04-16  152  
ba2fc167e94475 Matthew Gerlach    2021-04-16  153  	hw->regmap = devm_regmap_init(dev, NULL, base, &indirect_regbus_cfg);
ba2fc167e94475 Matthew Gerlach    2021-04-16  154  	if (IS_ERR(hw->regmap))
ba2fc167e94475 Matthew Gerlach    2021-04-16  155  		return PTR_ERR(hw->regmap);
ba2fc167e94475 Matthew Gerlach    2021-04-16  156  
ba2fc167e94475 Matthew Gerlach    2021-04-16  157  	hw->irq = -EINVAL;
ba2fc167e94475 Matthew Gerlach    2021-04-16  158  
ec168190c1cace Yang Yingliang     2022-12-29  159  	altera_spi_init_host(host);
ba2fc167e94475 Matthew Gerlach    2021-04-16  160  
ec168190c1cace Yang Yingliang     2022-12-29  161  	err = devm_spi_register_controller(dev, host);
8e3ca32f46994e Christophe JAILLET 2022-05-29  162  	if (err)
ec168190c1cace Yang Yingliang     2022-12-29  163  		return dev_err_probe(dev, err, "%s failed to register spi host\n",
8e3ca32f46994e Christophe JAILLET 2022-05-29  164  				     __func__);
ba2fc167e94475 Matthew Gerlach    2021-04-16  165  
4f45f340496010 Martin Hundebøll   2021-07-16  166  	if (dfl_dev->revision == FME_FEATURE_REV_MAX10_SPI_N5010)
4f45f340496010 Martin Hundebøll   2021-07-16  167  		strscpy(board_info.modalias, "m10-n5010", SPI_NAME_SIZE);
4f45f340496010 Martin Hundebøll   2021-07-16  168  	else
4f45f340496010 Martin Hundebøll   2021-07-16  169  		strscpy(board_info.modalias, "m10-d5005", SPI_NAME_SIZE);
4f45f340496010 Martin Hundebøll   2021-07-16  170  
4f45f340496010 Martin Hundebøll   2021-07-16  171  	board_info.max_speed_hz = 12500000;
4f45f340496010 Martin Hundebøll   2021-07-16  172  	board_info.bus_num = 0;
4f45f340496010 Martin Hundebøll   2021-07-16  173  	board_info.chip_select = 0;
4f45f340496010 Martin Hundebøll   2021-07-16  174  
ec168190c1cace Yang Yingliang     2022-12-29  175  	if (!spi_new_device(host, &board_info)) {
ba2fc167e94475 Matthew Gerlach    2021-04-16  176  		dev_err(dev, "%s failed to create SPI device: %s\n",
4f45f340496010 Martin Hundebøll   2021-07-16  177  			__func__, board_info.modalias);
ba2fc167e94475 Matthew Gerlach    2021-04-16  178  	}
ba2fc167e94475 Matthew Gerlach    2021-04-16  179  
ba2fc167e94475 Matthew Gerlach    2021-04-16  180  	return 0;
ba2fc167e94475 Matthew Gerlach    2021-04-16  181  }
ba2fc167e94475 Matthew Gerlach    2021-04-16  182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
