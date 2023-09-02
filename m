Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3E32572;
	Sat,  2 Sep 2023 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693649660; x=1725185660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KiqwD+KyGDP50rrYtEOjq3MIyIsXXNyEPLVvLepqLX0=;
  b=K5D2sviJp5pEQXiIpoR5AZwauFyEoQ7l+CHjUh/kNu9pdFpaPAA57qFn
   hTatpJqZ01Jv32MrY3XIkmuDHnBAgRUtajWKYOvmIRV0M3JD6hpMvskSe
   BydmcZlJ4x8aOOLZqLME23h73PjPxHJOr6/Gi5GQ/MwpbPOol75EnxQb8
   pGnxEA1JAFE+YJDV7H+zublRVEujJlH/+fXp1k2lpjuomgeNIhft1yrAN
   W4cxPCaK1TdB/arWFpd9Zk6nqss4gRWi8OcFqXAbUF/pXe/wOFV5nxcSN
   9Tw/eNcGakvKFhi4J8Slh8IwwZ8lgOofdTocDmSZy5YAoM4fpVTsaOJO9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376294506"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="376294506"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 03:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="769449696"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="769449696"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Sep 2023 03:14:17 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcNdv-0002Ex-0N;
	Sat, 02 Sep 2023 10:14:15 +0000
Date: Sat, 2 Sep 2023 18:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 66/68] sound/soc/codecs/da7218.c:3257:19:
 warning: cast to smaller integer type 'enum da7218_dev_id' from 'const void
 *'
Message-ID: <202309021830.DgnsQOHZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e
commit: 28f0538156fc988c320739e72f4765bed25795da [66/68] ASoC: Use device_get_match_data()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230902/202309021830.DgnsQOHZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021830.DgnsQOHZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021830.DgnsQOHZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/da7218.c:3257:19: warning: cast to smaller integer type 'enum da7218_dev_id' from 'const void *' [-Wvoid-pointer-to-enum-cast]
    3257 |         da7218->dev_id = (enum da7218_dev_id)i2c_get_match_data(i2c);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +3257 sound/soc/codecs/da7218.c

  3240	
  3241	
  3242	/*
  3243	 * I2C layer
  3244	 */
  3245	
  3246	static int da7218_i2c_probe(struct i2c_client *i2c)
  3247	{
  3248		struct da7218_priv *da7218;
  3249		int ret;
  3250	
  3251		da7218 = devm_kzalloc(&i2c->dev, sizeof(*da7218), GFP_KERNEL);
  3252		if (!da7218)
  3253			return -ENOMEM;
  3254	
  3255		i2c_set_clientdata(i2c, da7218);
  3256	
> 3257		da7218->dev_id = (enum da7218_dev_id)i2c_get_match_data(i2c);
  3258	
  3259		if ((da7218->dev_id != DA7217_DEV_ID) &&
  3260		    (da7218->dev_id != DA7218_DEV_ID)) {
  3261			dev_err(&i2c->dev, "Invalid device Id\n");
  3262			return -EINVAL;
  3263		}
  3264	
  3265		da7218->irq = i2c->irq;
  3266	
  3267		da7218->regmap = devm_regmap_init_i2c(i2c, &da7218_regmap_config);
  3268		if (IS_ERR(da7218->regmap)) {
  3269			ret = PTR_ERR(da7218->regmap);
  3270			dev_err(&i2c->dev, "regmap_init() failed: %d\n", ret);
  3271			return ret;
  3272		}
  3273	
  3274		ret = devm_snd_soc_register_component(&i2c->dev,
  3275				&soc_component_dev_da7218, &da7218_dai, 1);
  3276		if (ret < 0) {
  3277			dev_err(&i2c->dev, "Failed to register da7218 component: %d\n",
  3278				ret);
  3279		}
  3280		return ret;
  3281	}
  3282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
