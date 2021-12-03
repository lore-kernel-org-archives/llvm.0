Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA8C2C80
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 06:30:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="223794933"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; 
   d="scan'208";a="223794933"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2021 22:30:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; 
   d="scan'208";a="677990253"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Dec 2021 22:29:59 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mt250-000HAb-A2; Fri, 03 Dec 2021 06:29:58 +0000
Date: Fri, 3 Dec 2021 14:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-href-charging-compiletest 23/23]
 drivers/power/supply/cw2015_battery.c:691:55: error: use of undeclared
 identifier 'cw'
Message-ID: <202112031447.ltG1SWxH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-href-charging-compiletest
head:   c362e3ead88e4c099ba792a0e3813e8aaeb68732
commit: c362e3ead88e4c099ba792a0e3813e8aaeb68732 [23/23] power: supply_core: Pass pointer to battery info
config: riscv-buildonly-randconfig-r006-20211203 (https://download.01.org/0day-ci/archive/20211203/202112031447.ltG1SWxH-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1e328b06c15273edf4a40a27ca24931b5efb3a87)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=c362e3ead88e4c099ba792a0e3813e8aaeb68732
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-href-charging-compiletest
        git checkout c362e3ead88e4c099ba792a0e3813e8aaeb68732
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/power/supply/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/power/supply/cw2015_battery.c:691:55: error: use of undeclared identifier 'cw'
                   cw_bat->battery = devm_kzalloc(&client->dev, sizeof(cw->battery),
                                                                       ^
   1 error generated.
--
>> drivers/power/supply/bq27xxx_battery.c:1524:34: error: incompatible pointer types passing 'struct power_supply_battery_info **' to parameter of type 'struct power_supply_battery_info *'; remove & [-Werror,-Wincompatible-pointer-types]
                   bq27xxx_battery_set_config(di, &info);
                                                  ^~~~~
   drivers/power/supply/bq27xxx_battery.c:1431:46: note: passing argument to parameter 'info' here
                                          struct power_supply_battery_info *info)
                                                                            ^
   1 error generated.
--
>> drivers/power/supply/sc27xx_fuel_gauge.c:1020:42: error: incompatible pointer types passing 'struct power_supply_battery_info **' to parameter of type 'struct power_supply_battery_info *'; remove & [-Werror,-Wincompatible-pointer-types]
           table = power_supply_find_ocv2cap_table(&info, 20, &data->table_len);
                                                   ^~~~~
   include/linux/power_supply.h:583:67: note: passing argument to parameter 'info' here
   power_supply_find_ocv2cap_table(struct power_supply_battery_info *info,
                                                                     ^
   1 error generated.


vim +/cw +691 drivers/power/supply/cw2015_battery.c

   641	
   642	static int cw_bat_probe(struct i2c_client *client)
   643	{
   644		int ret;
   645		struct cw_battery *cw_bat;
   646		struct power_supply_config psy_cfg = { 0 };
   647	
   648		cw_bat = devm_kzalloc(&client->dev, sizeof(*cw_bat), GFP_KERNEL);
   649		if (!cw_bat)
   650			return -ENOMEM;
   651	
   652		i2c_set_clientdata(client, cw_bat);
   653		cw_bat->dev = &client->dev;
   654		cw_bat->soc = 1;
   655	
   656		ret = cw2015_parse_properties(cw_bat);
   657		if (ret) {
   658			dev_err(cw_bat->dev, "Failed to parse cw2015 properties\n");
   659			return ret;
   660		}
   661	
   662		cw_bat->regmap = devm_regmap_init_i2c(client, &cw2015_regmap_config);
   663		if (IS_ERR(cw_bat->regmap)) {
   664			dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
   665				PTR_ERR(cw_bat->regmap));
   666			return PTR_ERR(cw_bat->regmap);
   667		}
   668	
   669		ret = cw_init(cw_bat);
   670		if (ret) {
   671			dev_err(cw_bat->dev, "Init failed: %d\n", ret);
   672			return ret;
   673		}
   674	
   675		psy_cfg.drv_data = cw_bat;
   676		psy_cfg.fwnode = dev_fwnode(cw_bat->dev);
   677	
   678		cw_bat->rk_bat = devm_power_supply_register(&client->dev,
   679							    &cw2015_bat_desc,
   680							    &psy_cfg);
   681		if (IS_ERR(cw_bat->rk_bat)) {
   682			/* try again if this happens */
   683			dev_err_probe(&client->dev, PTR_ERR(cw_bat->rk_bat),
   684				"Failed to register power supply\n");
   685			return PTR_ERR(cw_bat->rk_bat);
   686		}
   687	
   688		ret = power_supply_get_battery_info(cw_bat->rk_bat, &cw_bat->battery);
   689		if (ret) {
   690			/* Allocate an empty battery */
 > 691			cw_bat->battery = devm_kzalloc(&client->dev, sizeof(cw->battery),
   692						       GFP_KERNEL);
   693			if (!cw_bat->battery)
   694				return -ENOMEM;
   695			dev_warn(cw_bat->dev,
   696				 "No monitored battery, some properties will be missing\n");
   697		}
   698	
   699		cw_bat->battery_workqueue = create_singlethread_workqueue("rk_battery");
   700		INIT_DELAYED_WORK(&cw_bat->battery_delay_work, cw_bat_work);
   701		queue_delayed_work(cw_bat->battery_workqueue,
   702				   &cw_bat->battery_delay_work, msecs_to_jiffies(10));
   703		return 0;
   704	}
   705	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
