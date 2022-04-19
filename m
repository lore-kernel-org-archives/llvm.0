Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B05A2A
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 02:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650335056; x=1681871056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sg0GUnHw6JWHcaByo8mJxsaDyhurBYJrDE+tM61ItNU=;
  b=LUakrK1DJ6VDzTdNbq2J1xPMlbjWYDAEjPfmX2XLEoQDTt6FG3U3gqeL
   J5a33iAHjKcqaxGXR2+xfRR/Z1W7wlS82BVDBIZGkn4FE3ap7nGnDlbLS
   4iSdJYzoF9gmhFLutlOAlTcWPTNJ96mB0qy3f9cOFelnEOuycP9odQHf2
   Li8YW92KyPAXSmwltBbz+8AeXLZvZsbJ/TqNR7wY7iY/U1P5LXz+1TIFw
   3sCEsQUFO5GN3yeGjkbgMvrL50JHNo6ZPsL6LRL8EPc0ZMgIkD7M1ftte
   MWchGaUy6Lj3ijw8++38vhAa3SmZepE/13puigMgZo+6eenypwlAXWOAL
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="326556189"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="326556189"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 19:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="625496035"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2022 19:24:14 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngdXJ-0005D4-E8;
	Tue, 19 Apr 2022 02:24:13 +0000
Date: Tue, 19 Apr 2022 10:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2061/2356]
 drivers/pinctrl/pinctrl-microchip-sgpio.c:656:39: warning: variable 'flags'
 is uninitialized when used here
Message-ID: <202204191041.XKFMSrNr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   af93551cf39027d176f30b9beafc60a4c130998a
commit: abac2ae0fd81750ce0835c0637b6b7fff7c2316a [2061/2356] headers/deps: irq: Optimize <linux/irq.h> dependencies
config: i386-randconfig-a012-20220418 (https://download.01.org/0day-ci/archive/20220419/202204191041.XKFMSrNr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=abac2ae0fd81750ce0835c0637b6b7fff7c2316a
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout abac2ae0fd81750ce0835c0637b6b7fff7c2316a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/panel/ drivers/hwmon/ drivers/iio/afe/ drivers/iio/proximity/ drivers/input/touchscreen/ drivers/mtd/nand/ drivers/phy/cadence/ drivers/pinctrl/ drivers/platform/chrome/ mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-microchip-sgpio.c:656:2: error: implicit declaration of function 'spin_lock_irqsave' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           spin_lock_irqsave(&bank->priv->lock, flags);
           ^
   drivers/pinctrl/pinctrl-microchip-sgpio.c:675:2: error: implicit declaration of function 'spin_unlock_irqrestore' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           spin_unlock_irqrestore(&bank->priv->lock, flags);
           ^
   drivers/pinctrl/pinctrl-microchip-sgpio.c:675:2: note: did you mean 'spin_lock_irqsave'?
   drivers/pinctrl/pinctrl-microchip-sgpio.c:656:2: note: 'spin_lock_irqsave' declared here
           spin_lock_irqsave(&bank->priv->lock, flags);
           ^
>> drivers/pinctrl/pinctrl-microchip-sgpio.c:656:39: warning: variable 'flags' is uninitialized when used here [-Wuninitialized]
           spin_lock_irqsave(&bank->priv->lock, flags);
                                                ^~~~~
   drivers/pinctrl/pinctrl-microchip-sgpio.c:651:21: note: initialize the variable 'flags' to silence this warning
           unsigned long flags;
                              ^
                               = 0
   1 warning and 2 errors generated.


vim +/flags +656 drivers/pinctrl/pinctrl-microchip-sgpio.c

7e5ea974e61c8d Lars Povlsen  2020-11-13  642  
be2dc859abd4d7 Lars Povlsen  2020-12-09  643  static void microchip_sgpio_irq_settype(struct irq_data *data,
be2dc859abd4d7 Lars Povlsen  2020-12-09  644  					int type,
be2dc859abd4d7 Lars Povlsen  2020-12-09  645  					int polarity)
be2dc859abd4d7 Lars Povlsen  2020-12-09  646  {
be2dc859abd4d7 Lars Povlsen  2020-12-09  647  	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
be2dc859abd4d7 Lars Povlsen  2020-12-09  648  	struct sgpio_bank *bank = gpiochip_get_data(chip);
be2dc859abd4d7 Lars Povlsen  2020-12-09  649  	unsigned int gpio = irqd_to_hwirq(data);
be2dc859abd4d7 Lars Povlsen  2020-12-09  650  	struct sgpio_port_addr addr;
7996c5f5ec7a20 Michael Walle 2022-02-26  651  	unsigned long flags;
be2dc859abd4d7 Lars Povlsen  2020-12-09  652  	u32 ena;
be2dc859abd4d7 Lars Povlsen  2020-12-09  653  
be2dc859abd4d7 Lars Povlsen  2020-12-09  654  	sgpio_pin_to_addr(bank->priv, gpio, &addr);
be2dc859abd4d7 Lars Povlsen  2020-12-09  655  
7996c5f5ec7a20 Michael Walle 2022-02-26 @656  	spin_lock_irqsave(&bank->priv->lock, flags);
7996c5f5ec7a20 Michael Walle 2022-02-26  657  
be2dc859abd4d7 Lars Povlsen  2020-12-09  658  	/* Disable interrupt while changing type */
be2dc859abd4d7 Lars Povlsen  2020-12-09  659  	ena = sgpio_readl(bank->priv, REG_INT_ENABLE, addr.bit);
be2dc859abd4d7 Lars Povlsen  2020-12-09  660  	sgpio_writel(bank->priv, ena & ~BIT(addr.port), REG_INT_ENABLE, addr.bit);
be2dc859abd4d7 Lars Povlsen  2020-12-09  661  
be2dc859abd4d7 Lars Povlsen  2020-12-09  662  	/* Type value spread over 2 registers sets: low, high bit */
be2dc859abd4d7 Lars Povlsen  2020-12-09  663  	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER, addr.bit,
be2dc859abd4d7 Lars Povlsen  2020-12-09  664  			 BIT(addr.port), (!!(type & 0x1)) << addr.port);
5d5f2919273d10 Lars Povlsen  2021-02-03  665  	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER, SGPIO_MAX_BITS + addr.bit,
be2dc859abd4d7 Lars Povlsen  2020-12-09  666  			 BIT(addr.port), (!!(type & 0x2)) << addr.port);
be2dc859abd4d7 Lars Povlsen  2020-12-09  667  
be2dc859abd4d7 Lars Povlsen  2020-12-09  668  	if (type == SGPIO_INT_TRG_LEVEL)
be2dc859abd4d7 Lars Povlsen  2020-12-09  669  		sgpio_clrsetbits(bank->priv, REG_INT_POLARITY, addr.bit,
be2dc859abd4d7 Lars Povlsen  2020-12-09  670  				 BIT(addr.port), polarity << addr.port);
be2dc859abd4d7 Lars Povlsen  2020-12-09  671  
be2dc859abd4d7 Lars Povlsen  2020-12-09  672  	/* Possibly re-enable interrupts */
be2dc859abd4d7 Lars Povlsen  2020-12-09  673  	sgpio_writel(bank->priv, ena, REG_INT_ENABLE, addr.bit);
7996c5f5ec7a20 Michael Walle 2022-02-26  674  
7996c5f5ec7a20 Michael Walle 2022-02-26 @675  	spin_unlock_irqrestore(&bank->priv->lock, flags);
be2dc859abd4d7 Lars Povlsen  2020-12-09  676  }
be2dc859abd4d7 Lars Povlsen  2020-12-09  677  

:::::: The code at line 656 was first introduced by commit
:::::: 7996c5f5ec7a20b3f6b8fae93fcf3cb8f1c01743 pinctrl: microchip-sgpio: lock RMW access

:::::: TO: Michael Walle <michael@walle.cc>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
