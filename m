Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9997D33C9
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 22:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651615590; x=1683151590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yvkjUNabNq6cy33KpNVELYiaBalI0xS/GPm/17OLuJI=;
  b=jKhniS5EtjsUThLwrbl8lEmq94fN84zca9wROrGcUookPmgOU1Px5TM1
   L279qA42UYiFU2WjaICylCPSYUPPZZE8WteG5sZC+h55zvoqxwIzCzKab
   STwl8qv6HQtb9CmKapENbix5GS0sAZ2XrsGEP4To7ngXDQMl5uzKztqnj
   BjG6xODja7IgEX9vW8dWodAL96wez7aIgg+pcOO88GKP2hqOpvnHAkU5a
   bq5/WddmLLK1h20MZn9LPthD6NAMrfzVwFdiXyZ7pKVKA1C2eSy3H83VI
   WUh7I+TaSjYOMZ2mrqQZc59CtUcWjfn456+RKugAPmIWiNLRQfKd0URdc
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="248142416"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="248142416"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 15:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="734112350"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 May 2022 15:06:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm0f5-000Aq9-V2;
	Tue, 03 May 2022 22:06:27 +0000
Date: Wed, 4 May 2022 06:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v6 06/11] leds: trigger: netdev: add hardware control
 support
Message-ID: <202205040646.Qyd8nG2X-lkp@intel.com>
References: <20220503151633.18760-7-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503151633.18760-7-ansuelsmth@gmail.com>

Hi Ansuel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on robh/for-next]
[also build test ERROR on net-next/master net/master linus/master v5.18-rc5 next-20220503]
[cannot apply to pavel-leds/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ansuel-Smith/Adds-support-for-PHY-LEDs-with-offload-triggers/20220503-232347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: hexagon-randconfig-r041-20220501 (https://download.01.org/0day-ci/archive/20220504/202205040646.Qyd8nG2X-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d5c00815ca4c96e479d3653feceef0d4f21723c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ansuel-Smith/Adds-support-for-PHY-LEDs-with-offload-triggers/20220503-232347
        git checkout d5c00815ca4c96e479d3653feceef0d4f21723c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/leds/trigger/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/leds/trigger/ledtrig-netdev.c:102:8: error: call to undeclared function 'led_trigger_blink_mode_is_supported'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           if (led_trigger_blink_mode_is_supported(led_cdev, detail->bit))
                               ^
>> drivers/leds/trigger/ledtrig-netdev.c:137:13: error: no member named 'hw_control_configure' in 'struct led_classdev'
                   led_cdev->hw_control_configure(led_cdev, BIT(TRIGGER_NETDEV_LINK),
                   ~~~~~~~~  ^
>> drivers/leds/trigger/ledtrig-netdev.c:138:13: error: use of undeclared identifier 'BLINK_MODE_ZERO'
                                                  BLINK_MODE_ZERO);
                                                  ^
   drivers/leds/trigger/ledtrig-netdev.c:146:14: error: no member named 'hw_control_configure' in 'struct led_classdev'
                           led_cdev->hw_control_configure(led_cdev, BIT(detail->bit),
                           ~~~~~~~~  ^
>> drivers/leds/trigger/ledtrig-netdev.c:147:14: error: use of undeclared identifier 'BLINK_MODE_ENABLE'
                                                          BLINK_MODE_ENABLE);
                                                          ^
>> drivers/leds/trigger/ledtrig-netdev.c:150:13: error: no member named 'hw_control_start' in 'struct led_classdev'
                   led_cdev->hw_control_start(led_cdev);
                   ~~~~~~~~  ^
>> drivers/leds/trigger/ledtrig-netdev.c:503:17: error: no member named 'hw_control_status' in 'struct led_classdev'
                   if (led_cdev->hw_control_status(led_cdev)) {
                       ~~~~~~~~  ^
   drivers/leds/trigger/ledtrig-netdev.c:504:19: error: no member named 'hw_control_configure' in 'struct led_classdev'
                           rc = led_cdev->hw_control_configure(led_cdev, BIT(TRIGGER_NETDEV_LINK),
                                ~~~~~~~~  ^
   drivers/leds/trigger/ledtrig-netdev.c:505:12: error: use of undeclared identifier 'BLINK_MODE_ZERO'
                                                               BLINK_MODE_ZERO);
                                                               ^
   9 errors generated.


vim +/led_trigger_blink_mode_is_supported +102 drivers/leds/trigger/ledtrig-netdev.c

    68	
    69	static bool validate_baseline_state(struct led_netdev_data *trigger_data)
    70	{
    71		struct led_classdev *led_cdev = trigger_data->led_cdev;
    72		struct netdev_led_attr_detail *detail;
    73		u32 hw_blink_mode_supported = 0;
    74		bool force_sw = false;
    75		int i;
    76	
    77		for (i = 0; i < ARRAY_SIZE(attr_details); i++) {
    78			detail = &attr_details[i];
    79	
    80			/* Mode not active, skip */
    81			if (!test_bit(detail->bit, &trigger_data->mode))
    82				continue;
    83	
    84			/* Hardware only mode enabled on software controlled led */
    85			if (led_cdev->blink_mode == SOFTWARE_CONTROLLED &&
    86			    detail->hardware_only)
    87				return false;
    88	
    89			/* Check if the mode supports hardware mode */
    90			if (led_cdev->blink_mode != SOFTWARE_CONTROLLED) {
    91				/* With a net dev set, force software mode.
    92				 * With modes are handled by hardware, led will blink
    93				 * based on his own events and will ignore any event
    94				 * from the provided dev.
    95				 */
    96				if (trigger_data->net_dev) {
    97					force_sw = true;
    98					continue;
    99				}
   100	
   101				/* With empty dev, check if the mode is supported */
 > 102				if (led_trigger_blink_mode_is_supported(led_cdev, detail->bit))
   103					hw_blink_mode_supported |= BIT(detail->bit);
   104			}
   105		}
   106	
   107		/* We can't run modes handled by both software and hardware.
   108		 * Check if we run hardware modes and check if all the modes
   109		 * can be handled by hardware.
   110		 */
   111		if (hw_blink_mode_supported && hw_blink_mode_supported != trigger_data->mode)
   112			return false;
   113	
   114		/* Modes are valid. Decide now the running mode to later
   115		 * set the baseline.
   116		 * Software mode is enforced with net_dev set. With an empty
   117		 * one hardware mode is selected by default (if supported).
   118		 */
   119		if (force_sw || led_cdev->blink_mode == SOFTWARE_CONTROLLED)
   120			trigger_data->blink_mode = SOFTWARE_CONTROLLED;
   121		else
   122			trigger_data->blink_mode = HARDWARE_CONTROLLED;
   123	
   124		return true;
   125	}
   126	
   127	static void set_baseline_state(struct led_netdev_data *trigger_data)
   128	{
   129		int i;
   130		int current_brightness;
   131		struct netdev_led_attr_detail *detail;
   132		struct led_classdev *led_cdev = trigger_data->led_cdev;
   133	
   134		/* Modes already validated. Directly apply hw trigger modes */
   135		if (trigger_data->blink_mode == HARDWARE_CONTROLLED) {
   136			/* We are refreshing the blink modes. Reset them */
 > 137			led_cdev->hw_control_configure(led_cdev, BIT(TRIGGER_NETDEV_LINK),
 > 138						       BLINK_MODE_ZERO);
   139	
   140			for (i = 0; i < ARRAY_SIZE(attr_details); i++) {
   141				detail = &attr_details[i];
   142	
   143				if (!test_bit(detail->bit, &trigger_data->mode))
   144					continue;
   145	
   146				led_cdev->hw_control_configure(led_cdev, BIT(detail->bit),
 > 147							       BLINK_MODE_ENABLE);
   148			}
   149	
 > 150			led_cdev->hw_control_start(led_cdev);
   151	
   152			return;
   153		}
   154	
   155		/* Handle trigger modes by software */
   156		current_brightness = led_cdev->brightness;
   157		if (current_brightness)
   158			led_cdev->blink_brightness = current_brightness;
   159		if (!led_cdev->blink_brightness)
   160			led_cdev->blink_brightness = led_cdev->max_brightness;
   161	
   162		if (!trigger_data->carrier_link_up) {
   163			led_set_brightness(led_cdev, LED_OFF);
   164		} else {
   165			if (test_bit(TRIGGER_NETDEV_LINK, &trigger_data->mode))
   166				led_set_brightness(led_cdev,
   167						   led_cdev->blink_brightness);
   168			else
   169				led_set_brightness(led_cdev, LED_OFF);
   170	
   171			/* If we are looking for RX/TX start periodically
   172			 * checking stats
   173			 */
   174			if (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
   175			    test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode))
   176				schedule_delayed_work(&trigger_data->work, 0);
   177		}
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
