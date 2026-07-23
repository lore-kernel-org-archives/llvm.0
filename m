Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06A83B19B0;
	Thu, 23 Jul 2026 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784785756; cv=none; b=arkB6r1Jka+KyFwU9w1eSz79tv6F+GLDbdca/dAf7U50Q4QSIUsR+zr9rjdG5S/RXHOlFVVSeLxQbZ+DgpTQZfSjvD0o5DIB6XQsbBOS+0kr6kxKFCNCuFPTDqojuNtF2F7Y9U4AzepxmWedKWxydG+csWAaU0Oc/bYoKoe4bYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784785756; c=relaxed/simple;
	bh=C801agZAtvTPgzZiaie6h3rTyymbhBEDIj3KZA++1Dc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bIqGaA/Btil+VbHKXb/kOxNe292WfutrpZ3uGMPJ2c/RzCxuBDUY6uFSeaSCap/zwHDrsh5qJ0Lk+M5qoW+hHiTUIFNFeZdfRfhbmO2oUyglZeDIRzVC8Zm4khelM2w9Gx8iFf8/CDE+7Iun3+DO+37S0JJcDSAv3lioYYkJ578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgcTOA06; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgcTOA06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784785753; x=1816321753;
  h=date:from:to:cc:subject:message-id;
  bh=C801agZAtvTPgzZiaie6h3rTyymbhBEDIj3KZA++1Dc=;
  b=jgcTOA06/GZlFXu7z/H6w37EQwfAoiWLF1jAl7J5ASOpU2XfYD7GHNUZ
   8BGPd5boWj1q3nA8ODx03z8CBbhFcstaTFwbZmEEJm1Q7FXRni6cmoMrT
   QIFYrMaL83o+9FISo2mWh1iLB1nfxwrhSQXicqRU3Uv6RLVdDyS+YAXPI
   6JII0UjZCqXe5t4pZH1y5KyhSkYj3OZ6h4xiZYCDyFJ4C90iFeRapFIkD
   hoH8/jYrMJsn99gT9OG6+X2SBmNgDQs/yRDgMhhu6PaSi+v4PDuVS/4vI
   CvKKEjZx1W4bqFjDUy3a0sj1+YTsDJBSroPXpS5Xqz5JLSaNmpo1veLw8
   w==;
X-CSE-ConnectionGUID: v1aRWL14Rleu3OibwPu3tA==
X-CSE-MsgGUID: IQ8GT9JOQxOU420Y9ouY1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85523021"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="85523021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 22:49:12 -0700
X-CSE-ConnectionGUID: /BF8UHM4QI+DqmpxrgVyiQ==
X-CSE-MsgGUID: 1Vy+aOMKSFy1nLSqsXmzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="262092560"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Jul 2026 22:49:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmmIu-00000000ZJH-0DzE;
	Thu, 23 Jul 2026 05:49:08 +0000
Date: Thu, 23 Jul 2026 13:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-22 300/300]
 sound/soc/meson/meson-card-utils.c:314:41: warning: variable 'card_driver' is
 uninitialized when used here
Message-ID: <202607231325.rLd419Ie-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-22
head:   992d9ac1367e6b746cfabe31cf72ef690769afc8
commit: 8384b5464d5fc3809a6548bda73e1690bc5dea3a [300/300] ASoC: meson: meson-card-utils: use snd_soc_card_register()
config: arm-randconfig-004-20260722 (https://download.01.org/0day-ci/archive/20260723/202607231325.rLd419Ie-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231325.rLd419Ie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231325.rLd419Ie-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/meson/meson-card-utils.c:314:41: warning: variable 'card_driver' is uninitialized when used here [-Wuninitialized]
     314 |         ret = devm_snd_soc_card_register(card, card_driver);
         |                                                ^~~~~~~~~~~
   sound/soc/meson/meson-card-utils.c:266:41: note: initialize the variable 'card_driver' to silence this warning
     266 |         struct snd_soc_card_driver *card_driver;
         |                                                ^
         |                                                 = NULL
   1 warning generated.


vim +/card_driver +314 sound/soc/meson/meson-card-utils.c

   260	
   261	int meson_card_probe(struct platform_device *pdev)
   262	{
   263		const struct meson_card_match_data *data;
   264		struct device *dev = &pdev->dev;
   265		struct snd_soc_card *card;
   266		struct snd_soc_card_driver *card_driver;
   267		struct meson_card *priv;
   268		int ret;
   269	
   270		data = of_device_get_match_data(dev);
   271		if (!data) {
   272			dev_err(dev, "failed to match device\n");
   273			return -ENODEV;
   274		}
   275	
   276		card = snd_soc_card_alloc(dev);
   277		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   278		if (!card || !priv)
   279			return -ENOMEM;
   280	
   281		snd_soc_card_set_priv(card, priv);
   282	
   283		priv->card_driver.owner = THIS_MODULE;
   284		priv->card_driver.driver_name = dev->driver->name;
   285		priv->match_data = data;
   286		priv->dev = dev;
   287	
   288		ret = snd_soc_of_parse_card_name(card, "model");
   289		if (ret < 0)
   290			return ret;
   291	
   292		ret = meson_card_parse_of_optional(priv, "audio-routing",
   293					snd_soc_card_driver_of_parse_audio_routing);
   294		if (ret) {
   295			dev_err(dev, "error while parsing routing\n");
   296			return ret;
   297		}
   298	
   299		ret = meson_card_parse_of_optional(priv, "audio-widgets",
   300					snd_soc_card_driver_of_parse_simple_widgets);
   301		if (ret) {
   302			dev_err(dev, "error while parsing widgets\n");
   303			return ret;
   304		}
   305	
   306		ret = meson_card_add_links(priv);
   307		if (ret)
   308			goto out_err;
   309	
   310		ret = snd_soc_card_driver_of_parse_aux_devs(dev, &priv->card_driver, "audio-aux-devs");
   311		if (ret)
   312			goto out_err;
   313	
 > 314		ret = devm_snd_soc_card_register(card, card_driver);
   315		if (ret)
   316			goto out_err;
   317	
   318		return 0;
   319	
   320	out_err:
   321		meson_card_clean_references(priv);
   322		return ret;
   323	}
   324	EXPORT_SYMBOL_GPL(meson_card_probe);
   325	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
