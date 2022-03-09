Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777737A
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 05:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646804996; x=1678340996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zvQZ5nPQCTC5UYnCj2+lFrGh0evpkgZTD7/DaQxXUcs=;
  b=DZZQ4y4nCKK9lPMo/ZaDlUfUThUYHBOOk8G99iQWaIhKOoE6j2J3w9kF
   OD5YFMXVrKclq5Q738y98LOClIk7hG0W4tbcGxVNfR5BsifdDJM2Lcs7L
   mYpIek3pdT3HZ9QuBN39XH/sSA0D4twe2OeZwFHIEtaS37zxZlkrGmbyn
   cWoU7tL6mo2y2htyWMDB4Vvjqf4JsO8YA5PPElHY1hjM+AbBwa4GxGBPP
   h6Hmwt8nqjYpmQ57TWGHmNVM15u8FfoUGmr9hYB14dZNPcMgney/WWkBB
   echmY7mW/zX5yDhz43mQCMaedyDjCs8U/JfZzii119kxulb88cJvSdoBg
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="242338543"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; 
   d="scan'208";a="242338543"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 21:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; 
   d="scan'208";a="780976621"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2022 21:49:54 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRpCr-0002gL-UP; Wed, 09 Mar 2022 05:49:53 +0000
Date: Wed, 9 Mar 2022 13:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [andersson:tuxsuite 29/42] drivers/soc/qcom/pmic_glink.c:200:34:
 warning: unused variable 'pmic_glink_of_match'
Message-ID: <202203091303.wDvLl30f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/andersson/kernel tuxsuite
head:   d1c9502cfe160da3c09a0f379147f16d559e4ab7
commit: eb61d6c02e912eee3c26927b311b643f262b4036 [29/42] soc: qcom: pmic_glink: Introduce base PMIC GLINK driver
config: arm64-randconfig-r016-20220307 (https://download.01.org/0day-ci/archive/20220309/202203091303.wDvLl30f-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/andersson/kernel/commit/eb61d6c02e912eee3c26927b311b643f262b4036
        git remote add andersson https://github.com/andersson/kernel
        git fetch --no-tags andersson tuxsuite
        git checkout eb61d6c02e912eee3c26927b311b643f262b4036
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/soc/qcom/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/soc/qcom/pmic_glink.c:200:34: warning: unused variable 'pmic_glink_of_match' [-Wunused-const-variable]
   static const struct of_device_id pmic_glink_of_match[] = {
                                    ^
   1 warning generated.


vim +/pmic_glink_of_match +200 drivers/soc/qcom/pmic_glink.c

   199	
 > 200	static const struct of_device_id pmic_glink_of_match[] = {
   201		{ .compatible = "qcom,pmic-glink", },
   202		{}
   203	};
   204	MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
   205	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
