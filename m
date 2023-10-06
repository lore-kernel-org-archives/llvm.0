Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C583C29;
	Fri,  6 Oct 2023 05:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dew7Y4WR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696569024; x=1728105024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJy3nXVy1g22dz0pcffNB78f2pEa0w/wPjGsm5l3VL0=;
  b=dew7Y4WRi36k15htpfCqyV2jp/SP4gew+oBZIFrIHeRe8RhNK59ET21y
   tdYy9YnYePlrlkx/9KCi4GKYj6QVqLQtCkmLkYpVUqN9R7a+EBab4atoO
   LjBzoyp20UU2RYWA67MdO53br9KV0Vyv0EM7xPT0YESJczFuQGsKkKPVl
   UNz3acMQF3YErJNJyYFAwp2oqaieAbDYnyAcnGigWDJMGtQFDXY+S6OOt
   +FBTpzMT/puXlwBPCkZU69qrcHpZyLmSZau5aVWqbHAc1qcFxrU/cG+T9
   zIGlIEMh/RsE5nJUD6YvrAcQ72/Nkoq5Sa5tq3WJXRcwzm2RqOeYsSV7y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="368758916"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="368758916"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 22:10:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728716776"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="728716776"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 22:10:19 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qod6P-000MHY-0J;
	Fri, 06 Oct 2023 05:10:17 +0000
Date: Fri, 6 Oct 2023 13:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 5/6]
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c:680:29: warning: unused variable
 'clk_wzrd_ver_divider_ops'
Message-ID: <202310061301.Wcgynbmh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   d81a4120bd209b0103e37eae6f5cceada1eda492
commit: cea76d3ad26cb5f9142426c9b22db5d348c45f2e [5/6] clocking-wizard: Add support for versal clocking wizard
config: arm-imx_v4_v5_defconfig (https://download.01.org/0day-ci/archive/20231006/202310061301.Wcgynbmh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310061301.Wcgynbmh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061301.Wcgynbmh-lkp@intel.com/

All warnings (new ones prefixed by >>):

                                                  ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:284:49: warning: unused variable 'regval1' [-Wunused-variable]
           u32 value, regh, edged, p5en, p5fedge, regval, regval1;
                                                          ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:413:6: warning: unused variable 'reg' [-Wunused-variable]
           u32 reg, pre, value, f;
               ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:413:11: warning: unused variable 'pre' [-Wunused-variable]
           u32 reg, pre, value, f;
                    ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:413:23: warning: unused variable 'f' [-Wunused-variable]
           u32 reg, pre, value, f;
                                ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:436:16: warning: unused variable 'vco_freq' [-Wunused-variable]
           unsigned long vco_freq, rate_div, clockout0_div;
                         ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:436:26: warning: unused variable 'rate_div' [-Wunused-variable]
           unsigned long vco_freq, rate_div, clockout0_div;
                                   ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:436:36: warning: unused variable 'clockout0_div' [-Wunused-variable]
           unsigned long vco_freq, rate_div, clockout0_div;
                                             ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:438:6: warning: unused variable 'reg' [-Wunused-variable]
           u32 reg, pre, value, f;
               ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:438:11: warning: unused variable 'pre' [-Wunused-variable]
           u32 reg, pre, value, f;
                    ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:438:23: warning: unused variable 'f' [-Wunused-variable]
           u32 reg, pre, value, f;
                                ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:6: warning: unused variable 'regh' [-Wunused-variable]
           u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
               ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:12: warning: unused variable 'edged' [-Wunused-variable]
           u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
                     ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:19: warning: unused variable 'p5en' [-Wunused-variable]
           u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
                            ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:25: warning: unused variable 'p5fedge' [-Wunused-variable]
           u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
                                  ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:34: warning: unused variable 'value2' [-Wunused-variable]
           u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
                                           ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:42: warning: unused variable 'm' [-Wunused-variable]
           u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
                                                   ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:45: warning: unused variable 'regval' [-Wunused-variable]
           u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
                                                      ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:53: warning: unused variable 'regval1' [-Wunused-variable]
           u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
                                                              ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:506:16: warning: unused variable 'value' [-Wunused-variable]
           u32 reg, pre, value, f;
                         ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:6: warning: unused variable 'edged' [-Wunused-variable]
           u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
               ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:13: warning: unused variable 'div2' [-Wunused-variable]
           u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
                      ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:19: warning: unused variable 'p5en' [-Wunused-variable]
           u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
                            ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:25: warning: unused variable 'edge' [-Wunused-variable]
           u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
                                  ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:31: warning: unused variable 'prediv2' [-Wunused-variable]
           u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
                                        ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:40: warning: unused variable 'all' [-Wunused-variable]
           u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
                                                 ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:45: warning: unused variable 'regl' [-Wunused-variable]
           u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
                                                      ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:51: warning: unused variable 'regh' [-Wunused-variable]
           u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
                                                            ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:57: warning: unused variable 'mult' [-Wunused-variable]
           u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
                                                                  ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:592:6: warning: unused variable 'm' [-Wunused-variable]
           u32 m, d, o, div, reg, f;
               ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:592:9: warning: unused variable 'd' [-Wunused-variable]
           u32 m, d, o, div, reg, f;
                  ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:592:12: warning: unused variable 'o' [-Wunused-variable]
           u32 m, d, o, div, reg, f;
                     ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:592:25: warning: unused variable 'f' [-Wunused-variable]
           u32 m, d, o, div, reg, f;
                                  ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:929:29: warning: unused variable 'match' [-Wunused-variable]
           const struct of_device_id *match;
                                      ^
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:680:29: warning: unused variable 'clk_wzrd_ver_divider_ops' [-Wunused-const-variable]
   static const struct clk_ops clk_wzrd_ver_divider_ops = {
                               ^
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:686:29: warning: unused variable 'clk_wzrd_ver_div_all_ops' [-Wunused-const-variable]
   static const struct clk_ops clk_wzrd_ver_div_all_ops = {
                               ^
   48 warnings generated.


vim +/clk_wzrd_ver_divider_ops +680 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

   679	
 > 680	static const struct clk_ops clk_wzrd_ver_divider_ops = {
   681		.round_rate = clk_wzrd_round_rate,
   682		.set_rate = clk_wzrd_ver_dynamic_reconfig,
   683		.recalc_rate = clk_wzrd_recalc_rate_ver,
   684	};
   685	
 > 686	static const struct clk_ops clk_wzrd_ver_div_all_ops = {
   687		.round_rate = clk_wzrd_round_rate_all,
   688		.set_rate = clk_wzrd_dynamic_all_ver,
   689		.recalc_rate = clk_wzrd_recalc_rate_all_ver,
   690	};
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
