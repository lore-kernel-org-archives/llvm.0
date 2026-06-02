Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99789371043;
	Tue,  2 Jun 2026 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388789; cv=none; b=bojhQ6/qZFtn8dZEZNIFpazq+caxCwx9SVaTCNQcUic41ZKNy6Ih7skQigNZEyi/vi8f8hnpf5+/t+WHVkiqZUuzQPuXn8AvhpkS9KHZyWyQcM3Dvu5Dlnd7IW6weFtIsQ12RfzfpojGcYBQIkWDl/lYLTDZaPzOZUR9SXPhFY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388789; c=relaxed/simple;
	bh=KoJirJOySXdeAkdwPga5VwtZvFTR+sdoOFjPZigz9FU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YGBjLkiAPP9X3wuGfPXPeEHK4ZXFmJzzDRPRnmhAn17VClQNXYqvNPvl118CUbU4Wwp4e3Cf1kEySzHrXeZGSGQfAaPUMoDPesUqSuAJCvA+uLbbii2bYJWZ/T3lBU7CG4O553HIrlIWhFumzPcg+KoDgI1n9J65c2ZcoEHepew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdN5gnHR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdN5gnHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780388787; x=1811924787;
  h=date:from:to:cc:subject:message-id;
  bh=KoJirJOySXdeAkdwPga5VwtZvFTR+sdoOFjPZigz9FU=;
  b=PdN5gnHR/1amgNAiTwJKl6j7ILy/VHO6K6tzUwWZASOP7pRtu1hKeLLv
   pxTAl5OZ/YIA5L5SUgMJD2soK1vsiLGFQQzbQB/1dxcsObNswowE05+Ot
   oKsqJSR8V5IwKLlIcuwfabZu3+YJCIabpQ6McXvNONU5KArmwjsxbAV28
   g2fx9TuoHNb9VmxmdJ4FbIN+WIfG9DRAgRBvZWcMEdTnHm1QXjTIiex86
   DWXKxKlbU5HDaudlGGlLbdlHMAAeZ0kSyRoLD+qOuXCE3cYXFdUWAKQFB
   XioHKStSYQQJlmABXr2JD38zLvz3cM9BOKLAqWCCppM42OMOPvrAAuaO/
   w==;
X-CSE-ConnectionGUID: d542KYKpRXe2VyEC+g5HWQ==
X-CSE-MsgGUID: tp/053bhTUKwUhDBo7GjLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="84791197"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="84791197"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:26:27 -0700
X-CSE-ConnectionGUID: lfRyu5MMT06JdhhB3yS3nw==
X-CSE-MsgGUID: q/mK1pgMSIWDlA7/b6N0dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="274106307"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jun 2026 01:26:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUKS6-00000000BiY-2tfo;
	Tue, 02 Jun 2026 08:26:22 +0000
Date: Tue, 02 Jun 2026 16:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/meson/meson-card-utils.c:302:9: error: incompatible function
 pointer types passing 'int (struct device *, struct snd_soc_card_driver *,
 const char *)' to parameter of type 'int (*)(struct snd_soc_card *, const
 char *)'
Message-ID: <202606021536.MmpL1VNX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 9b07c6aa4c11e450c2f7f409b4a47925b85697c0 [290/290] ASoC: soc.h: remove compatible definition
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606021536.MmpL1VNX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021536.MmpL1VNX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021536.MmpL1VNX-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/meson/meson-card-utils.c:253:3: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     253 |                 for_each_card_prelinks(card, i, link) {
         |                 ^
   sound/soc/meson/meson-card-utils.c:253:40: error: expected ';' after expression
     253 |                 for_each_card_prelinks(card, i, link) {
         |                                                      ^
         |                                                      ;
   sound/soc/meson/meson-card-utils.c:262:3: error: call to undeclared function 'for_each_card_pre_auxs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |                 for_each_card_pre_auxs(card, i, aux)
         |                 ^
   sound/soc/meson/meson-card-utils.c:262:39: error: expected ';' after expression
     262 |                 for_each_card_pre_auxs(card, i, aux)
         |                                                     ^
         |                                                     ;
   sound/soc/meson/meson-card-utils.c:287:57: error: too many arguments to function call, expected 2, have 6
     287 |         priv->card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &priv->card_driver,
         |                      ~~~~~~~~~~~~~~~~~~~~~~~                   ^~~~~~~~~~~~~~~~~~~
     288 |                                              NULL, NULL, NULL);
         |                                              ~~~~~~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: 'devm_snd_soc_card_alloc' declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^                       ~~~~~~~~~~~~~~~~~~~
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/meson/meson-card-utils.c:297:8: error: call to undeclared function 'snd_soc_card_of_parse_name'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     297 |         ret = snd_soc_card_of_parse_name(priv->card, "model");
         |               ^
   sound/soc/meson/meson-card-utils.c:297:8: note: did you mean 'snd_soc_card_driver_of_parse_name'?
   include/sound/soc-card.h:135:5: note: 'snd_soc_card_driver_of_parse_name' declared here
     135 | int snd_soc_card_driver_of_parse_name(struct device *dev,
         |     ^
   sound/soc/meson/meson-card-utils.c:302:9: error: use of undeclared identifier 'snd_soc_card_of_parse_audio_routing'; did you mean 'snd_soc_card_driver_of_parse_audio_routing'?
     302 |                                            snd_soc_card_of_parse_audio_routing);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            snd_soc_card_driver_of_parse_audio_routing
   include/sound/soc-card.h:141:5: note: 'snd_soc_card_driver_of_parse_audio_routing' declared here
     141 | int snd_soc_card_driver_of_parse_audio_routing(struct device *dev,
         |     ^
>> sound/soc/meson/meson-card-utils.c:302:9: error: incompatible function pointer types passing 'int (struct device *, struct snd_soc_card_driver *, const char *)' to parameter of type 'int (*)(struct snd_soc_card *, const char *)' [-Wincompatible-function-pointer-types]
     302 |                                            snd_soc_card_of_parse_audio_routing);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/meson/meson-card-utils.c:230:12: note: passing argument to parameter 'func' here
     230 |                                         int (*func)(struct snd_soc_card *c,
         |                                               ^
   sound/soc/meson/meson-card-utils.c:309:9: error: use of undeclared identifier 'snd_soc_card_of_parse_simple_widgets'; did you mean 'snd_soc_card_driver_of_parse_simple_widgets'?
     309 |                                            snd_soc_card_of_parse_simple_widgets);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            snd_soc_card_driver_of_parse_simple_widgets
   include/sound/soc-card.h:132:5: note: 'snd_soc_card_driver_of_parse_simple_widgets' declared here
     132 | int snd_soc_card_driver_of_parse_simple_widgets(struct device *dev,
         |     ^
   sound/soc/meson/meson-card-utils.c:309:9: error: incompatible function pointer types passing 'int (struct device *, struct snd_soc_card_driver *, const char *)' to parameter of type 'int (*)(struct snd_soc_card *, const char *)' [-Wincompatible-function-pointer-types]
     309 |                                            snd_soc_card_of_parse_simple_widgets);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/meson/meson-card-utils.c:230:12: note: passing argument to parameter 'func' here
     230 |                                         int (*func)(struct snd_soc_card *c,
         |                                               ^
   sound/soc/meson/meson-card-utils.c:319:8: error: call to undeclared function 'snd_soc_card_of_parse_aux_devs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     319 |         ret = snd_soc_card_of_parse_aux_devs(priv->card, "audio-aux-devs");
         |               ^
   11 errors generated.


vim +302 sound/soc/meson/meson-card-utils.c

aa9c3b7273a58b Jerome Brunet     2020-02-13  269  
aa9c3b7273a58b Jerome Brunet     2020-02-13  270  int meson_card_probe(struct platform_device *pdev)
aa9c3b7273a58b Jerome Brunet     2020-02-13  271  {
aa9c3b7273a58b Jerome Brunet     2020-02-13  272  	const struct meson_card_match_data *data;
aa9c3b7273a58b Jerome Brunet     2020-02-13  273  	struct device *dev = &pdev->dev;
aa9c3b7273a58b Jerome Brunet     2020-02-13  274  	struct meson_card *priv;
aa9c3b7273a58b Jerome Brunet     2020-02-13  275  	int ret;
aa9c3b7273a58b Jerome Brunet     2020-02-13  276  
aa9c3b7273a58b Jerome Brunet     2020-02-13  277  	data = of_device_get_match_data(dev);
aa9c3b7273a58b Jerome Brunet     2020-02-13  278  	if (!data) {
aa9c3b7273a58b Jerome Brunet     2020-02-13  279  		dev_err(dev, "failed to match device\n");
aa9c3b7273a58b Jerome Brunet     2020-02-13  280  		return -ENODEV;
aa9c3b7273a58b Jerome Brunet     2020-02-13  281  	}
aa9c3b7273a58b Jerome Brunet     2020-02-13  282  
aa9c3b7273a58b Jerome Brunet     2020-02-13  283  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
aa9c3b7273a58b Jerome Brunet     2020-02-13  284  	if (!priv)
aa9c3b7273a58b Jerome Brunet     2020-02-13  285  		return -ENOMEM;
aa9c3b7273a58b Jerome Brunet     2020-02-13  286  
ba5577652c6a70 Kuninori Morimoto 2026-05-20  287  	priv->card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &priv->card_driver,
ba5577652c6a70 Kuninori Morimoto 2026-05-20  288  					     NULL, NULL, NULL);
ba5577652c6a70 Kuninori Morimoto 2026-05-20  289  	if (!priv->card)
ba5577652c6a70 Kuninori Morimoto 2026-05-20  290  		return -ENOMEM;
ba5577652c6a70 Kuninori Morimoto 2026-05-20  291  
f66a1b718fbcb7 Kuninori Morimoto 2026-06-01  292  	snd_soc_card_attach_priv(priv->card, priv);
aa9c3b7273a58b Jerome Brunet     2020-02-13  293  
ba5577652c6a70 Kuninori Morimoto 2026-05-20  294  	priv->card_driver.name = dev->driver->name;
aa9c3b7273a58b Jerome Brunet     2020-02-13  295  	priv->match_data = data;
aa9c3b7273a58b Jerome Brunet     2020-02-13  296  
f66a1b718fbcb7 Kuninori Morimoto 2026-06-01  297  	ret = snd_soc_card_of_parse_name(priv->card, "model");
aa9c3b7273a58b Jerome Brunet     2020-02-13  298  	if (ret < 0)
aa9c3b7273a58b Jerome Brunet     2020-02-13  299  		return ret;
aa9c3b7273a58b Jerome Brunet     2020-02-13  300  
ba5577652c6a70 Kuninori Morimoto 2026-05-20  301  	ret = meson_card_parse_of_optional(priv->card, "audio-routing",
f66a1b718fbcb7 Kuninori Morimoto 2026-06-01 @302  					   snd_soc_card_of_parse_audio_routing);
aa9c3b7273a58b Jerome Brunet     2020-02-13  303  	if (ret) {
aa9c3b7273a58b Jerome Brunet     2020-02-13  304  		dev_err(dev, "error while parsing routing\n");
aa9c3b7273a58b Jerome Brunet     2020-02-13  305  		return ret;
aa9c3b7273a58b Jerome Brunet     2020-02-13  306  	}
aa9c3b7273a58b Jerome Brunet     2020-02-13  307  
ba5577652c6a70 Kuninori Morimoto 2026-05-20  308  	ret = meson_card_parse_of_optional(priv->card, "audio-widgets",
f66a1b718fbcb7 Kuninori Morimoto 2026-06-01  309  					   snd_soc_card_of_parse_simple_widgets);
aa9c3b7273a58b Jerome Brunet     2020-02-13  310  	if (ret) {
aa9c3b7273a58b Jerome Brunet     2020-02-13  311  		dev_err(dev, "error while parsing widgets\n");
aa9c3b7273a58b Jerome Brunet     2020-02-13  312  		return ret;
aa9c3b7273a58b Jerome Brunet     2020-02-13  313  	}
aa9c3b7273a58b Jerome Brunet     2020-02-13  314  
ba5577652c6a70 Kuninori Morimoto 2026-05-20  315  	ret = meson_card_add_links(priv->card);
aa9c3b7273a58b Jerome Brunet     2020-02-13  316  	if (ret)
aa9c3b7273a58b Jerome Brunet     2020-02-13  317  		goto out_err;
aa9c3b7273a58b Jerome Brunet     2020-02-13  318  
f66a1b718fbcb7 Kuninori Morimoto 2026-06-01  319  	ret = snd_soc_card_of_parse_aux_devs(priv->card, "audio-aux-devs");
aa9c3b7273a58b Jerome Brunet     2020-02-13  320  	if (ret)
aa9c3b7273a58b Jerome Brunet     2020-02-13  321  		goto out_err;
aa9c3b7273a58b Jerome Brunet     2020-02-13  322  
ba5577652c6a70 Kuninori Morimoto 2026-05-20  323  	ret = devm_snd_soc_card_register(priv->card);
aa9c3b7273a58b Jerome Brunet     2020-02-13  324  	if (ret)
aa9c3b7273a58b Jerome Brunet     2020-02-13  325  		goto out_err;
aa9c3b7273a58b Jerome Brunet     2020-02-13  326  
aa9c3b7273a58b Jerome Brunet     2020-02-13  327  	return 0;
aa9c3b7273a58b Jerome Brunet     2020-02-13  328  
aa9c3b7273a58b Jerome Brunet     2020-02-13  329  out_err:
aa9c3b7273a58b Jerome Brunet     2020-02-13  330  	meson_card_clean_references(priv);
aa9c3b7273a58b Jerome Brunet     2020-02-13  331  	return ret;
aa9c3b7273a58b Jerome Brunet     2020-02-13  332  }
aa9c3b7273a58b Jerome Brunet     2020-02-13  333  EXPORT_SYMBOL_GPL(meson_card_probe);
aa9c3b7273a58b Jerome Brunet     2020-02-13  334  

:::::: The code at line 302 was first introduced by commit
:::::: f66a1b718fbcb7553fef8ad2e807c9e84ca546e5 dai

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
