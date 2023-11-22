Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638DC56B89;
	Wed, 22 Nov 2023 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmX/g0ur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700667991; x=1732203991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VMThAxcfwfHFmF8vBaC/KWXl7syQp/l+akyj8lYOKPw=;
  b=AmX/g0urs2pyG9qj8fzFkYKOP16j4TdH6RqpVj6gsBlKKa2TZIKIxUe0
   aq5fHe3yZbeaPBUMQ3kxAwrf2LY0y2O0JRPZCcL5L4dSA5kVpZNj5ni/i
   jsjwiDh+e8T7gi57PLnX+2jZhYcLQOLiyA3qcszTKSAqzvVGU9e0ABzfV
   dEij31C5Xi+XpmJ8Kw/BnQBtDspAC4N8wMMw3Ike3Y94F4OAYXFgNci6b
   xPTwURZ9OAG0VGzAh3Z6vizcpsveSaVoWxTdZlbek/p57ylEBE31F2uRE
   xYO1mxPzf4KJkznYfU4pCdOo6ggCIzp4xeZKeBJeCUuWIEyyXcoDwGkSM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5279492"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5279492"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 07:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837464101"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="837464101"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Nov 2023 07:46:26 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5pQm-0000de-2C;
	Wed, 22 Nov 2023 15:46:24 +0000
Date: Wed, 22 Nov 2023 23:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH 13/14] net: phy: add Qualcom QCA807x driver
Message-ID: <202311222136.bjgltmdE-lkp@intel.com>
References: <20231120135041.15259-14-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-14-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-extend-PHY-package-API-to-support-multiple-global-address/20231120-220405
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231120135041.15259-14-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH 13/14] net: phy: add Qualcom QCA807x driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311222136.bjgltmdE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311222136.bjgltmdE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311222136.bjgltmdE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/qca807x.c:342:46: warning: declaration of 'struct gpio_chip' will not be visible outside of this function [-Wvisibility]
   static int qca807x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
                                                ^
>> drivers/net/phy/qca807x.c:344:9: error: use of undeclared identifier 'GPIO_LINE_DIRECTION_OUT'
           return GPIO_LINE_DIRECTION_OUT;
                  ^
   drivers/net/phy/qca807x.c:352:36: warning: declaration of 'struct gpio_chip' will not be visible outside of this function [-Wvisibility]
   static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
                                      ^
>> drivers/net/phy/qca807x.c:354:35: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
                                            ^
>> drivers/net/phy/qca807x.c:354:28: error: incompatible integer to pointer conversion initializing 'struct qca807x_gpio_priv *' with an expression of type 'int' [-Wint-conversion]
           struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
                                     ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/qca807x.c:362:37: warning: declaration of 'struct gpio_chip' will not be visible outside of this function [-Wvisibility]
   static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
                                       ^
   drivers/net/phy/qca807x.c:364:35: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
                                            ^
   drivers/net/phy/qca807x.c:364:28: error: incompatible integer to pointer conversion initializing 'struct qca807x_gpio_priv *' with an expression of type 'int' [-Wint-conversion]
           struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
                                     ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/qca807x.c:375:40: warning: declaration of 'struct gpio_chip' will not be visible outside of this function [-Wvisibility]
   static int qca807x_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
                                          ^
>> drivers/net/phy/qca807x.c:377:19: error: incompatible pointer types passing 'struct gpio_chip *' to parameter of type 'struct gpio_chip *' [-Werror,-Wincompatible-pointer-types]
           qca807x_gpio_set(gc, offset, value);
                            ^~
   drivers/net/phy/qca807x.c:362:48: note: passing argument to parameter 'gc' here
   static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
                                                  ^
>> drivers/net/phy/qca807x.c:394:31: error: invalid application of 'sizeof' to an incomplete type 'struct gpio_chip'
           gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
                                        ^~~~~
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
>> drivers/net/phy/qca807x.c:398:4: error: incomplete definition of type 'struct gpio_chip'
           gc->label = dev_name(dev);
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:399:4: error: incomplete definition of type 'struct gpio_chip'
           gc->base = -1;
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:400:4: error: incomplete definition of type 'struct gpio_chip'
           gc->ngpio = 2;
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:401:4: error: incomplete definition of type 'struct gpio_chip'
           gc->parent = dev;
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:402:4: error: incomplete definition of type 'struct gpio_chip'
           gc->owner = THIS_MODULE;
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:403:4: error: incomplete definition of type 'struct gpio_chip'
           gc->can_sleep = true;
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:404:4: error: incomplete definition of type 'struct gpio_chip'
           gc->get_direction = qca807x_gpio_get_direction;
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:405:4: error: incomplete definition of type 'struct gpio_chip'
           gc->direction_output = qca807x_gpio_dir_out;
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:406:4: error: incomplete definition of type 'struct gpio_chip'
           gc->get = qca807x_gpio_get;
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:407:4: error: incomplete definition of type 'struct gpio_chip'
           gc->set = qca807x_gpio_set;
           ~~^
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
>> drivers/net/phy/qca807x.c:409:9: error: call to undeclared function 'devm_gpiochip_add_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return devm_gpiochip_add_data(dev, gc, priv);
                  ^
>> drivers/net/phy/qca807x.c:708:36: error: too few arguments to function call, expected 3, have 2
                   if (of_find_property(node, "leds") &&
                       ~~~~~~~~~~~~~~~~             ^
   include/linux/of.h:309:25: note: 'of_find_property' declared here
   extern struct property *of_find_property(const struct device_node *np,
                           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   4 warnings and 20 errors generated.


vim +/GPIO_LINE_DIRECTION_OUT +344 drivers/net/phy/qca807x.c

   340	
   341	#ifdef CONFIG_GPIOLIB
   342	static int qca807x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
   343	{
 > 344		return GPIO_LINE_DIRECTION_OUT;
   345	}
   346	
   347	static int qca807x_gpio_get_reg(unsigned int offset)
   348	{
   349		return QCA807X_MMD7_LED_100N_2 + (offset % 2) * 2;
   350	}
   351	
   352	static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
   353	{
 > 354		struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
   355		int val;
   356	
   357		val = phy_read_mmd(priv->phy, MDIO_MMD_AN, qca807x_gpio_get_reg(offset));
   358	
   359		return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
   360	}
   361	
   362	static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
   363	{
   364		struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
   365		int val;
   366	
   367		val = phy_read_mmd(priv->phy, MDIO_MMD_AN, qca807x_gpio_get_reg(offset));
   368		val &= ~QCA807X_GPIO_FORCE_MODE_MASK;
   369		val |= QCA807X_GPIO_FORCE_EN;
   370		val |= FIELD_PREP(QCA807X_GPIO_FORCE_MODE_MASK, value);
   371	
   372		phy_write_mmd(priv->phy, MDIO_MMD_AN, qca807x_gpio_get_reg(offset), val);
   373	}
   374	
   375	static int qca807x_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
   376	{
 > 377		qca807x_gpio_set(gc, offset, value);
   378	
   379		return 0;
   380	}
   381	
   382	static int qca807x_gpio(struct phy_device *phydev)
   383	{
   384		struct device *dev = &phydev->mdio.dev;
   385		struct qca807x_gpio_priv *priv;
   386		struct gpio_chip *gc;
   387	
   388		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   389		if (!priv)
   390			return -ENOMEM;
   391	
   392		priv->phy = phydev;
   393	
 > 394		gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
   395		if (!gc)
   396			return -ENOMEM;
   397	
 > 398		gc->label = dev_name(dev);
   399		gc->base = -1;
   400		gc->ngpio = 2;
   401		gc->parent = dev;
   402		gc->owner = THIS_MODULE;
   403		gc->can_sleep = true;
   404		gc->get_direction = qca807x_gpio_get_direction;
   405		gc->direction_output = qca807x_gpio_dir_out;
   406		gc->get = qca807x_gpio_get;
   407		gc->set = qca807x_gpio_set;
   408	
 > 409		return devm_gpiochip_add_data(dev, gc, priv);
   410	}
   411	#endif
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
