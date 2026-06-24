Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFBE3B388E;
	Wed, 24 Jun 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311143; cv=none; b=j6XjI92BLP1SP/LeVlOESSRzRdYh1ueUdl9kTspD3Jdr/Uu0THcSxAz3vC2Sx9RVEyxZDWhODI0MmXg0bQwzcVLw39J2a0ZqiMyMMT4sg68fZV0LhyrpHZHPs1uYyEAR2QKwRZeOmIS3q8a8pPl+pZ+XOvHnUpxSSF9Puk4bPGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311143; c=relaxed/simple;
	bh=Fq+mm9iluQG3S6HFbziaUdfngU2xQGn3UBVIEkk97wk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P7W7b6fMKugYDIvLw7mXH+65SM/18fA8Dcg8Yi9xkCVoHQbifTcjOzNLWNlVoaEDb012H28rmW0g6khUgfvOGNAV72Xri2f0olinEoJZeISh/P+wo02nPAuPFIuPXGDcUUdJu7tgd0lPBSo7dDcXEQrcSrHhmbmdW8faZfA/RIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dV9+u9Xv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dV9+u9Xv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782311141; x=1813847141;
  h=date:from:to:cc:subject:message-id;
  bh=Fq+mm9iluQG3S6HFbziaUdfngU2xQGn3UBVIEkk97wk=;
  b=dV9+u9Xva2opr3I4yEwOh76wbflDGZjqnFWdT+C0fzbGRfUL5PZl/Ayo
   LGG5pBz2Zqn4OWmmyG7aHpNK0HOJThaiUNc4gXKFfQsQeG5qOegFI7GUd
   GOeyZDe+fSkvgEcYhXTjVc+WQMgyjEgBcE5bzcJscYQ1XAjsr9+gnyTSU
   seoXMJs+CYxCjBCkMOEb/fhHAYCbvrJFJ4sOkhMQG9rXWw54UKe8p8oEq
   SPlwO5US1+o5jOvBgvh0iQhBQwLsdoxpjIFnGYsYtR9Ek2mWSnxfOEece
   1juT7JJvJ44NY9FIwGZCl3KxnOyyAK1USYenQ6yI9LT0uz2r9BWz3sr3+
   Q==;
X-CSE-ConnectionGUID: PufNVxOxQPCWHfLytTd+vg==
X-CSE-MsgGUID: Neq7ZAzcQWGP2cUTUC6ihg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83074973"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="83074973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:25:40 -0700
X-CSE-ConnectionGUID: 09W6dxfZQviyXknIUk0Z7w==
X-CSE-MsgGUID: U6kNOhi1S5SLPMbiLHhJGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="245789779"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2026 07:25:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcOXh-000000003Pl-1wxy;
	Wed, 24 Jun 2026 14:25:31 +0000
Date: Wed, 24 Jun 2026 22:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-19 259/326]
 sound/soc/mediatek/mt2701/mt2701-hdmi.c:88:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202606242257.fqQb06ux-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-19
head:   885feafb1fe92b67450ae8ac4996368e3a6dd242
commit: 406e3cf2881a82be44aa8ddb60795faf672bd453 [259/326] ASoC: mediatek: mt2701-hdmi: use snd_soc_card_register()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260624/202606242257.fqQb06ux-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606242257.fqQb06ux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606242257.fqQb06ux-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/mt2701/mt2701-hdmi.c:88:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      88 |         if (!card)
         |             ^~~~~
   sound/soc/mediatek/mt2701/mt2701-hdmi.c:93:9: note: uninitialized use occurs here
      93 |         return ret;
         |                ^~~
   sound/soc/mediatek/mt2701/mt2701-hdmi.c:88:2: note: remove the 'if' if its condition is always true
      88 |         if (!card)
         |         ^~~~~~~~~~
      89 |                 ret = -ENOMEM;
   sound/soc/mediatek/mt2701/mt2701-hdmi.c:65:9: note: initialize the variable 'ret' to silence this warning
      65 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +88 sound/soc/mediatek/mt2701/mt2701-hdmi.c

    56	
    57	static int mt2701_hdmi_machine_probe(struct platform_device *pdev)
    58	{
    59		struct snd_soc_card *card;
    60		struct snd_soc_card_driver *card_driver = &mt2701_hdmi_card_driver;
    61		struct device *dev = &pdev->dev;
    62		struct device_node *platform_node;
    63		struct device_node *codec_node;
    64		struct snd_soc_dai_link *dai_link;
    65		int ret;
    66		int i;
    67	
    68		platform_node = of_parse_phandle(dev->of_node, "mediatek,platform", 0);
    69		if (!platform_node)
    70			return dev_err_probe(dev, -EINVAL,
    71					     "Property 'mediatek,platform' missing\n");
    72	
    73		for_each_card_driver_prelinks(card_driver, i, dai_link) {
    74			if (dai_link->platforms->name)
    75				continue;
    76			dai_link->platforms->of_node = platform_node;
    77		}
    78	
    79		codec_node = of_parse_phandle(dev->of_node, "mediatek,audio-codec", 0);
    80		if (!codec_node) {
    81			of_node_put(platform_node);
    82			return dev_err_probe(dev, -EINVAL,
    83					     "Property 'mediatek,audio-codec' missing\n");
    84		}
    85		mt2701_hdmi_dai_links[DAI_LINK_BE_HDMI_I2S].codecs->of_node = codec_node;
    86	
    87		card = devm_snd_soc_card_register(dev, card_driver);
  > 88		if (!card)
    89			ret = -ENOMEM;
    90	
    91		of_node_put(platform_node);
    92		of_node_put(codec_node);
    93		return ret;
    94	}
    95	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
