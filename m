Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3CA62B;
	Thu, 13 Jul 2023 01:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689212179; x=1720748179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0SPTe5hVJCAmVHX8J+KUzJuoQmgdA7TatynUXxis3aE=;
  b=c6T/34ZP6MhwW5+T1uUkofzW0AI5ZuwWCvZRT1l/ozFKY5l6nXnbhPMO
   Ut72jf0piSqQBBD887rKTOf04rJntKnUVMnwNwU9uIlNl7DwCegg2vOt0
   V0uX2BIpSa6LddNOd58fhJwq5X4LcMFy6DxylGdDsLz9R0D6H0ySL/fw6
   748DQx3Udr47ydBG/fJX4u2+54YsEUK4f1VxmyI2Zl71eHPDxJw5Sl5WI
   teoQnVZB3p62waYWNejUB/LpGX5+A86UZ6PSopDbMX8iKGkordOhG4VTA
   RzkZO0j7X7hCqIXIkg2VIfrVXv1ETtg2+VIGo21rJB5W+Y7Mp5LmkpUf3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="344650583"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="344650583"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 18:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="811805488"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="811805488"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jul 2023 18:36:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJlFa-00066E-26;
	Thu, 13 Jul 2023 01:36:10 +0000
Date: Thu, 13 Jul 2023 09:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 100/101]
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:327:34: warning: unused variable
 'sun6i_rtc_ccu_match'
Message-ID: <202307130921.fQjhhl6B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: 313ab319a928ebd740c8a86e6cc1436be6c1c359 [100/101] Use of_device_get_match_data
config: riscv-randconfig-r042-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130921.fQjhhl6B-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130921.fQjhhl6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130921.fQjhhl6B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:327:34: warning: unused variable 'sun6i_rtc_ccu_match' [-Wunused-const-variable]
     327 | static const struct of_device_id sun6i_rtc_ccu_match[] = {
         |                                  ^
   1 warning generated.


vim +/sun6i_rtc_ccu_match +327 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c

d91612d7f01aca Samuel Holland 2022-02-02  326  
d91612d7f01aca Samuel Holland 2022-02-02 @327  static const struct of_device_id sun6i_rtc_ccu_match[] = {
d91612d7f01aca Samuel Holland 2022-02-02  328  	{
d91612d7f01aca Samuel Holland 2022-02-02  329  		.compatible	= "allwinner,sun50i-h616-rtc",
d91612d7f01aca Samuel Holland 2022-02-02  330  		.data		= &sun50i_h616_rtc_ccu_data,
d91612d7f01aca Samuel Holland 2022-02-02  331  	},
d91612d7f01aca Samuel Holland 2022-02-02  332  	{
d91612d7f01aca Samuel Holland 2022-02-02  333  		.compatible	= "allwinner,sun50i-r329-rtc",
d91612d7f01aca Samuel Holland 2022-02-02  334  		.data		= &sun50i_r329_rtc_ccu_data,
d91612d7f01aca Samuel Holland 2022-02-02  335  	},
c887bdc4fb254a Wan Jiabing    2022-03-28  336  	{},
d91612d7f01aca Samuel Holland 2022-02-02  337  };
d91612d7f01aca Samuel Holland 2022-02-02  338  

:::::: The code at line 327 was first introduced by commit
:::::: d91612d7f01aca454469976d25db761c5085ae4d clk: sunxi-ng: Add support for the sun6i RTC clocks

:::::: TO: Samuel Holland <samuel@sholland.org>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
