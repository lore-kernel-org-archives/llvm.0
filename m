Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06A67C
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 19:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653505397; x=1685041397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SU179mfTpSWiQK7fl+PnzxUPgZEme8OU2i0LItLxxog=;
  b=WbvouVnqfxiKxpGHixd43FeCRwxIAhS1/8krRxoEQXIH5j7y7WYdm2Vh
   iwoZc/CuiCVqHyHxWAx0inZDNE9lMBR3q4F4fDOVKg3xrUrKHBPQNYL0O
   e046cMUaLXopL8uyEBLvmqMggNDMdQ2dSANTq2J/4Ls1jV/uByVtQModv
   Vp36sQrPjZLhpemmcM9aBiFVkwjiawIAMwOdtIHEW1rCOGEw5cwoPq3Fr
   PYZ/mCh0osV9Yk4f2N42Mr8SMOd6hZrdIzVXTUXTfqlTJ5DRW2ZATo+Tj
   Y2IOETpFKu4npnYjQIwkEpNzKk3JTrUEnFG/r8uYAHQlv3y2d/VZrCVU1
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="255974616"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="255974616"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 12:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="609335504"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 May 2022 12:03:05 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntwHh-0003FY-8p;
	Wed, 25 May 2022 19:03:05 +0000
Date: Thu, 26 May 2022 03:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [vireshk-pm:opp/config 26/33]
 drivers/memory/tegra/tegra124-emc.c:1401:20: error: use of undeclared
 identifier 'hw_versions'; did you mean 'hw_version'?
Message-ID: <202205260254.LPPZybMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/config
head:   d730dc101c586defb49eeafd8eea9b7bb0baa01b
commit: c2dbafb4076bf639babb279975e034a050d9b72a [26/33] media: tegra: Migrate to dev_pm_opp_set_config()
config: arm64-randconfig-r031-20220524 (https://download.01.org/0day-ci/archive/20220526/202205260254.LPPZybMA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?id=c2dbafb4076bf639babb279975e034a050d9b72a
        git remote add vireshk-pm https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git
        git fetch --no-tags vireshk-pm opp/config
        git checkout c2dbafb4076bf639babb279975e034a050d9b72a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/memory/tegra/tegra124-emc.c:1401:20: error: use of undeclared identifier 'hw_versions'; did you mean 'hw_version'?
                   .supported_hw = &hw_versions,
                                    ^~~~~~~~~~~
                                    hw_version
   drivers/memory/tegra/tegra124-emc.c:1397:6: note: 'hw_version' declared here
           u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
               ^
   1 error generated.


vim +1401 drivers/memory/tegra/tegra124-emc.c

  1394	
  1395	static int tegra_emc_opp_table_init(struct tegra_emc *emc)
  1396	{
  1397		u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
  1398		struct opp_table *opp_table;
  1399		int err;
  1400		struct dev_pm_opp_config config = {
> 1401			.supported_hw = &hw_versions,
  1402			.supported_hw_count = 1,
  1403		};
  1404	
  1405		opp_table = dev_pm_opp_set_config(emc->dev, &config);
  1406		err = PTR_ERR_OR_ZERO(opp_table);
  1407		if (err) {
  1408			dev_err(emc->dev, "failed to set OPP config: %d\n", err);
  1409			return err;
  1410		}
  1411	
  1412		err = dev_pm_opp_of_add_table(emc->dev);
  1413		if (err) {
  1414			if (err == -ENODEV)
  1415				dev_err(emc->dev, "OPP table not found, please update your device tree\n");
  1416			else
  1417				dev_err(emc->dev, "failed to add OPP table: %d\n", err);
  1418	
  1419			goto put_hw_table;
  1420		}
  1421	
  1422		dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
  1423			      hw_version, clk_get_rate(emc->clk) / 1000000);
  1424	
  1425		/* first dummy rate-set initializes voltage state */
  1426		err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
  1427		if (err) {
  1428			dev_err(emc->dev, "failed to initialize OPP clock: %d\n", err);
  1429			goto remove_table;
  1430		}
  1431	
  1432		return 0;
  1433	
  1434	remove_table:
  1435		dev_pm_opp_of_remove_table(emc->dev);
  1436	put_hw_table:
  1437		dev_pm_opp_clear_config(opp_table);
  1438	
  1439		return err;
  1440	}
  1441	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
