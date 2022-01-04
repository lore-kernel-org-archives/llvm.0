Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757902C80
	for <llvm@lists.linux.dev>; Tue,  4 Jan 2022 05:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641272906; x=1672808906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kd7kPaEys7pVyFrc4dzzcm+OIGBKf71UGWsh1Rxd8TY=;
  b=m9+Ps7Gr1iT8YkhPv+W4kbmjiVJDXyRP5Ny6vTn0RVacHivTYm0p88c7
   2J5L6kJbhwDJfD1m8hJAm4uOFbhD3wKE+IPJ0QTKoMjY2Gd6aDP2EJIfy
   UEKsL6Qdjsoa43U8MoCGfwTX00GrNXLz9IF2w9EvGzpaXvJW+aXeeWVD7
   WqZ7Vb4STUc/pF+jrp6uigPKv8kfLgchkTaKFXaNBk+GKH5+UyqSfNPnz
   ytSkhzwfO2RGlp+RoIlvdfFCFZ4LjIG91gbaTDWbLQ9t19HK/KjDxvWoG
   /+P252tQW/W+y4B7k8WCKIDHtiskLkce+E7DdnNEt0rpGdnZtzMOnsG6p
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="305510628"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="305510628"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 21:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="573903933"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Jan 2022 21:08:23 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n4c3b-000EiN-A5; Tue, 04 Jan 2022 05:08:23 +0000
Date: Tue, 4 Jan 2022 13:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [sre-power-supply:for-next 11/28]
 drivers/power/supply/ab8500_btemp.c:527:35: warning: variable 'i' is
 uninitialized when used here
Message-ID: <202201041301.z9yQzYjF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
head:   25fd330370ac40653671f323acc7fb6db27ef6fe
commit: e5dff305ab5c539320f1e30db44604e9977c3504 [11/28] power: supply: ab8500: Use only one battery type
config: arm-randconfig-r001-20220103 (https://download.01.org/0day-ci/archive/20220104/202201041301.z9yQzYjF-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/commit/?id=e5dff305ab5c539320f1e30db44604e9977c3504
        git remote add sre-power-supply https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git
        git fetch --no-tags sre-power-supply for-next
        git checkout e5dff305ab5c539320f1e30db44604e9977c3504
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/power/supply/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/power/supply/ab8500_btemp.c:527:35: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                            di->bm->bat_type->resis_high, i);
                                                          ^
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                            ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/power/supply/ab8500_btemp.c:509:6: note: initialize the variable 'i' to silence this warning
           u8 i;
               ^
                = '\0'
   1 warning generated.


vim +/i +527 drivers/power/supply/ab8500_btemp.c

   497	
   498	/**
   499	 * ab8500_btemp_id() - Identify the connected battery
   500	 * @di:		pointer to the ab8500_btemp structure
   501	 *
   502	 * This function will try to identify the battery by reading the ID
   503	 * resistor. Some brands use a combined ID resistor with a NTC resistor to
   504	 * both be able to identify and to read the temperature of it.
   505	 */
   506	static int ab8500_btemp_id(struct ab8500_btemp *di)
   507	{
   508		int res;
   509		u8 i;
   510	
   511		di->curr_source = BTEMP_BATCTRL_CURR_SRC_7UA;
   512	
   513		res =  ab8500_btemp_get_batctrl_res(di);
   514		if (res < 0) {
   515			dev_err(di->dev, "%s get batctrl res failed\n", __func__);
   516			return -ENXIO;
   517		}
   518	
   519		if ((res <= di->bm->bat_type->resis_high) &&
   520		    (res >= di->bm->bat_type->resis_low)) {
   521			dev_info(di->dev, "Battery detected on %s"
   522				 " low %d < res %d < high: %d"
   523				 " index: %d\n",
   524				 di->bm->adc_therm == AB8500_ADC_THERM_BATCTRL ?
   525				 "BATCTRL" : "BATTEMP",
   526				 di->bm->bat_type->resis_low, res,
 > 527				 di->bm->bat_type->resis_high, i);
   528		} else {
   529			dev_warn(di->dev, "Battery identified as unknown"
   530				 ", resistance %d Ohm\n", res);
   531			return -ENXIO;
   532		}
   533	
   534		/*
   535		 * We only have to change current source if the
   536		 * detected type is Type 1 (LIPO) resis_high = 53407, resis_low = 12500
   537		 * if someone hacks this in.
   538		 *
   539		 * FIXME: make sure this is done automatically for the batteries
   540		 * that need it.
   541		 */
   542		if ((di->bm->adc_therm == AB8500_ADC_THERM_BATCTRL) &&
   543		    (di->bm->bat_type->name == POWER_SUPPLY_TECHNOLOGY_LIPO) &&
   544		    (res <= 53407) && (res >= 12500)) {
   545			dev_dbg(di->dev, "Set BATCTRL current source to 20uA\n");
   546			di->curr_source = BTEMP_BATCTRL_CURR_SRC_20UA;
   547		}
   548	
   549		return 0;
   550	}
   551	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
