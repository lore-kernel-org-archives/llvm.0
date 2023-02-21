Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B42C6FC4;
	Tue, 21 Feb 2023 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677001954; x=1708537954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J8xilWvaJmR1xiHa1vfR9jgPRt6kr5Zfp++G4sQ6VXI=;
  b=WOyPpisg2ZxvYR0uH1DCfzz4E2Cl7CrzAsYLvebvfTjDgVVlH0s16Fl9
   2zqkf0YXC7+uBmgjxNgFLo38IrgGoxk6aVZkcZvWmKnHJcj+Z3iSgGD0z
   L33m1vjMslmClMOlBwhanzEX46h4FT4U4hLAMvW/JkEszt0SHil4PP0r5
   1VpuZu1FnRAI0wbPTKWzfkYyJxwwfaYBP9FaCIGpT6ytaePhh2s+x1926
   Q2j2ZbxBaLmsOs1GAYtwG05nZkwkTxR5yGm8au1KpzSulHqRKbeOlSVLc
   KAQJqw+GQ/H/Iuo66JbVE3vq6INmSlCVRy2RcoVQuuOmhdWQCRRfRRByy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397394157"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="397394157"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 09:52:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="917270931"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="917270931"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2023 09:52:32 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUWoZ-00006L-16;
	Tue, 21 Feb 2023 17:52:31 +0000
Date: Wed, 22 Feb 2023 01:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 344/620] drivers/clk/qcom/clk-cbf-8996.c:403:45: error: too many arguments
 to function call, expected single argument 'pdev', have 2 arguments
Message-ID: <202302220137.V9Hhcxpy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   1f3ac4514a512e9f791badc3c6754a55a40a1492
commit: e7fac1ad7827402e38be0fba7c195b93afa32f55 [344/620] clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
config: arm64-randconfig-r011-20230220 (https://download.01.org/0day-ci/archive/20230222/202302220137.V9Hhcxpy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/krzk/linux/commit/e7fac1ad7827402e38be0fba7c195b93afa32f55
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout e7fac1ad7827402e38be0fba7c195b93afa32f55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220137.V9Hhcxpy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/qcom/clk-cbf-8996.c:194:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case ABORT_RATE_CHANGE:
                ^~~~~~~~~~~~~~~~~
   include/linux/clk.h:41:28: note: expanded from macro 'ABORT_RATE_CHANGE'
   #define ABORT_RATE_CHANGE               BIT(2)
                                           ^~~~~~
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^~~~~~~~~~~~~~~
   drivers/clk/qcom/clk-cbf-8996.c:205:29: note: uninitialized use occurs here
           return notifier_from_errno(ret);
                                      ^~~
   drivers/clk/qcom/clk-cbf-8996.c:181:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case PRE_RATE_CHANGE:
                ^~~~~~~~~~~~~~~
   include/linux/clk.h:39:27: note: expanded from macro 'PRE_RATE_CHANGE'
   #define PRE_RATE_CHANGE                 BIT(0)
                                           ^~~~~~
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^~~~~~~~~~~~~~~
   drivers/clk/qcom/clk-cbf-8996.c:205:29: note: uninitialized use occurs here
           return notifier_from_errno(ret);
                                      ^~~
   drivers/clk/qcom/clk-cbf-8996.c:178:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
>> drivers/clk/qcom/clk-cbf-8996.c:403:45: error: too many arguments to function call, expected single argument 'pdev', have 2 arguments
           return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~       ^~~~~~~~~~~~~~~~
   drivers/clk/qcom/clk-cbf-8996.c:344:12: note: 'qcom_msm8996_cbf_icc_register' declared here
   static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev)
              ^
>> drivers/clk/qcom/clk-cbf-8996.c:423:17: error: use of undeclared identifier 'icc_sync_state'
                   .sync_state = icc_sync_state,
                                 ^
   2 warnings and 2 errors generated.


vim +/pdev +403 drivers/clk/qcom/clk-cbf-8996.c

   352	
   353	static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
   354	{
   355		void __iomem *base;
   356		struct regmap *regmap;
   357		struct device *dev = &pdev->dev;
   358		int i, ret;
   359	
   360		base = devm_platform_ioremap_resource(pdev, 0);
   361		if (IS_ERR(base))
   362			return PTR_ERR(base);
   363	
   364		regmap = devm_regmap_init_mmio(dev, base, &cbf_msm8996_regmap_config);
   365		if (IS_ERR(regmap))
   366			return PTR_ERR(regmap);
   367	
   368		/* Select GPLL0 for 300MHz for the CBF clock */
   369		regmap_write(regmap, CBF_MUX_OFFSET, 0x3);
   370	
   371		/* Ensure write goes through before PLLs are reconfigured */
   372		udelay(5);
   373	
   374		clk_alpha_pll_configure(&cbf_pll, regmap, &cbfpll_config);
   375	
   376		/* Wait for PLL(s) to lock */
   377	        udelay(50);
   378	
   379		/* Switch CBF to use the primary PLL */
   380		regmap_update_bits(regmap, CBF_MUX_OFFSET,
   381				   CBF_MUX_PARENT_MASK, 0x1);
   382	
   383		for (i = 0; i < ARRAY_SIZE(cbf_msm8996_hw_clks); i++) {
   384			ret = devm_clk_hw_register(dev, cbf_msm8996_hw_clks[i]);
   385			if (ret)
   386				return ret;
   387		}
   388	
   389		for (i = 0; i < ARRAY_SIZE(cbf_msm8996_clks); i++) {
   390			ret = devm_clk_register_regmap(dev, cbf_msm8996_clks[i]);
   391			if (ret)
   392				return ret;
   393		}
   394	
   395		ret = devm_clk_notifier_register(dev, cbf_mux.clkr.hw.clk, &cbf_mux.nb);
   396		if (ret)
   397			return ret;
   398	
   399		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
   400		if (ret)
   401			return ret;
   402	
 > 403		return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
   404	}
   405	
   406	static int qcom_msm8996_cbf_remove(struct platform_device *pdev)
   407	{
   408		return qcom_msm8996_cbf_icc_remove(pdev);
   409	}
   410	
   411	static const struct of_device_id qcom_msm8996_cbf_match_table[] = {
   412		{ .compatible = "qcom,msm8996-cbf" },
   413		{ /* sentinel */ },
   414	};
   415	MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
   416	
   417	static struct platform_driver qcom_msm8996_cbf_driver = {
   418		.probe = qcom_msm8996_cbf_probe,
   419		.remove = qcom_msm8996_cbf_remove,
   420		.driver = {
   421			.name = "qcom-msm8996-cbf",
   422			.of_match_table = qcom_msm8996_cbf_match_table,
 > 423			.sync_state = icc_sync_state,
   424		},
   425	};
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
