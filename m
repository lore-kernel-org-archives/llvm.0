Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DD58C0A;
	Sat, 12 Aug 2023 23:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691882609; x=1723418609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHydbE9SM2HRLx51xGHwC67/72x5NKTZQLG2kfSo2n4=;
  b=QqfMuwVO7YDmBm2Lf2KtnO9GBlDxNu2Jax3ky0IZ4/XgD4wUSubPWCs8
   0c0qjACDLLIOGBBBEqRutp/S5L45zP4hLMZ7kfnLzccN9JtpekNwWC6ms
   +CI211GPtqt08GCjSg8MEFAPCuzq/QW28YkT34hkByUo7WXu1CMhvRqpW
   BFPUyGy8STU3QWB0/fS6f5y0ATcXZoO66rOJjQUFQWTNoP/kVOG0MjfRl
   hHFzfamesjsfLx0NXP1g4x/BZDOp4+R+36v9RMZ7ezDCKwLZndulx1dzt
   n7a0x56QBXld7msBtyNyvyjnX3IKfhPM+p+9LlYTD7sxZ4E10PYkcYRWN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="435747967"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="435747967"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 16:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="682895851"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="682895851"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Aug 2023 16:23:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUxx8-0008qh-0i;
	Sat, 12 Aug 2023 23:23:26 +0000
Date: Sun, 13 Aug 2023 07:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 2/37] sound/soc/codecs/tas2764.c:749:20:
 warning: cast to smaller integer type 'enum tas2764_devid' from 'const void
 *'
Message-ID: <202308130747.C99k6FXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   fd19415d77a7612b4edbe780d58328ec41019816
commit: 80c18dcbfdbcb6fea62ccc79cd656ba978b3a40d [2/37] ASoC: tas2764: Extend driver to SN012776
config: x86_64-randconfig-x011-20230813 (https://download.01.org/0day-ci/archive/20230813/202308130747.C99k6FXZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130747.C99k6FXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130747.C99k6FXZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2764.c:749:20: warning: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   tas2764->devid = (enum tas2764_devid) of_id->data;
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +749 sound/soc/codecs/tas2764.c

   733	
   734	static int tas2764_i2c_probe(struct i2c_client *client)
   735	{
   736		struct tas2764_priv *tas2764;
   737		const struct of_device_id *of_id = NULL;
   738		int result;
   739	
   740		tas2764 = devm_kzalloc(&client->dev, sizeof(struct tas2764_priv),
   741				       GFP_KERNEL);
   742		if (!tas2764)
   743			return -ENOMEM;
   744	
   745		if (client->dev.of_node)
   746			of_id = of_match_device(tas2764_of_match, &client->dev);
   747	
   748		if (of_id)
 > 749			tas2764->devid = (enum tas2764_devid) of_id->data;
   750		else
   751			tas2764->devid = DEVID_TAS2764;
   752	
   753		tas2764->dev = &client->dev;
   754		tas2764->irq = client->irq;
   755		i2c_set_clientdata(client, tas2764);
   756		dev_set_drvdata(&client->dev, tas2764);
   757	
   758		tas2764->regmap = devm_regmap_init_i2c(client, &tas2764_i2c_regmap);
   759		if (IS_ERR(tas2764->regmap)) {
   760			result = PTR_ERR(tas2764->regmap);
   761			dev_err(&client->dev, "Failed to allocate register map: %d\n",
   762						result);
   763			return result;
   764		}
   765	
   766		if (client->dev.of_node) {
   767			result = tas2764_parse_dt(&client->dev, tas2764);
   768			if (result) {
   769				dev_err(tas2764->dev, "%s: Failed to parse devicetree\n",
   770					__func__);
   771				return result;
   772			}
   773		}
   774	
   775		return devm_snd_soc_register_component(tas2764->dev,
   776						       &soc_component_driver_tas2764,
   777						       tas2764_dai_driver,
   778						       ARRAY_SIZE(tas2764_dai_driver));
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
