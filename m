Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9CB4E619;
	Wed, 22 Nov 2023 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P38f6vWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700664552; x=1732200552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iFSzHqUOze79culTr6M1JqqoU9r2kTO+0mYegO09R0Q=;
  b=P38f6vWDZlrSyFnMYtfqMqZ97kgWSeqBsLCdnNPa6ykC+sXMMiem81D3
   KSUkbFK0PsE/7/0qVlouluTX8/4l+E6aGo0I9HsZ6l6G+f0iD6KWREkHH
   m4FQ1kYwDoohJdHdF0GSfUHrYrnICxOGUr3DLo12Rodb+zqST69v9UHXx
   VgfeaEWA6q521sAV1rSM434Dm61KG5POcfuBt7+b1iUpXl/IFzaeOdhnY
   tw5NwCWSwyHMBbqi8aqMvXvQlxpJdpt3yMzrHYZMUq0e66nWa2EZ4tUA6
   RUBdi/2gk9EBv5ZYeEx3+hq3jqiu6QavSwNzialu+utX5iGLpyqm/St5z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478269619"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="478269619"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 06:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="15284540"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2023 06:49:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5oXG-0000Za-0q;
	Wed, 22 Nov 2023 14:49:02 +0000
Date: Wed, 22 Nov 2023 22:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH 13/14] net: phy: add Qualcom QCA807x driver
Message-ID: <202311221857.uKXhU81D-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-extend-PHY-package-API-to-support-multiple-global-address/20231120-220405
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231120135041.15259-14-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH 13/14] net: phy: add Qualcom QCA807x driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311221857.uKXhU81D-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221857.uKXhU81D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221857.uKXhU81D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/qca807x.c:342:46: warning: declaration of 'struct gpio_chip' will not be visible outside of this function [-Wvisibility]
   static int qca807x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
                                                ^
   drivers/net/phy/qca807x.c:344:9: error: use of undeclared identifier 'GPIO_LINE_DIRECTION_OUT'
           return GPIO_LINE_DIRECTION_OUT;
                  ^
   drivers/net/phy/qca807x.c:352:36: warning: declaration of 'struct gpio_chip' will not be visible outside of this function [-Wvisibility]
   static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
                                      ^
   drivers/net/phy/qca807x.c:354:35: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
                                            ^
   drivers/net/phy/qca807x.c:354:28: error: incompatible integer to pointer conversion initializing 'struct qca807x_gpio_priv *' with an expression of type 'int' [-Wint-conversion]
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
   drivers/net/phy/qca807x.c:377:19: error: incompatible pointer types passing 'struct gpio_chip *' to parameter of type 'struct gpio_chip *' [-Werror,-Wincompatible-pointer-types]
           qca807x_gpio_set(gc, offset, value);
                            ^~
   drivers/net/phy/qca807x.c:362:48: note: passing argument to parameter 'gc' here
   static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
                                                  ^
   drivers/net/phy/qca807x.c:394:31: error: invalid application of 'sizeof' to an incomplete type 'struct gpio_chip'
           gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
                                        ^~~~~
   drivers/net/phy/qca807x.c:386:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip *gc;
                  ^
   drivers/net/phy/qca807x.c:398:4: error: incomplete definition of type 'struct gpio_chip'
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
   drivers/net/phy/qca807x.c:409:9: error: call to undeclared function 'devm_gpiochip_add_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return devm_gpiochip_add_data(dev, gc, priv);


vim +342 drivers/net/phy/qca807x.c

   340	
   341	#ifdef CONFIG_GPIOLIB
 > 342	static int qca807x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
   343	{
   344		return GPIO_LINE_DIRECTION_OUT;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
