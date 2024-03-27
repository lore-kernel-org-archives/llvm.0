Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2941433AA;
	Wed, 27 Mar 2024 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548933; cv=none; b=A4EEgnn+pjfF4eDUqqcaZlyX0k43HNAtBMVpB4c96AnwtMWmuznhAG6voKyUs2OL/pA+cTinqqPwETbCB41WK6I2Eenk6UjlS7VVA2Xc8OfAyvGpkHztJtxDFSVL2aMnK7G05Ov9qMXV40z83wk6l9SZlYkavgJoO0HH0/3zDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548933; c=relaxed/simple;
	bh=ecjM5qPus2GHv+KnHHWKtL/eFRORD9Y5Z5eqoQ+e2c4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QilqWbhBXk9xFd7W6dVsnJqE8Qp7HfN6CO+9HAHov1UmEFoLB5o3KP2EegaQdec3HAcLRNGN+1JE782SYhCQ9lcyYOOxhYTkiTeJRytssuWmWuTo3iPZHTZk7dqWE0lMmlJFd/3sNIAHMsc3UrpjIMy/MA8tph9NMGRLeoXbQ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUONt7l4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUONt7l4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711548933; x=1743084933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ecjM5qPus2GHv+KnHHWKtL/eFRORD9Y5Z5eqoQ+e2c4=;
  b=BUONt7l4tQblZsaFHlYuzhsSc8mwLJ9Cnl2xVkjHmxzhnj8FbXrUpGYZ
   xuV1dvN/bw6TCSJwevN40JHbsC9EVvTzb7/rnQP+0YSgsq+up7kvRrxdl
   5dwTOE/W4ZWIoSuYhFKbeWJGLkw2MnSkIuTB1q+QYmqdAt3h4RSkI1Ivd
   UAZkUbWiymjnNIHcLbotn/TgJDwjBAe907BDw20MDnmTl67vsUHCS6CZv
   t93uiOLkm2+Gnb4hg56a5feM9SYoVM+cDdocz6azd25LekW8ByTPT4AkK
   Feh5n+YHZ43V4Jx7vhDF72zfgFsnrB+SbqRIiPxsOF4xt410Ez/22nx/H
   w==;
X-CSE-ConnectionGUID: zI4is/unRm+7LpwiabunXQ==
X-CSE-MsgGUID: UNb4BBm3QdSzY6a0IOonDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6786292"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6786292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 07:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="16150147"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2024 07:15:25 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpU3o-00016m-2E;
	Wed, 27 Mar 2024 14:15:24 +0000
Date: Wed, 27 Mar 2024 22:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1131/2169] drivers/pwm/pwm-stm32.c:662:8: error:
 call to undeclared function 'devm_clk_rate_exclusive_get'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202403272205.UKAQzc7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26074e1be23143b2388cacb36166766c235feb7c
commit: 50d05a09e8474fa4768ffd39cce6af7f73cf003b [1131/2169] pwm: stm32: Fix for settings using period > UINT32_MAX
config: hexagon-randconfig-001-20240326 (https://download.01.org/0day-ci/archive/20240327/202403272205.UKAQzc7v-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403272205.UKAQzc7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403272205.UKAQzc7v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pwm/pwm-stm32.c:12:
   In file included from include/linux/mfd/stm32-timers.h:11:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/pwm/pwm-stm32.c:12:
   In file included from include/linux/mfd/stm32-timers.h:11:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pwm/pwm-stm32.c:12:
   In file included from include/linux/mfd/stm32-timers.h:11:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pwm/pwm-stm32.c:12:
   In file included from include/linux/mfd/stm32-timers.h:11:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/pwm/pwm-stm32.c:327:9: warning: variable 'prd' is uninitialized when used here [-Wuninitialized]
     327 |                 div = prd;
         |                       ^~~
   drivers/pwm/pwm-stm32.c:314:24: note: initialize the variable 'prd' to silence this warning
     314 |         unsigned long long prd, div, dty;
         |                               ^
         |                                = 0
>> drivers/pwm/pwm-stm32.c:662:8: error: call to undeclared function 'devm_clk_rate_exclusive_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     662 |         ret = devm_clk_rate_exclusive_get(dev, priv->clk);
         |               ^
   drivers/pwm/pwm-stm32.c:662:8: note: did you mean 'clk_rate_exclusive_get'?
   include/linux/clk.h:284:19: note: 'clk_rate_exclusive_get' declared here
     284 | static inline int clk_rate_exclusive_get(struct clk *clk)
         |                   ^
   8 warnings and 1 error generated.


vim +/devm_clk_rate_exclusive_get +662 drivers/pwm/pwm-stm32.c

   627	
   628	static int stm32_pwm_probe(struct platform_device *pdev)
   629	{
   630		struct device *dev = &pdev->dev;
   631		struct device_node *np = dev->of_node;
   632		struct stm32_timers *ddata = dev_get_drvdata(pdev->dev.parent);
   633		struct pwm_chip *chip;
   634		struct stm32_pwm *priv;
   635		unsigned int npwm, num_enabled;
   636		unsigned int i;
   637		int ret;
   638	
   639		npwm = stm32_pwm_detect_channels(ddata->regmap, &num_enabled);
   640	
   641		chip = devm_pwmchip_alloc(dev, npwm, sizeof(*priv));
   642		if (IS_ERR(chip))
   643			return PTR_ERR(chip);
   644		priv = to_stm32_pwm_dev(chip);
   645	
   646		mutex_init(&priv->lock);
   647		priv->regmap = ddata->regmap;
   648		priv->clk = ddata->clk;
   649		priv->max_arr = ddata->max_arr;
   650	
   651		if (!priv->regmap || !priv->clk)
   652			return dev_err_probe(dev, -EINVAL, "Failed to get %s\n",
   653					     priv->regmap ? "clk" : "regmap");
   654	
   655		ret = stm32_pwm_probe_breakinputs(priv, np);
   656		if (ret)
   657			return dev_err_probe(dev, ret,
   658					     "Failed to configure breakinputs\n");
   659	
   660		stm32_pwm_detect_complementary(priv);
   661	
 > 662		ret = devm_clk_rate_exclusive_get(dev, priv->clk);
   663		if (ret)
   664			return dev_err_probe(dev, ret, "Failed to lock clock\n");
   665	
   666		/*
   667		 * With the clk running with not more than 1 GHz the calculations in
   668		 * .apply() won't overflow.
   669		 */
   670		if (clk_get_rate(priv->clk) > 1000000000)
   671			return dev_err_probe(dev, -EINVAL, "Failed to lock clock\n");
   672	
   673		chip->ops = &stm32pwm_ops;
   674	
   675		/* Initialize clock refcount to number of enabled PWM channels. */
   676		for (i = 0; i < num_enabled; i++)
   677			clk_enable(priv->clk);
   678	
   679		ret = devm_pwmchip_add(dev, chip);
   680		if (ret < 0)
   681			return dev_err_probe(dev, ret,
   682					     "Failed to register pwmchip\n");
   683	
   684		platform_set_drvdata(pdev, chip);
   685	
   686		return 0;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
