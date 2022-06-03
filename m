Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C0DEA8
	for <llvm@lists.linux.dev>; Fri,  3 Jun 2022 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654247366; x=1685783366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2FqBPrUEzmLBZst0xSTmIvl7eeRIdcf32fLYWnchJeM=;
  b=DLoXajFDkpglYG9eLUjE79+b966FUAKuX0oOXFhaLaCNlAyyaVVmZGlI
   USR6F5Mv4wz4O8EtcEz5Aa3+JeQVsQQG+c04iTeHczxWoVwA1wutaVz54
   EHKwv6OBAdqGk1QWiAWMsDFliK7j43IGZehkFdWEwzZE3bVpF6D3Gp7Te
   gvJ/IP0DV7yyMrxM8hGfJegmOJeYPP0nKacgThRnsizODBWwZuQ+DoUv2
   x0mqc//F/vs1fPf+OOatgXkhP2Zi2gsu8zTP5BiCRXCygZwVbONfDwmvk
   qi1N4n7mV/Xv5CQpDTHTY5D1Qkht6e+Y6IaemtueU1YyuVB01TPSy7TbT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="362579233"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="362579233"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 02:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="530940913"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Jun 2022 02:09:23 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nx3J4-000768-Aj;
	Fri, 03 Jun 2022 09:09:22 +0000
Date: Fri, 3 Jun 2022 17:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 16/20] ASoC: tlv320aic26: Use modern ASoC DAI format
 terminology
Message-ID: <202206031611.NflHL5M6-lkp@intel.com>
References: <20220602135316.3554400-17-broonie@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602135316.3554400-17-broonie@kernel.org>

Hi Mark,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on v5.18 next-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/ASoC-DAI-clocking-terminology-modernisation/20220602-220124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: hexagon-randconfig-r034-20220531 (https://download.01.org/0day-ci/archive/20220603/202206031611.NflHL5M6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dbeb676b530a8a641b9444a092dcab1d5af2a71f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Brown/ASoC-DAI-clocking-terminology-modernisation/20220602-220124
        git checkout dbeb676b530a8a641b9444a092dcab1d5af2a71f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tlv320aic26.c:365:9: error: no member named 'master' in 'struct aic26'
           aic26->master = 1;
           ~~~~~  ^
   1 error generated.


vim +365 sound/soc/codecs/tlv320aic26.c

7fbdeb809050cb Mark Brown        2013-09-25  341  
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  342  /* ---------------------------------------------------------------------
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  343   * SPI device portion of driver: probe and release routines and SPI
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  344   * 				 driver registration.
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  345   */
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  346  static int aic26_spi_probe(struct spi_device *spi)
d8e3bb7385da0b Grant Likely      2008-07-29  347  {
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  348  	struct aic26 *aic26;
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  349  	int ret;
d8e3bb7385da0b Grant Likely      2008-07-29  350  
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  351  	dev_dbg(&spi->dev, "probing tlv320aic26 spi device\n");
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  352  
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  353  	/* Allocate driver data */
a8163023d29c14 Axel Lin          2011-12-29  354  	aic26 = devm_kzalloc(&spi->dev, sizeof *aic26, GFP_KERNEL);
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  355  	if (!aic26)
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  356  		return -ENOMEM;
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  357  
7fbdeb809050cb Mark Brown        2013-09-25  358  	aic26->regmap = devm_regmap_init_spi(spi, &aic26_regmap);
7fbdeb809050cb Mark Brown        2013-09-25  359  	if (IS_ERR(aic26->regmap))
7fbdeb809050cb Mark Brown        2013-09-25  360  		return PTR_ERR(aic26->regmap);
7fbdeb809050cb Mark Brown        2013-09-25  361  
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  362  	/* Initialize the driver data */
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  363  	aic26->spi = spi;
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  364  	dev_set_drvdata(&spi->dev, aic26);
f0fba2ad1b6b53 Liam Girdwood     2010-03-17 @365  	aic26->master = 1;
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  366  
1514613a7a4480 Kuninori Morimoto 2018-01-29  367  	ret = devm_snd_soc_register_component(&spi->dev,
1514613a7a4480 Kuninori Morimoto 2018-01-29  368  			&aic26_soc_component_dev, &aic26_dai, 1);
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  369  	return ret;
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  370  }
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  371  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
