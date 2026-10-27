Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098805;
	b=K5GmO6US1rDlGIpMZw7nG4+zwhrvcjnMJTht0R6lZY7qBcfO0KytUxtXdmvTHCJsGylI
	 g8NMqVgaOcTvkcBNBoCaLCbtlUmnWKNKnzaYAi/u/Jk3PoOdJTJvpCfg0r4ovJ729POG/
	 K4dahgvWj54M2cpGRXMVUGWodXBgrgqR4EaZCRitXvEviIHeKNDf5NhmZtbr1xDNdycbu
	 hB5f927u5MEXdXQrHM9QU85BDucV13vZ67LhyX0lEUa4bZjcZ86IXnJujEi5jwBWR5mOh
	 2cCx/2iWP37D70781qDk7GjXMjH8p6td1jqSRLpgTjg9zLiQRiX4ATzj10LXcMKrJXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098805;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0jgTFCtQ70nfBNVj6KO+sAOQ4y/zK36kbIKAsf99nOQ=;
	b=GL5OryDlZ5GgOIwFz8L7MwkNxM81Ncn9GuMrCB8EljKsnv7p6GK3yui28niCs4WqTN+m
	 a4ECtvq25ibNflUBokV70D56J8qCpdTQCbl36UXumUU9p13zGUVvzeU8t56wI0LHDaA4H
	 pruhuSIx50Y/8qvXqPNf76p9MIL9/Jk/r7S2IsFZjEWoocDUoiQeTT3fyfVQPewAaT8My
	 oNEtWUHLLTF/o6kAV2WgSkTwtN6Ma4BM/BTPxr5Y+6fCOoK7weffg2NODv9LQZfYrLH30
	 zVlE0lHV73gsqeIJdfSheK+YqgOsJZgv5KgDKWBFd93++mt84jlFzxOXcdsKrOHz51A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YrRBjQta;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D74606A31A;
	Tue, 27 Oct 2026 11:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D74606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YrRBjQta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793098803; x=1824634803;
  h=date:from:to:cc:subject:message-id;
  bh=YdP7OTOXdC44bRSMGuo2fKQ9hwp/qzO9HKxv0xYOqJs=;
  b=YrRBjQta5CqF/ltOKH8SytcYa0VUXwEizP3SFkvQhEuA+1rW21q7n65Y
   QwYDg1VGR8h2jMU8pSKRdFMzDL5j/pTdeE2n8V5oiQCHQzAhZLfYwVXiH
   XSsr54yHeQxAYwUolx3geCw0bdQkQoHHO02dExsEtVwpPGCMw9N/g2FaP
   Jojsfcy+65ACPHAtjDIySXXm7VjNGbEdmz8RZ9dWUpKJSRVkEztjqSEo8
   WvSt9kE34QzG/cQT4QhTIsVkw130wL/wBEF55lPfdQSN6g1pDJC5/Wpkt
   TmviNlVK2EyqEJ+fglpBr14PCzUq8DJvR8YDYzw4Zllu7871QVEMp87VP
   A==;
X-CSE-ConnectionGUID: kAo154NIS+as0ZX51KO3+g==
X-CSE-MsgGUID: ez2h2ZXkRk2b0T0JycVc/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1803174"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1803174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:00:03 -0700
X-CSE-ConnectionGUID: 8bbS3cPFQhOosWo34AAjZQ==
X-CSE-MsgGUID: n8r0ioFLSJqLwtF/57bfbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5034044"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 04:00:01 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLeuM-000000004UH-3oDC;
	Tue, 27 Oct 2026 10:59:58 +0000
Date: Tue, 27 Oct 2026 11:59:14 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-27 189/366]
 sound/soc/mediatek/mt6797/mt6797-mt6351.c:217:35: error: incompatible pointer
 types passing 'struct device *' to parameter of type 'struct snd_soc_card *'
Message-ID: <202610271146.J2KYgi8H-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-27
head:   a6f5f374420e4556475bd5e208cf57c1028d5e59
commit: d9d0900ff9e45b0c27f682db6583bd0e786ed1e8 [189/366] ASoC: mediatek: mt6797-mt6351: use snd_soc_card_register()
config: arm64-randconfig-2000-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271146.J2KYgi8H-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271146.J2KYgi8H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271146.J2KYgi8H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt6797/mt6797-mt6351.c:217:35: error: incompatible pointer types passing 'struct device *' to parameter of type 'struct snd_soc_card *' [-Wincompatible-pointer-types]
     217 |         ret = devm_snd_soc_card_register(&pdev->dev, card_driver);
         |                                          ^~~~~~~~~~
   include/sound/soc-card.h:101:53: note: passing argument to parameter 'card' here
     101 | int devm_snd_soc_card_register(struct snd_soc_card *card, struct snd_soc_card_driver *driver);
         |                                                     ^
   1 error generated.


vim +217 sound/soc/mediatek/mt6797/mt6797-mt6351.c

   183	
   184	static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
   185	{
   186		struct snd_soc_card_driver *card_driver = &mt6797_mt6351_card_driver;
   187		struct device_node *platform_node, *codec_node;
   188		struct snd_soc_dai_link *dai_link;
   189		int ret, i;
   190	
   191		platform_node = of_parse_phandle(pdev->dev.of_node,
   192						 "mediatek,platform", 0);
   193		if (!platform_node) {
   194			dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
   195			return -EINVAL;
   196		}
   197		for_each_card_driver_prelinks(card_driver, i, dai_link) {
   198			if (dai_link->platforms->name)
   199				continue;
   200			dai_link->platforms->of_node = platform_node;
   201		}
   202	
   203		codec_node = of_parse_phandle(pdev->dev.of_node,
   204					      "mediatek,audio-codec", 0);
   205		if (!codec_node) {
   206			dev_err(&pdev->dev,
   207				"Property 'audio-codec' missing or invalid\n");
   208			ret = -EINVAL;
   209			goto put_platform_node;
   210		}
   211		for_each_card_driver_prelinks(card_driver, i, dai_link) {
   212			if (dai_link->codecs->name)
   213				continue;
   214			dai_link->codecs->of_node = codec_node;
   215		}
   216	
 > 217		ret = devm_snd_soc_card_register(&pdev->dev, card_driver);
   218	
   219		if (ret)
   220			dev_err(&pdev->dev, "%s snd_soc_card_register() fail %d\n",
   221				__func__, ret);
   222	
   223		of_node_put(codec_node);
   224	put_platform_node:
   225		of_node_put(platform_node);
   226		return ret;
   227	}
   228	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
