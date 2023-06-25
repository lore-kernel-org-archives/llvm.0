Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB1B7472;
	Sun, 25 Jun 2023 20:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687726434; x=1719262434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=38xHjKQLN2r/04LjV2DljXdFnqBG6n2HZUafPdjBfs0=;
  b=YS7ArVwfz2Yup9s934lo31GOgGxHM+sr/R118rHB5Xf58cwIqx3crRiz
   rgoN4lhD5MMqZuqJ6uMOCNWCd5TA9IiAl+TutF4GIzPTRK54hE2Qz0t4o
   9xmE7YKttYe0P/9cAitlVV71pztoi4Ak2b56az79DfLwsYiiqRaiLIlK1
   YAevBgrH/iNJCUkBft/ZGHs8JKpzJZcv8+ORiXLpNtw8g2nnBhKt41Ysq
   zBp5/sd77os4/4UOjmxnbLoAtcJ1P5igGr3IFiNrM4wFCqjU3bcgtn4Pv
   fcjw644B/hoV0qO3C28kcN1VvRGh9z7K3VnjsYILRvL3HfgQmJtTNNQyW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="358609166"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="358609166"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 13:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829007796"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="829007796"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jun 2023 13:53:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDWk2-000AHF-2h;
	Sun, 25 Jun 2023 20:53:50 +0000
Date: Mon, 26 Jun 2023 04:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: Okan Sahin <okan.sahin@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linux-next:master 11546/12162] drivers/mfd/max77541.c:176:18:
 warning: cast to smaller integer type 'enum max7754x_ids' from 'const void
 *'
Message-ID: <202306260401.qZlYQpV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d2be868b42c08290509c60515865f4de24ea704
commit: e0cbc202388af454eb771043b20db6dfe68199ec [11546/12162] mfd: max77541: Add ADI MAX77541/MAX77540 PMIC Support
config: x86_64-randconfig-r003-20230626 (https://download.01.org/0day-ci/archive/20230626/202306260401.qZlYQpV2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306260401.qZlYQpV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306260401.qZlYQpV2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/max77541.c:176:18: warning: cast to smaller integer type 'enum max7754x_ids' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           max77541->id  = (enum max7754x_ids)device_get_match_data(dev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +176 drivers/mfd/max77541.c

   162	
   163	static int max77541_probe(struct i2c_client *client)
   164	{
   165		const struct i2c_device_id *id = i2c_client_get_device_id(client);
   166		struct device *dev = &client->dev;
   167		struct max77541 *max77541;
   168	
   169		max77541 = devm_kzalloc(dev, sizeof(*max77541), GFP_KERNEL);
   170		if (!max77541)
   171			return -ENOMEM;
   172	
   173		i2c_set_clientdata(client, max77541);
   174		max77541->i2c = client;
   175	
 > 176		max77541->id  = (enum max7754x_ids)device_get_match_data(dev);
   177		if (!max77541->id)
   178			max77541->id  = (enum max7754x_ids)id->driver_data;
   179	
   180		if (!max77541->id)
   181			return -EINVAL;
   182	
   183		max77541->regmap = devm_regmap_init_i2c(client,
   184							&max77541_regmap_config);
   185		if (IS_ERR(max77541->regmap))
   186			return dev_err_probe(dev, PTR_ERR(max77541->regmap),
   187					     "Failed to allocate register map\n");
   188	
   189		return max77541_pmic_setup(dev);
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
