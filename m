Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F47B10F9
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 07:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663657749; x=1695193749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYbJhqpDswFyR40UwHPuNlV8GKZGdh6k6I4XklvFh2c=;
  b=Hs1pH99c46H0qkmn54bra2P7/gUohC2QgcFm32VuIlWzQTh9IKXMBiB4
   Nm6lLLRnwd+1lZnH7FE4bywmg7jvjspNq+gcA1L+xRDPdsl9hzqp4JZAe
   J9+ThKmcZ+jPlXjV/M5SGnCHkL9ODf0UGB/B6mHbKDAw+HFYA3/jXcMNE
   BdVbvCBBR92dcmDWJBswF6BGfod5NW2YMQLS75eEHfK0DzOcGVa+QVC3w
   vGNXPt/Y6YnLxinqp6tINXvmMuUGihhIJzL3oNfOwOwvvDmZSqWCuzSyl
   8e7TuAwwzyaMdkW9Bfvmgq76ZgrfcgaxT25RvRw42eT5Y4Vh2xKCNZuKZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279345641"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="279345641"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 00:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="947547727"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2022 00:09:06 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaXNR-0002Yv-33;
	Tue, 20 Sep 2022 07:09:05 +0000
Date: Tue, 20 Sep 2022 15:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [linux-next:master 6855/7934] drivers/perf/arm_spe_pmu.c:677:7:
 error: use of undeclared identifier 'ID_AA64DFR0_PMSVER_8_2'
Message-ID: <202209201518.HcP4DoUZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c9ca5b1597e3222177ba2a94658f78fa5ef4f58
commit: c0357a73fa4a96d8ed9ee46e9927d9fcbc9d0828 [6855/7934] arm64/sysreg: Align field names in ID_AA64DFR0_EL1 with architecture
config: arm64-randconfig-r036-20220919 (https://download.01.org/0day-ci/archive/20220920/202209201518.HcP4DoUZ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c0357a73fa4a96d8ed9ee46e9927d9fcbc9d0828
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c0357a73fa4a96d8ed9ee46e9927d9fcbc9d0828
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/rockchip/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/perf/arm_spe_pmu.c:677:7: error: use of undeclared identifier 'ID_AA64DFR0_PMSVER_8_2'
           case ID_AA64DFR0_PMSVER_8_2:
                ^
>> drivers/perf/arm_spe_pmu.c:679:7: error: use of undeclared identifier 'ID_AA64DFR0_PMSVER_8_3'
           case ID_AA64DFR0_PMSVER_8_3:
                ^
>> drivers/perf/arm_spe_pmu.c:961:10: error: use of undeclared identifier 'ID_AA64DFR0_PMSVER_SHIFT'
                                                      ID_AA64DFR0_PMSVER_SHIFT);
                                                      ^
   3 errors generated.


vim +/ID_AA64DFR0_PMSVER_8_2 +677 drivers/perf/arm_spe_pmu.c

d5d9696b03808b Will Deacon 2016-09-22  673  
4a669e2432fce9 Wei Li      2020-12-03  674  static u64 arm_spe_pmsevfr_res0(u16 pmsver)
4a669e2432fce9 Wei Li      2020-12-03  675  {
4a669e2432fce9 Wei Li      2020-12-03  676  	switch (pmsver) {
4a669e2432fce9 Wei Li      2020-12-03 @677  	case ID_AA64DFR0_PMSVER_8_2:
4a669e2432fce9 Wei Li      2020-12-03  678  		return SYS_PMSEVFR_EL1_RES0_8_2;
4a669e2432fce9 Wei Li      2020-12-03 @679  	case ID_AA64DFR0_PMSVER_8_3:
4a669e2432fce9 Wei Li      2020-12-03  680  	/* Return the highest version we support in default */
4a669e2432fce9 Wei Li      2020-12-03  681  	default:
4a669e2432fce9 Wei Li      2020-12-03  682  		return SYS_PMSEVFR_EL1_RES0_8_3;
4a669e2432fce9 Wei Li      2020-12-03  683  	}
4a669e2432fce9 Wei Li      2020-12-03  684  }
4a669e2432fce9 Wei Li      2020-12-03  685  

:::::: The code at line 677 was first introduced by commit
:::::: 4a669e2432fce9c01522a8453460e89f877dccd4 drivers/perf: Add support for ARMv8.3-SPE

:::::: TO: Wei Li <liwei391@huawei.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
