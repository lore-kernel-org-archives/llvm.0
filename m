Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A34B15AB;
	Mon,  4 Sep 2023 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693830954; x=1725366954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KHo2uXBPUoUZkLcloIlDvQry2MWmGHn4YHZjhc47z/8=;
  b=kpKUsxSAcKWkxiEsAka7PZE6tVQXgYW6TPHEObsbr270w7gNB7Vj7yKO
   qCpc5nkmRRqJhby0ozWDaqsgpW4kMkPP3cTu3RiHsowqwPw+fkydiNZ5G
   t5SItokqh1WUe01NYtViqlHq/Na9fOykP1b3B1yH9gGc85S7mP3GGPiLc
   ETE7Y/ScJ2ggFNOhwFPFlpiMnIq15Zc0c4kZNDFO3v0yfLSldwncsZ89B
   aW9mGoRvPr+fHNm0S9oIDvodih6MwNlzCvs4IkZgSAvKxFU/yL0weFglw
   hmLlw20irK+1Uit4Hcz6OM6yvXV1dOP4NJehcgyapcPOy3w9Y7MvbWt9o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="376525500"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="376525500"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 05:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="830897034"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="830897034"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2023 05:35:51 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd8o1-0000Tv-1p;
	Mon, 04 Sep 2023 12:35:49 +0000
Date: Mon, 4 Sep 2023 20:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: drivers/clk/clk-asm9260.c:258:17: warning: variable 'hw' set but not
 used
Message-ID: <202309042014.IWERPl09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   708283abf896dd4853e673cc8cba70acaf9bf4ea
commit: f5290d8e4f0caa81a491448a27dd70e726095d07 clk: asm9260: use parent index to link the reference clock
date:   11 months ago
config: arm-randconfig-r001-20230904 (https://download.01.org/0day-ci/archive/20230904/202309042014.IWERPl09-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309042014.IWERPl09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309042014.IWERPl09-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-asm9260.c:258:17: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
           struct clk_hw *hw, *pll_hw;
                          ^
   1 warning generated.


vim +/hw +258 drivers/clk/clk-asm9260.c

   255	
   256	static void __init asm9260_acc_init(struct device_node *np)
   257	{
 > 258		struct clk_hw *hw, *pll_hw;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
