Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3B2E7362;
	Wed, 17 Jun 2026 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705317; cv=none; b=QU5ebRI4yQiJa8n2Tjm8K2TGgRG03x5U/vWyuPozSS6kD0ZWLquKTAQ/nAm9lrtNZBbD97IzGbKSAczIOKqldp2daHh463AcqDlyPEBBCXE1/vwNqvKEtwzuAN23UHeLCnhw/ZUPskperaTqrZ/2N6OUct1T8wS94UObgiICPRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705317; c=relaxed/simple;
	bh=RSGpDPRGyhhlMcfzsNNsgzjiT9e8oWRC04ez9EVSQWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IbILa1HxSFk0IicHdwoZ7Eiuro+/dadcOaGZAPHVdsDXZQexuAJPX2Gt8uSp3Rad576SoaHqbiaSLQSbw+K1eWr0nAcTvSS28Pe7c0ZHaRMDPGQsITeuIz/jA9gJ8QhLzubUBzOMgSr8+S+tJQJHj9G54toFkTQIQXiKjJkr6UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6IWeNbe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6IWeNbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781705316; x=1813241316;
  h=date:from:to:cc:subject:message-id;
  bh=RSGpDPRGyhhlMcfzsNNsgzjiT9e8oWRC04ez9EVSQWU=;
  b=m6IWeNbeI0Fl9JzFc/7RZA9VTM1s5jAojuGh0wWF7nldsPVTi0CJ8SpX
   ov9kimgwL6FocdM02SBuH6MWRlzkMyK3q6llVMn+y3b86NnaWAXcWocaP
   zxzVm36pQT35bu10AIwdbNt3wyGTbJN/xusTLbR8azr7Zs3U4UlVQDYCd
   nzR0cA5sC6bA+V+lkxNWkyguwucj4PYtQAP7ilNF5iwaUKketANsmsxkN
   qZyKplrTbMrpq9shnBJ/cJPNxgf5nv//g2DItyymMQ1QRtvYDV93sFRej
   M67O71l1iHtz/4rHKVx1mVsb8hbR8hn0sUXbCB/pQSEMqgGp5g09lTD8n
   w==;
X-CSE-ConnectionGUID: EGoDOhEyQfaDdv4xZEPg+A==
X-CSE-MsgGUID: i7wWSsGlQ9mx2JL+3UXKLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82507787"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82507787"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 07:08:32 -0700
X-CSE-ConnectionGUID: oSu+aDlfSM6bEmP/7TLTsA==
X-CSE-MsgGUID: l/rDKWvxRtG5sGeNwqHSZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="252381194"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2026 07:08:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZqwN-00000000UXE-1inY;
	Wed, 17 Jun 2026 14:08:27 +0000
Date: Wed, 17 Jun 2026 22:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/codecs/cs35l56-test.c:558:21: error: incompatible integer to
 pointer conversion assigning to 'struct snd_soc_component *' from 'int'
Message-ID: <202606172147.CPu1r61e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 4bbdf4f7c937878b634b01d362515e2a79053b52 [326/326] dai
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260617/202606172147.CPu1r61e-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606172147.CPu1r61e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606172147.CPu1r61e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/cs35l56-test.c:558:23: error: call to undeclared function 'snd_soc_component_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                              ^
   sound/soc/codecs/cs35l56-test.c:558:23: note: did you mean 'snd_soc_component_close'?
   include/sound/soc-component.h:410:5: note: 'snd_soc_component_close' declared here
     410 | int snd_soc_component_close(struct snd_soc_component *component,
         |     ^
>> sound/soc/codecs/cs35l56-test.c:558:21: error: incompatible integer to pointer conversion assigning to 'struct snd_soc_component *' from 'int' [-Wint-conversion]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     559 |                                                      NULL, NULL, NULL, NULL);
         |                                                      ~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> sound/soc/codecs/wm8750.c:638:4: error: call to undeclared function 'snd_soc_component_regmap_regcache_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     638 |                         snd_soc_component_regmap_regcache_sync(component);
         |                         ^
   sound/soc/codecs/wm8750.c:638:4: note: did you mean 'snd_soc_component_regcache_sync'?
   include/sound/soc-component.h:497:19: note: 'snd_soc_component_regcache_sync' declared here
     497 | static inline int snd_soc_component_regcache_sync(struct snd_soc_component *component)
         |                   ^
   1 error generated.
--
>> sound/soc/codecs/wm8971.c:581:4: error: call to undeclared function 'snd_soc_component_regmap_regcache_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     581 |                         snd_soc_component_regmap_regcache_sync(component);
         |                         ^
   sound/soc/codecs/wm8971.c:581:4: note: did you mean 'snd_soc_component_regcache_sync'?
   include/sound/soc-component.h:497:19: note: 'snd_soc_component_regcache_sync' declared here
     497 | static inline int snd_soc_component_regcache_sync(struct snd_soc_component *component)
         |                   ^
   1 error generated.
--
>> sound/soc/codecs/wm9712.c:628:3: error: call to undeclared function 'snd_soc_component_regmap_regcache_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     628 |                 snd_soc_component_regmap_regcache_sync(component);
         |                 ^
   sound/soc/codecs/wm9712.c:628:3: note: did you mean 'snd_soc_component_regcache_sync'?
   include/sound/soc-component.h:497:19: note: 'snd_soc_component_regcache_sync' declared here
     497 | static inline int snd_soc_component_regcache_sync(struct snd_soc_component *component)
         |                   ^
   1 error generated.
--
>> sound/soc/codecs/wm9713.c:1212:3: error: call to undeclared function 'snd_soc_component_regmap_regcache_mark_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1212 |                 snd_soc_component_regmap_regcache_mark_dirty(component);
         |                 ^
   sound/soc/codecs/wm9713.c:1212:3: note: did you mean 'snd_soc_component_regcache_mark_dirty'?
   include/sound/soc-component.h:527:20: note: 'snd_soc_component_regcache_mark_dirty' declared here
     527 | static inline void snd_soc_component_regcache_mark_dirty(struct snd_soc_component *component)
         |                    ^
>> sound/soc/codecs/wm9713.c:1213:3: error: call to undeclared function 'snd_soc_component_regmap_regcache_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1213 |                 snd_soc_component_regmap_regcache_sync(component);
         |                 ^
   sound/soc/codecs/wm9713.c:1213:3: note: did you mean 'snd_soc_component_regcache_sync'?
   include/sound/soc-component.h:497:19: note: 'snd_soc_component_regcache_sync' declared here
     497 | static inline int snd_soc_component_regcache_sync(struct snd_soc_component *component)
         |                   ^
   2 errors generated.
--
>> sound/soc/codecs/wm_adsp_fw_find_test.c:287:24: error: call to undeclared function 'snd_soc_component_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     287 |         priv->dsp.component = snd_soc_component_alloc(test_dev, &component_driver,
         |                               ^
   sound/soc/codecs/wm_adsp_fw_find_test.c:287:24: note: did you mean 'snd_soc_component_close'?
   include/sound/soc-component.h:410:5: note: 'snd_soc_component_close' declared here
     410 | int snd_soc_component_close(struct snd_soc_component *component,
         |     ^
>> sound/soc/codecs/wm_adsp_fw_find_test.c:287:22: error: incompatible integer to pointer conversion assigning to 'struct snd_soc_component *' from 'int' [-Wint-conversion]
     287 |         priv->dsp.component = snd_soc_component_alloc(test_dev, &component_driver,
         |                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     288 |                                                       NULL, NULL, NULL, NULL);
         |                                                       ~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +558 sound/soc/codecs/cs35l56-test.c

   528	
   529	static int cs35l56_test_case_init_common(struct kunit *test)
   530	{
   531		struct cs35l56_test_priv *priv;
   532		const struct cs35l56_test_param *param = test->param_value;
   533		struct cs35l56_private *cs35l56;
   534		struct snd_soc_card *card;
   535	
   536		KUNIT_ASSERT_NOT_NULL(test, cs_amp_test_hooks);
   537	
   538		priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
   539		if (!priv)
   540			return -ENOMEM;
   541	
   542		test->priv = priv;
   543	
   544		/* Create dummy amp driver dev */
   545		priv->amp_dev = faux_device_create("cs35l56_test_drv", NULL, NULL);
   546		KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
   547		KUNIT_ASSERT_EQ(test, 0,
   548				kunit_add_action_or_reset(test,
   549							  faux_device_destroy_wrapper,
   550							  priv->amp_dev));
   551	
   552		/* Construct minimal set of driver structs */
   553		priv->cs35l56_priv = kunit_kzalloc(test, sizeof(*priv->cs35l56_priv), GFP_KERNEL);
   554		KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_priv);
   555		cs35l56 = priv->cs35l56_priv;
   556		cs35l56->base.dev = &priv->amp_dev->dev;
   557	
 > 558		cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
   559							     NULL, NULL, NULL, NULL);
   560		dev_set_drvdata(cs35l56->base.dev, cs35l56);
   561	
   562		cs35l56->card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
   563		KUNIT_ASSERT_NOT_NULL(test, cs35l56->card);
   564	
   565		if (param) {
   566			cs35l56->base.type = param->type;
   567			cs35l56->base.rev = param->rev;
   568		}
   569	
   570		return 0;
   571	}
   572	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
