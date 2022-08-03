Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F8B4A26
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 21:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659563046; x=1691099046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=31EkGTKWoJ67xuQHsf9/JeBk/obWAn8p0DWaIUbjN0o=;
  b=ico2G+nUvqSLYOq4YECMHeiah0r+Hf0IIsIpkpCQQyPwXncB8DcTealm
   pYTwcm7T1iOtK2UdOuRtOkN8cJU5Y/03yB+1eYwx483mFPjFJKnb0ENkH
   D2+M7xeTf4KzBGVMF0SJ0f3ShF+/rBgrhQrn3JWBDdgaCdIfZ23WNsdwD
   +8WrzJRFmEQOzjWkRGOLlcZdsFawDBCnSCBwjwBpLof4HzB7kaBW7bFBn
   vPodD7qUi9swSNKgv/2CRNU4x8Yogci3KQ1Z761OZ/eUaI+T+F2Cr4cJp
   fisJcPbgsva1/zF6S6JxAguLijtgPnsml3o6Tl2HE81+9LPzJCc+68H6O
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="376084285"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="376084285"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 14:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="578818113"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Aug 2022 14:43:24 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJM9D-000HgN-2b;
	Wed, 03 Aug 2022 21:43:23 +0000
Date: Thu, 4 Aug 2022 05:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [egtvedt-avr32:avr32-cleanup 9/9]
 drivers/net/ethernet/cadence/macb_main.c:4114:9: error: use of undeclared
 identifier 'MACB_MII_OFFSET'
Message-ID: <202208040507.2IhizbEP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/egtvedt/linux-avr32.git avr32-cleanup
head:   127c95b209653b261277d3a6346b6fc5f9a9ef2e
commit: 127c95b209653b261277d3a6346b6fc5f9a9ef2e [9/9] net:cadence: remove bitfields only used by AVR32
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220804/202208040507.2IhizbEP-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 495519e5f8232d144ed26e9c18dbcbac6a5f25eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/egtvedt/linux-avr32.git/commit/?id=127c95b209653b261277d3a6346b6fc5f9a9ef2e
        git remote add egtvedt-avr32 https://git.kernel.org/pub/scm/linux/kernel/git/egtvedt/linux-avr32.git
        git fetch --no-tags egtvedt-avr32 avr32-cleanup
        git checkout 127c95b209653b261277d3a6346b6fc5f9a9ef2e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/cadence/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:4114:9: error: use of undeclared identifier 'MACB_MII_OFFSET'
           .mii = MACB_BIT(MII),
                  ^
   drivers/net/ethernet/cadence/macb.h:725:8: note: expanded from macro 'MACB_BIT'
           (1 << MACB_##name##_OFFSET)
                 ^
   <scratch space>:112:1: note: expanded from here
   MACB_MII_OFFSET
   ^
   1 error generated.


vim +/MACB_MII_OFFSET +4114 drivers/net/ethernet/cadence/macb_main.c

421d9df0628be1 drivers/net/ethernet/cadence/macb.c      Cyrille Pitchen 2015-03-07  4112  
b12422362ce947 drivers/net/ethernet/cadence/macb_main.c Atish Patra     2021-03-03  4113  static const struct macb_usrio_config macb_default_usrio = {
b12422362ce947 drivers/net/ethernet/cadence/macb_main.c Atish Patra     2021-03-03 @4114  	.mii = MACB_BIT(MII),
b12422362ce947 drivers/net/ethernet/cadence/macb_main.c Atish Patra     2021-03-03  4115  	.rmii = MACB_BIT(RMII),
b12422362ce947 drivers/net/ethernet/cadence/macb_main.c Atish Patra     2021-03-03  4116  	.rgmii = GEM_BIT(RGMII),
b12422362ce947 drivers/net/ethernet/cadence/macb_main.c Atish Patra     2021-03-03  4117  	.refclk = MACB_BIT(CLKEN),
b12422362ce947 drivers/net/ethernet/cadence/macb_main.c Atish Patra     2021-03-03  4118  };
b12422362ce947 drivers/net/ethernet/cadence/macb_main.c Atish Patra     2021-03-03  4119  

:::::: The code at line 4114 was first introduced by commit
:::::: b12422362ce947098ac420ac3c975fc006af4c02 net: macb: Add default usrio config to default gem config

:::::: TO: Atish Patra <atish.patra@wdc.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
