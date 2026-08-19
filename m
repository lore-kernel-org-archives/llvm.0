Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D93CEB8A;
	Wed, 19 Aug 2026 06:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787119816; cv=none; b=Fn3k7Fc2rao9QOasZ07sR2ifq4qZrqrbIByvkMoJJkrcIo5JMQABsUdzQFGAzzod2w13IwV+gQhLVBRpJ2dydYLncp3uiwKuzxC5Rl5nS8m5zzeM/+EAu/UJAwPvq/xoipCUpZ+7sxzde87+RKCbuu40gCpLv6R8RSUo9jXUVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787119816; c=relaxed/simple;
	bh=TmOHFK4T8w9GQlQdpithi5wUjMH32Z8usQrYLn2tblA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rlnXCZ9i6ndbL9md+3Sq8pHfyKXe8jNFDOLxt+4BMu9ntXUScG7iD/ghBAr5XskzSBLu0WIPFtmQ+HnLGQefQ2pA42qSk9XmYn3cwoN+00xoxh/alWmNS9EBKH8nhb4VoKktMSMmTGojEE6PZy8CmRr2Q+ofd2FNPmglEZhyxSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFlogX6k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFlogX6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787119815; x=1818655815;
  h=date:from:to:cc:subject:message-id;
  bh=TmOHFK4T8w9GQlQdpithi5wUjMH32Z8usQrYLn2tblA=;
  b=lFlogX6k7SKoqG1nEwST0+ICeQp0EgcFUk9l8gVmjx4unI4BXoyQJ62S
   RtaaEKZHNMvzUeQTs1OFN1sFf0DcrrK+ddAQn0cb6Utwjs0vcofNQDO5b
   X+HWTvUggbeGHIfH1ITtkZMuPTRo15i2L/jABd0SZLyhkKA4Gc3wApsL7
   pZNC+V6lWiB2T/KHFY+fCWqq1TCtmJET0hC7czInJCXYc35AVeG50i08C
   Ki2d3gww0tRXAyQMuStqqAdb1xn3jZxZEupffsbT/KHz4yaV7ncvC+Qwf
   BofqkMCK5B7NC5vk+dRx2H2l3sp1gMC7uD24gahQkDQWBxZoCZ0RtzjOB
   w==;
X-CSE-ConnectionGUID: GEOno6HSRNOlLkllxmA5mg==
X-CSE-MsgGUID: sYP4I+jNSt+c5Jxjvs9oLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87538590"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87538590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:09:38 -0700
X-CSE-ConnectionGUID: taugNEcVT4egK7ZZU+ScvQ==
X-CSE-MsgGUID: Wu+ZxQYCRIWFRdi0ILmXCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269719920"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Aug 2026 23:09:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZUS-00000000evo-2uxt;
	Wed, 19 Aug 2026 06:09:32 +0000
Date: Wed, 19 Aug 2026 14:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 137/200] drivers/mfd/max8925-i2c.c:175:28:
 warning: variable 'tsc_irq' is uninitialized when used here
Message-ID: <202608191428.rYgVrQ4k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: cdd7cbf79d6c020c83a34985cae63f91f8f8a4c9 [137/200] mfd: max8925: remove platform data probing
config: i386-randconfig-016-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191428.rYgVrQ4k-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191428.rYgVrQ4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191428.rYgVrQ4k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/max8925-i2c.c:175:28: warning: variable 'tsc_irq' is uninitialized when used here [-Wuninitialized]
     175 |         max8925_device_init(chip, tsc_irq);
         |                                   ^~~~~~~
   drivers/mfd/max8925-i2c.c:138:13: note: initialize the variable 'tsc_irq' to silence this warning
     138 |         int tsc_irq;
         |                    ^
         |                     = 0
   1 warning generated.


vim +/tsc_irq +175 drivers/mfd/max8925-i2c.c

   133	
   134	static int max8925_probe(struct i2c_client *client)
   135	{
   136		struct max8925_chip *chip;
   137		struct device_node *node = client->dev.of_node;
   138		int tsc_irq;
   139		int ret;
   140	
   141		chip = devm_kzalloc(&client->dev,
   142				    sizeof(struct max8925_chip), GFP_KERNEL);
   143		if (chip == NULL)
   144			return -ENOMEM;
   145	
   146		/* parse DT to get platform data */
   147		ret = of_property_read_u32(node, "maxim,tsc-irq", &chip->tsc_irq);
   148		if (ret) {
   149			dev_err(&client->dev, "Not found maxim,tsc-irq property\n");
   150			return -EINVAL;
   151		}
   152	
   153		chip->i2c = client;
   154		chip->dev = &client->dev;
   155		i2c_set_clientdata(client, chip);
   156		mutex_init(&chip->io_lock);
   157	
   158		chip->rtc = i2c_new_dummy_device(chip->i2c->adapter, RTC_I2C_ADDR);
   159		if (IS_ERR(chip->rtc)) {
   160			dev_err(chip->dev, "Failed to allocate I2C device for RTC\n");
   161			return PTR_ERR(chip->rtc);
   162		}
   163		i2c_set_clientdata(chip->rtc, chip);
   164	
   165		chip->adc = i2c_new_dummy_device(chip->i2c->adapter, ADC_I2C_ADDR);
   166		if (IS_ERR(chip->adc)) {
   167			dev_err(chip->dev, "Failed to allocate I2C device for ADC\n");
   168			i2c_unregister_device(chip->rtc);
   169			return PTR_ERR(chip->adc);
   170		}
   171		i2c_set_clientdata(chip->adc, chip);
   172	
   173		device_init_wakeup(&client->dev, 1);
   174	
 > 175		max8925_device_init(chip, tsc_irq);
   176	
   177		return 0;
   178	}
   179	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
