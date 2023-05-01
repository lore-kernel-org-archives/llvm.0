Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29F62F;
	Mon,  1 May 2023 04:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682914439; x=1714450439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZecFb9gf/Ehy6i/AFgWcjHsi5h5BCGAD3yY96wdAFM=;
  b=Bf+fSCowTZBKg6AstmbohrN6Utv3IYCjdiegHqoCu/Zka4Tdq8zPFqzT
   /h+J3fwT2KsfQ1yXC0/jAa3qnM0H9fD4J4yU5BXQNcWc8Gx8V99TgLwxK
   bkf2muQScwiRuGZHY1noWRWOOJfdEef+5596eZDfGT8fdREDfTL0/g5KU
   L+pD8wasJ0X3nibv2TJZCqzb0tFdGGTBj7RjVDrKdijmDP5/1lxhPisDp
   YdR+U8PNXm5uxrKo876RtoSdxuUsJTAspaCKwRr/GPzlRrbhI7M3csPsW
   moclwqcqeePYAOOiPAtAX+SnwKDRmQWJeklUuZqq0FIe2nintfjWOj5+v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="350154164"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="350154164"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 21:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="726222424"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="726222424"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Apr 2023 21:13:57 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptKvE-0000IZ-2t;
	Mon, 01 May 2023 04:13:56 +0000
Date: Mon, 1 May 2023 12:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:leds-offload-support-reduced-auto-netdev 15/21]
 drivers/leds/led-class.c:362:15: error: no member named 'fwnode' in 'struct
 led_classdev'
Message-ID: <202305011226.xx58ePkg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git leds-offload-support-reduced-auto-netdev
head:   f1ffe7d8f875fe17f996d112a87846ad06e9eab3
commit: ff5cab2905c761adcb9d203303c5d4bd48e0aab9 [15/21] drivers: led: led-class: Keep fwnode from init_data for triggers
config: riscv-randconfig-r023-20230430 (https://download.01.org/0day-ci/archive/20230501/202305011226.xx58ePkg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/lunn/linux/commit/ff5cab2905c761adcb9d203303c5d4bd48e0aab9
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn leds-offload-support-reduced-auto-netdev
        git checkout ff5cab2905c761adcb9d203303c5d4bd48e0aab9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/leds/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011226.xx58ePkg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/led-class.c:362:15: error: no member named 'fwnode' in 'struct led_classdev'
                                   led_cdev->fwnode = init_data->fwnode;
                                   ~~~~~~~~  ^
   1 error generated.


vim +362 drivers/leds/led-class.c

   326	
   327	/**
   328	 * led_classdev_register_ext - register a new object of led_classdev class
   329	 *			       with init data.
   330	 *
   331	 * @parent: parent of LED device
   332	 * @led_cdev: the led_classdev structure for this device.
   333	 * @init_data: LED class device initialization data
   334	 */
   335	int led_classdev_register_ext(struct device *parent,
   336				      struct led_classdev *led_cdev,
   337				      struct led_init_data *init_data)
   338	{
   339		char composed_name[LED_MAX_NAME_SIZE];
   340		char final_name[LED_MAX_NAME_SIZE];
   341		const char *proposed_name = composed_name;
   342		int ret;
   343	
   344		if (init_data) {
   345			if (init_data->devname_mandatory && !init_data->devicename) {
   346				dev_err(parent, "Mandatory device name is missing");
   347				return -EINVAL;
   348			}
   349			ret = led_compose_name(parent, init_data, composed_name);
   350			if (ret < 0)
   351				return ret;
   352	
   353			if (init_data->fwnode) {
   354				fwnode_property_read_string(init_data->fwnode,
   355					"linux,default-trigger",
   356					&led_cdev->default_trigger);
   357	
   358				if (fwnode_property_present(init_data->fwnode,
   359							    "retain-state-shutdown"))
   360					led_cdev->flags |= LED_RETAIN_AT_SHUTDOWN;
   361				if (IS_ENABLED(CONFIG_LEDS_TRIGGERS))
 > 362					led_cdev->fwnode = init_data->fwnode;
   363			}
   364		} else {
   365			proposed_name = led_cdev->name;
   366		}
   367	
   368		ret = led_classdev_next_name(proposed_name, final_name, sizeof(final_name));
   369		if (ret < 0)
   370			return ret;
   371	
   372		mutex_init(&led_cdev->led_access);
   373		mutex_lock(&led_cdev->led_access);
   374		led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
   375					led_cdev, led_cdev->groups, "%s", final_name);
   376		if (IS_ERR(led_cdev->dev)) {
   377			mutex_unlock(&led_cdev->led_access);
   378			return PTR_ERR(led_cdev->dev);
   379		}
   380		if (init_data && init_data->fwnode)
   381			device_set_node(led_cdev->dev, init_data->fwnode);
   382	
   383		if (ret)
   384			dev_warn(parent, "Led %s renamed to %s due to name collision",
   385					proposed_name, dev_name(led_cdev->dev));
   386	
   387		if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
   388			ret = led_add_brightness_hw_changed(led_cdev);
   389			if (ret) {
   390				device_unregister(led_cdev->dev);
   391				led_cdev->dev = NULL;
   392				mutex_unlock(&led_cdev->led_access);
   393				return ret;
   394			}
   395		}
   396	
   397		led_cdev->work_flags = 0;
   398	#ifdef CONFIG_LEDS_TRIGGERS
   399		init_rwsem(&led_cdev->trigger_lock);
   400	#endif
   401	#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
   402		led_cdev->brightness_hw_changed = -1;
   403	#endif
   404		/* add to the list of leds */
   405		down_write(&leds_list_lock);
   406		list_add_tail(&led_cdev->node, &leds_list);
   407		up_write(&leds_list_lock);
   408	
   409		if (!led_cdev->max_brightness)
   410			led_cdev->max_brightness = LED_FULL;
   411	
   412		led_update_brightness(led_cdev);
   413	
   414		led_init_core(led_cdev);
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
