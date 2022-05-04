Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5532F23
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 19:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651692567; x=1683228567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAkzneplPThB+Fpk6I4cnpHDgZjpveYR4yK7k7616/8=;
  b=KonGdvwUIHSdtUlBu8nWpRCq4fl50t0FgxmEGy70DFsSKC72tOs7Y7es
   MwN3G7hgloUbt8u/HmSYxCZ0/vzZrhbDtcCA/SDlXKoKBA96E23AZehfF
   rAt8CjU7Er+QiQi/o5xpUO8jWLNsiPy/yoYx5cZpA03FwoIcdI3dCV3iO
   oJwe8zE0N3OF2fE4UUfIFZWPhm4a1WIqI0PDD3jMHR3+nP5NmYGyJdUa4
   YZAILmEDJnRonpvIv38RPlYM5JKOP1PRHHQJu1P9F1XmaCBra29e9pA+w
   76niTyR5h3eDcMXBjpA/ZfJmaU+op3TzQMpt3G64uMY93EC00vVtKvWTp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="249860346"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; 
   d="scan'208";a="249860346"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 12:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; 
   d="scan'208";a="568252063"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 May 2022 12:29:21 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmKga-000Bj5-WA;
	Wed, 04 May 2022 19:29:20 +0000
Date: Thu, 5 May 2022 03:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Fabien Parent <fparent@baylibre.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [dtor-input:next 34/37]
 drivers/input/keyboard/mtk-pmic-keys.c:93:22: error: use of undeclared
 identifier 'MT6359_TOPSTATUS'
Message-ID: <202205050316.EFiBxD4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   75e97ccaf557d09c5e176d137fde6fcedc35a150
commit: 0f97adf6431456cd8155cf6fa803ed5bf441444c [34/37] Input: mtk-pmic-keys - add support for MT6359
config: hexagon-randconfig-r041-20220502 (https://download.01.org/0day-ci/archive/20220505/202205050316.EFiBxD4E-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?id=0f97adf6431456cd8155cf6fa803ed5bf441444c
        git remote add dtor-input https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
        git fetch --no-tags dtor-input next
        git checkout 0f97adf6431456cd8155cf6fa803ed5bf441444c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/input/keyboard/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/input/keyboard/mtk-pmic-keys.c:93:22: error: use of undeclared identifier 'MT6359_TOPSTATUS'
                   MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
                                      ^
   drivers/input/keyboard/mtk-pmic-keys.c:96:22: error: use of undeclared identifier 'MT6359_TOPSTATUS'
                   MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
                                      ^
>> drivers/input/keyboard/mtk-pmic-keys.c:98:18: error: use of undeclared identifier 'MT6359_TOP_RST_MISC'
           .pmic_rst_reg = MT6359_TOP_RST_MISC,
                           ^
   3 errors generated.


vim +/MT6359_TOPSTATUS +93 drivers/input/keyboard/mtk-pmic-keys.c

    90	
    91	static const struct mtk_pmic_keys_pdata mt6359_pdata = {
    92		.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
  > 93			MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
    94			0x2, MT6359_PSC_TOP_INT_CON0, 0x5),
    95		.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
    96			MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
    97			0x8, MT6359_PSC_TOP_INT_CON0, 0xa),
  > 98		.pmic_rst_reg = MT6359_TOP_RST_MISC,
    99		.has_key_release_irqs = true,
   100	};
   101	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
