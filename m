Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398E33D5227;
	Sat, 16 May 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778932719; cv=none; b=Dhf0FsuX02gE1wS+TsAeITV5Eq+9cy3AZqD9xEw26H6/pzcvrBuanrerj73NjaH4LSAVw9YO8Jsen3g8qF1nK8U3BPKTT+hzpJ9Uha/AstJg6qGiBLBCwCcQoZGZm3J/mi2ayx19/UZcH3/3p13KH8QiXAn1NIx4v940P6fXzOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778932719; c=relaxed/simple;
	bh=2ERxoGHUEDIbm4cUjWfDJXF6FslLg8f6JAKyxzGXA2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvVBYP7qKQIpWQonWOD+48zABDgraqyfSijOuuPDDm8GSKNWdSNTtJNRK8AocO9KdTVRpfAEAhtr1zbAYr8XI3YMOHM+z+2DGYr9r4gwPvN9JMBBWhUGWcCoSBRQG7VrNB+UXwHBJkbE92LlTzAeGE1fTBpakclubB8HufmIk6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZzsCx/V; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZzsCx/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778932718; x=1810468718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ERxoGHUEDIbm4cUjWfDJXF6FslLg8f6JAKyxzGXA2A=;
  b=cZzsCx/V5iQmXTtHQFTNJDDRfGNySWMFg4Ela+s9WDXD+YljgDb0Nwjw
   Ju8Vh1RELZduvdc8KIf4l9cosr6J49D6v4R++qqr7mgID1DTX4IrjG4To
   rpcYe+ZGngyW/Uatz8l+LpHhwwEjbIfeTZ575ZYFREzKTHMIOjun2hXVK
   xNXKtNMT6PczgBAxUO0xjv7iwzRiZLyXQcQX6Xalo9sSntOx/jYw6O9PL
   Qp+EAjZ9eBL4ASV9YeiPy+cLXOVhuACdMypcAzlx/cT3m+NPJNDKTy7Ba
   VRAn+tNlzZUtka/vN/RtFNQ7YHD+h1DTrK74LVAPrfZ321A4Wi90xttxR
   Q==;
X-CSE-ConnectionGUID: +CslRfruQh6bZj8csLMYCQ==
X-CSE-MsgGUID: FogQY/GCTt63Fzz5godeYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90969891"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90969891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 04:58:37 -0700
X-CSE-ConnectionGUID: R/nW/oNiQS+8gVQcrrVVDw==
X-CSE-MsgGUID: +GvjioT3RDWXKyFrDqTMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="238829935"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 May 2026 04:58:36 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wODf7-000000000n4-0N9M;
	Sat, 16 May 2026 11:58:33 +0000
Date: Sat, 16 May 2026 19:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] i2c: i2c-gpio Enhance driver for buses with shared
 SCL
Message-ID: <202605161950.P3hdEfkq-lkp@intel.com>
References: <20260514092042.3265986-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514092042.3265986-1-markus.stockhausen@gmx.de>

Hi Markus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/i2c-i2c-gpio-Enhance-driver-for-buses-with-shared-SCL/20260514-233812
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20260514092042.3265986-1-markus.stockhausen%40gmx.de
patch subject: [RFC PATCH] i2c: i2c-gpio Enhance driver for buses with shared SCL
config: arm64-randconfig-004-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161950.P3hdEfkq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161950.P3hdEfkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161950.P3hdEfkq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-gpio.c:197:30: error: incompatible pointer types passing 'struct i2c_gpio_scl_data *' to parameter of type 'const struct gpio_desc *' [-Wincompatible-pointer-types]
     197 |         int ret, irq = gpiod_to_irq(priv->scl);
         |                                     ^~~~~~~~~
   include/linux/gpio/consumer.h:169:42: note: passing argument to parameter 'desc' here
     169 | int gpiod_to_irq(const struct gpio_desc *desc);
         |                                          ^
>> drivers/i2c/busses/i2c-gpio.c:204:30: error: incompatible pointer types passing 'struct i2c_gpio_scl_data *' to parameter of type 'struct gpio_desc *' [-Wincompatible-pointer-types]
     204 |         ret = gpiod_direction_input(priv->scl);
         |                                     ^~~~~~~~~
   include/linux/gpio/consumer.h:114:45: note: passing argument to parameter 'desc' here
     114 | int gpiod_direction_input(struct gpio_desc *desc);
         |                                             ^
   drivers/i2c/busses/i2c-gpio.c:219:31: error: incompatible pointer types passing 'struct i2c_gpio_scl_data *' to parameter of type 'struct gpio_desc *' [-Wincompatible-pointer-types]
     219 |         ret = gpiod_direction_output(priv->scl, 1) ?: ret;
         |                                      ^~~~~~~~~
   include/linux/gpio/consumer.h:115:46: note: passing argument to parameter 'desc' here
     115 | int gpiod_direction_output(struct gpio_desc *desc, int value);
         |                                              ^
   3 errors generated.


vim +197 drivers/i2c/busses/i2c-gpio.c

bbe899700a44af Wolfram Sang 2018-06-29  193  
63e57b6f191db9 Wolfram Sang 2019-02-19  194  static int i2c_gpio_fi_act_on_scl_irq(struct i2c_gpio_private_data *priv,
63e57b6f191db9 Wolfram Sang 2019-02-19  195  				       irqreturn_t handler(int, void*))
63e57b6f191db9 Wolfram Sang 2019-02-19  196  {
63e57b6f191db9 Wolfram Sang 2019-02-19 @197  	int ret, irq = gpiod_to_irq(priv->scl);
63e57b6f191db9 Wolfram Sang 2019-02-19  198  
63e57b6f191db9 Wolfram Sang 2019-02-19  199  	if (irq < 0)
63e57b6f191db9 Wolfram Sang 2019-02-19  200  		return irq;
63e57b6f191db9 Wolfram Sang 2019-02-19  201  
63e57b6f191db9 Wolfram Sang 2019-02-19  202  	i2c_lock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
63e57b6f191db9 Wolfram Sang 2019-02-19  203  
63e57b6f191db9 Wolfram Sang 2019-02-19 @204  	ret = gpiod_direction_input(priv->scl);
63e57b6f191db9 Wolfram Sang 2019-02-19  205  	if (ret)
63e57b6f191db9 Wolfram Sang 2019-02-19  206  		goto unlock;
63e57b6f191db9 Wolfram Sang 2019-02-19  207  
63e57b6f191db9 Wolfram Sang 2019-02-19  208  	reinit_completion(&priv->scl_irq_completion);
63e57b6f191db9 Wolfram Sang 2019-02-19  209  
63e57b6f191db9 Wolfram Sang 2019-02-19  210  	ret = request_irq(irq, handler, IRQF_TRIGGER_FALLING,
63e57b6f191db9 Wolfram Sang 2019-02-19  211  			  "i2c_gpio_fault_injector_scl_irq", priv);
63e57b6f191db9 Wolfram Sang 2019-02-19  212  	if (ret)
63e57b6f191db9 Wolfram Sang 2019-02-19  213  		goto output;
63e57b6f191db9 Wolfram Sang 2019-02-19  214  
63e57b6f191db9 Wolfram Sang 2019-02-19  215  	wait_for_completion_interruptible(&priv->scl_irq_completion);
63e57b6f191db9 Wolfram Sang 2019-02-19  216  
63e57b6f191db9 Wolfram Sang 2019-02-19  217  	free_irq(irq, priv);
63e57b6f191db9 Wolfram Sang 2019-02-19  218   output:
63e57b6f191db9 Wolfram Sang 2019-02-19  219  	ret = gpiod_direction_output(priv->scl, 1) ?: ret;
63e57b6f191db9 Wolfram Sang 2019-02-19  220   unlock:
63e57b6f191db9 Wolfram Sang 2019-02-19  221  	i2c_unlock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
63e57b6f191db9 Wolfram Sang 2019-02-19  222  
63e57b6f191db9 Wolfram Sang 2019-02-19  223  	return ret;
63e57b6f191db9 Wolfram Sang 2019-02-19  224  }
63e57b6f191db9 Wolfram Sang 2019-02-19  225  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
