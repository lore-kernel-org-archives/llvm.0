Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD3285CB9;
	Sat, 28 Mar 2026 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774659533; cv=none; b=lDSLvkMYVoo/z+nh67/P0LHFrn+6m0GYc80GRMoyMP0KM/0nsQ81sKBsW4LdRFjK7r8yNfDtper6IKxjBiJhaT1X3Eg5L8f9/3FHhK8Hfs7ovzgTAUZGsf7SQWNKD9Z2Z43+KwcymOxPy86huq5LTeVmw24IhjmckJgKZ2CNm+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774659533; c=relaxed/simple;
	bh=azB9hmv70gLBW5LsyiL1X6nwKr8TJvARFmfIPS/OJoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=plXwiPq5bzv5v7ZAMbmzHhhvCaAnjrkPNZkf6iEEWaJR/u5HOdMNSM6hV2Fzg1vnphDnKM/59vt3VoyvoYVxJoAeyLTJRiloun+B4CVmskw1uRYYqbmSptWkM3pl/oNAhuy0g5mLMAdVfBxqBoB79d5UR0hkYAmU+8o7ybJq/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxyGXbCp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxyGXbCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774659525; x=1806195525;
  h=date:from:to:cc:subject:message-id;
  bh=azB9hmv70gLBW5LsyiL1X6nwKr8TJvARFmfIPS/OJoU=;
  b=DxyGXbCpo7e8ygnmma3HzKZlfiGzDFgcOHX2ZS4zY2mPmCuu5YRGwMZN
   vi51yJAYWaMgvw2UMHOVHDSXCFLhCGSmVNKYeb3MjoSvUI+dn/1ckkoys
   Um2Ck7yhf6eQX3d1d9B8OSFMc/egBlBuzb+LdqrMXMwLHqjuoBu7TvNro
   zk4WSJXSekkJ5aZYiS3b3iOpSk4oWO6f9dplUJMQ1rfF6hjBzRRnwoIy1
   XOrV9gl9psMw+mDkd5gS2wI3Clt1w2B29DUA7bPPk35+aJQ5keqy9VZ/r
   z7MaqPdmpsbOr2YVxJ05z2qlUYX+6BDxaImC3qolu08vmyBosEDHNWaP5
   w==;
X-CSE-ConnectionGUID: 0q2G1OVCQDGQRNh+jCkltw==
X-CSE-MsgGUID: Fsst5qw0SFmZHxvzzcCGNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87124364"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="87124364"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 17:58:43 -0700
X-CSE-ConnectionGUID: nzNL7yZGTO6JT9pUKHuk/w==
X-CSE-MsgGUID: Q2/CbfzsQmWUEWH/kttUyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230396218"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Mar 2026 17:58:42 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6I0d-00000000Axz-0M5j;
	Sat, 28 Mar 2026 00:58:39 +0000
Date: Sat, 28 Mar 2026 08:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 105/106]
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1150:8: error: call to undeclared
 function 'snd_soc_component_initialize'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202603280853.N1XAI8fd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 875ce5ef9fec2ed41005eac865ef96e1da800d57 [105/106] ASoC: soc-component: remove compatible definition
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260328/202603280853.N1XAI8fd-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280853.N1XAI8fd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280853.N1XAI8fd-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     297 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     297 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:310:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     310 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:310:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     310 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:325:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:325:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:346:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:346:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:360:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     360 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:360:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     360 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:374:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     374 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:374:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     374 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:436:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     436 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:436:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     436 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:438:57: error: incomplete definition of type 'struct snd_soc_dai'
     438 |         dev_info(afe->dev, "%s cmd=%d %s\n", __func__, cmd, dai->name);
         |                                                             ~~~^
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:486:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     486 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:486:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     486 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:487:75: error: incomplete definition of type 'struct snd_soc_dai'
     487 |         struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
         |                                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1150:8: error: call to undeclared function 'snd_soc_component_initialize'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1150 |         ret = snd_soc_component_initialize(comp_pcm,
         |               ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1150:8: note: did you mean 'snd_soc_component_init'?
   include/sound/soc-component.h:294:5: note: 'snd_soc_component_init' declared here
     294 | int snd_soc_component_init(struct snd_soc_component *component);
         |     ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/snd_soc_component_initialize +1150 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c

ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1049  
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1050  static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1051  {
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1052  	int ret, i;
d6e2c4ffdf67de sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Arvind Yadav               2017-11-29  1053  	int irq_id;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1054  	struct mtk_base_afe *afe;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1055  	struct mt8173_afe_private *afe_priv;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1056  	struct snd_soc_component *comp_pcm, *comp_hdmi;
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1057  	struct device *dev = &pdev->dev;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1058  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1059  	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(33));
fcde5a7eca1a28 sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1060  	if (ret)
fcde5a7eca1a28 sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1061  		return ret;
fcde5a7eca1a28 sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1062  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1063  	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1064  	if (!afe)
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1065  		return -ENOMEM;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1066  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1067  	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1068  	afe_priv = afe->platform_priv;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1069  	if (!afe_priv)
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1070  		return -ENOMEM;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1071  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1072  	afe->dev = dev;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1073  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1074  	ret = of_reserved_mem_device_init(dev);
ec4a10ca4a68ec sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1075  	if (ret) {
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1076  		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
ec4a10ca4a68ec sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1077  		afe->preallocate_buffers = true;
ec4a10ca4a68ec sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1078  	}
ec4a10ca4a68ec sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1079  
f9c058d14f4fe2 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1080  	irq_id = platform_get_irq(pdev, 0);
f9c058d14f4fe2 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1081  	if (irq_id <= 0)
f9c058d14f4fe2 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1082  		return irq_id < 0 ? irq_id : -ENXIO;
f9c058d14f4fe2 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1083  
fceef72b68d635 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c YueHaibing                 2019-07-27  1084  	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1085  	if (IS_ERR(afe->base_addr))
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1086  		return PTR_ERR(afe->base_addr);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1087  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1088  	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1089  					    &mt8173_afe_regmap_config);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1090  	if (IS_ERR(afe->regmap))
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1091  		return PTR_ERR(afe->regmap);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1092  
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1093  	/* initial audio related clock */
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1094  	ret = mt8173_afe_init_audio_clk(afe);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1095  	if (ret) {
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1096  		dev_err(dev, "mt8173_afe_init_audio_clk fail\n");
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1097  		return ret;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1098  	}
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1099  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1100  	/* memif % irq initialize*/
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1101  	afe->memif_size = MT8173_AFE_MEMIF_NUM;
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1102  	afe->memif = devm_kcalloc(dev, afe->memif_size,
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1103  				  sizeof(*afe->memif), GFP_KERNEL);
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1104  	if (!afe->memif)
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1105  		return -ENOMEM;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1106  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1107  	afe->irqs_size = MT8173_AFE_IRQ_NUM;
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1108  	afe->irqs = devm_kcalloc(dev, afe->irqs_size,
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1109  				 sizeof(*afe->irqs), GFP_KERNEL);
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1110  	if (!afe->irqs)
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1111  		return -ENOMEM;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1112  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1113  	for (i = 0; i < afe->irqs_size; i++) {
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1114  		afe->memif[i].data = &memif_data[i];
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1115  		afe->irqs[i].irq_data = &irq_data[i];
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1116  		afe->irqs[i].irq_occupyed = true;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1117  		afe->memif[i].irq_usage = i;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1118  		afe->memif[i].const_irq = 1;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1119  	}
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1120  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1121  	afe->mtk_afe_hardware = &mt8173_afe_hardware;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1122  	afe->memif_fs = mt8173_memif_fs;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1123  	afe->irq_fs = mt8173_irq_fs;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1124  
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1125  	platform_set_drvdata(pdev, afe);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1126  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1127  	pm_runtime_enable(dev);
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1128  	if (!pm_runtime_enabled(dev)) {
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1129  		ret = mt8173_afe_runtime_resume(dev);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1130  		if (ret)
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1131  			goto err_pm_disable;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1132  	}
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1133  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1134  	afe->reg_back_up_list = mt8173_afe_backup_list;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1135  	afe->reg_back_up_list_num = ARRAY_SIZE(mt8173_afe_backup_list);
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1136  	afe->runtime_resume = mt8173_afe_runtime_resume;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1137  	afe->runtime_suspend = mt8173_afe_runtime_suspend;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1138  
61c94a63000ef8 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Kuninori Morimoto          2026-03-27  1139  	ret = devm_snd_soc_component_register(dev, &mtk_afe_pcm_platform,
f1b5bf07365d4d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Kuninori Morimoto          2018-01-29  1140  					      NULL, 0);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1141  	if (ret)
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1142  		goto err_pm_disable;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1143  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1144  	comp_pcm = devm_kzalloc(dev, sizeof(*comp_pcm), GFP_KERNEL);
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1145  	if (!comp_pcm) {
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1146  		ret = -ENOMEM;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1147  		goto err_pm_disable;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1148  	}
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1149  
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11 @1150  	ret = snd_soc_component_initialize(comp_pcm,
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1151  					   &mt8173_afe_pcm_dai_component,
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1152  					   dev);
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1153  	if (ret)
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1154  		goto err_pm_disable;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1155  

:::::: The code at line 1150 was first introduced by commit
:::::: 8c32984bc7da29828260ac514d5d4967f7e8f62d ASoC: mediatek: mt8173: Fix debugfs registration for components

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
