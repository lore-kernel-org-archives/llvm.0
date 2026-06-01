Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC47340A6B;
	Mon,  1 Jun 2026 21:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780350724; cv=none; b=Gg+W4vB1j/BCOw6fgbt3OiX/zVVYXqSn6cKLRr+7dWgQ3TAAphBTUdha7AzIMN+jxFoftxNy6YjTYQCg074YoX6gxikRc2BYbpgcie/0n94d9mK/sQLqdldSoM+DGd2vLFlo4EdiojcrRJAqGTe+Hp4+JcC4K2C1zFZFL57sh+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780350724; c=relaxed/simple;
	bh=MOu2VGety2kdefOXvcvdltSb2tbJfWvBSMs/8FvtLNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NQIm4ORse3BX5DJBH08LKZFuHtv/d9pES+NTf6Z1sMIgHSNGPRGfiDIawzRjN7lMUMsmudZebjlp0LPn806PR368JcQtw0OCxtPNbLCNkVjZQQb6Brzui9/rX1uG5vuT/R3eDLTpgI7zx7PtuyHE0cKZPBDNKecqvAVFCDKJWFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zy3fnTQo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zy3fnTQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780350723; x=1811886723;
  h=date:from:to:cc:subject:message-id;
  bh=MOu2VGety2kdefOXvcvdltSb2tbJfWvBSMs/8FvtLNw=;
  b=Zy3fnTQodhv+O1A5IW78qNHTP+2nGdiH2QfwHlANzMHob8pMgwxA6jLc
   1OHUT88ij8HEEoh9g324+aaJyz7ZHi2OMBv4gjqCVoCwTVp8Q8RJvFEb9
   KJUBoab3ejrT8lgRusx27UaLIUfpZE+DblmcH5Z+TXZFnpV5tEakqSjAL
   pG3GoH42lAu6M/gfefKKXjgAyQ3eXFSzaNcyk1S7ftAjdwVr/uyVsngs5
   VXbf9txafMCOoYfWIJk5VXoQ1Oo4mxtzuGxuBgwRhINCr6CscVJJyYdk/
   ssPIoEfkr1s6+AiB1Lnpar9AYQT13RDMd6vl4l7Xf7rYnIwXbVvR4DWXq
   g==;
X-CSE-ConnectionGUID: eXXdMg+hTOOBzKh6bPWI/w==
X-CSE-MsgGUID: Jjat94dDQp2siSghC6uEOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81019854"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81019854"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 14:52:03 -0700
X-CSE-ConnectionGUID: XJKcnGveTzmBc0FgOL0+kg==
X-CSE-MsgGUID: Go8GlUpYQ3CVYTCRg+H+EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="239279242"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2026 14:52:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUAYA-00000000B6h-1sl5;
	Mon, 01 Jun 2026 21:51:58 +0000
Date: Tue, 02 Jun 2026 05:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/qcom/apq8016_sbc.c:313:38: error: incompatible pointer types
 passing 'struct snd_soc_card_platform *' to parameter of type 'struct
 snd_soc_card_driver *'
Message-ID: <202606020506.dDyYDp2V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: a779421ee3636a4d54a8dcdea7f2035e308309f1 [290/290] ASoC: qcom: use snd_soc_card_register()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020506.dDyYDp2V-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020506.dDyYDp2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020506.dDyYDp2V-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/qcom/apq8016_sbc.c:26:31: error: field has incomplete type 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                                      ^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:161:46: error: incomplete definition of type 'struct snd_soc_card_platform'
     161 |         for_each_card_driver_prelinks(&card_platform->driver, i, link)
         |                                        ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:161:46: error: incomplete definition of type 'struct snd_soc_card_platform'
     161 |         for_each_card_driver_prelinks(&card_platform->driver, i, link)
         |                                        ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:261:15: error: incomplete definition of type 'struct snd_soc_card_platform'
     261 |         card_platform->components = "qdsp6";
         |         ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:263:46: error: incomplete definition of type 'struct snd_soc_card_platform'
     263 |         for_each_card_driver_prelinks(&card_platform->driver, i, link) {
         |                                        ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:263:46: error: incomplete definition of type 'struct snd_soc_card_platform'
     263 |         for_each_card_driver_prelinks(&card_platform->driver, i, link) {
         |                                        ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:305:15: error: incomplete definition of type 'struct snd_soc_card_platform'
     305 |         card_platform->owner = THIS_MODULE;
         |         ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:306:15: error: incomplete definition of type 'struct snd_soc_card_platform'
     306 |         card_platform->driver.dapm_widgets = apq8016_sbc_dapm_widgets;
         |         ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:307:15: error: incomplete definition of type 'struct snd_soc_card_platform'
     307 |         card_platform->driver.num_dapm_widgets = ARRAY_SIZE(apq8016_sbc_dapm_widgets);
         |         ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:308:15: error: incomplete definition of type 'struct snd_soc_card_platform'
     308 |         card_platform->driver.controls = apq8016_sbc_snd_controls;
         |         ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
   sound/soc/qcom/apq8016_sbc.c:309:15: error: incomplete definition of type 'struct snd_soc_card_platform'
     309 |         card_platform->driver.num_controls = ARRAY_SIZE(apq8016_sbc_snd_controls);
         |         ~~~~~~~~~~~~~^
   sound/soc/qcom/apq8016_sbc.c:26:9: note: forward declaration of 'struct snd_soc_card_platform'
      26 |         struct snd_soc_card_platform card_platform;
         |                ^
>> sound/soc/qcom/apq8016_sbc.c:313:38: error: incompatible pointer types passing 'struct snd_soc_card_platform *' to parameter of type 'struct snd_soc_card_driver *' [-Wincompatible-pointer-types]
     313 |         card = devm_snd_soc_card_alloc(dev, card_platform);
         |                                             ^~~~~~~~~~~~~
   include/sound/soc-card.h:91:39: note: passing argument to parameter 'driver' here
      91 |                                              struct snd_soc_card_driver *driver);
         |                                                                          ^
   12 errors generated.


vim +313 sound/soc/qcom/apq8016_sbc.c

   286	
   287	static int apq8016_sbc_platform_probe(struct platform_device *pdev)
   288	{
   289		void (*add_ops)(struct snd_soc_card_platform *);
   290		struct device *dev = &pdev->dev;
   291		struct snd_soc_card *card;
   292		struct snd_soc_card_platform *card_platform;
   293		struct apq8016_sbc_data *data;
   294		int ret;
   295	
   296		add_ops = device_get_match_data(&pdev->dev);
   297		if (!add_ops)
   298			return -EINVAL;
   299	
   300		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   301		if (!data)
   302			return -ENOMEM;
   303	
   304		card_platform = &data->card_platform;
   305		card_platform->owner = THIS_MODULE;
   306		card_platform->driver.dapm_widgets = apq8016_sbc_dapm_widgets;
   307		card_platform->driver.num_dapm_widgets = ARRAY_SIZE(apq8016_sbc_dapm_widgets);
   308		card_platform->driver.controls = apq8016_sbc_snd_controls;
   309		card_platform->driver.num_controls = ARRAY_SIZE(apq8016_sbc_snd_controls);
   310	
   311		add_ops(card_platform);
   312	
 > 313		card = devm_snd_soc_card_alloc(dev, card_platform);
   314		if (!card)
   315			return -ENOMEM;
   316	
   317		ret = qcom_snd_parse_of(card);
   318		if (ret)
   319			return ret;
   320	
   321		data->mic_iomux = devm_platform_ioremap_resource_byname(pdev, "mic-iomux");
   322		if (IS_ERR(data->mic_iomux))
   323			return PTR_ERR(data->mic_iomux);
   324	
   325		data->spkr_iomux = devm_platform_ioremap_resource_byname(pdev, "spkr-iomux");
   326		if (IS_ERR(data->spkr_iomux))
   327			return PTR_ERR(data->spkr_iomux);
   328	
   329		snd_soc_card_set_drvdata(card, data);
   330	
   331		return devm_snd_soc_card_register(card);
   332	}
   333	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
