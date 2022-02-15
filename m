Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ED51561
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644934073; x=1676470073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QyOdFie58DqVD5pCUmn6qiB/IdU9X3h2j5/DJpDPuIU=;
  b=BxgwEFD93C69IXTp+V7fThniOAaKdKMsMKVx+gyYfZJgfyz68S3P2IPU
   yII5JEeRgjst+tLa7GcStLyMFqsXFuAP6Uez8xgdH5TNm2BrIArgJ0Yme
   0g3b32LegSpLbiu/hlfPEI/WWCRcE6x01/bEnAuUYPxIVtqdNhd0MLTro
   knKPA2ZI67Omt/43vUOZKyndWjxb7qs7l4ORvWsgJ4lSsC5EaC82Zk3a0
   3LFbt5YaEpxpGIHRZ8xUzZhnZ2G8XwT2h2GFH4UDAEkIV6qkfDPtIwwMw
   MNUGYWbXrhRQIjvKQPooxwhHP7A3TULQxq1niAQx+rHLe/6HTPsKC9x1A
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250300609"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="250300609"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 06:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="497176230"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Feb 2022 06:07:51 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJyUg-0009jE-Pa; Tue, 15 Feb 2022 14:07:50 +0000
Date: Tue, 15 Feb 2022 22:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
Message-ID: <202202152237.xcXTQpk6-lkp@intel.com>
References: <20220215043353.1256754-2-bjorn.andersson@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215043353.1256754-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Bjorn,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on v5.17-rc4 next-20220215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bjorn-Andersson/drm-msm-dpu-Add-INTF_5-interrupts/20220215-123310
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220215/202202152237.xcXTQpk6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2ad34ad9a2871f13cf0948eecc12d7faabcee788
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bjorn-Andersson/drm-msm-dpu-Add-INTF_5-interrupts/20220215-123310
        git checkout 2ad34ad9a2871f13cf0948eecc12d7faabcee788
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/ drivers/pwm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1124:39: warning: excess elements in array initializer [-Wexcess-initializers]
           .danger_lut_tbl = {0xf, 0xffff, 0x0, 0x0},
                                                ^~~
   1 warning generated.


vim +1124 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

  1117	
  1118	static const struct dpu_perf_cfg sc8180x_perf_data = {
  1119		.max_bw_low = 9600000,
  1120		.max_bw_high = 9600000,
  1121		.min_core_ib = 2400000,
  1122		.min_llcc_ib = 800000,
  1123		.min_dram_ib = 800000,
> 1124		.danger_lut_tbl = {0xf, 0xffff, 0x0, 0x0},
  1125		.qos_lut_tbl = {
  1126			{.nentry = ARRAY_SIZE(sc8180x_qos_linear),
  1127			.entries = sc8180x_qos_linear
  1128			},
  1129			{.nentry = ARRAY_SIZE(sc8180x_qos_macrotile),
  1130			.entries = sc8180x_qos_macrotile
  1131			},
  1132			{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
  1133			.entries = sc7180_qos_nrt
  1134			},
  1135			/* TODO: macrotile-qseed is different from macrotile */
  1136		},
  1137		.cdp_cfg = {
  1138			{.rd_enable = 1, .wr_enable = 1},
  1139			{.rd_enable = 1, .wr_enable = 0}
  1140		},
  1141		.clk_inefficiency_factor = 105,
  1142		.bw_inefficiency_factor = 120,
  1143	};
  1144	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
