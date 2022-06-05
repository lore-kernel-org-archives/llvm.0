Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710A1FA4
	for <llvm@lists.linux.dev>; Sun,  5 Jun 2022 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654442692; x=1685978692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yikPlj0wND/Abtn5F66hdIjP6Y6XeK5dIgxnMBNJi40=;
  b=BPMJTJSmCJLwxnMztqAo5ThcrsxX19EX7fszAiYd45x7oFZa9tOWH/R1
   wArHj/AEOspYPs/g7uRvydd4DyC0BHIc4zM3/Lh6lpzjOqBV/9dEXGAcp
   XEy2GnkRwIBOfq7CvbbUCTGqL/yPOG4nDcXUBm1vzjVkFgVoBSiFG6sfJ
   gyFmmu1TRjJI8MQh85pwrPCY141kCeGIoxfvQaJ+Q3d7d14VtVuJODK7E
   TFCTuJzOah8wi+iGp1MJCW/2GwKVUqMmIK6ggs1Kv0y4KVytzmaiWcl7n
   KApDEo8Mele9Sp54bwdbK+eE8SXKr9DLmhYRKz5J4DsP5kWIPhZzRtBX4
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="258675547"
X-IronPort-AV: E=Sophos;i="5.91,279,1647327600"; 
   d="scan'208";a="258675547"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2022 08:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,279,1647327600"; 
   d="scan'208";a="613952476"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jun 2022 08:24:47 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxs7S-000C1B-UN;
	Sun, 05 Jun 2022 15:24:46 +0000
Date: Sun, 5 Jun 2022 23:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v10 1/5] clk: qcom: regmap: add PHY clock source
 implementation
Message-ID: <202206052344.Lkv2vI5x-lkp@intel.com>
References: <20220603084454.1861142-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603084454.1861142-2-dmitry.baryshkov@linaro.org>

Hi Dmitry,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.18]
[also build test ERROR on next-20220603]
[cannot apply to clk/clk-next helgaas-pci/next agross-msm/qcom/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/PCI-qcom-Rework-pipe_clk-pipe_clk_src-handling/20220605-164136
base:    4b0986a3613c92f4ec1bdc7f60ec66fea135991f
config: mips-randconfig-r005-20220605 (https://download.01.org/0day-ci/archive/20220605/202206052344.Lkv2vI5x-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 416a5080d89066029f9889dc23f94de47c2fa895)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4fbc2ca1313223feb409121fa1028557f72a310b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/PCI-qcom-Rework-pipe_clk-pipe_clk_src-handling/20220605-164136
        git checkout 4fbc2ca1313223feb409121fa1028557f72a310b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/clk-regmap-phy-mux.c:30:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           val = FIELD_GET(PHY_MUX_MASK, val);
                 ^
>> drivers/clk/qcom/clk-regmap-phy-mux.c:44:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                     FIELD_PREP(PHY_MUX_MASK, PHY_MUX_PHY_SRC));
                                     ^
   drivers/clk/qcom/clk-regmap-phy-mux.c:54:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                              FIELD_PREP(PHY_MUX_MASK, PHY_MUX_REF_SRC));
                              ^
   3 errors generated.


vim +/FIELD_GET +30 drivers/clk/qcom/clk-regmap-phy-mux.c

    22	
    23	static int phy_mux_is_enabled(struct clk_hw *hw)
    24	{
    25		struct clk_regmap *clkr = to_clk_regmap(hw);
    26		struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(clkr);
    27		unsigned int val;
    28	
    29		regmap_read(clkr->regmap, phy_mux->reg, &val);
  > 30		val = FIELD_GET(PHY_MUX_MASK, val);
    31	
    32		WARN_ON(val != PHY_MUX_PHY_SRC && val != PHY_MUX_REF_SRC);
    33	
    34		return val == PHY_MUX_PHY_SRC;
    35	}
    36	
    37	static int phy_mux_enable(struct clk_hw *hw)
    38	{
    39		struct clk_regmap *clkr = to_clk_regmap(hw);
    40		struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(clkr);
    41	
    42		return regmap_update_bits(clkr->regmap, phy_mux->reg,
    43					  PHY_MUX_MASK,
  > 44					  FIELD_PREP(PHY_MUX_MASK, PHY_MUX_PHY_SRC));
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
