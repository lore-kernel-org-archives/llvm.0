Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEE32564
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649340888; x=1680876888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWhY3jodudaZKR6GHXXAp4Bh1p+7Kuh3o7Vuu0DBYV4=;
  b=DCLE427p+/zQ4h30l0uq+Ebga3OEBbzgnrqt9FsBmFhn3yeKVtQ7Z9Vt
   EW4x/fShpza9xFlqA2VXCO68J5ARpyE8f6B1o7hu2HPp2OGVRj7fRTT7a
   9u7cybniG/4oc5Y4mvRsAbuebVL36puqcMaIrtTircho/8L16MEdntkU/
   r7YUzn5yHY+YO2BuHn22GZixY0h5IoA000snek2ZDl4PDDIBqc6zgbUIg
   Po4tki2Cbgm+OAhZfmr2fRi0ZMiL49/BOwcx4xuKcg0UPFZVuWyrquQWf
   TMD9Aq9PEV9Ltsh5QLXxa0qi1p02HnHm+PZo/k8q5k3yLS54sFUWKYJeV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10309"; a="261025561"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="261025561"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 07:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="506160115"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2022 07:14:46 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncSuL-0005UN-Ou;
	Thu, 07 Apr 2022 14:14:45 +0000
Date: Thu, 7 Apr 2022 22:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 484/1091]
 drivers/clk/clk-xlnx-clock-wizard-v.c:601:63: warning: variable 'i' is
 uninitialized when used here
Message-ID: <202204072256.Bz3SAMzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Shubhrajyoti,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   031eb9ce665429a9574c95f89bcc488fd0ba0ec1
commit: 8b5383767cb4c856283824baee568f4286ecc0db [484/1091] clocking-wizard: Add versal clocking wizard support
config: riscv-randconfig-r023-20220407 (https://download.01.org/0day-ci/archive/20220407/202204072256.Bz3SAMzY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b306233f78876a1d197ed6e1f05785505de7c63)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/8b5383767cb4c856283824baee568f4286ecc0db
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 8b5383767cb4c856283824baee568f4286ecc0db
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/clk-xlnx-clock-wizard-v.c:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/clk/clk-xlnx-clock-wizard-v.c:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/clk/clk-xlnx-clock-wizard-v.c:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   drivers/clk/clk-xlnx-clock-wizard-v.c:164:9: error: implicit declaration of function 'FIELD_GET' [-Werror,-Wimplicit-function-declaration]
           regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
                  ^
   drivers/clk/clk-xlnx-clock-wizard-v.c:276:12: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           regval1 = FIELD_PREP(WZRD_DIVCLK_EDGE, edged);
                     ^
>> drivers/clk/clk-xlnx-clock-wizard-v.c:601:63: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                   if (of_property_read_string_index(np, "clock-output-names", i,
                                                                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/clk/clk-xlnx-clock-wizard-v.c:545:7: note: initialize the variable 'i' to silence this warning
           int i, ret;
                ^
                 = 0
   8 warnings and 2 errors generated.


vim +/i +601 drivers/clk/clk-xlnx-clock-wizard-v.c

   539	
   540	static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
   541				 clk_wzrd_resume);
   542	
   543	static int clk_wzrd_probe(struct platform_device *pdev)
   544	{
   545		int i, ret;
   546		u32 regl, regh, edge, mult;
   547		u32 regld, reghd, edged, div;
   548		unsigned long rate;
   549		const char *clk_name;
   550		struct clk_wzrd *clk_wzrd;
   551		struct resource *mem;
   552		int outputs;
   553		struct device_node *np = pdev->dev.of_node;
   554	
   555		clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
   556		if (!clk_wzrd)
   557			return -ENOMEM;
   558		platform_set_drvdata(pdev, clk_wzrd);
   559	
   560		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   561		clk_wzrd->base = devm_ioremap_resource(&pdev->dev, mem);
   562		if (IS_ERR(clk_wzrd->base))
   563			return PTR_ERR(clk_wzrd->base);
   564	
   565		clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
   566		if (IS_ERR(clk_wzrd->clk_in1)) {
   567			if (clk_wzrd->clk_in1 != ERR_PTR(-EPROBE_DEFER))
   568				dev_err(&pdev->dev, "clk_in1 not found\n");
   569			return PTR_ERR(clk_wzrd->clk_in1);
   570		}
   571	
   572		clk_wzrd->axi_clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
   573		if (IS_ERR(clk_wzrd->axi_clk)) {
   574			if (clk_wzrd->axi_clk != ERR_PTR(-EPROBE_DEFER))
   575				dev_err(&pdev->dev, "s_axi_aclk not found\n");
   576			return PTR_ERR(clk_wzrd->axi_clk);
   577		}
   578		ret = clk_prepare_enable(clk_wzrd->axi_clk);
   579		if (ret) {
   580			dev_err(&pdev->dev, "enabling s_axi_aclk failed\n");
   581			return ret;
   582		}
   583		rate = clk_get_rate(clk_wzrd->axi_clk);
   584		if (rate > WZRD_ACLK_MAX_FREQ) {
   585			dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n",
   586				rate);
   587			ret = -EINVAL;
   588			goto err_disable_clk;
   589		}
   590	
   591		outputs = of_property_count_strings(np, "clock-output-names");
   592		clk_name = kasprintf(GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
   593		if (!clk_name) {
   594			ret = -ENOMEM;
   595			goto err_rm_int_clk;
   596		}
   597	
   598		if (outputs == 1) {
   599			const char *clkout_name;
   600	
 > 601			if (of_property_read_string_index(np, "clock-output-names", i,
   602							  &clkout_name)) {
   603				dev_err(&pdev->dev,
   604					"clock output name not specified\n");
   605				ret = -EINVAL;
   606				goto err_rm_int_clks;
   607			}
   608	
   609			clk_wzrd->clkout[0] = clk_wzrd_register_divider
   610					(&pdev->dev, clkout_name,
   611					__clk_get_name(clk_wzrd->clk_in1), 0,
   612					clk_wzrd->base, WZRD_CLK_CFG_REG(3),
   613					WZRD_CLKOUT_DIVIDE_SHIFT,
   614					WZRD_CLKOUT_DIVIDE_WIDTH,
   615					CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
   616					DIV_ALL, &clkwzrd_lock);
   617	
   618			goto out;
   619		}
   620	
   621		/* register multiplier */
   622		edge = !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) & BIT(8));
   623		regl = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(1)) &
   624			     WZRD_CLKFBOUT_L_MASK) >> WZRD_CLKFBOUT_L_SHIFT;
   625		regh = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(1)) &
   626			     WZRD_CLKFBOUT_H_MASK) >> WZRD_CLKFBOUT_H_SHIFT;
   627		mult = (regl  + regh + edge);
   628		if (!mult)
   629			mult = 1;
   630		mult = mult * 64;
   631	
   632		regl = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(51)) &
   633			     WZRD_CLKFBOUT_FRAC_EN;
   634		if (regl) {
   635			regl = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(48)) &
   636				WZRD_CLKFBOUT_FRAC_MASK;
   637			mult = mult + regl;
   638		}
   639	
   640		clk_name = kasprintf(GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
   641		if (!clk_name) {
   642			ret = -ENOMEM;
   643			goto err_disable_clk;
   644		}
   645		clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
   646				(&pdev->dev, clk_name,
   647				 __clk_get_name(clk_wzrd->clk_in1),
   648				0, mult, 64);
   649		kfree(clk_name);
   650		if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul])) {
   651			dev_err(&pdev->dev, "unable to register fixed-factor clock\n");
   652			ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul]);
   653			goto err_disable_clk;
   654		}
   655	
   656		/* register div */
   657		edged = !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(20)) &
   658			     BIT(10));
   659		regld = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(21)) &
   660			     WZRD_CLKFBOUT_L_MASK) >> WZRD_CLKFBOUT_L_SHIFT;
   661		reghd = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(21)) &
   662			     WZRD_CLKFBOUT_H_MASK) >> WZRD_CLKFBOUT_H_SHIFT;
   663		div = (regld  + reghd + edged);
   664		if (!div)
   665			div = 1;
   666		clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_fixed_factor
   667				(&pdev->dev, clk_name,
   668				 __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
   669				0, 1, div);
   670		if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
   671			dev_err(&pdev->dev, "unable to register divider clock\n");
   672			ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
   673			goto err_rm_int_clk;
   674		}
   675	
   676		/* register div per output */
   677		for (i = outputs - 1; i >= 0 ; i--) {
   678			const char *clkout_name;
   679	
   680			if (of_property_read_string_index(np, "clock-output-names", i,
   681							  &clkout_name)) {
   682				dev_err(&pdev->dev,
   683					"clock output name not specified\n");
   684				ret = -EINVAL;
   685				goto err_rm_int_clks;
   686			}
   687	
   688				clk_wzrd->clkout[i] = clk_wzrd_register_divider
   689					(&pdev->dev, clkout_name,
   690					clk_name, 0,
   691					clk_wzrd->base, (WZRD_CLK_CFG_REG(3) + i * 8),
   692					WZRD_CLKOUT_DIVIDE_SHIFT,
   693					WZRD_CLKOUT_DIVIDE_WIDTH,
   694					CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
   695					DIV_O, &clkwzrd_lock);
   696	
   697			if (IS_ERR(clk_wzrd->clkout[i])) {
   698				int j;
   699	
   700				for (j = i + 1; j < outputs; j++)
   701					clk_unregister(clk_wzrd->clkout[j]);
   702				dev_err(&pdev->dev,
   703					"unable to register divider clock\n");
   704				ret = PTR_ERR(clk_wzrd->clkout[i]);
   705				goto err_rm_int_clks;
   706			}
   707		}
   708	
   709		kfree(clk_name);
   710	
   711	out:
   712		clk_wzrd->clk_data.clks = clk_wzrd->clkout;
   713		clk_wzrd->clk_data.clk_num = ARRAY_SIZE(clk_wzrd->clkout);
   714		of_clk_add_provider(np, of_clk_src_onecell_get, &clk_wzrd->clk_data);
   715	
   716		return 0;
   717	
   718	err_rm_int_clks:
   719		clk_unregister(clk_wzrd->clks_internal[1]);
   720	err_rm_int_clk:
   721		kfree(clk_name);
   722		clk_unregister(clk_wzrd->clks_internal[0]);
   723	err_disable_clk:
   724		clk_disable_unprepare(clk_wzrd->axi_clk);
   725	
   726		return ret;
   727	}
   728	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
