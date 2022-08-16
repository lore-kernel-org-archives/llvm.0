Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3802F26
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660639194; x=1692175194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=haZJJ6qIsp18u5JMSxLBwZ3xo8DIn7m1qKopIr+1Xfg=;
  b=lkwmPd83y3ye37IQwlHhOZYHdLZDYri4lk+IsVI4etnCsy93g7cvDekB
   mx2E4ipqdp8TffUrtjjVR711im8IlPwrY5Oj1shbPomLOB2BsKjSUib3x
   qCKOGNW7CmL3B4Eix7IxZeJMyK0gmfIFolZEIDkFDV8TWRY0+75c54T+R
   mw9DMf/42HnsttxxSU2M4Rr+YSONKd3zpq9W5cGiU6cz9bc5eVgaaeHfh
   3PYjDLtA892xBrInJs8XZF3jGK2685F5cuiPGQrhxToYYwN5BNRIjrLjQ
   mzY7KEW5BE/xalPMc8rVHdzumPUP0I5YCuDKoGJgZjBe3CXBeDZGJpDd9
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="353907251"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="353907251"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 01:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="610189582"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Aug 2022 01:39:51 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNs74-0001e1-2d;
	Tue, 16 Aug 2022 08:39:50 +0000
Date: Tue, 16 Aug 2022 16:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 4/16] sound/soc/codecs/tas2764.c:681:20:
 warning: cast to smaller integer type 'enum tas2764_devid' from 'const void
 *'
Message-ID: <202208161624.BKESkCXj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   51024ef467ff6c288e679bc72d0e3fcdd54d9b39
commit: e8c4eabb2252a8ee21269737e90c57973ab36269 [4/16] ASoC: tas2764: Extend driver to SN012776
config: arm64-randconfig-r022-20220815 (https://download.01.org/0day-ci/archive/20220816/202208161624.BKESkCXj-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/e8c4eabb2252a8ee21269737e90c57973ab36269
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout e8c4eabb2252a8ee21269737e90c57973ab36269
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2764.c:681:20: warning: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   tas2764->devid = (enum tas2764_devid) of_id->data;
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +681 sound/soc/codecs/tas2764.c

   665	
   666	static int tas2764_i2c_probe(struct i2c_client *client)
   667	{
   668		struct tas2764_priv *tas2764;
   669		const struct of_device_id *of_id = NULL;
   670		int result;
   671	
   672		tas2764 = devm_kzalloc(&client->dev, sizeof(struct tas2764_priv),
   673				       GFP_KERNEL);
   674		if (!tas2764)
   675			return -ENOMEM;
   676	
   677		if (client->dev.of_node)
   678			of_id = of_match_device(tas2764_of_match, &client->dev);	
   679	
   680		if (of_id)
 > 681			tas2764->devid = (enum tas2764_devid) of_id->data;
   682		else
   683			tas2764->devid = DEVID_TAS2764;
   684	
   685		tas2764->dev = &client->dev;
   686		i2c_set_clientdata(client, tas2764);
   687		dev_set_drvdata(&client->dev, tas2764);
   688	
   689		tas2764->regmap = devm_regmap_init_i2c(client, &tas2764_i2c_regmap);
   690		if (IS_ERR(tas2764->regmap)) {
   691			result = PTR_ERR(tas2764->regmap);
   692			dev_err(&client->dev, "Failed to allocate register map: %d\n",
   693						result);
   694			return result;
   695		}
   696	
   697		if (client->dev.of_node) {
   698			result = tas2764_parse_dt(&client->dev, tas2764);
   699			if (result) {
   700				dev_err(tas2764->dev, "%s: Failed to parse devicetree\n",
   701					__func__);
   702				return result;
   703			}
   704		}
   705	
   706		return devm_snd_soc_register_component(tas2764->dev,
   707						       &soc_component_driver_tas2764,
   708						       tas2764_dai_driver,
   709						       ARRAY_SIZE(tas2764_dai_driver));
   710	}
   711	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
