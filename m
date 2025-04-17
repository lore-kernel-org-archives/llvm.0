Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563CC23C8D7;
	Thu, 17 Apr 2025 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889175; cv=none; b=ewr0D1kyoCUKq5g3lmx54Q4OSR8L4JQRLztmMD//cM3XQCvQdGQpHKu7HCaWj9gy2crPPBWUW2Z1PwnjEtmqIZSWHdS0ZB6m2RI0yfNwToWUl38uY1DRm4RtNzTH0FhhMNs5FY5RQKIZ5yIilH7Liatrg81sd6T8u4jrUOvw9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889175; c=relaxed/simple;
	bh=3iBddRL6jyT6YRqtISyIVvJ2dZlmtoSncfqgdYqHsi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYadMmkoqNQXoLpr1HYfccGkk7BnEHT9gReYlvEIvmqMz15zVtISu6vd+qzobL8VLSJDxj5b3RDI+o1OicMex02IMNAY92rTL3Z9hrU98aI1h7hVHvbSXh1PenCMoKcH7fW5BopTJSMewQ7iLymlSKtxvybdKS0oYEz28DsOMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1K5Pd+y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1K5Pd+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744889173; x=1776425173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iBddRL6jyT6YRqtISyIVvJ2dZlmtoSncfqgdYqHsi4=;
  b=n1K5Pd+yifCcwiXOxurnxJfmfpuv7eOPXaketSJeZe9wyNzQfMbcw3EW
   ++OE/G5HnSJGBXQxgA0yyYVJdpPo942woY3sOECbQvh0c4xlOAqhpEg6Y
   PIHPHKULTtpdYcYbFs0JVbtzfvAIHj7invRoOpVwXSRN8dpsy01FRxnOb
   MbzEPm3eD3Bk8Mk7YG6Zg1F49xNjvFqW8l5y52JW3uY2caKn2QaufujJE
   4BtBpnH16Trn+W0iHe3QthvvKtjtwyWGYYzZhr/UDk1AUq/e0CWjIQZu2
   6DjmYQDiXVOygjPyX0qeton5D6JRaR1oFJYsqwSJKGiT0+jiNRyjlPvgf
   w==;
X-CSE-ConnectionGUID: +A9VfYhqRNuCKy2//ItirQ==
X-CSE-MsgGUID: 8MTWKA7YRja116AXfRpdoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46560782"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46560782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:26:11 -0700
X-CSE-ConnectionGUID: Eb/5Lhc5T6GdnwsRIKel1w==
X-CSE-MsgGUID: tMg+/TTeSy+PoEjpm65XzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131757568"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2025 04:26:10 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5NNf-000MXE-0b;
	Thu, 17 Apr 2025 11:26:07 +0000
Date: Thu, 17 Apr 2025 19:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 4495/4779] drivers/gpio/gpio-ich.c:142:9: error:
 call to '_inl' declared with 'error' attribute: inl() requires
 CONFIG_HAS_IOPORT
Message-ID: <202504171941.g1yXja0j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
commit: 10b16abc29e17c6ca86bcb8ceebf840e509b0ce5 [4495/4779] gpio: ich: enable building with COMPILE_TEST=y
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250417/202504171941.g1yXja0j-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171941.g1yXja0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171941.g1yXja0j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-ich.c:142:9: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
     142 |         data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
         |                ^
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
>> drivers/gpio/gpio-ich.c:142:9: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
>> drivers/gpio/gpio-ich.c:213:3: error: call to '_outl' declared with 'error' attribute: outl() requires CONFIG_HAS_IOPORT
     213 |                 ICHX_WRITE(BIT(16 + nr), 0, ichx_priv.pm_base);
         |                 ^
   drivers/gpio/gpio-ich.c:54:40: note: expanded from macro 'ICHX_WRITE'
      54 | #define ICHX_WRITE(val, reg, base_res)  outl(val, (reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:663:14: note: expanded from macro 'outl'
     663 | #define outl _outl
         |              ^
   include/asm-generic/io.h:626:15: note: expanded from macro '_outl'
     626 | #define _outl _outl
         |               ^
   drivers/gpio/gpio-ich.c:214:10: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
     214 |                 data = ICHX_READ(0, ichx_priv.pm_base);
         |                        ^
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
>> drivers/gpio/gpio-ich.c:142:9: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
     142 |         data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
         |                ^
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
>> drivers/gpio/gpio-ich.c:142:9: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
>> drivers/gpio/gpio-ich.c:142:9: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
   drivers/gpio/gpio-ich.c:113:10: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
     113 |                 data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
         |                        ^
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
   drivers/gpio/gpio-ich.c:120:2: error: call to '_outl' declared with 'error' attribute: outl() requires CONFIG_HAS_IOPORT
     120 |         ICHX_WRITE(data, ichx_priv.desc->regs[reg][reg_nr],
         |         ^
   drivers/gpio/gpio-ich.c:54:40: note: expanded from macro 'ICHX_WRITE'
      54 | #define ICHX_WRITE(val, reg, base_res)  outl(val, (reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:663:14: note: expanded from macro 'outl'
     663 | #define outl _outl
         |              ^
   include/asm-generic/io.h:626:15: note: expanded from macro '_outl'
     626 | #define _outl _outl
         |               ^
   drivers/gpio/gpio-ich.c:125:8: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
     125 |         tmp = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
         |               ^
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
   drivers/gpio/gpio-ich.c:113:10: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
     113 |                 data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
         |                        ^
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
   drivers/gpio/gpio-ich.c:120:2: error: call to '_outl' declared with 'error' attribute: outl() requires CONFIG_HAS_IOPORT
     120 |         ICHX_WRITE(data, ichx_priv.desc->regs[reg][reg_nr],
         |         ^
   drivers/gpio/gpio-ich.c:54:40: note: expanded from macro 'ICHX_WRITE'
      54 | #define ICHX_WRITE(val, reg, base_res)  outl(val, (reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:663:14: note: expanded from macro 'outl'
     663 | #define outl _outl
         |              ^
   include/asm-generic/io.h:626:15: note: expanded from macro '_outl'
     626 | #define _outl _outl
         |               ^
   drivers/gpio/gpio-ich.c:125:8: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
     125 |         tmp = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
         |               ^
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
   drivers/gpio/gpio-ich.c:113:10: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
     113 |                 data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
         |                        ^
   drivers/gpio/gpio-ich.c:55:34: note: expanded from macro 'ICHX_READ'
      55 | #define ICHX_READ(reg, base_res)        inl((reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:651:13: note: expanded from macro 'inl'
     651 | #define inl _inl
         |             ^
   include/asm-generic/io.h:578:14: note: expanded from macro '_inl'
     578 | #define _inl _inl
         |              ^
   drivers/gpio/gpio-ich.c:120:2: error: call to '_outl' declared with 'error' attribute: outl() requires CONFIG_HAS_IOPORT
     120 |         ICHX_WRITE(data, ichx_priv.desc->regs[reg][reg_nr],
         |         ^
   drivers/gpio/gpio-ich.c:54:40: note: expanded from macro 'ICHX_WRITE'
      54 | #define ICHX_WRITE(val, reg, base_res)  outl(val, (reg) + (base_res)->start)
         |                                         ^
   include/asm-generic/io.h:663:14: note: expanded from macro 'outl'


vim +142 drivers/gpio/gpio-ich.c

3b9231893e5731 Vincent Donnefort 2014-02-14   53  
6ed9f9c405f97c Peter Tyser       2012-04-18   54  #define ICHX_WRITE(val, reg, base_res)	outl(val, (reg) + (base_res)->start)
6ed9f9c405f97c Peter Tyser       2012-04-18  @55  #define ICHX_READ(reg, base_res)	inl((reg) + (base_res)->start)
6ed9f9c405f97c Peter Tyser       2012-04-18   56  
6ed9f9c405f97c Peter Tyser       2012-04-18   57  struct ichx_desc {
6ed9f9c405f97c Peter Tyser       2012-04-18   58  	/* Max GPIO pins the chipset can have */
6ed9f9c405f97c Peter Tyser       2012-04-18   59  	uint ngpio;
6ed9f9c405f97c Peter Tyser       2012-04-18   60  
bb62a35bd5d96e Vincent Donnefort 2014-02-14   61  	/* chipset registers */
bb62a35bd5d96e Vincent Donnefort 2014-02-14   62  	const u8 (*regs)[3];
bb62a35bd5d96e Vincent Donnefort 2014-02-14   63  	const u8 *reglen;
bb62a35bd5d96e Vincent Donnefort 2014-02-14   64  
ba7f74fe2bbac3 Vincent Donnefort 2014-02-14   65  	/* GPO_BLINK is available on this chipset */
ba7f74fe2bbac3 Vincent Donnefort 2014-02-14   66  	bool have_blink;
ba7f74fe2bbac3 Vincent Donnefort 2014-02-14   67  
6ed9f9c405f97c Peter Tyser       2012-04-18   68  	/* Whether the chipset has GPIO in GPE0_STS in the PM IO region */
6ed9f9c405f97c Peter Tyser       2012-04-18   69  	bool uses_gpe0;
6ed9f9c405f97c Peter Tyser       2012-04-18   70  
6ed9f9c405f97c Peter Tyser       2012-04-18   71  	/* USE_SEL is bogus on some chipsets, eg 3100 */
6ed9f9c405f97c Peter Tyser       2012-04-18   72  	u32 use_sel_ignore[3];
6ed9f9c405f97c Peter Tyser       2012-04-18   73  
6ed9f9c405f97c Peter Tyser       2012-04-18   74  	/* Some chipsets have quirks, let these use their own request/get */
ae84f15c651ac4 Abanoub Sameh     2020-07-21   75  	int (*request)(struct gpio_chip *chip, unsigned int offset);
ae84f15c651ac4 Abanoub Sameh     2020-07-21   76  	int (*get)(struct gpio_chip *chip, unsigned int offset);
e6540f332447b2 Vincent Donnefort 2014-02-14   77  
e6540f332447b2 Vincent Donnefort 2014-02-14   78  	/*
e6540f332447b2 Vincent Donnefort 2014-02-14   79  	 * Some chipsets don't let reading output values on GPIO_LVL register
e6540f332447b2 Vincent Donnefort 2014-02-14   80  	 * this option allows driver caching written output values
e6540f332447b2 Vincent Donnefort 2014-02-14   81  	 */
e6540f332447b2 Vincent Donnefort 2014-02-14   82  	bool use_outlvl_cache;
6ed9f9c405f97c Peter Tyser       2012-04-18   83  };
6ed9f9c405f97c Peter Tyser       2012-04-18   84  
6ed9f9c405f97c Peter Tyser       2012-04-18   85  static struct {
6ed9f9c405f97c Peter Tyser       2012-04-18   86  	spinlock_t lock;
ff4709b44cc075 Andy Shevchenko   2018-11-08   87  	struct device *dev;
6ed9f9c405f97c Peter Tyser       2012-04-18   88  	struct gpio_chip chip;
6ed9f9c405f97c Peter Tyser       2012-04-18   89  	struct resource *gpio_base;	/* GPIO IO base */
9b6d5690b543b8 sachin agarwal    2020-02-09   90  	struct resource *pm_base;	/* Power Management IO base */
6ed9f9c405f97c Peter Tyser       2012-04-18   91  	struct ichx_desc *desc;	/* Pointer to chipset-specific description */
6ed9f9c405f97c Peter Tyser       2012-04-18   92  	u32 orig_gpio_ctrl;	/* Orig CTRL value, used to restore on exit */
4f600ada70beeb Jean Delvare      2012-07-23   93  	u8 use_gpio;		/* Which GPIO groups are usable */
e6540f332447b2 Vincent Donnefort 2014-02-14   94  	int outlvl_cache[3];	/* cached output values */
6ed9f9c405f97c Peter Tyser       2012-04-18   95  } ichx_priv;
6ed9f9c405f97c Peter Tyser       2012-04-18   96  
6ed9f9c405f97c Peter Tyser       2012-04-18   97  static int modparam_gpiobase = -1;	/* dynamic */
6ed9f9c405f97c Peter Tyser       2012-04-18   98  module_param_named(gpiobase, modparam_gpiobase, int, 0444);
5f6f2b9f6dbf7a Andy Shevchenko   2018-07-03   99  MODULE_PARM_DESC(gpiobase, "The GPIO number base. -1 means dynamic, which is the default.");
6ed9f9c405f97c Peter Tyser       2012-04-18  100  
ae84f15c651ac4 Abanoub Sameh     2020-07-21  101  static int ichx_write_bit(int reg, unsigned int nr, int val, int verify)
6ed9f9c405f97c Peter Tyser       2012-04-18  102  {
6ed9f9c405f97c Peter Tyser       2012-04-18  103  	unsigned long flags;
6ed9f9c405f97c Peter Tyser       2012-04-18  104  	u32 data, tmp;
6ed9f9c405f97c Peter Tyser       2012-04-18  105  	int reg_nr = nr / 32;
6ed9f9c405f97c Peter Tyser       2012-04-18  106  	int bit = nr & 0x1f;
6ed9f9c405f97c Peter Tyser       2012-04-18  107  
6ed9f9c405f97c Peter Tyser       2012-04-18  108  	spin_lock_irqsave(&ichx_priv.lock, flags);
6ed9f9c405f97c Peter Tyser       2012-04-18  109  
e6540f332447b2 Vincent Donnefort 2014-02-14  110  	if (reg == GPIO_LVL && ichx_priv.desc->use_outlvl_cache)
e6540f332447b2 Vincent Donnefort 2014-02-14  111  		data = ichx_priv.outlvl_cache[reg_nr];
e6540f332447b2 Vincent Donnefort 2014-02-14  112  	else
bb62a35bd5d96e Vincent Donnefort 2014-02-14  113  		data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
bb62a35bd5d96e Vincent Donnefort 2014-02-14  114  				 ichx_priv.gpio_base);
e6540f332447b2 Vincent Donnefort 2014-02-14  115  
6ed9f9c405f97c Peter Tyser       2012-04-18  116  	if (val)
7a8fd1f5cc3fd0 Linus Walleij     2018-03-06  117  		data |= BIT(bit);
6ed9f9c405f97c Peter Tyser       2012-04-18  118  	else
7a8fd1f5cc3fd0 Linus Walleij     2018-03-06  119  		data &= ~BIT(bit);
bb62a35bd5d96e Vincent Donnefort 2014-02-14  120  	ICHX_WRITE(data, ichx_priv.desc->regs[reg][reg_nr],
bb62a35bd5d96e Vincent Donnefort 2014-02-14  121  			 ichx_priv.gpio_base);
e6540f332447b2 Vincent Donnefort 2014-02-14  122  	if (reg == GPIO_LVL && ichx_priv.desc->use_outlvl_cache)
e6540f332447b2 Vincent Donnefort 2014-02-14  123  		ichx_priv.outlvl_cache[reg_nr] = data;
e6540f332447b2 Vincent Donnefort 2014-02-14  124  
bb62a35bd5d96e Vincent Donnefort 2014-02-14  125  	tmp = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
bb62a35bd5d96e Vincent Donnefort 2014-02-14  126  			ichx_priv.gpio_base);
6ed9f9c405f97c Peter Tyser       2012-04-18  127  
6ed9f9c405f97c Peter Tyser       2012-04-18  128  	spin_unlock_irqrestore(&ichx_priv.lock, flags);
6ed9f9c405f97c Peter Tyser       2012-04-18  129  
c5aaa316819428 Andy Shevchenko   2018-11-07  130  	return (verify && data != tmp) ? -EPERM : 0;
6ed9f9c405f97c Peter Tyser       2012-04-18  131  }
6ed9f9c405f97c Peter Tyser       2012-04-18  132  
ae84f15c651ac4 Abanoub Sameh     2020-07-21  133  static int ichx_read_bit(int reg, unsigned int nr)
6ed9f9c405f97c Peter Tyser       2012-04-18  134  {
6ed9f9c405f97c Peter Tyser       2012-04-18  135  	unsigned long flags;
6ed9f9c405f97c Peter Tyser       2012-04-18  136  	u32 data;
6ed9f9c405f97c Peter Tyser       2012-04-18  137  	int reg_nr = nr / 32;
6ed9f9c405f97c Peter Tyser       2012-04-18  138  	int bit = nr & 0x1f;
6ed9f9c405f97c Peter Tyser       2012-04-18  139  
6ed9f9c405f97c Peter Tyser       2012-04-18  140  	spin_lock_irqsave(&ichx_priv.lock, flags);
6ed9f9c405f97c Peter Tyser       2012-04-18  141  
bb62a35bd5d96e Vincent Donnefort 2014-02-14 @142  	data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
bb62a35bd5d96e Vincent Donnefort 2014-02-14  143  			 ichx_priv.gpio_base);
6ed9f9c405f97c Peter Tyser       2012-04-18  144  
e6540f332447b2 Vincent Donnefort 2014-02-14  145  	if (reg == GPIO_LVL && ichx_priv.desc->use_outlvl_cache)
e6540f332447b2 Vincent Donnefort 2014-02-14  146  		data = ichx_priv.outlvl_cache[reg_nr] | data;
e6540f332447b2 Vincent Donnefort 2014-02-14  147  
6ed9f9c405f97c Peter Tyser       2012-04-18  148  	spin_unlock_irqrestore(&ichx_priv.lock, flags);
6ed9f9c405f97c Peter Tyser       2012-04-18  149  
7a8fd1f5cc3fd0 Linus Walleij     2018-03-06  150  	return !!(data & BIT(bit));
6ed9f9c405f97c Peter Tyser       2012-04-18  151  }
6ed9f9c405f97c Peter Tyser       2012-04-18  152  
ae84f15c651ac4 Abanoub Sameh     2020-07-21  153  static bool ichx_gpio_check_available(struct gpio_chip *gpio, unsigned int nr)
4f600ada70beeb Jean Delvare      2012-07-23  154  {
7a8fd1f5cc3fd0 Linus Walleij     2018-03-06  155  	return !!(ichx_priv.use_gpio & BIT(nr / 32));
4f600ada70beeb Jean Delvare      2012-07-23  156  }
4f600ada70beeb Jean Delvare      2012-07-23  157  
ae84f15c651ac4 Abanoub Sameh     2020-07-21  158  static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned int nr)
62e08f25bd09b0 Aaron Sierra      2015-03-31  159  {
e42615ec233b30 Matti Vaittinen   2019-11-06  160  	if (ichx_read_bit(GPIO_IO_SEL, nr))
e42615ec233b30 Matti Vaittinen   2019-11-06  161  		return GPIO_LINE_DIRECTION_IN;
e42615ec233b30 Matti Vaittinen   2019-11-06  162  
e42615ec233b30 Matti Vaittinen   2019-11-06  163  	return GPIO_LINE_DIRECTION_OUT;
62e08f25bd09b0 Aaron Sierra      2015-03-31  164  }
62e08f25bd09b0 Aaron Sierra      2015-03-31  165  
ae84f15c651ac4 Abanoub Sameh     2020-07-21  166  static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
6ed9f9c405f97c Peter Tyser       2012-04-18  167  {
6ed9f9c405f97c Peter Tyser       2012-04-18  168  	/*
6ed9f9c405f97c Peter Tyser       2012-04-18  169  	 * Try setting pin as an input and verify it worked since many pins
6ed9f9c405f97c Peter Tyser       2012-04-18  170  	 * are output-only.
6ed9f9c405f97c Peter Tyser       2012-04-18  171  	 */
c5aaa316819428 Andy Shevchenko   2018-11-07  172  	return ichx_write_bit(GPIO_IO_SEL, nr, 1, 1);
6ed9f9c405f97c Peter Tyser       2012-04-18  173  }
6ed9f9c405f97c Peter Tyser       2012-04-18  174  
ae84f15c651ac4 Abanoub Sameh     2020-07-21  175  static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
6ed9f9c405f97c Peter Tyser       2012-04-18  176  					int val)
6ed9f9c405f97c Peter Tyser       2012-04-18  177  {
7f6569f54695c1 Vincent Donnefort 2013-06-17  178  	/* Disable blink hardware which is available for GPIOs from 0 to 31. */
ba7f74fe2bbac3 Vincent Donnefort 2014-02-14  179  	if (nr < 32 && ichx_priv.desc->have_blink)
7f6569f54695c1 Vincent Donnefort 2013-06-17  180  		ichx_write_bit(GPO_BLINK, nr, 0, 0);
7f6569f54695c1 Vincent Donnefort 2013-06-17  181  
6ed9f9c405f97c Peter Tyser       2012-04-18  182  	/* Set GPIO output value. */
6ed9f9c405f97c Peter Tyser       2012-04-18  183  	ichx_write_bit(GPIO_LVL, nr, val, 0);
6ed9f9c405f97c Peter Tyser       2012-04-18  184  
6ed9f9c405f97c Peter Tyser       2012-04-18  185  	/*
6ed9f9c405f97c Peter Tyser       2012-04-18  186  	 * Try setting pin as an output and verify it worked since many pins
6ed9f9c405f97c Peter Tyser       2012-04-18  187  	 * are input-only.
6ed9f9c405f97c Peter Tyser       2012-04-18  188  	 */
c5aaa316819428 Andy Shevchenko   2018-11-07  189  	return ichx_write_bit(GPIO_IO_SEL, nr, 0, 1);
6ed9f9c405f97c Peter Tyser       2012-04-18  190  }
6ed9f9c405f97c Peter Tyser       2012-04-18  191  
ae84f15c651ac4 Abanoub Sameh     2020-07-21  192  static int ichx_gpio_get(struct gpio_chip *chip, unsigned int nr)
6ed9f9c405f97c Peter Tyser       2012-04-18  193  {
6ed9f9c405f97c Peter Tyser       2012-04-18  194  	return ichx_read_bit(GPIO_LVL, nr);
6ed9f9c405f97c Peter Tyser       2012-04-18  195  }
6ed9f9c405f97c Peter Tyser       2012-04-18  196  
ae84f15c651ac4 Abanoub Sameh     2020-07-21  197  static int ich6_gpio_get(struct gpio_chip *chip, unsigned int nr)
6ed9f9c405f97c Peter Tyser       2012-04-18  198  {
6ed9f9c405f97c Peter Tyser       2012-04-18  199  	unsigned long flags;
6ed9f9c405f97c Peter Tyser       2012-04-18  200  	u32 data;
6ed9f9c405f97c Peter Tyser       2012-04-18  201  
6ed9f9c405f97c Peter Tyser       2012-04-18  202  	/*
6ed9f9c405f97c Peter Tyser       2012-04-18  203  	 * GPI 0 - 15 need to be read from the power management registers on
6ed9f9c405f97c Peter Tyser       2012-04-18  204  	 * a ICH6/3100 bridge.
6ed9f9c405f97c Peter Tyser       2012-04-18  205  	 */
6ed9f9c405f97c Peter Tyser       2012-04-18  206  	if (nr < 16) {
6ed9f9c405f97c Peter Tyser       2012-04-18  207  		if (!ichx_priv.pm_base)
6ed9f9c405f97c Peter Tyser       2012-04-18  208  			return -ENXIO;
6ed9f9c405f97c Peter Tyser       2012-04-18  209  
6ed9f9c405f97c Peter Tyser       2012-04-18  210  		spin_lock_irqsave(&ichx_priv.lock, flags);
6ed9f9c405f97c Peter Tyser       2012-04-18  211  
6ed9f9c405f97c Peter Tyser       2012-04-18  212  		/* GPI 0 - 15 are latched, write 1 to clear*/
7a8fd1f5cc3fd0 Linus Walleij     2018-03-06 @213  		ICHX_WRITE(BIT(16 + nr), 0, ichx_priv.pm_base);
6ed9f9c405f97c Peter Tyser       2012-04-18  214  		data = ICHX_READ(0, ichx_priv.pm_base);
6ed9f9c405f97c Peter Tyser       2012-04-18  215  
6ed9f9c405f97c Peter Tyser       2012-04-18  216  		spin_unlock_irqrestore(&ichx_priv.lock, flags);
6ed9f9c405f97c Peter Tyser       2012-04-18  217  
7a8fd1f5cc3fd0 Linus Walleij     2018-03-06  218  		return !!((data >> 16) & BIT(nr));
6ed9f9c405f97c Peter Tyser       2012-04-18  219  	} else {
6ed9f9c405f97c Peter Tyser       2012-04-18  220  		return ichx_gpio_get(chip, nr);
6ed9f9c405f97c Peter Tyser       2012-04-18  221  	}
6ed9f9c405f97c Peter Tyser       2012-04-18  222  }
6ed9f9c405f97c Peter Tyser       2012-04-18  223  

:::::: The code at line 142 was first introduced by commit
:::::: bb62a35bd5d96e506af0ea8dd145480b9172a2a6 gpio: ich: Add support for multiple register addresses

:::::: TO: Vincent Donnefort <vdonnefort@gmail.com>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
