Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22C24C88
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646774260; x=1678310260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hSVbu2R7beghB63RuJi9OaaNlDSwndeabNpK/MMXVmM=;
  b=g1jaWrzDR/PjoXa4FD0aeQ7zqs42FbT3Rh36aIEKRbRea5hpxOrRa33V
   BVEmm1oSKjtkXO1qGyHK3kdklWVqY6XSJH3xQgp7aCG6qqfp63ThMW+Av
   ffzVO3oFtiEZIE4pMH/c4FobL6Ar272EHnPqsTjvC8kJYAs9IJuSROJbw
   YyRZZqRKEi49B9O13GXerlG41+tHROfx3P7tdjYuuPfE23P9Z7CJt6iOD
   H9eLpW3+Y/wSucysMbkxEdIsWNGwrWBmpRq8aTBlfjJrxlViv8iceC0lj
   mYb8A6sGXrmFhX98TtcTHU7Vm9SgPWQSAucEwEI74K3yrLgGBkPWTD1z1
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254758004"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="254758004"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 13:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="495605783"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2022 13:17:38 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRhD7-0001yQ-UN; Tue, 08 Mar 2022 21:17:37 +0000
Date: Wed, 9 Mar 2022 05:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8195/11353] ld.lld: error: undefined symbol:
 devm_clk_hw_register
Message-ID: <202203090508.dI9OTyRb-lkp@intel.com>
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
head:   cb153b68ff91cbc434f3de70ac549e110543e1bb
commit: 70a5e96bad592145ba25365689a2d7d8dedb3bd9 [8195/11353] ASoC: codecs: rx-macro: move clk provider to managed variants
config: arm-randconfig-r022-20220308 (https://download.01.org/0day-ci/archive/20220309/202203090508.dI9OTyRb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=70a5e96bad592145ba25365689a2d7d8dedb3bd9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 70a5e96bad592145ba25365689a2d7d8dedb3bd9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_clk_hw_register
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_probe) in archive sound/built-in.a
--
>> ld.lld: error: undefined symbol: devm_of_clk_add_hw_provider
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_probe) in archive sound/built-in.a
--
>> ld.lld: error: undefined symbol: of_clk_hw_simple_get
   >>> referenced by lpass-rx-macro.c
   >>> soc/codecs/lpass-rx-macro.o:(rx_macro_probe) in archive sound/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_LPASS_RX_MACRO
   Depends on SOUND && !UML && SND && SND_SOC && COMMON_CLK
   Selected by
   - SND_SOC_SC7280 && SOUND && !UML && SND && SND_SOC && SND_SOC_QCOM && I2C && SOUNDWIRE
   WARNING: unmet direct dependencies detected for SND_SOC_LPASS_TX_MACRO
   Depends on SOUND && !UML && SND && SND_SOC && COMMON_CLK
   Selected by
   - SND_SOC_SC7280 && SOUND && !UML && SND && SND_SOC && SND_SOC_QCOM && I2C && SOUNDWIRE

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
