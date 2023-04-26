Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B110515A0;
	Wed, 26 Apr 2023 03:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682478808; x=1714014808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JlqLDSz6fbGccbQhS+HodxTEhgwpZOEQpFLn6ZoASKc=;
  b=XmEkCj4gPSH3V65nw9m9oKqI7FLB5Fc441cyEvHmYzyXUjY27mc3R7h9
   n/MOJi3e/Wi816uS5FEVY85S0oFwBsORAlYxsuq0y2IBwentYf8tWWhtD
   BNosv5Ky2dgEuTRySj77/XX22EhxY/z2S0LVJs+CzJjgu5uRhOrjoOE0+
   bVFWyNC4tKcixsLKedDaI+6DBaAHfIyEBsAqKfSlCv3iBapDwvyPCRzb7
   u69dZYP+3oflU1l/NSkGBE9RTMxOcERExT3IlgPGqwok7nFOCg3ZuK1F/
   JUocBKAirUHmEfLeZ3l3BIdUDZj9JFQTtMl/cDoNWG04mVCV9zD3Zw+vl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="335880616"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="335880616"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 20:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="868109817"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="868109817"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Apr 2023 20:13:26 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prVaw-00002A-0L;
	Wed, 26 Apr 2023 03:13:26 +0000
Date: Wed, 26 Apr 2023 11:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-component-2023-04-25-v2 27/28]
 sound/soc/soc-core.c:2555: warning: expecting prototype for
 snd_soc_register_dais(). Prototype was for devm_snd_soc_register_dais()
 instead
Message-ID: <202304261145.LesTA6p5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-component-2023-04-25-v2
head:   edc0bca1729bdd9ce5fc87a8076a5ef08e771aee
commit: 7ca5c2e62571b8fa6e838671a4cac618b28112da [27/28] ASoC: soc-core.c: use devm_snd_soc_register_dai()
config: x86_64-randconfig-a003-20230424 (https://download.01.org/0day-ci/archive/20230426/202304261145.LesTA6p5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/7ca5c2e62571b8fa6e838671a4cac618b28112da
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-component-2023-04-25-v2
        git checkout 7ca5c2e62571b8fa6e838671a4cac618b28112da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304261145.LesTA6p5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-core.c:2555: warning: expecting prototype for snd_soc_register_dais(). Prototype was for devm_snd_soc_register_dais() instead


vim +2555 sound/soc/soc-core.c

e11381f38f3478 Kuninori Morimoto 2019-11-05  2544  
daf7737335bf55 Kuninori Morimoto 2019-11-05  2545  /**
daf7737335bf55 Kuninori Morimoto 2019-11-05  2546   * snd_soc_register_dais - Register a DAI with the ASoC core
daf7737335bf55 Kuninori Morimoto 2019-11-05  2547   *
daf7737335bf55 Kuninori Morimoto 2019-11-05  2548   * @component: The component the DAIs are registered for
daf7737335bf55 Kuninori Morimoto 2019-11-05  2549   * @dai_drv: DAI driver to use for the DAIs
daf7737335bf55 Kuninori Morimoto 2019-11-05  2550   * @count: Number of DAIs
daf7737335bf55 Kuninori Morimoto 2019-11-05  2551   */
7ca5c2e62571b8 Kuninori Morimoto 2023-03-15  2552  static int devm_snd_soc_register_dais(struct snd_soc_component *component,
daf7737335bf55 Kuninori Morimoto 2019-11-05  2553  				      struct snd_soc_dai_driver *dai_drv,
daf7737335bf55 Kuninori Morimoto 2019-11-05  2554  				      size_t count)
daf7737335bf55 Kuninori Morimoto 2019-11-05 @2555  {
daf7737335bf55 Kuninori Morimoto 2019-11-05  2556  	struct snd_soc_dai *dai;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2557  	unsigned int i;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2558  
daf7737335bf55 Kuninori Morimoto 2019-11-05  2559  	for (i = 0; i < count; i++) {
7ca5c2e62571b8 Kuninori Morimoto 2023-03-15  2560  		dai = devm_snd_soc_register_dai(component->dev,
7ca5c2e62571b8 Kuninori Morimoto 2023-03-15  2561  						component, dai_drv + i, count == 1 &&
129f055a2144ab Charles Keepax    2022-06-23  2562  						component->driver->legacy_dai_naming);
7ca5c2e62571b8 Kuninori Morimoto 2023-03-15  2563  		if (!dai)
7ca5c2e62571b8 Kuninori Morimoto 2023-03-15  2564  			return -ENOMEM;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2565  	}
daf7737335bf55 Kuninori Morimoto 2019-11-05  2566  
daf7737335bf55 Kuninori Morimoto 2019-11-05  2567  	return 0;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2568  }
daf7737335bf55 Kuninori Morimoto 2019-11-05  2569  

:::::: The code at line 2555 was first introduced by commit
:::::: daf7737335bf555abf14031530fe8e47b46b373a ASoC: soc-core: move snd_soc_register_dai()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
