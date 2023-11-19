Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B3910789;
	Sun, 19 Nov 2023 14:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7boVz92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700402612; x=1731938612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=veZ8RYcf6UVJuLEN9jKYr24uRumefCNxqTXRfrbNmAs=;
  b=f7boVz925CrEHW/LSExfDwdDtlKrxTUAoBQcx0pwIutB3SMPXNdRgpWI
   7K00DNe4wPScC3CjRQPrWjqPE8ABtg+m3flZnLY9XV1yi3cFA9yoZNaqg
   VqQSyGkOpE9LE7D60Uh6DPArAg8FNDlhXBlYyxwFtKVSwGL5ayFnrZ5c1
   rmElzJRkCF6YzlM4GenSOSF9UMFFKTSChKBmjITU/qhixJNBdO82SffTc
   kAHk4cqEjbls54YgLdlR2OTVihLsvOmSIGBHuoYMsaj/nCDhJdpi6s+YP
   XzVX0Os/OU1LbgmtpLb6jyPbBjxjGtUiVfa6pQ7Ux0oK+pw21OXIF6RIo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388643435"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="388643435"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 06:03:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="742502536"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="742502536"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Nov 2023 06:03:28 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4iOU-0005BD-1s;
	Sun, 19 Nov 2023 14:03:26 +0000
Date: Sun, 19 Nov 2023 22:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 2/100] sound/soc/codecs/tas2764.c:749:20:
 warning: cast to smaller integer type 'enum tas2764_devid' from 'const void
 *'
Message-ID: <202311192157.chUKcYfp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   1c71b1fa2c491cc29c94d29f1a450dba39f27557
commit: 68baf94b8d789f517f45a9de2910e6242d54281b [2/100] ASoC: tas2764: Extend driver to SN012776
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231119/202311192157.chUKcYfp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311192157.chUKcYfp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192157.chUKcYfp-lkp@intel.com/

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
