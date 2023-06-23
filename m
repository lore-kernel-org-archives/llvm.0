Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE82230E8;
	Fri, 23 Jun 2023 11:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687518790; x=1719054790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcjBkB0YxCCGmeKAP8imTFlIqIx/eceN102NpEurFIU=;
  b=V1hSWlflAoGymyfNxnkCJ3lzQEHX+rgmhPDL8uzATBkcRAjmImWI5bIn
   7HqCqLHMnKF8HA8gs3Hnqts7J1rbPFb0Jj/WcgyKbyu4CXHua3xn8JrMS
   3gSaWK4ImLmvi8wIcbcimw9hSZ1P46ehzz17SQVRQw2/Pwo9gw2GFi+5E
   43M66b1DUwvoqotQHErepjnquOKlD7tLPi04LnoQ7ufalASw4uPR5TKca
   sdfa3zvvQrLK7+WZnKY9Su7sU4j9GbUKJ2ShTAQELJLn5KxTQzsyliKvh
   AMIk8sRovxhBNZ161Nb9bI8YHu4oaUpysQ1xjcKfP96Cmv4oK7ibYY20s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="426727461"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="426727461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 04:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="744966853"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="744966853"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jun 2023 04:13:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCeiv-0008Dz-2x;
	Fri, 23 Jun 2023 11:13:05 +0000
Date: Fri, 23 Jun 2023 19:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [linux-next:master 10675/12162] drivers/clk/imx/clk-imx31.c:14:10:
 fatal error: 'soc/imx/timer.h' file not found
Message-ID: <202306231959.rM5kD1QX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d2be868b42c08290509c60515865f4de24ea704
commit: 9e9d7570485d724838322714cd413eb90d9459f4 [10675/12162] clocksource/drivers/imx-gpt: Fold <soc/imx/timer.h> into its only user
config: arm-randconfig-r016-20230622 (https://download.01.org/0day-ci/archive/20230623/202306231959.rM5kD1QX-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231959.rM5kD1QX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231959.rM5kD1QX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx31.c:14:10: fatal error: 'soc/imx/timer.h' file not found
   #include <soc/imx/timer.h>
            ^~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/clk/imx/clk-imx35.c:13:10: fatal error: 'soc/imx/timer.h' file not found
   #include <soc/imx/timer.h>
            ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +14 drivers/clk/imx/clk-imx31.c

0931aff7226abb drivers/clk/imx/clk-imx31.c   Shawn Guo    2015-05-15 @14  #include <soc/imx/timer.h>
0c831317e77b55 arch/arm/mach-imx/clk-imx31.c Shawn Guo    2015-04-25  15  #include <asm/irq.h>
95878cbed89504 arch/arm/mach-imx/clk-imx31.c Sascha Hauer 2012-03-18  16  

:::::: The code at line 14 was first introduced by commit
:::::: 0931aff7226abb7e1dab018488e363294385fa66 ARM: imx: define an enum for gpt timer device type

:::::: TO: Shawn Guo <shawn.guo@linaro.org>
:::::: CC: Shawn Guo <shawn.guo@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
