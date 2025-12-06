Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A211A27470;
	Sat,  6 Dec 2025 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765008115; cv=none; b=EVYl8YAHkxoSHBXeknAMv8pLB1o+meIhjpU5p0Dg2ehaEZ9CZCMP3RC66G6wvyMtbTQtl1oN/0+v0WTm3W+U7grE3Sgy6/0oDbHjVw71ocjpJUlxwemrEn3MZ3XgFbCG5e5pVf1uY/JUE5q5BeH4dBi14uD/Mkdev+6A/mM5G6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765008115; c=relaxed/simple;
	bh=C2fZlWTyUDFmOjtTfby0g5B+lFWUgYx8oDUk9945HOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjpbjm3yYuXaTRN6jzVQmvQNksLZ95dUthGuNQ4si3x9acKsnT7oTR63Jb7qpcNxPbTZLVCyECMz/Ab/n3ytDBPZLP91/Nq19tFg2TMpeLmHEdnCI4oH378VvDPsmPTR4dgX25BHER3MBBnp6Ua0PhV0DSgMdq4YD7hbQi88kzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKbAKYug; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKbAKYug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765008114; x=1796544114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C2fZlWTyUDFmOjtTfby0g5B+lFWUgYx8oDUk9945HOc=;
  b=nKbAKYug7eNdbWnqMw6JL2zCbkXIVO/9rEtZl5tfOci0WGReVw3KsAY3
   KupigVd8jB9Sq9+lPTDvhtBKLJ07MbRkq0w7LSo/j8VOMStYaRNqYQBpr
   qLBFEvTZpVjPijVajZR12oahm8eK8gDVe6BhinDIwQopOap4GprxJOucJ
   IX82k9kEmOvRkBaGQAf9pthTthUCzKpxCwvaSzyBBy0zgLvDqEP83F1OE
   EkkCaAKZa9xdjOyu5nQuBnkjvP1p3dpEBl8Lp5crQBG5yltAo8V6/seZw
   5qiVtBoLBAdvV9k1taqMHA+E1emtnQwdzDSDvWlVW1060wQROfyD6GFZ5
   Q==;
X-CSE-ConnectionGUID: zCgRubYmRMesYCl7v7Jh7w==
X-CSE-MsgGUID: IpXpHa71QBeq/GXaO8uVnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66032718"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66032718"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 00:01:52 -0800
X-CSE-ConnectionGUID: mEe7eGFzTbi/l/Aa2JWZ5w==
X-CSE-MsgGUID: 1rCOmZ3fQ6ymUU0VTTJ8Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="226504815"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Dec 2025 00:01:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRnEg-00000000G0r-2npg;
	Sat, 06 Dec 2025 08:01:46 +0000
Date: Sat, 6 Dec 2025 16:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Timothy Pearson <tpearson@raptorengineering.com>,
	devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org, Georgy.Yakovlev@sony.com,
	sanastasio@raptorengineering.com,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v5 3/4] led: sony-cronos-smc: Add RGB LED driver for Sony
 Cronos SMC
Message-ID: <202512061522.S28ch1Qu-lkp@intel.com>
References: <20251204185015.1364439-4-tpearson@raptorengineering.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204185015.1364439-4-tpearson@raptorengineering.com>

Hi Timothy,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-mfd/for-mfd-fixes lee-leds/for-leds-next robh/for-next linus/master v6.18 next-20251205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Timothy-Pearson/dt-bindings-mfd-Add-sony-cronos-smc/20251205-030506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20251204185015.1364439-4-tpearson%40raptorengineering.com
patch subject: [PATCH v5 3/4] led: sony-cronos-smc: Add RGB LED driver for Sony Cronos SMC
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251206/202512061522.S28ch1Qu-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061522.S28ch1Qu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061522.S28ch1Qu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/leds/leds-sony-cronos.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/leds/leds-sony-cronos.c:140:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     140 |                 return ret;
         |                        ^~~
   drivers/leds/leds-sony-cronos.c:119:9: note: initialize the variable 'ret' to silence this warning
     119 |         int ret;
         |                ^
         |                 = 0
>> drivers/leds/leds-sony-cronos.c:304:32: error: incompatible function pointer types assigning to 'int (*)(struct led_classdev *, enum led_brightness)' from 'ssize_t (struct led_classdev *, enum led_brightness)' (aka 'long (struct led_classdev *, enum led_brightness)') [-Wincompatible-function-pointer-types]
     304 |         cdev->brightness_set_blocking = cronos_led_set_brightness;
         |                                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +304 drivers/leds/leds-sony-cronos.c

   110	
   111	static int cronos_led_color_store(struct sony_cronos_smc *chip, struct sony_cronos_led *led)
   112	{
   113		u8 byte;
   114		u8 color_mask;
   115		u8 color_shift;
   116		u8 color_key_red;
   117		u8 color_key_green;
   118		u8 color_key_blue;
   119		int ret;
   120	
   121		if (led->led_type == LED_TYPE_STATUS) {
   122			color_mask = CRONOS_LEDS_STATUS_COLOR_MASK;
   123			color_shift = CRONOS_LEDS_STATUS_COLOR_SHIFT;
   124		} else if (led->led_type == LED_TYPE_LINK) {
   125			color_mask = CRONOS_LEDS_LINK_COLOR_MASK;
   126			color_shift = CRONOS_LEDS_LINK_COLOR_SHIFT;
   127		} else if (led->led_id == LED_ID_CCM1_POWER) {
   128			color_mask = CRONOS_LEDS_CCM1_POWER_COLOR_MASK;
   129			color_shift = CRONOS_LEDS_CCM1_POWER_COLOR_SHIFT;
   130		} else if (led->led_id == LED_ID_CCM2_POWER) {
   131			color_mask = CRONOS_LEDS_CCM2_POWER_COLOR_MASK;
   132			color_shift = CRONOS_LEDS_CCM2_POWER_COLOR_SHIFT;
   133		} else if (led->led_id == LED_ID_CCM3_POWER) {
   134			color_mask = CRONOS_LEDS_CCM3_POWER_COLOR_MASK;
   135			color_shift = CRONOS_LEDS_CCM3_POWER_COLOR_SHIFT;
   136		} else if (led->led_id == LED_ID_CCM4_POWER) {
   137			color_mask = CRONOS_LEDS_CCM4_POWER_COLOR_MASK;
   138			color_shift = CRONOS_LEDS_CCM4_POWER_COLOR_SHIFT;
   139		} else
 > 140			return ret;
   141	
   142		switch (led->led_type) {
   143		case LED_TYPE_POWER:
   144			color_key_red = LED_COLOR_POWER_RED;
   145			color_key_green = LED_COLOR_POWER_GREEN;
   146			/* Blue channel does not exist for CCM power LEDs */
   147			color_key_blue = LED_COLOR_POWER_OFF;
   148			break;
   149		default:
   150			color_key_red = LED_COLOR_RED;
   151			color_key_green = LED_COLOR_GREEN;
   152			color_key_blue = LED_COLOR_BLUE;
   153		}
   154	
   155		/* Assemble SMC color command code */
   156		byte = LED_COLOR_POWER_OFF;
   157		if (led->subled_info[0].brightness > 128)
   158			byte |= color_key_red;
   159		if (led->subled_info[1].brightness > 128)
   160			byte |= color_key_green;
   161		if (led->subled_info[2].brightness > 128)
   162			byte |= color_key_blue;
   163	
   164		ret = regmap_update_bits(chip->regmap, led->led_register, color_mask, byte << color_shift);
   165		if (ret) {
   166			dev_err(chip->dev, "Failed to set color value 0x%02x to LED register 0x%02x", byte,
   167				led->led_register);
   168			return ret;
   169		}
   170		return 0;
   171	}
   172	
   173	static ssize_t cronos_led_set_brightness(struct led_classdev *cdev, enum led_brightness brightness)
   174	{
   175		struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
   176		struct sony_cronos_leds *leds = dev_get_drvdata(cdev->dev->parent);
   177		struct sony_cronos_led *led = to_cronos_led(mc_cdev);
   178	
   179		led_mc_calc_color_components(mc_cdev, brightness ?: cdev->max_brightness);
   180	
   181		return cronos_led_color_store(leds->hw, led);
   182	}
   183	
   184	static int sony_cronos_led_register(struct device *dev, struct sony_cronos_leds *leds,
   185					    struct sony_cronos_led *led, struct device_node *np)
   186	{
   187		struct led_init_data init_data = {};
   188		struct led_classdev *cdev;
   189		int led_index;
   190		int ret, color;
   191	
   192		ret = of_property_read_u32(np, "reg", &led_index);
   193		if (ret || led_index >= LED_COUNT_ALL) {
   194			dev_err(dev, "'reg' property is out of range (0-%i)\n", LED_COUNT_ALL - 1);
   195			return -EINVAL;
   196		}
   197	
   198		switch (led_index) {
   199		case 0:
   200			led->led_register = CRONOS_LEDS_CCM1_STATUS_REG;
   201			led->led_type = LED_TYPE_STATUS;
   202			led->led_id = LED_ID_CCM1_STATUS;
   203			break;
   204		case 1:
   205			led->led_register = CRONOS_LEDS_CCM2_STATUS_REG;
   206			led->led_type = LED_TYPE_STATUS;
   207			led->led_id = LED_ID_CCM2_STATUS;
   208			break;
   209		case 2:
   210			led->led_register = CRONOS_LEDS_CCM3_STATUS_REG;
   211			led->led_type = LED_TYPE_STATUS;
   212			led->led_id = LED_ID_CCM3_STATUS;
   213			break;
   214		case 3:
   215			led->led_register = CRONOS_LEDS_CCM4_STATUS_REG;
   216			led->led_type = LED_TYPE_STATUS;
   217			led->led_id = LED_ID_CCM4_STATUS;
   218			break;
   219		case 4:
   220			led->led_register = CRONOS_LEDS_SWITCH_STATUS_REG;
   221			led->led_type = LED_TYPE_STATUS;
   222			led->led_id = LED_ID_SWITCH_STATUS;
   223			break;
   224		case 5:
   225			led->led_register = CRONOS_LEDS_SMC_STATUS_REG;
   226			led->led_type = LED_TYPE_STATUS;
   227			led->led_id = LED_ID_SMC_STATUS;
   228			break;
   229		case 6:
   230			led->led_register = CRONOS_LEDS_CCM1_STATUS_REG;
   231			led->led_type = LED_TYPE_LINK;
   232			led->led_id = LED_ID_CCM1_LINK;
   233			break;
   234		case 7:
   235			led->led_register = CRONOS_LEDS_CCM2_STATUS_REG;
   236			led->led_type = LED_TYPE_LINK;
   237			led->led_id = LED_ID_CCM1_LINK;
   238			break;
   239		case 8:
   240			led->led_register = CRONOS_LEDS_CCM3_STATUS_REG;
   241			led->led_type = LED_TYPE_LINK;
   242			led->led_id = LED_ID_CCM2_LINK;
   243			break;
   244		case 9:
   245			led->led_register = CRONOS_LEDS_CCM4_STATUS_REG;
   246			led->led_type = LED_TYPE_LINK;
   247			led->led_id = LED_ID_CCM3_LINK;
   248			break;
   249		case 10:
   250			led->led_register = CRONOS_LEDS_SWITCH_STATUS_REG;
   251			led->led_type = LED_TYPE_LINK;
   252			led->led_id = LED_ID_CCM4_LINK;
   253			break;
   254		case 11:
   255			led->led_register = CRONOS_LEDS_CCM_POWER_REG;
   256			led->led_type = LED_TYPE_POWER;
   257			led->led_id = LED_ID_CCM1_POWER;
   258			break;
   259		case 12:
   260			led->led_register = CRONOS_LEDS_CCM_POWER_REG;
   261			led->led_type = LED_TYPE_POWER;
   262			led->led_id = LED_ID_CCM2_POWER;
   263			break;
   264		case 13:
   265			led->led_register = CRONOS_LEDS_CCM_POWER_REG;
   266			led->led_type = LED_TYPE_POWER;
   267			led->led_id = LED_ID_CCM3_POWER;
   268			break;
   269		case 14:
   270			led->led_register = CRONOS_LEDS_CCM_POWER_REG;
   271			led->led_type = LED_TYPE_POWER;
   272			led->led_id = LED_ID_CCM4_POWER;
   273			break;
   274		default:
   275			return -EINVAL;
   276		}
   277	
   278		ret = of_property_read_u32(np, "color", &color);
   279		if (ret || color != LED_COLOR_ID_RGB) {
   280			dev_warn(dev,
   281				 "Node %pOF: must contain 'color' property with value LED_COLOR_ID_RGB\n",
   282				 np);
   283			return -EINVAL;
   284		}
   285	
   286		led->subled_info[0].color_index = LED_COLOR_ID_RED;
   287		led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
   288		led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
   289	
   290		/* Initial color is white */
   291		for (int i = 0; i < LED_COUNT_ALL; i++) {
   292			led->subled_info[i].intensity = 255;
   293			led->subled_info[i].brightness = 255;
   294			led->subled_info[i].channel = i;
   295		}
   296	
   297		led->mc_cdev.subled_info = led->subled_info;
   298		led->mc_cdev.num_colors = LED_COUNT_ALL;
   299	
   300		init_data.fwnode = &np->fwnode;
   301	
   302		cdev = &led->mc_cdev.led_cdev;
   303		cdev->max_brightness = 255;
 > 304		cdev->brightness_set_blocking = cronos_led_set_brightness;
   305	
   306		/* Set initial color */
   307		ret = cronos_led_color_store(leds->hw, led);
   308		if (ret < 0)
   309			return dev_err_probe(dev, ret, "Cannot set LED %pOF initial color\n", np);
   310	
   311		ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
   312		if (ret)
   313			return dev_err_probe(dev, ret, "Cannot register LED %pOF\n", np);
   314	
   315		/* Set global brightness for all LEDs */
   316		ret = regmap_write(leds->hw->regmap, CRONOS_SMC_BRIGHTNESS_RED_REG, 0x00);
   317		ret = regmap_write(leds->hw->regmap, CRONOS_SMC_BRIGHTNESS_GREEN_REG, 0x00);
   318		ret = regmap_write(leds->hw->regmap, CRONOS_SMC_BRIGHTNESS_BLUE_REG, 0x00);
   319	
   320		return 0;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
