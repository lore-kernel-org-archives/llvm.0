Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EF87F1;
	Fri, 17 Mar 2023 08:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679041515; x=1710577515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+jleMgIU7brcJ3e1YYCk4ueV6bTgr94/nbnfN85CBo=;
  b=SyTFiGLVGYq64ZDGECOOuLuoXAaqOCI02f2Y4w3OMqkAE6Ko8CpYyEpl
   p7UTIBToOt6vSPoJVovFcGSjRpKvSM4x1GzSI7ugLgZw36R3XN56gs9bl
   yJvG1BRG+lKnHMiTgWfECpeznZ2y/lORsfwhQCGJwgrJH/bZT5Ks4yMw0
   bFBDCHGMJ0YDW7t1clurE8YLUf6wPe20TQa3L83gAYu1O/piA1uyLuNLw
   qcI/RcDorDoQVfdNMqEjGcSu/V4wMN4v1339UfKkX3b0JFXAjfa1dbzqm
   uOnVQBHNCubBeIMJsN4MLYANSHosNmnYQXfVekJwBHimbQA5SOLqWTAc3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424481789"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="424481789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 01:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="682598498"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="682598498"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Mar 2023 01:25:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd5OX-0009Dg-1Z;
	Fri, 17 Mar 2023 08:25:01 +0000
Date: Fri, 17 Mar 2023 16:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-dai-ops-2023-03-17-v1 31/64]
 sound/soc/soc-core.c:2559: warning: expecting prototype for
 snd_soc_register_dais(). Prototype was for devm_snd_soc_register_dais()
 instead
Message-ID: <202303171650.6o1M4B0w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-dai-ops-2023-03-17-v1
head:   ac006aa2dfde34cedc5570e1ae3b38b6e4d49fa5
commit: e3e3c21aac68fb56b962d1f3c1ebbdd15a207cc9 [31/64] ASoC: soc-core.c: use devm_snd_soc_register_dai()
config: x86_64-randconfig-a012-20230313 (https://download.01.org/0day-ci/archive/20230317/202303171650.6o1M4B0w-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/e3e3c21aac68fb56b962d1f3c1ebbdd15a207cc9
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-dai-ops-2023-03-17-v1
        git checkout e3e3c21aac68fb56b962d1f3c1ebbdd15a207cc9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171650.6o1M4B0w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-core.c:2559: warning: expecting prototype for snd_soc_register_dais(). Prototype was for devm_snd_soc_register_dais() instead


vim +2559 sound/soc/soc-core.c

e11381f38f3478 Kuninori Morimoto 2019-11-05  2548  
daf7737335bf55 Kuninori Morimoto 2019-11-05  2549  /**
daf7737335bf55 Kuninori Morimoto 2019-11-05  2550   * snd_soc_register_dais - Register a DAI with the ASoC core
daf7737335bf55 Kuninori Morimoto 2019-11-05  2551   *
daf7737335bf55 Kuninori Morimoto 2019-11-05  2552   * @component: The component the DAIs are registered for
daf7737335bf55 Kuninori Morimoto 2019-11-05  2553   * @dai_drv: DAI driver to use for the DAIs
daf7737335bf55 Kuninori Morimoto 2019-11-05  2554   * @count: Number of DAIs
daf7737335bf55 Kuninori Morimoto 2019-11-05  2555   */
e3e3c21aac68fb Kuninori Morimoto 2023-03-15  2556  static int devm_snd_soc_register_dais(struct snd_soc_component *component,
daf7737335bf55 Kuninori Morimoto 2019-11-05  2557  				      struct snd_soc_dai_driver *dai_drv,
daf7737335bf55 Kuninori Morimoto 2019-11-05  2558  				      size_t count)
daf7737335bf55 Kuninori Morimoto 2019-11-05 @2559  {
daf7737335bf55 Kuninori Morimoto 2019-11-05  2560  	struct snd_soc_dai *dai;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2561  	unsigned int i;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2562  
daf7737335bf55 Kuninori Morimoto 2019-11-05  2563  	for (i = 0; i < count; i++) {
e3e3c21aac68fb Kuninori Morimoto 2023-03-15  2564  		dai = devm_snd_soc_register_dai(component->dev,
e3e3c21aac68fb Kuninori Morimoto 2023-03-15  2565  						component, dai_drv + i, count == 1 &&
129f055a2144ab Charles Keepax    2022-06-23  2566  						component->driver->legacy_dai_naming);
e3e3c21aac68fb Kuninori Morimoto 2023-03-15  2567  		if (!dai)
e3e3c21aac68fb Kuninori Morimoto 2023-03-15  2568  			return -ENOMEM;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2569  	}
daf7737335bf55 Kuninori Morimoto 2019-11-05  2570  
daf7737335bf55 Kuninori Morimoto 2019-11-05  2571  	return 0;
daf7737335bf55 Kuninori Morimoto 2019-11-05  2572  }
daf7737335bf55 Kuninori Morimoto 2019-11-05  2573  

:::::: The code at line 2559 was first introduced by commit
:::::: daf7737335bf555abf14031530fe8e47b46b373a ASoC: soc-core: move snd_soc_register_dai()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
