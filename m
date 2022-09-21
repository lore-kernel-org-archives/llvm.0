Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92F7C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 20:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663793865; x=1695329865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KYNMEDQg5iJU1NijMu9qBx+OZB+wuVO10rhA/f+8AQg=;
  b=PPHDEANT9lcSeUm/D97gfwl7RUIgJyaaaPyJcdwwXR3FjNaT2g8KcO6f
   MLZB59POMEHzBRkslfgpGU61u7tdQOdbkLa9EK8rshIjC1KMKV2sWHm8Z
   6N9yfLa2KuqyHZKgu8VvdNLWqclOqKciViQRThVfrxdSorMbY3p7KlYLO
   TfH2r+cH4LE0zHr7O7a1LAcvD+AB9CDi4lIGx1tjAw8ZPAokTPah/Ny8e
   DCwu6VMTWv1VBnqerkCXG341zCzPRaWI111yyB73Dgfy5cNsx8kS4HxKh
   PBrobxZFDec20yMjM5GHdeYWhtu7zWyIrNBnozF9OyyWnS03j3A9+Mx7V
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="386412416"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="386412416"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 13:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="794830307"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2022 13:57:42 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ob6mr-0003yN-2o;
	Wed, 21 Sep 2022 20:57:41 +0000
Date: Thu, 22 Sep 2022 04:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bernardo Rodrigues <bernardocrodrigues@live.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: [pavel-leds:for-next 1/2] drivers/leds/leds-pca963x.c:357:4:
 warning: misleading indentation; statement is not part of the previous 'if'
Message-ID: <202209220459.9iyIqtgv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
head:   31fd7108302388d732973c58470d4be559d352ec
commit: fd6dd9584ed3ee6debf2e7f9c9e69ef09b368277 [1/2] leds: pca963x: fix blink with hw acceleration
config: hexagon-randconfig-r041-20220921 (https://download.01.org/0day-ci/archive/20220922/202209220459.9iyIqtgv-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?id=fd6dd9584ed3ee6debf2e7f9c9e69ef09b368277
        git remote add pavel-leds git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
        git fetch --no-tags pavel-leds for-next
        git checkout fd6dd9584ed3ee6debf2e7f9c9e69ef09b368277
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/leds/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-pca963x.c:357:4: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                           led->blinking = false;
                           ^
   drivers/leds/leds-pca963x.c:355:3: note: previous statement is here
                   if (hw_blink)
                   ^
   1 warning generated.


vim +/if +357 drivers/leds/leds-pca963x.c

   301	
   302	static int pca963x_register_leds(struct i2c_client *client,
   303					 struct pca963x *chip)
   304	{
   305		struct pca963x_chipdef *chipdef = chip->chipdef;
   306		struct pca963x_led *led = chip->leds;
   307		struct device *dev = &client->dev;
   308		struct fwnode_handle *child;
   309		bool hw_blink;
   310		s32 mode2;
   311		u32 reg;
   312		int ret;
   313	
   314		if (device_property_read_u32(dev, "nxp,period-scale",
   315					     &chipdef->scaling))
   316			chipdef->scaling = 1000;
   317	
   318		hw_blink = device_property_read_bool(dev, "nxp,hw-blink");
   319	
   320		mode2 = i2c_smbus_read_byte_data(client, PCA963X_MODE2);
   321		if (mode2 < 0)
   322			return mode2;
   323	
   324		/* default to open-drain unless totem pole (push-pull) is specified */
   325		if (device_property_read_bool(dev, "nxp,totem-pole"))
   326			mode2 |= PCA963X_MODE2_OUTDRV;
   327		else
   328			mode2 &= ~PCA963X_MODE2_OUTDRV;
   329	
   330		/* default to non-inverted output, unless inverted is specified */
   331		if (device_property_read_bool(dev, "nxp,inverted-out"))
   332			mode2 |= PCA963X_MODE2_INVRT;
   333		else
   334			mode2 &= ~PCA963X_MODE2_INVRT;
   335	
   336		ret = i2c_smbus_write_byte_data(client, PCA963X_MODE2, mode2);
   337		if (ret < 0)
   338			return ret;
   339	
   340		device_for_each_child_node(dev, child) {
   341			struct led_init_data init_data = {};
   342			char default_label[32];
   343	
   344			ret = fwnode_property_read_u32(child, "reg", &reg);
   345			if (ret || reg >= chipdef->n_leds) {
   346				dev_err(dev, "Invalid 'reg' property for node %pfw\n",
   347					child);
   348				ret = -EINVAL;
   349				goto err;
   350			}
   351	
   352			led->led_num = reg;
   353			led->chip = chip;
   354			led->led_cdev.brightness_set_blocking = pca963x_led_set;
   355			if (hw_blink)
   356				led->led_cdev.blink_set = pca963x_blink_set;
 > 357				led->blinking = false;
   358	
   359			init_data.fwnode = child;
   360			/* for backwards compatibility */
   361			init_data.devicename = "pca963x";
   362			snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
   363				 client->adapter->nr, client->addr, reg);
   364			init_data.default_label = default_label;
   365	
   366			ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
   367							     &init_data);
   368			if (ret) {
   369				dev_err(dev, "Failed to register LED for node %pfw\n",
   370					child);
   371				goto err;
   372			}
   373	
   374			++led;
   375		}
   376	
   377		return 0;
   378	err:
   379		fwnode_handle_put(child);
   380		return ret;
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
