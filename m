Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85C818FC86;
	Sun, 17 Nov 2024 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731853003; cv=none; b=Ba8YkGIJ0FxfDXxyW2gXspWfbD1d4VL6KwOn+vUvV09EmG3qlSuFwcb0KAeI3U7vC3HDJSn9B9NATL5wbGGNEgQQ5Pa/ohZs7OZVfCgrntYIiYisqcq1TJIHtlvVUFyFysOY7Q/BkKvaxUKoXif7WkEFC2tEKheU8hSgiEPsuHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731853003; c=relaxed/simple;
	bh=2GY+v96bexGM0CDdRCtrxap37eplz74xpuaQJ2EO+0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VKZXbkN2gc75TrGsQnYncmY7tstTdeUgczaGWWS9W3vwaazLvapehqP3hhYIuxWq6kzBzyP2gXbTM69hf4Cjpt5vIVe55NJIQDgbm/TFH78ocXCmbAOhv35oQkPCRKigTjca4GvVd7alsg4qoTmRyJJvNOG2vqs631J8cQfV9Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EONtl6HK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EONtl6HK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731853002; x=1763389002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2GY+v96bexGM0CDdRCtrxap37eplz74xpuaQJ2EO+0w=;
  b=EONtl6HKR9/JToLwjGxofiuDoiDRuy7LKKPJkou+QbTR3KRC4e+FJNFg
   aBRdNqaL5hgVRhZ0q+iccIxAsGJI440yjj/ajYA16XqikgHMJbjev+2O2
   Hmkn0KJV8THytbpUibSI/FuXiPJXiRp4EbFSUvod9yBjnqXf4MZ+WMYU1
   zjwRejyF7lQvyRCpF1AakZdmNTW4WMLK5cY5buCait1FTYQMC3/8hA32x
   3gR8yAxe0NmD/0idbuqAjIcgcMlxvks86pG5lzkmEt6Ui0+mNU0pJi75/
   UEh6ea8tv6wclvpfp2rfod0k751KLHtR4JsM9QXV/H98z51qKDhSWBzH1
   Q==;
X-CSE-ConnectionGUID: GQ2kbUGRRE2DF08bT8dXoQ==
X-CSE-MsgGUID: 8e6zI2IUQ22ZEyZ1aRiM5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49338590"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="49338590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 06:16:41 -0800
X-CSE-ConnectionGUID: dhkaspC4RZiqM8tjV5O7Nw==
X-CSE-MsgGUID: VMXVdKReQd6oJp3fPFdYqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="88902020"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2024 06:16:40 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCg4r-0001n7-0v;
	Sun, 17 Nov 2024 14:16:37 +0000
Date: Sun, 17 Nov 2024 22:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?unknown-8bit?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 7/119] sound/soc/codecs/tas2764.c:748:20:
 warning: cast to smaller integer type 'enum tas2764_devid' from 'const void
 *'
Message-ID: <202411172229.qfyXbHPz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   3a76f715b4795098c50db9f139c961b292cb13a6
commit: ef42f0f8660619ac5654ac2397c0742924fe7369 [7/119] ASoC: tas2764: Extend driver to SN012776
config: x86_64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241117/202411172229.qfyXbHPz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172229.qfyXbHPz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411172229.qfyXbHPz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2764.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/tas2764.c:748:20: warning: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     748 |                 tas2764->devid = (enum tas2764_devid) of_id->data;
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +748 sound/soc/codecs/tas2764.c

   732	
   733	static int tas2764_i2c_probe(struct i2c_client *client)
   734	{
   735		struct tas2764_priv *tas2764;
   736		const struct of_device_id *of_id = NULL;
   737		int result;
   738	
   739		tas2764 = devm_kzalloc(&client->dev, sizeof(struct tas2764_priv),
   740				       GFP_KERNEL);
   741		if (!tas2764)
   742			return -ENOMEM;
   743	
   744		if (client->dev.of_node)
   745			of_id = of_match_device(tas2764_of_match, &client->dev);
   746	
   747		if (of_id)
 > 748			tas2764->devid = (enum tas2764_devid) of_id->data;
   749		else
   750			tas2764->devid = DEVID_TAS2764;
   751	
   752		tas2764->dev = &client->dev;
   753		tas2764->irq = client->irq;
   754		i2c_set_clientdata(client, tas2764);
   755		dev_set_drvdata(&client->dev, tas2764);
   756	
   757		tas2764->regmap = devm_regmap_init_i2c(client, &tas2764_i2c_regmap);
   758		if (IS_ERR(tas2764->regmap)) {
   759			result = PTR_ERR(tas2764->regmap);
   760			dev_err(&client->dev, "Failed to allocate register map: %d\n",
   761						result);
   762			return result;
   763		}
   764	
   765		if (client->dev.of_node) {
   766			result = tas2764_parse_dt(&client->dev, tas2764);
   767			if (result) {
   768				dev_err(tas2764->dev, "%s: Failed to parse devicetree\n",
   769					__func__);
   770				return result;
   771			}
   772		}
   773	
   774		return devm_snd_soc_register_component(tas2764->dev,
   775						       &soc_component_driver_tas2764,
   776						       tas2764_dai_driver,
   777						       ARRAY_SIZE(tas2764_dai_driver));
   778	}
   779	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
