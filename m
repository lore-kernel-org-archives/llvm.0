Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AB72569
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 18:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653415632; x=1684951632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1vJoRflnMuivQzr+Yzjvj22XFCeDagG6hX+/69B4hjg=;
  b=ZFpgtaWSMjsIQafH5r/rDi8VXtlfyvikKBvBNQrcqtGkiSeAk3HEsBHw
   WSUMDk8rqMrXjeiZRylP4Y/WYUkvbW8hzDzercDdyIs5ExVK4YaQBGSvL
   3Q6tOMhqsL6cejZU+CLVFJZUDMG3asd8LtF5gIlU++CPQJ0q5DSx4lS6a
   hBpOJ0OX82ZT/VlseUXG662IICzTNyTsKL/NIgPhft3On/3sSa//sjF6s
   feFe8RZ4njeWs3EekVmx2dmSTmzp8sasnJxthWzKoG+kTGNcbo6FmbiVo
   RvyUBJJnqapmjk5bCarLwSh4G30UiM/eafnddRsaHAaNUk6cgQ48508VV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="273342445"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="273342445"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 11:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="548581882"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 May 2022 11:07:10 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntYvx-0002K8-0I;
	Tue, 24 May 2022 18:07:05 +0000
Date: Wed, 25 May 2022 02:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 15/20] sound/soc/codecs/tas2764.c:683:20:
 warning: cast to smaller integer type 'enum tas2764_devid' from 'const void
 *'
Message-ID: <202205250215.BQHYYJpH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   401ef594286e6abfe89c2d92664087bc5d6ca657
commit: 732003ea9b5c8115c96e1e22272959bd74fcbd4a [15/20] ASoC: tas2764: Extend driver to SN012776
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220525/202205250215.BQHYYJpH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/732003ea9b5c8115c96e1e22272959bd74fcbd4a
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout 732003ea9b5c8115c96e1e22272959bd74fcbd4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2764.c:683:20: warning: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   tas2764->devid = (enum tas2764_devid) of_id->data;
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +683 sound/soc/codecs/tas2764.c

   666	
   667	static int tas2764_i2c_probe(struct i2c_client *client,
   668				const struct i2c_device_id *id)
   669	{
   670		struct tas2764_priv *tas2764;
   671		const struct of_device_id *of_id = NULL;
   672		int result;
   673	
   674		tas2764 = devm_kzalloc(&client->dev, sizeof(struct tas2764_priv),
   675				       GFP_KERNEL);
   676		if (!tas2764)
   677			return -ENOMEM;
   678	
   679		if (client->dev.of_node)
   680			of_id = of_match_device(tas2764_of_match, &client->dev);	
   681	
   682		if (of_id)
 > 683			tas2764->devid = (enum tas2764_devid) of_id->data;
   684		else
   685			tas2764->devid = DEVID_TAS2764;
   686	
   687		tas2764->dev = &client->dev;
   688		i2c_set_clientdata(client, tas2764);
   689		dev_set_drvdata(&client->dev, tas2764);
   690	
   691		tas2764->regmap = devm_regmap_init_i2c(client, &tas2764_i2c_regmap);
   692		if (IS_ERR(tas2764->regmap)) {
   693			result = PTR_ERR(tas2764->regmap);
   694			dev_err(&client->dev, "Failed to allocate register map: %d\n",
   695						result);
   696			return result;
   697		}
   698	
   699		if (client->dev.of_node) {
   700			result = tas2764_parse_dt(&client->dev, tas2764);
   701			if (result) {
   702				dev_err(tas2764->dev, "%s: Failed to parse devicetree\n",
   703					__func__);
   704				return result;
   705			}
   706		}
   707	
   708		return devm_snd_soc_register_component(tas2764->dev,
   709						       &soc_component_driver_tas2764,
   710						       tas2764_dai_driver,
   711						       ARRAY_SIZE(tas2764_dai_driver));
   712	}
   713	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
