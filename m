Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6C2CA3
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 03:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643082563; x=1674618563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8E0BXaujWRfP6SVgSA5AvLKHGn3ywtm8a64FjgzFAEw=;
  b=POsaE5+Wh9nbyeSgbmNoOs6BjxR7DQDhlrDI2JCk+EEtNvHKlfzhYI5S
   ciXnpAIoPCixdVeT5XIWhnl2TPozR9QCwU5gWxguspOB6slLL37dbEfsN
   a6zstGBrFHAkhf/H24PRrlY1C8VD4VXQPkh2A1MAB/oJ5TjYxWIiyFt3s
   Q2eMmSjIbYVu6uW0U++1dNjgX5L1Q/Rda5saxIOT3Aonc1W/SsCOA2BoS
   jlKDV+MNDgrTw3agrRPUhSMfjEH/CnNikhMKuukfvUAw/tbesGONirHi/
   CFsN1SMCQDg5TbHBCby6DBw9D69WgcUEH/O2z/Lu0Zgi/bM7ZtIjbe8ck
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="332565225"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="332565225"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 19:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="627754962"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2022 19:49:21 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCCpc-000JJ5-TS; Tue, 25 Jan 2022 03:49:20 +0000
Date: Tue, 25 Jan 2022 11:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Eckert <fe@dev.tdt.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 1/2] leds: ktd20xx: Extension of the KTD20xx family of
 LED drivers from Kinetic
Message-ID: <202201251140.YNV7J1Ot-lkp@intel.com>
References: <20220121140150.1729-2-fe@dev.tdt.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121140150.1729-2-fe@dev.tdt.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Florian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on robh/for-next linux/master linus/master v5.17-rc1 next-20220124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Florian-Eckert/leds-add-ktd20xx-LED-driver-support/20220121-220338
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220125/202201251140.YNV7J1Ot-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2e58a18910867ba6795066e044293e6daf89edf5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8e24c9cc5b5a807f40eec9cc643c2ea43f75e8a3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Florian-Eckert/leds-add-ktd20xx-LED-driver-support/20220121-220338
        git checkout 8e24c9cc5b5a807f40eec9cc643c2ea43f75e8a3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/ drivers/leds/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-ktd20xx.c:490:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (IS_ERR(chip->regmap)) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-ktd20xx.c:542:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/leds/leds-ktd20xx.c:490:2: note: remove the 'if' if its condition is always false
           if (IS_ERR(chip->regmap)) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-ktd20xx.c:478:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +490 drivers/leds/leds-ktd20xx.c

   469	
   470	static int ktd20xx_probe(struct i2c_client *client,
   471			const struct i2c_device_id *id)
   472	{
   473		struct ktd20xx *chip;
   474		unsigned int vendor;
   475		unsigned int chip_id;
   476		unsigned int chip_rev;
   477		struct device *dev;
   478		int ret;
   479	
   480		chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
   481		if (!chip)
   482			return -ENOMEM;
   483	
   484		mutex_init(&chip->lock);
   485		chip->client = client;
   486		dev = &client->dev;
   487		i2c_set_clientdata(client, chip);
   488	
   489		chip->regmap = devm_regmap_init_i2c(client, &ktd20xx_regmap_config);
 > 490		if (IS_ERR(chip->regmap)) {
   491			dev_err_probe(dev, PTR_ERR(chip->regmap),
   492				"Failed to allocate register map\n");
   493			goto error;
   494		}
   495	
   496		chip->control_mode = devm_regmap_field_alloc(dev, chip->regmap,
   497				kt20xx_control_mode);
   498		chip->faderate = devm_regmap_field_alloc(dev, chip->regmap,
   499				kt20xx_faderate);
   500		chip->vendor = devm_regmap_field_alloc(dev, chip->regmap,
   501				kt20xx_vendor);
   502		chip->chip_id = devm_regmap_field_alloc(dev, chip->regmap,
   503				kt20xx_chip_id);
   504		chip->chip_rev = devm_regmap_field_alloc(dev, chip->regmap,
   505				kt20xx_chip_rev);
   506	
   507		/* Reset all registers to hardware device default settings */
   508		regmap_field_write(chip->control_mode, CONTROL_MODE_RESET);
   509	
   510		ret = regmap_field_read(chip->vendor, &vendor);
   511		if (ret) {
   512			dev_err_probe(dev, ret, "Failed to read vendor\n");
   513			goto error;
   514		}
   515	
   516		ret = regmap_field_read(chip->chip_id, &chip_id);
   517		if (ret) {
   518			dev_err_probe(dev, ret, "Failed to read chip id\n");
   519			goto error;
   520		}
   521	
   522		ret = regmap_field_read(chip->chip_rev, &chip_rev);
   523		if (ret) {
   524			dev_err_probe(dev, ret, "Failed to read chip rev\n");
   525			goto error;
   526		}
   527	
   528		dev_info(dev, "vendor: 0x%02x chip-id: 0x%02x chip-rev: 0x%02x\n",
   529				vendor, chip_id, chip_rev);
   530	
   531		ret = ktd20xx_probe_dt(chip);
   532		if (ret)
   533			goto error;
   534	
   535		ret = ktd20xx_hwinit(chip);
   536		if (ret)
   537			goto error;
   538	
   539		return 0;
   540	
   541	error:
   542		return ret;
   543	}
   544	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
