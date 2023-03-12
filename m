Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1D11848;
	Sun, 12 Mar 2023 05:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678600455; x=1710136455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2mqj4hqymbHqRfD6DPQ8pMEIwJ9vZaQcKQsUiA6wBg=;
  b=n0Xrpxx+TN1knMSZngsFc4yIuFAgreu1Rg11AC/Cc4gbPBJ6LPfFmt/Z
   V8aLfL2AAFTIJgt+1i4BtphYkNui3PLAJ0qTV4eDbJlK69pCxcqhpgGbR
   ReUIn1DED6VE4uzwYi38FQrf1ZatseqEukW9BtuJaCY7OQmF/ypBXnl7n
   IsrDvpYtXSuf8MbDZxfGmAaYD+wLXKJcnvWThMwJqcaWPeiCXmYp2SKg6
   KnGDUsw55gMelhi5EzHn33nFZO3LkhxQTUBuLReDRTcw6df2pU4G07Q5Y
   xh8L8RCcBpjT8gxgwdzabTn6LamUw9MeTEMCnWdVqCs6k4ACJPu4zPIIX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="336984598"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="336984598"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 21:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="655619867"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="655619867"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Mar 2023 21:54:13 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbEeq-00051o-1T;
	Sun, 12 Mar 2023 05:54:12 +0000
Date: Sun, 12 Mar 2023 13:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:rk3588 21/24] drivers/cpufreq/rockchip-cpufreq.c:327:6:
 warning: variable 'np' is used uninitialized whenever 'if' condition is true
Message-ID: <202303121347.420PxLKK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   33c1f355b9e3adddf69e0e86b504236e2b2f611e
commit: 9318de1973da5b701d772c900b53062689b84d54 [21/24] cpufreq: rockchip: Fix functionality
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230312/202303121347.420PxLKK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git/commit/?id=9318de1973da5b701d772c900b53062689b84d54
        git remote add sre-misc https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git
        git fetch --no-tags sre-misc rk3588
        git checkout 9318de1973da5b701d772c900b53062689b84d54
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/bus/fsl-mc/ drivers/cpufreq/ drivers/power/supply/ net/dsa/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121347.420PxLKK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/rockchip-cpufreq.c:327:6: warning: variable 'np' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (reg_table_token < 0) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/rockchip-cpufreq.c:371:14: note: uninitialized use occurs here
           of_node_put(np);
                       ^~
   drivers/cpufreq/rockchip-cpufreq.c:327:2: note: remove the 'if' if its condition is always false
           if (reg_table_token < 0) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/rockchip-cpufreq.c:314:24: note: initialize the variable 'np' to silence this warning
           struct device_node *np;
                                 ^
                                  = NULL
   1 warning generated.


vim +327 drivers/cpufreq/rockchip-cpufreq.c

   308	
   309	static int rockchip_cpufreq_cluster_init(int cpu, struct cluster_info *cluster)
   310	{
   311		struct rockchip_opp_info *opp_info = &cluster->opp_info;
   312		int reg_table_token = -EINVAL;
   313		int opp_table_token = -EINVAL;
   314		struct device_node *np;
   315		struct device *dev;
   316		const char * const reg_names[] = { "cpu", "mem", NULL };
   317		int ret = 0;
   318	
   319		dev = get_cpu_device(cpu);
   320		if (!dev)
   321			return -ENODEV;
   322	
   323		if (!of_find_property(dev->of_node, "cpu-supply", NULL))
   324			return -ENOENT;
   325	
   326		reg_table_token = dev_pm_opp_set_regulators(dev, reg_names);
 > 327		if (reg_table_token < 0) {
   328			ret = reg_table_token;
   329			dev_err(dev, "Failed to set opp regulators\n");
   330			goto np_err;
   331		}
   332	
   333		np = of_parse_phandle(dev->of_node, "operating-points-v2", 0);
   334		if (!np) {
   335			dev_warn(dev, "OPP-v2 not supported\n");
   336			return -ENOENT;
   337		}
   338	
   339		ret = dev_pm_opp_of_get_sharing_cpus(dev, &cluster->cpus);
   340		if (ret) {
   341			dev_err(dev, "Failed to get sharing cpus\n");
   342			goto np_err;
   343		}
   344	
   345		rockchip_get_opp_data(rockchip_cpufreq_of_match, opp_info);
   346		if (opp_info->data && opp_info->data->set_read_margin) {
   347			opp_info->current_rm = UINT_MAX;
   348			opp_info->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
   349			if (IS_ERR(opp_info->grf))
   350				opp_info->grf = NULL;
   351			rockchip_get_volt_rm_table(dev, np, "rockchip,volt-mem-read-margin", &opp_info->volt_rm_tbl);
   352	
   353			of_property_read_u32(np, "rockchip,reboot-freq", &opp_info->reboot_freq);
   354		}
   355	
   356		opp_table_token = dev_pm_opp_set_config_regulators(dev, rk_opp_config_regulators);
   357		if (opp_table_token < 0) {
   358			ret = opp_table_token;
   359			dev_err(dev, "Failed to set opp config regulators\n");
   360			goto reg_opp_table;
   361		}
   362	
   363		of_node_put(np);
   364	
   365		return 0;
   366	
   367	reg_opp_table:
   368		if (reg_table_token >= 0)
   369			dev_pm_opp_put_regulators(reg_table_token);
   370	np_err:
   371		of_node_put(np);
   372	
   373		return ret;
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
