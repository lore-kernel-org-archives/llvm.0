Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C9168
	for <llvm@lists.linux.dev>; Sun, 23 Jan 2022 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642964242; x=1674500242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q2l1fX8gInKAN+q/KE4C6Wz0GM+Bwbrm4UcSPTJs9pU=;
  b=RkqdhhzTSb1il1YAdVUHEO/MPtAvA6mh0azEZP1YfmGfkFHR2rnRJ0Aw
   TzWCe54kz5MLZ3K0JmpUqRHBX9MFptPGAPzSF15B72jwwdO+z+3ALViAD
   d+v1Jj/81k+Dc49y6Xcz9xxhqadw/1G3tkt7ireRBLoJkVmFbpp/2cysC
   yAesEUGb3tJl3IVXToXQ1KTnoCSs6FSQthgnIoaNsPYrWv8XcS1Dj0whK
   UpOxygUpt4BGI2twY0WHtpIJKRNMfI56QO0UgFhDcsQ4AClO6kC0suL3h
   n7vUn2xd2wPYQh4ujQBVVVhQ3M9IzHaY2TNmtHp85DcV0uC02d/SAm4MC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="244747953"
X-IronPort-AV: E=Sophos;i="5.88,310,1635231600"; 
   d="scan'208";a="244747953"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2022 10:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,310,1635231600"; 
   d="scan'208";a="519680445"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2022 10:57:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBi2w-000HT3-Hu; Sun, 23 Jan 2022 18:57:02 +0000
Date: Mon, 24 Jan 2022 02:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: michael.srba@seznam.cz
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 4/4] drivers: bus: add driver for initializing the SSC
 bus on (some) qcom SoCs
Message-ID: <202201240259.yrjnY1AO-lkp@intel.com>
References: <20220122180413.1480-4-michael.srba@seznam.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220122180413.1480-4-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v5.17-rc1 next-20220121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/michael-srba-seznam-cz/dt-bindings-clock-gcc-msm8998-Add-definitions-of-SSC-related-clocks/20220123-021013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: i386-randconfig-a011-20220124 (https://download.01.org/0day-ci/archive/20220124/202201240259.yrjnY1AO-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2895c20e9788239e701eb0a1774049aae7963864
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review michael-srba-seznam-cz/dt-bindings-clock-gcc-msm8998-Add-definitions-of-SSC-related-clocks/20220123-021013
        git checkout 2895c20e9788239e701eb0a1774049aae7963864
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/bus/qcom-ssc-block-bus.c:217:17: error: assigning to 'const char **' from 'const char *const[2]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           data->pd_names = qcom_ssc_block_pd_names;
                          ^ ~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +217 drivers/bus/qcom-ssc-block-bus.c

   199	
   200	static int qcom_ssc_block_bus_probe(struct platform_device *pdev)
   201	{
   202		struct qcom_ssc_block_bus_data *data;
   203		struct device_node *np = pdev->dev.of_node;
   204		struct of_phandle_args halt_args;
   205		struct resource *res;
   206		int ret;
   207	
   208		if (np)
   209			of_platform_populate(np, NULL, NULL, &pdev->dev);
   210	
   211		data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
   212		if (!data)
   213			return -ENOMEM;
   214	
   215		platform_set_drvdata(pdev, data);
   216	
 > 217		data->pd_names = qcom_ssc_block_pd_names;
   218		data->num_pds = ARRAY_SIZE(qcom_ssc_block_pd_names);
   219	
   220		ret = qcom_ssc_block_bus_pds_attach(&pdev->dev, data->pds, data->pd_names, data->num_pds);
   221		if (ret < 0) {
   222			dev_err(&pdev->dev, "error when attaching power domains: %d\n", ret);
   223			return ret;
   224		}
   225	
   226		ret = qcom_ssc_block_bus_pds_enable(data->pds, data->num_pds);
   227		if (ret < 0) {
   228			dev_err(&pdev->dev, "error when enabling power domains: %d\n", ret);
   229			return ret;
   230		}
   231	
   232		// the meaning of the bits in these two registers is sadly not documented,
   233		// the set/clear operations are just copying what qcom does
   234		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
   235		data->reg_mpm_sscaon_config0 = devm_ioremap_resource(&pdev->dev, res);
   236		if (IS_ERR(data->reg_mpm_sscaon_config0)) {
   237			ret = PTR_ERR(data->reg_mpm_sscaon_config0);
   238			dev_err(&pdev->dev, "failed to ioremap mpm_sscaon_config0 (err: %d)\n", ret);
   239			return ret;
   240		}
   241		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpm_sscaon_config0");
   242		data->reg_mpm_sscaon_config1 = devm_ioremap_resource(&pdev->dev, res);
   243		if (IS_ERR(data->reg_mpm_sscaon_config1)) {
   244			ret = PTR_ERR(data->reg_mpm_sscaon_config1);
   245			dev_err(&pdev->dev, "failed to ioremap mpm_sscaon_config1 (err: %d)\n", ret);
   246			return ret;
   247		}
   248	
   249		data->ssc_bcr = devm_reset_control_get_exclusive(&pdev->dev, "ssc_bcr");
   250		if (IS_ERR(data->ssc_bcr)) {
   251			ret = PTR_ERR(data->ssc_bcr);
   252			dev_err(&pdev->dev, "failed to acquire reset: scc_bcr (err: %d)\n", ret);
   253			return ret;
   254		}
   255		data->ssc_reset = devm_reset_control_get_exclusive(&pdev->dev, "ssc_reset");
   256		if (IS_ERR(data->ssc_reset)) {
   257			ret = PTR_ERR(data->ssc_reset);
   258			dev_err(&pdev->dev, "failed to acquire reset: ssc_reset: (err: %d)\n", ret);
   259			return ret;
   260		}
   261	
   262		data->xo_clk = devm_clk_get(&pdev->dev, "xo");
   263		if (IS_ERR(data->xo_clk)) {
   264			ret = PTR_ERR(data->xo_clk);
   265			if (ret != -EPROBE_DEFER)
   266				dev_err(&pdev->dev, "Failed to get clock: xo (err: %d)\n", ret);
   267			return ret;
   268		}
   269	
   270		data->aggre2_clk = devm_clk_get(&pdev->dev, "aggre2");
   271		if (IS_ERR(data->aggre2_clk)) {
   272			ret = PTR_ERR(data->aggre2_clk);
   273			if (ret != -EPROBE_DEFER)
   274				dev_err(&pdev->dev, "Failed to get clock: aggre2 (err: %d)\n", ret);
   275			return ret;
   276		}
   277	
   278		data->gcc_im_sleep_clk = devm_clk_get(&pdev->dev, "gcc_im_sleep");
   279		if (IS_ERR(data->gcc_im_sleep_clk)) {
   280			ret = PTR_ERR(data->gcc_im_sleep_clk);
   281			if (ret != -EPROBE_DEFER)
   282				dev_err(&pdev->dev, "Failed to get clock: gcc_im_sleep (err: %d)\n", ret);
   283			return ret;
   284		}
   285	
   286		data->aggre2_north_clk = devm_clk_get(&pdev->dev, "aggre2_north");
   287		if (IS_ERR(data->aggre2_north_clk)) {
   288			ret = PTR_ERR(data->aggre2_north_clk);
   289			if (ret != -EPROBE_DEFER)
   290				dev_err(&pdev->dev, "Failed to get clock: aggre2_north (err: %d)\n", ret);
   291			return ret;
   292		}
   293	
   294		data->ssc_xo_clk = devm_clk_get(&pdev->dev, "ssc_xo");
   295		if (IS_ERR(data->ssc_xo_clk)) {
   296			ret = PTR_ERR(data->ssc_xo_clk);
   297			if (ret != -EPROBE_DEFER)
   298				dev_err(&pdev->dev, "Failed to get clock: ssc_xo (err: %d)\n", ret);
   299			return ret;
   300		}
   301	
   302		data->ssc_ahbs_clk = devm_clk_get(&pdev->dev, "ssc_ahbs");
   303		if (IS_ERR(data->ssc_ahbs_clk)) {
   304			ret = PTR_ERR(data->ssc_ahbs_clk);
   305			if (ret != -EPROBE_DEFER)
   306				dev_err(&pdev->dev, "Failed to get clock: ssc_ahbs (err: %d)\n", ret);
   307			return ret;
   308		}
   309	
   310		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node, "qcom,halt-regs", 1, 0,
   311						       &halt_args);
   312		if (ret < 0) {
   313			dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
   314			return -EINVAL;
   315		}
   316	
   317		data->halt_map = syscon_node_to_regmap(halt_args.np);
   318		of_node_put(halt_args.np);
   319		if (IS_ERR(data->halt_map))
   320			return PTR_ERR(data->halt_map);
   321	
   322		data->ssc_axi_halt = halt_args.args[0];
   323	
   324		qcom_ssc_block_bus_init(&pdev->dev);
   325	
   326		return 0;
   327	}
   328	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
