Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC362C80
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 07:28:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="223974272"
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; 
   d="scan'208";a="223974272"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 23:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; 
   d="scan'208";a="460276100"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Dec 2021 23:28:41 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtPTM-000Ien-Tb; Sat, 04 Dec 2021 07:28:40 +0000
Date: Sat, 4 Dec 2021 15:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 3226/5128] ERROR: modpost: "cs35l41_remove"
 [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
Message-ID: <202112041547.SKz1bfGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
commit: a5e0091d62abb9599d9dea505ec0e8c820001831 [3226/5128] ASoC: cs35l41: Fix link problem
config: i386-randconfig-a015-20211130 (https://download.01.org/0day-ci/archive/20211204/202112041547.SKz1bfGR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a5e0091d62abb9599d9dea505ec0e8c820001831
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a5e0091d62abb9599d9dea505ec0e8c820001831
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 7afeac307a9561e3a93682c1e7eb22f918aa1187 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "spi_setup" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
>> ERROR: modpost: "cs35l41_remove" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
>> ERROR: modpost: "cs35l41_probe" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
ERROR: modpost: "__devm_regmap_init_spi" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
>> ERROR: modpost: "cs35l41_regmap_spi" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
ERROR: modpost: "__spi_register_driver" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_CS35L41_SPI
   Depends on SOUND && !UML && SND && SND_SOC && SPI_MASTER
   Selected by
   - SND_SOC_AMD_VANGOGH_MACH && SOUND && !UML && SND && SND_SOC && SND_SOC_AMD_ACP5x && I2C

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
