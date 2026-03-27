Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A533A24B28;
	Fri, 27 Mar 2026 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652200; cv=none; b=JLylOmpNELUhtqeBLVSAWKMq9NMI+zMYvC0C7Au+UzE4wwEDx6UMsm25GM5QbKyv7AibvtxlUQnScslt18laoL5j+/sIZY8QnIZQQlHElQyFJwjObV/JYPrGj8dPYM5bOCi4XR+T85azrwRpAJ60IRBtejsT1iqw3l9rOXwgFfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652200; c=relaxed/simple;
	bh=YHX7FxwHQPp5ad0gMKhioOiX8b3Jexp4m0alrCdRu0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Erts9x022d38vcqLmocX+GlPmKiE5P1mchG+RM7wHDMapA1G2KEX3OaYMhHDoKr1xxtxZs2hwwUeRCz+giU2doV8JJA0Hgs82liRxPFPhh7aGqinsJ+N65vxi9womSU9/lU/Kc5y2nuBRjn3TAhSVDFXR2DZ6Ukvp313FXFerYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yzh6Abql; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yzh6Abql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774652197; x=1806188197;
  h=date:from:to:cc:subject:message-id;
  bh=YHX7FxwHQPp5ad0gMKhioOiX8b3Jexp4m0alrCdRu0I=;
  b=Yzh6Abql6kBWP8uaAeS85IRYNngLkHXP1HE/hYLWp1VCQclWsFdV06bF
   PJDGp15Koxh9L4IqYDt/AlMaPhGgfnzsAg925Eg/cRuxsX+NdRHSW7P2A
   4UJRRReVkqT+7Xl7rGysp2JDZSJAz05M4rlRDqDxsSpdQT0ustKsd2T3T
   RlE1Z0sRkkZGyyMuACgPZ/ki/+lirafW3ZBK3PRPT6H4w8VKLeHlSFyXV
   CG9R9HB7d2srZuk01B6V1uF8krdnXKYPa+BjfipIxTzHOO60eoqRUyJjK
   l8gJvW3WLPKyJF88kyXX6gLSV/aqeWArQHII5ftBH5AU3sRGGNzBt7skv
   w==;
X-CSE-ConnectionGUID: FPrPjL52QLS3hhhkuhNFCg==
X-CSE-MsgGUID: yM63tPB4QIOmnH+2YhGQGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86809858"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="86809858"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 15:56:36 -0700
X-CSE-ConnectionGUID: DTJn4RxpQOmZx8Jzczd/yw==
X-CSE-MsgGUID: /J4GDEE8R46BHpV109ZPxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="221049206"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2026 15:56:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6G6R-00000000ArL-2Gte;
	Fri, 27 Mar 2026 22:56:31 +0000
Date: Sat, 28 Mar 2026 06:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 104/106]
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:145:29: error: call to undeclared
 function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202603280604.aHtoXzUS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 55f784e93bd97f195076c74fbd15fcb7dfa4a435 [104/106] ASoC: soc-component: remove snd_soc_component_{set/get}_drvdata()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260328/202603280604.aHtoXzUS-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280604.aHtoXzUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280604.aHtoXzUS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:145:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     145 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^
>> sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:145:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     145 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:146:37: error: incomplete definition of type 'struct snd_soc_dai'
     146 |         int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:156:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     156 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^
   sound/soc/mediatek/mt6797/mt6797-afe-pcm.c:156:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     156 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.
--
>> sound/soc/mediatek/mt6797/mt6797-dai-adda.c:56:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:56:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
      56 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:155:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:155:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     155 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt6797/mt6797-dai-adda.c:159:16: error: incomplete definition of type 'struct snd_soc_dai'
     159 |                 __func__, dai->id, substream->stream, rate);
         |                           ~~~^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   5 errors generated.
--
>> sound/soc/mediatek/mt7986/mt7986-afe-pcm.c:111:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     111 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^
>> sound/soc/mediatek/mt7986/mt7986-afe-pcm.c:111:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     111 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-afe-pcm.c:121:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     121 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^
   sound/soc/mediatek/mt7986/mt7986-afe-pcm.c:121:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     121 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
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
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:486:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
   18 errors generated.
--
>> sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:150:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     150 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^
>> sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:150:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     150 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:151:37: error: incomplete definition of type 'struct snd_soc_dai'
     151 |         int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:161:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     161 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c:161:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     161 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.
--
>> sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:122:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     122 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:122:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     122 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:141:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     141 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:141:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     141 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:275:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     275 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:275:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     275 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:302:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     302 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:302:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     302 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:420:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     420 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:420:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     420 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:441:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     441 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:441:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     441 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:470:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     470 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:470:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     470 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:496:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     496 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:496:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     496 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:525:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     525 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:525:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     525 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:776:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     776 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:251:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     251 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:251:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     251 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:277:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     277 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:277:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     277 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:335:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     335 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:335:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     335 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:468:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     468 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:468:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     468 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:470:18: error: incomplete definition of type 'struct snd_soc_dai'
     470 |         int tdm_id = dai->id;
         |                      ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:585:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     585 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:585:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     585 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:618:48: error: incomplete definition of type 'struct snd_soc_dai'
     618 |         struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
         |                                                    ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:620:60: error: incomplete definition of type 'struct snd_soc_dai'
     620 |         struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai->id];
         |                                                                ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:639:48: error: incomplete definition of type 'struct snd_soc_dai'
     639 |         struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
         |                                                    ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:641:60: error: incomplete definition of type 'struct snd_soc_dai'
     641 |         struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai->id];
         |                                                                ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   15 errors generated.
--
>> sound/soc/mediatek/mt8183/mt8183-dai-adda.c:63:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-adda.c:63:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
      63 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-adda.c:117:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-adda.c:117:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     117 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-adda.c:129:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-adda.c:129:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     129 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-adda.c:273:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     273 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-adda.c:273:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     273 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-adda.c:277:16: error: incomplete definition of type 'struct snd_soc_dai'
     277 |                 __func__, dai->id, substream->stream, rate);
         |                           ~~~^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   9 errors generated.
..


vim +/snd_soc_component_get_drvdata +145 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c

3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  138  
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  139  static int mt6797_memif_fs(struct snd_pcm_substream *substream,
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  140  			   unsigned int rate)
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  141  {
de9e70137f0068 Kuninori Morimoto 2023-09-26  142  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  143  	struct snd_soc_component *component =
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  144  		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25 @145  	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
de9e70137f0068 Kuninori Morimoto 2023-09-26  146  	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  147  
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  148  	return mt6797_rate_transform(afe->dev, rate, id);
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  149  }
3901b9fc0f0de6 Kai Chieh Chuang  2018-04-25  150  

:::::: The code at line 145 was first introduced by commit
:::::: 3901b9fc0f0de6801b4a2dad8f8731f619723437 ASoC: mt6797: add mt6797 platform driver

:::::: TO: Kai Chieh Chuang <kaichieh.chuang@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
