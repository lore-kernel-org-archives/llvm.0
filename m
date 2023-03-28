Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF01AD30;
	Tue, 28 Mar 2023 18:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680028038; x=1711564038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DN2FJwTresxePdSR3n6OQRN52obEh0wie816tu/NgMA=;
  b=R0Wq8iBKlJkEL7u+V+CEtHKlNTtYCIM31Oe8jqEPw1viGJIZT2zkM2VJ
   LjchSCbR7Y23aeSf2ql0q0lFDPDHW/9A6eXCVlSWIOUWmASORoTCF4+vd
   GLt5EOl1ecFW9voYIHlgUXqrpAz3uhiTOgklaWNMSrGSHFMrv4Kgc40xN
   mPM6cIGLAvmIT2P/RdrdOGeS8ao6ltmAi5h0GzIBv2Ro65zMSa+qBdIHy
   33UzG1aos7IS1xQ4YgPxxcf1C2gX55mTEKfrd72yJim3kICLG88r6Ssv9
   w/5MUR88gOVRnOK8OEodbjaNJ9PyQVG0pvhbDGP4sqMthza/j2DimZLgN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338157384"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="338157384"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 11:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="930020912"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="930020912"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Mar 2023 11:27:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phE2O-000IoR-1R;
	Tue, 28 Mar 2023 18:27:16 +0000
Date: Wed, 29 Mar 2023 02:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 2/40] sound/soc/codecs/tas2764.c:749:20:
 warning: cast to smaller integer type 'enum tas2764_devid' from 'const void
 *'
Message-ID: <202303290224.erYF2KBF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   04466302f3a6cb36c4784f371777f254644bfff3
commit: 61c2d7249c3eb1c55b6b2e1dc0a809d66e88863a [2/40] ASoC: tas2764: Extend driver to SN012776
config: arm64-randconfig-r023-20230327 (https://download.01.org/0day-ci/archive/20230329/202303290224.erYF2KBF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/61c2d7249c3eb1c55b6b2e1dc0a809d66e88863a
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout 61c2d7249c3eb1c55b6b2e1dc0a809d66e88863a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290224.erYF2KBF-lkp@intel.com/

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
https://github.com/intel/lkp-tests
