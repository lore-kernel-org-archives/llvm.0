Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6549B10EC
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 22:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649716630; x=1681252630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2eR85BMYnRz5kchIsdg13csHJIvsf2Bn4c9LJIBnfRY=;
  b=CVTjwqwZW7kvvuqQmbQGHxZXlaHr3Av+zCYOIiPRIAsjVozhPG49ZnTR
   Ek3DDiE855YYQr+mW7EqqglwJeTgB2yc4GDdh8W1Iler69X75JbpVA4Gd
   nFea4C3uVETbOkdMEv/QwjwG87Ammjf7t82vCbqFLKjqq+rGi0tNlDPI7
   GspMIdrkuP/RewFtQ0HBrcf4OJZq2Avkduvb7N5fbGkXs8g0oYvWVookX
   aq25uyTmdelilHFA6uReu/wJLgEY0/zUrRzprYEyRECAgzEq2VQ/cf+1Z
   hLx9BNW7FVn95JtlpKsqzduqJoL5lQM5pxEkSqaEqnEQtm7k+lCsQSOZU
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="325141511"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="325141511"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 15:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="525754348"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Apr 2022 15:37:08 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ne2eh-0002Gc-Sg;
	Mon, 11 Apr 2022 22:37:07 +0000
Date: Tue, 12 Apr 2022 06:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [krzk-github:n/qcom-ufs-opp-v2 14/16] drivers/opp/core.c:1177:4:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202204120601.Szg8qx1B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v2
head:   bf7d30c9329c87f06dff42b303a9bcfd2e1f54eb
commit: be46c855d54f763bfb95424e5204fe7496e2ee5f [14/16] PM: opp: allow control of multiple clocks
config: arm-buildonly-randconfig-r001-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120601.Szg8qx1B-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/krzk/linux/commit/be46c855d54f763bfb95424e5204fe7496e2ee5f
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/qcom-ufs-opp-v2
        git checkout be46c855d54f763bfb95424e5204fe7496e2ee5f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/opp/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/opp/core.c:1177:4: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                           if (opp_table->clks)
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/opp/core.c:1215:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/opp/core.c:1177:4: note: remove the 'if' if its condition is always true
                           if (opp_table->clks)
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/opp/core.c:1160:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +1177 drivers/opp/core.c

  1143	
  1144	/**
  1145	 * dev_pm_opp_set_rate() - Configure new OPP based on frequency
  1146	 * @dev:	 device for which we do this operation
  1147	 * @target_freq: frequency to achieve
  1148	 *
  1149	 * This configures the power-supplies to the levels specified by the OPP
  1150	 * corresponding to the target_freq, and programs the clock to a value <=
  1151	 * target_freq, as rounded by clk_round_rate(). Device wanting to run at fmax
  1152	 * provided by the opp, should have already rounded to the target OPP's
  1153	 * frequency.
  1154	 */
  1155	int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
  1156	{
  1157		struct opp_table *opp_table;
  1158		unsigned long freq = 0, temp_freq;
  1159		struct dev_pm_opp *opp = NULL;
  1160		int ret;
  1161	
  1162		opp_table = _find_opp_table(dev);
  1163		if (IS_ERR(opp_table)) {
  1164			dev_err(dev, "%s: device's opp table doesn't exist\n", __func__);
  1165			return PTR_ERR(opp_table);
  1166		}
  1167	
  1168		if (target_freq) {
  1169			/*
  1170			 * For IO devices which require an OPP on some platforms/SoCs
  1171			 * while just needing to scale the clock on some others
  1172			 * we look for empty OPP tables with just a clock handle and
  1173			 * scale only the clk. This makes dev_pm_opp_set_rate()
  1174			 * equivalent to a clk_set_rate()
  1175			 */
  1176			if (!_get_opp_count(opp_table)) {
> 1177				if (opp_table->clks)
  1178					ret = _generic_set_opp_clk_only(dev,
  1179									opp_table->clks[0],
  1180									target_freq);
  1181				goto put_opp_table;
  1182			}
  1183	
  1184			if (opp_table->clks)
  1185				freq = clk_round_rate(opp_table->clks[0], target_freq);
  1186			if ((long)freq <= 0)
  1187				freq = target_freq;
  1188	
  1189			/*
  1190			 * The clock driver may support finer resolution of the
  1191			 * frequencies than the OPP table, don't update the frequency we
  1192			 * pass to clk_set_rate() here.
  1193			 */
  1194			temp_freq = freq;
  1195			opp = _find_freq_ceil(opp_table, &temp_freq);
  1196			if (IS_ERR(opp)) {
  1197				ret = PTR_ERR(opp);
  1198				dev_err(dev, "%s: failed to find OPP for freq %lu (%d)\n",
  1199					__func__, freq, ret);
  1200				goto put_opp_table;
  1201			}
  1202			/*
  1203			 * opp->rates are used for scaling clocks, so be sure accurate
  1204			 * 'freq' is used, instead what was defined via e.g. Devicetree.
  1205			 */
  1206			opp->rates[0] = freq;
  1207		}
  1208	
  1209		ret = _set_opp(dev, opp_table, opp, freq);
  1210	
  1211		if (target_freq)
  1212			dev_pm_opp_put(opp);
  1213	put_opp_table:
  1214		dev_pm_opp_put_opp_table(opp_table);
  1215		return ret;
  1216	}
  1217	EXPORT_SYMBOL_GPL(dev_pm_opp_set_rate);
  1218	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
