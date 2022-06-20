Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0B03237
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 22:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655764272; x=1687300272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Re7rWL4abOLtS+lrprFgG6IQmQ4DOHCKTCHvuEvnm94=;
  b=feqo429CR4/iYARcBiHWCvzkA7EK6FqvzYhnoK+mM5PzwBi7cWG4gSJc
   1tpyyzvUeddwTEgq2RZFvCBnDaFpyGa9bxKDtZqQbgycYzDDq6d1R9gsy
   Q/XWSiNUn4cY7QhOsw3Dj194CeATHdwPXXKK1ErhV34N2RnxLLrw8MhU5
   vZ9SNUQCASSrMtDjplJ1kSMzkd5TlSPFBEgawuesXRF9MTOUwZu+pLiZV
   IntEnuouRwIgCSSjZr0EpqXIUSKf7AAvBE+iNy3xvHiYowNJL/UbOXXeZ
   Q1U+Uc1LbUyVY0Li2uUvLVMoWQunAhcq9CaLnkY4nR2dn2n5wFGyTKWHc
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="280029672"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="280029672"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 15:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="614530076"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jun 2022 15:31:09 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3PvI-000Wkn-PL;
	Mon, 20 Jun 2022 22:31:08 +0000
Date: Tue, 21 Jun 2022 06:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 1/1] pinctrl: nomadik: Convert drivers to use struct
 pingroup and PINCTRL_PINGROUP()
Message-ID: <202206210623.0U4Kh4D3-lkp@intel.com>
References: <20220620171136.84648-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620171136.84648-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-nomadik-Convert-drivers-to-use-struct-pingroup-and-PINCTRL_PINGROUP/20220621-011251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: arm-randconfig-r015-20220619 (https://download.01.org/0day-ci/archive/20220621/202206210623.0U4Kh4D3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/b4fae758bbe7d632c6bac2fe8070634f41a7f9bf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/pinctrl-nomadik-Convert-drivers-to-use-struct-pingroup-and-PINCTRL_PINGROUP/20220621-011251
        git checkout b4fae758bbe7d632c6bac2fe8070634f41a7f9bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pinctrl/nomadik/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1529:4: error: incompatible pointer types assigning to 'const struct nmk_pingroup *' from 'const struct pingroup *' [-Werror,-Wincompatible-pointer-types]
           g = &npct->soc->groups[group].grp;
             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1533:54: error: no member named 'name' in 'struct nmk_pingroup'
           dev_dbg(npct->dev, "enable group %s, %u pins\n", g->name, g->npins);
                                                            ~  ^
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                                  ^~~~~~~~~~~
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1533:63: error: no member named 'npins' in 'struct nmk_pingroup'
           dev_dbg(npct->dev, "enable group %s, %u pins\n", g->name, g->npins);
                                                                     ~  ^
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                                  ^~~~~~~~~~~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1568:22: error: no member named 'npins' in 'struct nmk_pingroup'
                   for (i = 0; i < g->npins; i++)
                                   ~  ^
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1569:12: error: no member named 'pins' in 'struct nmk_pingroup'
                           slpm[g->pins[i] / NMK_GPIO_PER_CHIP] &= ~BIT(g->pins[i]);
                                ~  ^
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1569:52: error: no member named 'pins' in 'struct nmk_pingroup'
                           slpm[g->pins[i] / NMK_GPIO_PER_CHIP] &= ~BIT(g->pins[i]);
                                                                        ~  ^
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                              ^~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1573:21: error: no member named 'npins' in 'struct nmk_pingroup'
           for (i = 0; i < g->npins; i++) {
                           ~  ^
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1577:40: error: no member named 'pins' in 'struct nmk_pingroup'
                   nmk_chip = find_nmk_gpio_from_pin(g->pins[i]);
                                                     ~  ^
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1581:8: error: no member named 'pins' in 'struct nmk_pingroup'
                                   g->pins[i], g->name, i);
                                   ~  ^
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1581:20: error: no member named 'name' in 'struct nmk_pingroup'
                                   g->pins[i], g->name, i);
                                               ~  ^
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1584:62: error: no member named 'pins' in 'struct nmk_pingroup'
                   dev_dbg(npct->dev, "setting pin %d to altsetting %d\n", g->pins[i], g->altsetting);
                                                                           ~  ^
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                                  ^~~~~~~~~~~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1587:12: error: no member named 'pins' in 'struct nmk_pingroup'
                   bit = g->pins[i] % NMK_GPIO_PER_CHIP;
                         ~  ^
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1610:37: error: no member named 'pins' in 'struct nmk_pingroup'
                           nmk_prcm_altcx_set_mode(npct, g->pins[i],
                                                         ~  ^
   13 errors generated.


vim +1529 drivers/pinctrl/nomadik/pinctrl-nomadik.c

  1517	
  1518	static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned function,
  1519			       unsigned group)
  1520	{
  1521		struct nmk_pinctrl *npct = pinctrl_dev_get_drvdata(pctldev);
  1522		const struct nmk_pingroup *g;
  1523		static unsigned int slpm[NUM_BANKS];
  1524		unsigned long flags = 0;
  1525		bool glitch;
  1526		int ret = -EINVAL;
  1527		int i;
  1528	
> 1529		g = &npct->soc->groups[group].grp;
  1530		if (g->altsetting < 0)
  1531			return -EINVAL;
  1532	
> 1533		dev_dbg(npct->dev, "enable group %s, %u pins\n", g->name, g->npins);
  1534	
  1535		/*
  1536		 * If we're setting altfunc C by setting both AFSLA and AFSLB to 1,
  1537		 * we may pass through an undesired state. In this case we take
  1538		 * some extra care.
  1539		 *
  1540		 * Safe sequence used to switch IOs between GPIO and Alternate-C mode:
  1541		 *  - Save SLPM registers (since we have a shadow register in the
  1542		 *    nmk_chip we're using that as backup)
  1543		 *  - Set SLPM=0 for the IOs you want to switch and others to 1
  1544		 *  - Configure the GPIO registers for the IOs that are being switched
  1545		 *  - Set IOFORCE=1
  1546		 *  - Modify the AFLSA/B registers for the IOs that are being switched
  1547		 *  - Set IOFORCE=0
  1548		 *  - Restore SLPM registers
  1549		 *  - Any spurious wake up event during switch sequence to be ignored
  1550		 *    and cleared
  1551		 *
  1552		 * We REALLY need to save ALL slpm registers, because the external
  1553		 * IOFORCE will switch *all* ports to their sleepmode setting to as
  1554		 * to avoid glitches. (Not just one port!)
  1555		 */
  1556		glitch = ((g->altsetting & NMK_GPIO_ALT_C) == NMK_GPIO_ALT_C);
  1557	
  1558		if (glitch) {
  1559			spin_lock_irqsave(&nmk_gpio_slpm_lock, flags);
  1560	
  1561			/* Initially don't put any pins to sleep when switching */
  1562			memset(slpm, 0xff, sizeof(slpm));
  1563	
  1564			/*
  1565			 * Then mask the pins that need to be sleeping now when we're
  1566			 * switching to the ALT C function.
  1567			 */
  1568			for (i = 0; i < g->npins; i++)
> 1569				slpm[g->pins[i] / NMK_GPIO_PER_CHIP] &= ~BIT(g->pins[i]);
  1570			nmk_gpio_glitch_slpm_init(slpm);
  1571		}
  1572	
  1573		for (i = 0; i < g->npins; i++) {
  1574			struct nmk_gpio_chip *nmk_chip;
  1575			unsigned bit;
  1576	
  1577			nmk_chip = find_nmk_gpio_from_pin(g->pins[i]);
  1578			if (!nmk_chip) {
  1579				dev_err(npct->dev,
  1580					"invalid pin offset %d in group %s at index %d\n",
  1581					g->pins[i], g->name, i);
  1582				goto out_glitch;
  1583			}
  1584			dev_dbg(npct->dev, "setting pin %d to altsetting %d\n", g->pins[i], g->altsetting);
  1585	
  1586			clk_enable(nmk_chip->clk);
  1587			bit = g->pins[i] % NMK_GPIO_PER_CHIP;
  1588			/*
  1589			 * If the pin is switching to altfunc, and there was an
  1590			 * interrupt installed on it which has been lazy disabled,
  1591			 * actually mask the interrupt to prevent spurious interrupts
  1592			 * that would occur while the pin is under control of the
  1593			 * peripheral. Only SKE does this.
  1594			 */
  1595			nmk_gpio_disable_lazy_irq(nmk_chip, bit);
  1596	
  1597			__nmk_gpio_set_mode_safe(nmk_chip, bit,
  1598				(g->altsetting & NMK_GPIO_ALT_C), glitch);
  1599			clk_disable(nmk_chip->clk);
  1600	
  1601			/*
  1602			 * Call PRCM GPIOCR config function in case ALTC
  1603			 * has been selected:
  1604			 * - If selection is a ALTCx, some bits in PRCM GPIOCR registers
  1605			 *   must be set.
  1606			 * - If selection is pure ALTC and previous selection was ALTCx,
  1607			 *   then some bits in PRCM GPIOCR registers must be cleared.
  1608			 */
  1609			if ((g->altsetting & NMK_GPIO_ALT_C) == NMK_GPIO_ALT_C)
  1610				nmk_prcm_altcx_set_mode(npct, g->pins[i],
  1611					g->altsetting >> NMK_GPIO_ALT_CX_SHIFT);
  1612		}
  1613	
  1614		/* When all pins are successfully reconfigured we get here */
  1615		ret = 0;
  1616	
  1617	out_glitch:
  1618		if (glitch) {
  1619			nmk_gpio_glitch_slpm_restore(slpm);
  1620			spin_unlock_irqrestore(&nmk_gpio_slpm_lock, flags);
  1621		}
  1622	
  1623		return ret;
  1624	}
  1625	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
