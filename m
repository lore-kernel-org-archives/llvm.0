Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC297E;
	Tue,  4 Apr 2023 00:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680569933; x=1712105933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t/8M52oZNpmJ0rYrT21nM2K3sasgaKzMUWvh/T0RiMY=;
  b=FTVbO4hsk8Q4WxjoITwzIWvIlKhrsQ3orceohU70BbyX1+XQg8u3xyWZ
   WL+rhws5DgvLIVbRHCRWHSTRoNAYIjTXbK7BOO13UEOvVdFf/YzU5ODkF
   riCBZUM376MGiJOfF44VK8nFdg8O3mW8J1CnZP4LooLIHNGxhxRwHp/MI
   da02TrD5FrmatP2wUGgI/yGW+ogju7GE28SkfLsyVQ863/B3J8I6w8PgO
   MVv7vPVZnXESl4a683LRrQiCf39d0lsbyYBXUDGmyzZ9+HYTRVnG3iV4I
   FM+Zu6+QueMmuK64BqBkLh6vQs5MXfHh+Ay1/J66slaBa0BS4IB/szH/+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="407116884"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="407116884"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 17:58:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663397229"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="663397229"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Apr 2023 17:58:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjV0b-000Oyw-2D;
	Tue, 04 Apr 2023 00:58:49 +0000
Date: Tue, 4 Apr 2023 08:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linux-next:master 932/8744] arch/mips/ar7/gpio.c:19:19: error:
 field has incomplete type 'struct gpio_chip'
Message-ID: <202304040830.kPrP1Qew-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   31bd35b66249699343d2416658f57e97314a433a
commit: 21d9526d13b5467b0a6532e5a8b0eb04c01ce326 [932/8744] gpiolib: Make the legacy <linux/gpio.h> consumer-only
config: mips-randconfig-r035-20230402 (https://download.01.org/0day-ci/archive/20230404/202304040830.kPrP1Qew-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=21d9526d13b5467b0a6532e5a8b0eb04c01ce326
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 21d9526d13b5467b0a6532e5a8b0eb04c01ce326
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040830.kPrP1Qew-lkp@intel.com/

Note: the linux-next/master HEAD 31bd35b66249699343d2416658f57e97314a433a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/mips/ar7/gpio.c:19:19: error: field has incomplete type 'struct gpio_chip'
           struct gpio_chip        chip;
                                   ^
   arch/mips/ar7/gpio.c:19:9: note: forward declaration of 'struct gpio_chip'
           struct gpio_chip        chip;
                  ^
>> arch/mips/ar7/gpio.c:24:31: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                        ^
>> arch/mips/ar7/gpio.c:24:24: error: incompatible integer to pointer conversion initializing 'struct ar7_gpio_chip *' with an expression of type 'int' [-Wint-conversion]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                 ^      ~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c:32:31: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                        ^
   arch/mips/ar7/gpio.c:32:24: error: incompatible integer to pointer conversion initializing 'struct ar7_gpio_chip *' with an expression of type 'int' [-Wint-conversion]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                 ^      ~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c:42:31: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                        ^
   arch/mips/ar7/gpio.c:42:24: error: incompatible integer to pointer conversion initializing 'struct ar7_gpio_chip *' with an expression of type 'int' [-Wint-conversion]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                 ^      ~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c:55:31: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                        ^
   arch/mips/ar7/gpio.c:55:24: error: incompatible integer to pointer conversion initializing 'struct ar7_gpio_chip *' with an expression of type 'int' [-Wint-conversion]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                 ^      ~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c:68:31: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                        ^
   arch/mips/ar7/gpio.c:68:24: error: incompatible integer to pointer conversion initializing 'struct ar7_gpio_chip *' with an expression of type 'int' [-Wint-conversion]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                 ^      ~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c:78:31: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                        ^
   arch/mips/ar7/gpio.c:78:24: error: incompatible integer to pointer conversion initializing 'struct ar7_gpio_chip *' with an expression of type 'int' [-Wint-conversion]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                 ^      ~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c:93:31: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                        ^
   arch/mips/ar7/gpio.c:93:24: error: incompatible integer to pointer conversion initializing 'struct ar7_gpio_chip *' with an expression of type 'int' [-Wint-conversion]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                 ^      ~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c:105:31: error: call to undeclared function 'gpiochip_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                        ^
   arch/mips/ar7/gpio.c:105:24: error: incompatible integer to pointer conversion initializing 'struct ar7_gpio_chip *' with an expression of type 'int' [-Wint-conversion]
           struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
                                 ^      ~~~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/ar7/gpio.c:318:8: error: call to undeclared function 'gpiochip_add_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = gpiochip_add_data(&gpch->chip, gpch);
                 ^
   18 errors generated.


vim +19 arch/mips/ar7/gpio.c

7ca5dc145bc7da Florian Fainelli 2009-06-24  16  
5f3c909881d5de Florian Fainelli 2010-01-03  17  struct ar7_gpio_chip {
5f3c909881d5de Florian Fainelli 2010-01-03  18  	void __iomem		*regs;
5f3c909881d5de Florian Fainelli 2010-01-03 @19  	struct gpio_chip	chip;
5f3c909881d5de Florian Fainelli 2010-01-03  20  };
7ca5dc145bc7da Florian Fainelli 2009-06-24  21  
5f3c909881d5de Florian Fainelli 2010-01-03  22  static int ar7_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
7ca5dc145bc7da Florian Fainelli 2009-06-24  23  {
1b2766fb496c46 Linus Walleij    2015-12-08 @24  	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
5f3c909881d5de Florian Fainelli 2010-01-03  25  	void __iomem *gpio_in = gpch->regs + AR7_GPIO_INPUT;
7ca5dc145bc7da Florian Fainelli 2009-06-24  26  
249e573d99ab59 Linus Walleij    2015-12-22  27  	return !!(readl(gpio_in) & (1 << gpio));
5f3c909881d5de Florian Fainelli 2010-01-03  28  }
5f3c909881d5de Florian Fainelli 2010-01-03  29  

:::::: The code at line 19 was first introduced by commit
:::::: 5f3c909881d5deebb9a3ddc836a15937e76daefc MIPS: AR7: Implement gpiolib

:::::: TO: Florian Fainelli <florian@openwrt.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
