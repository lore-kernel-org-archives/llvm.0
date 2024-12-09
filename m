Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E242156C74;
	Mon,  9 Dec 2024 04:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717535; cv=none; b=jH/NYwPfXDAKathVox3jojzNj9CXv7qbWOUFz6Jc9k1/bgpjPF/RfvamR5D/PfiM8wlmy41kAE+EWZVqiX+zAerFPSHk/cf7yvOKHcyeNWS023/MxZkmJ0n00jCx1iE505KDsznwuRVudrpzGGZZOfGArW8X3T6T63HDGa21iBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717535; c=relaxed/simple;
	bh=jeaU5cD30qq8KgLp1vwHXVGn1Sa67LzrXjtJZtFG+ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2S1duesyEPObLwi5sGyZns/6/LUorg/DNAnjpvkcrknsRXP2epAFhkuT/mN6QUgPS1m2HWFKj4noCWGCHqAAjL86nZsICgMlnXJ876prlP3dgoDoo12Rw3tifc3E5fKzzQmOmnfMxjJRH4/dou9Gj1Wb4OdlYTOCdliDgEXt5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l13mMJLk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l13mMJLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717534; x=1765253534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jeaU5cD30qq8KgLp1vwHXVGn1Sa67LzrXjtJZtFG+ds=;
  b=l13mMJLk0oVWgbbFuZWhUftuXQqIdqrZjIVw2tbkB8sRA/gjMmifOFDk
   jRjHaR2YUO3W+QhhnovhWSPCm0CxsEqp9lkhm+uC/dbo8tJmKcmhurZFd
   9rLukXBWZj+7yY5lc6CufsMa6bJqYgGdTOwHbHDzszd4CyWcPhTgba6o0
   kxKSQp3BZ7u50gdRB54/FKZx1t3HoRcXayxc2sanpdjvsf/ol13J+QI6n
   xTfGZq74lCaeX2Oa0ylq3MDnNffxsPh+0ndFSpDiprw+88GL7HQWb20fz
   noSDI9JZ1fGRnv1RczGaBIcMt0aLTxMztC//0zxPg3YNogb2NVYwgjj33
   A==;
X-CSE-ConnectionGUID: S+0ISvT+Qnm7tK0aI//QAA==
X-CSE-MsgGUID: gf4TV7sGR1uyzixdXYwQ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33891404"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33891404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:12:13 -0800
X-CSE-ConnectionGUID: 15WYhjCEQKy/SNHF2n3+uA==
X-CSE-MsgGUID: VqFIhV3CSNK1s0SWk9lplw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99004598"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:12:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV7t-0003oD-1u;
	Mon, 09 Dec 2024 04:12:05 +0000
Date: Mon, 9 Dec 2024 12:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Taniya Das <quic_tdas@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH 3/3] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
Message-ID: <202412071654.X0lSg9EN-lkp@intel.com>
References: <20241206-sm8750_videocc-v1-3-5da6e7eea2bd@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-sm8750_videocc-v1-3-5da6e7eea2bd@quicinc.com>

Hi Taniya,

kernel test robot noticed the following build errors:

[auto build test ERROR on af2ea8ab7a546b430726183458da0a173d331272]

url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-branch-Extend-invert-logic-for-branch2-mem-clocks/20241207-015655
base:   af2ea8ab7a546b430726183458da0a173d331272
patch link:    https://lore.kernel.org/r/20241206-sm8750_videocc-v1-3-5da6e7eea2bd%40quicinc.com
patch subject: [PATCH 3/3] clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241207/202412071654.X0lSg9EN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071654.X0lSg9EN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071654.X0lSg9EN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/qcom/videocc-sm8750.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/videocc-sm8750.c:56:29: error: use of undeclared identifier 'CLK_ALPHA_PLL_TYPE_TAYCAN_ELU'; did you mean 'CLK_ALPHA_PLL_TYPE_RIVIAN_EVO'?
      56 |         .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    CLK_ALPHA_PLL_TYPE_RIVIAN_EVO
   drivers/clk/qcom/clk-alpha-pll.h:30:2: note: 'CLK_ALPHA_PLL_TYPE_RIVIAN_EVO' declared here
      30 |         CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
         |         ^
>> drivers/clk/qcom/videocc-sm8750.c:64:12: error: use of undeclared identifier 'clk_alpha_pll_taycan_elu_ops'; did you mean 'clk_alpha_pll_rivian_evo_ops'?
      64 |                         .ops = &clk_alpha_pll_taycan_elu_ops,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 clk_alpha_pll_rivian_evo_ops
   drivers/clk/qcom/clk-alpha-pll.h:195:29: note: 'clk_alpha_pll_rivian_evo_ops' declared here
     195 | extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
         |                             ^
>> drivers/clk/qcom/videocc-sm8750.c:426:2: error: call to undeclared function 'clk_taycan_elu_pll_configure'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     426 |         clk_taycan_elu_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
         |         ^
   drivers/clk/qcom/videocc-sm8750.c:426:2: note: did you mean 'clk_rivian_evo_pll_configure'?
   drivers/clk/qcom/clk-alpha-pll.h:221:6: note: 'clk_rivian_evo_pll_configure' declared here
     221 | void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
         |      ^
   4 warnings and 3 errors generated.


vim +56 drivers/clk/qcom/videocc-sm8750.c

    51	
    52	static struct clk_alpha_pll video_cc_pll0 = {
    53		.offset = 0x0,
    54		.vco_table = taycan_elu_vco,
    55		.num_vco = ARRAY_SIZE(taycan_elu_vco),
  > 56		.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
    57		.clkr = {
    58			.hw.init = &(const struct clk_init_data) {
    59				.name = "video_cc_pll0",
    60				.parent_data = &(const struct clk_parent_data) {
    61					.index = DT_BI_TCXO,
    62				},
    63				.num_parents = 1,
  > 64				.ops = &clk_alpha_pll_taycan_elu_ops,
    65			},
    66		},
    67	};
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
