Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827087E;
	Thu,  3 Aug 2023 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691053218; x=1722589218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73+3Cb5ni7Tet4YdqmGTp5ATSVgziQbJs+zBgt35usQ=;
  b=CAzNw4orJcuUsCs/w9eaueDjge/Xheg6T9qvUNdtBFRv8F1KnBIVWFMn
   xwtv4gVinN7NXeaCFDSWxlkqZohKBftWcr4B6fDzk3Z9l55x+I1443uUD
   I76J1mxfDuccVhRvAczpgQiqbaRDprOzDjs1KvUolRXZUvklqFPiI/o65
   bAKpctUQFJDuhZcDT54xusCA89OOyx8hOsZFtabJXgHNpiPfPBVoDXtNy
   wmkc7nmYTDOvqR1WrnnJiJM5mD4i8IWZ9biCO74bQnFL/g8XTFKS1KIlr
   T+5M0SP8gHHbQdsKyXEO71CFS3MMEPjWZ3n254oIsWIHUG04qBsBzcGbc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="373447435"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="373447435"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 02:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="706475996"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="706475996"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Aug 2023 02:00:16 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRUBr-0001xo-13;
	Thu, 03 Aug 2023 09:00:15 +0000
Date: Thu, 3 Aug 2023 16:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hansg:media-ov2680 28/32] drivers/media/i2c/ov2680.c:1092:2:
 warning: comparison of distinct pointer types ('typeof
 ((sensor->pixel_rate)) *' (aka 'long long *') and 'uint64_t *' (aka
 'unsigned long long *'))
Message-ID: <202308031647.3XSbtmMJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git media-ov2680
head:   a17f9773e032a12d52d8e5cab428fb27233e54d0
commit: e68baf062551006eca61fafcddacfea552b15af2 [28/32] media: ov2680: Add link-freq and pixel-rate controls
config: riscv-randconfig-r042-20230731 (https://download.01.org/0day-ci/archive/20230803/202308031647.3XSbtmMJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031647.3XSbtmMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031647.3XSbtmMJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ov2680.c:1092:2: warning: comparison of distinct pointer types ('typeof ((sensor->pixel_rate)) *' (aka 'long long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
    1092 |         do_div(sensor->pixel_rate, 10);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   1 warning generated.


vim +1092 drivers/media/i2c/ov2680.c

  1008	
  1009	static int ov2680_parse_dt(struct ov2680_dev *sensor)
  1010	{
  1011		struct device *dev = sensor->dev;
  1012		struct fwnode_handle *ep_fwnode;
  1013		struct gpio_desc *gpio;
  1014		unsigned int rate = 0;
  1015		int i, ret;
  1016	
  1017		/*
  1018		 * Sometimes the fwnode graph is initialized by the bridge driver.
  1019		 * Bridge drivers doing this may also add GPIO mappings, wait for this.
  1020		 */
  1021		ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
  1022		if (!ep_fwnode)
  1023			return dev_err_probe(dev, -EPROBE_DEFER,
  1024					     "waiting for fwnode graph endpoint\n");
  1025	
  1026		fwnode_handle_put(ep_fwnode);
  1027	
  1028		/*
  1029		 * The pin we want is named XSHUTDN in the datasheet. Linux sensor
  1030		 * drivers have standardized on using "powerdown" as con-id name
  1031		 * for powerdown or shutdown pins. Older DTB files use "reset",
  1032		 * so fallback to that if there is no "powerdown" pin.
  1033		 */
  1034		gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
  1035		if (!gpio)
  1036			gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
  1037	
  1038		ret = PTR_ERR_OR_ZERO(gpio);
  1039		if (ret < 0) {
  1040			dev_dbg(dev, "error while getting reset gpio: %d\n", ret);
  1041			return ret;
  1042		}
  1043	
  1044		sensor->pwdn_gpio = gpio;
  1045	
  1046		sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
  1047		if (IS_ERR(sensor->xvclk)) {
  1048			dev_err(dev, "xvclk clock missing or invalid\n");
  1049			return PTR_ERR(sensor->xvclk);
  1050		}
  1051	
  1052		/*
  1053		 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
  1054		 * ACPI... but we also need to support the weird IPU3 case which will
  1055		 * have an external clock AND a clock-frequency property. Check for the
  1056		 * clock-frequency property and if found, set that rate if we managed
  1057		 * to acquire a clock. This should cover the ACPI case. If the system
  1058		 * uses devicetree then the configured rate should already be set, so
  1059		 * we can just read it.
  1060		 */
  1061		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
  1062					       &rate);
  1063		if (ret && !sensor->xvclk)
  1064			return dev_err_probe(dev, ret, "invalid clock config\n");
  1065	
  1066		if (!ret && sensor->xvclk) {
  1067			ret = clk_set_rate(sensor->xvclk, rate);
  1068			if (ret)
  1069				return dev_err_probe(dev, ret,
  1070						     "failed to set clock rate\n");
  1071		}
  1072	
  1073		sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
  1074	
  1075		for (i = 0; i < ARRAY_SIZE(ov2680_xvclk_freqs); i++) {
  1076			if (sensor->xvclk_freq == ov2680_xvclk_freqs[i])
  1077				break;
  1078		}
  1079	
  1080		if (i == ARRAY_SIZE(ov2680_xvclk_freqs))
  1081			return dev_err_probe(dev, -EINVAL,
  1082					     "unsupported xvclk frequency %d Hz\n",
  1083					     sensor->xvclk_freq);
  1084	
  1085		sensor->pll_mult = ov2680_pll_multipliers[i];
  1086	
  1087		sensor->link_freq[0] = sensor->xvclk_freq / OV2680_PLL_PREDIV0 /
  1088				       OV2680_PLL_PREDIV * sensor->pll_mult;
  1089	
  1090		/* CSI-2 is double data rate, bus-format is 10 bpp */
  1091		sensor->pixel_rate = sensor->link_freq[0] * 2;
> 1092		do_div(sensor->pixel_rate, 10);
  1093	
  1094		return 0;
  1095	}
  1096	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
