Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47E285072;
	Fri, 17 Jul 2026 22:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784328234; cv=none; b=Tv4gNhFDH2KfKg3xt8H4ZO0y25Lzh9yxQO69d9R5Thojxrc6G+rMfX7gzLYhg0qxlJ0+YXdZwIwHM8AM17eVqNLEuV70Xo/MrxrUTUnmvp9N1WvCfziPj45nSQ2p4x4eWmAwzPlI7p6mwGxmaJzlMwSlR+9owYy6gIVNju70BCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784328234; c=relaxed/simple;
	bh=ZCXdXPylefleozLrcqh3nkCSphGN9WmGzHvV1XbJud4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NbAWFc9UCf6T4nXak3MXrCej+OCqBv3iMqGwwkJv19YMThoGnZu9OTk7vA73skB1+wltlMbc4cXzpYAJ6owYF3Ly4D3rBuPrWLg4V06dqky8MDL1+jmfDGkd4DHOvwmZPS+0390SCiktYiVY6b1LKGXr1jpAQMGBkKQrj2hOax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPYRpued; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPYRpued"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784328231; x=1815864231;
  h=date:from:to:cc:subject:message-id;
  bh=ZCXdXPylefleozLrcqh3nkCSphGN9WmGzHvV1XbJud4=;
  b=PPYRpuediO6uxry1BGuBjGRS9fiBRbsOfdPiD2ouk1yX4bEX5sxRBCxC
   b3n63mXyCHEvT5y+VST/7b/atPP+t1n24U4knNNz6ELkEChMYypDtxr6F
   NpK4yfYkWvdS5IRzcpyKkQEgHCPfeokTO3sSXQiJbKXU60aruhKLwElHC
   4Z3KMncY7WQbuHoARkow4R0r/i8351bKR3StZy0q6Ogr9Q3aeVdOGfNyA
   N3kryKjAuvHeRcJ9C/xlIABSaKfiSED79Epio1K4Ze8h005e1hyem46NT
   NXtcum6KOLwcVAzsF7xy8NX6nS2YOBbty5PKSPw2GKorQaVSiR3w6GoFl
   A==;
X-CSE-ConnectionGUID: 9SwKAxdyQO+7lz7xTA5cvw==
X-CSE-MsgGUID: Cxy747INR5m1itok8I626A==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85205075"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85205075"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 15:43:50 -0700
X-CSE-ConnectionGUID: 4QY8ystBS7yIcvGJbKsxSg==
X-CSE-MsgGUID: UTS+0lOlS9edZSa2DtIOtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="253489636"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jul 2026 15:43:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkrHH-00000000TDC-1sr4;
	Fri, 17 Jul 2026 22:43:45 +0000
Date: Sat, 18 Jul 2026 06:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 sound/soc/soc-component.c:1585:26: error: incomplete definition of type
 'struct snd_soc_card'
Message-ID: <202607180636.1Baj9kmm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e51d2e02d8d4c974132f00eec9d2215a476084f0 [311/311] ASoC: move struct snd_soc_card/snd_soc_card_driver to soc-card.[hc]
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260718/202607180636.1Baj9kmm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180636.1Baj9kmm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180636.1Baj9kmm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-component.c:1585:26: error: incomplete definition of type 'struct snd_soc_card'
    1585 |                                 component->name, card->name, component->card->name);
         |                                                  ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/soc-component.c:1585:49: error: incomplete definition of type 'struct snd_soc_card'
    1585 |                                 component->name, card->name, component->card->name);
         |                                                              ~~~~~~~~~~~~~~~^
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/soc-component.c:1940:2: error: call to undeclared function 'snd_soc_unregister_component_by_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1940 |         snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
         |         ^
   3 errors generated.
--
>> sound/soc/loongson/loongson_card.c:182:37: error: incomplete definition of type 'struct snd_soc_card'
     182 |         struct fwnode_handle *fwnode = card->dev->fwnode;
         |                                        ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/loongson/loongson_card.c:189:15: error: incomplete definition of type 'struct snd_soc_card'
     189 |                 dev_err(card->dev, "No matching phy in ACPI table\n");
         |                         ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/loongson/loongson_card.c:219:40: error: incomplete definition of type 'struct snd_soc_card'
     219 |         ret = device_property_read_string(card->dev, "codec-dai-name", &codec_dai_name);
         |                                           ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/loongson/loongson_card.c:235:36: error: call to undeclared function 'snd_soc_card_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     235 |         struct loongson_card_data *data = snd_soc_card_get_drvdata(card);
         |                                           ^
   sound/soc/loongson/loongson_card.c:235:29: error: incompatible integer to pointer conversion initializing 'struct loongson_card_data *' with an expression of type 'int' [-Wint-conversion]
     235 |         struct loongson_card_data *data = snd_soc_card_get_drvdata(card);
         |                                    ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/loongson/loongson_card.c:237:27: error: incomplete definition of type 'struct snd_soc_card'
     237 |         struct device *dev = card->dev;
         |                              ~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/loongson/loongson_card.c:327:2: error: call to undeclared function 'snd_soc_card_set_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     327 |         snd_soc_card_set_drvdata(card, ls_priv);
         |         ^
   7 errors generated.


vim +1585 sound/soc/soc-component.c

20848cdc6d191fe Kuninori Morimoto 2026-06-03  1569  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1570  int soc_component_probe(struct snd_soc_card *card, struct snd_soc_component *component)
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1571  {
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1572  	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1573  	struct snd_soc_dai *dai;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1574  	int probed = 0;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1575  	int ret;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1576  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1577  	if (snd_soc_component_is_dummy(component))
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1578  		return 0;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1579  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1580  	if (component->card) {
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1581  		if (component->card != card) {
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1582  			dev_err(component->dev,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1583  				"Trying to bind component \"%s\" to card \"%s\" "
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1584  				"but is already bound to card \"%s\"\n",
20848cdc6d191fe Kuninori Morimoto 2026-06-03 @1585  				component->name, card->name, component->card->name);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1586  			return -ENODEV;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1587  		}
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1588  		return 0;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1589  	}
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1590  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1591  	ret = snd_soc_component_module_get_when_probe(component);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1592  	if (ret < 0)
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1593  		return ret;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1594  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1595  	component->card = card;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1596  	soc_component_set_name_prefix(card, component);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1597  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1598  	soc_component_debugfs_init(component);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1599  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1600  	snd_soc_dapm_init(dapm, card, component);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1601  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1602  	ret = snd_soc_dapm_new_controls(dapm,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1603  					component->driver->dapm_widgets,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1604  					component->driver->num_dapm_widgets);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1605  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1606  	if (ret != 0) {
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1607  		dev_err(component->dev,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1608  			"Failed to create new controls %d\n", ret);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1609  		goto err_probe;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1610  	}
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1611  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1612  	for_each_component_dais(component, dai) {
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1613  		ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1614  		if (ret != 0) {
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1615  			dev_err(component->dev,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1616  				"Failed to create DAI widgets %d\n", ret);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1617  			goto err_probe;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1618  		}
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1619  	}
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1620  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1621  	ret = _soc_component_probe(component);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1622  	if (ret < 0)
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1623  		goto err_probe;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1624  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1625  	WARN(!snd_soc_dapm_get_idle_bias(dapm) &&
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1626  	     snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_OFF,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1627  	     "codec %s can not start from non-off bias with idle_bias_off==1\n",
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1628  	     component->name);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1629  	probed = 1;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1630  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1631  	/*
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1632  	 * machine specific init
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1633  	 * see
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1634  	 *	snd_soc_component_set_aux()
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1635  	 */
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1636  	ret = snd_soc_component_init(component);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1637  	if (ret < 0)
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1638  		goto err_probe;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1639  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1640  	ret = snd_soc_component_add_controls(component,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1641  					     component->driver->controls,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1642  					     component->driver->num_controls);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1643  	if (ret < 0)
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1644  		goto err_probe;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1645  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1646  	ret = snd_soc_dapm_add_routes(dapm,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1647  				      component->driver->dapm_routes,
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1648  				      component->driver->num_dapm_routes);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1649  	if (ret < 0)
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1650  		goto err_probe;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1651  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1652  	/* see for_each_card_components */
35c6980018dd42a Kuninori Morimoto 2026-07-15  1653  	list_add(&component->component_list, snd_soc_card_to_component_list_head(card));
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1654  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1655  err_probe:
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1656  	if (ret < 0)
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1657  		soc_component_remove(component, probed);
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1658  
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1659  	return ret;
20848cdc6d191fe Kuninori Morimoto 2026-06-03  1660  }
ac802be4dce003d Kuninori Morimoto 2026-07-07  1661  

:::::: The code at line 1585 was first introduced by commit
:::::: 20848cdc6d191fef400fa0eb2df112a7018462db ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
