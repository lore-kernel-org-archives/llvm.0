Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E2D31D381;
	Tue,  2 Jun 2026 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780423577; cv=none; b=hV+c7hODfzpd9W6xmUeZCiSa8uti6HWpPRvUt0R9p11fgSo8v8ZizT+Z1CZBmn8CUwwcD9YDFxKBlODYxD5GzNtYofjL2nX/PR33pLRfFoEAkKmNc5pQmBTmvmBv8luaa7e6L0QeuzrVtFzJWbCJD4/bKrY9O19FXvF+HzDUVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780423577; c=relaxed/simple;
	bh=ry2vRUXxNxCx4/f0tDSsP43+LhXP3dk7CaaSf+mtXxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SxNYq1eSX4NUa69au23xjUJI4Ms0uUeIf6bB93qGh8KFbFOMyEesv/wb9w3srs11E5T7DZnp06QWoxe4jY2/AJ4wpMYUpl8y41Y0VKSwwZP2GOmWYtTDTD+CEJvmiCttRGrQhwNYu9kVpljsZ0zHNbLnNhj2+z6ceIEZtRJG6sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JN84TNIO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JN84TNIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780423575; x=1811959575;
  h=date:from:to:cc:subject:message-id;
  bh=ry2vRUXxNxCx4/f0tDSsP43+LhXP3dk7CaaSf+mtXxE=;
  b=JN84TNIOnoabwQyPgENRmZiW1+jjino1VBzysPr82R4HTFjIRLfbg1T0
   QVc0Ur33DHxbrmfQjC1vKJxtNqZhTpjSVR/SuS5NODn7a0IbbtS8C79w5
   JkApkbGZJtDWlRZyBonpKE9jlt9BXmiFbnJegNor5TUXG3bT11kvssNyV
   mXBjZ05N2j4u3ijRMzbg6pdQ3NWbtpAyaWqAdQj1ytnJwtN0s52X4/mBM
   Rqpjp7jP3ku/mKAZMehNS836q5J6v+/LRWnkqTEaWu6gS+FiqNYDeCIz6
   joaD6xM53t2g+n+zwu1jx0L3Il8wVuKAZwu604Rn1dicNiCyKzscM7v4N
   g==;
X-CSE-ConnectionGUID: oeLyAx+xQV+sRBxkFA7zpg==
X-CSE-MsgGUID: Dtx5YyxESo6a870Jm/gKPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="106666556"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="106666556"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 11:06:15 -0700
X-CSE-ConnectionGUID: JERTbLDfTf+yQzCk+4QSaQ==
X-CSE-MsgGUID: 6J7MHQv6Qom56cuKQRjgOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237629654"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jun 2026 11:06:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUTVC-00000000CNu-2N3P;
	Tue, 02 Jun 2026 18:06:10 +0000
Date: Wed, 03 Jun 2026 02:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:144:25: error: incomplete
 definition of type 'struct snd_soc_dai'
Message-ID: <202606030136.R4on6tJO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 61940afff67a6c8e813921b69dbef7e26112dccf [290/290] ASoC: soc-dai: move struct snd_soc_dai to soc-dai.c
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606030136.R4on6tJO-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030136.R4on6tJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030136.R4on6tJO-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:141:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     141 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:141:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     141 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:144:25: error: incomplete definition of type 'struct snd_soc_dai'
     144 |         int memif_num = cpu_dai->id;
         |                         ~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:186:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:186:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     186 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:188:25: error: incomplete definition of type 'struct snd_soc_dai'
     188 |         int memif_num = cpu_dai->id;
         |                         ~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:208:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     208 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:208:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     208 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:211:37: error: incomplete definition of type 'struct snd_soc_dai'
     211 |         int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:253:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     253 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:253:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     253 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:254:37: error: incomplete definition of type 'struct snd_soc_dai'
     254 |         int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   12 errors generated.
--
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:412:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     412 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:412:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     412 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8196/mt8196-dai-adda.c:417:14: error: incomplete definition of type 'struct snd_soc_dai'
     417 |         int id = dai->id;
         |                  ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:470:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     470 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:470:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     470 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:477:14: error: incomplete definition of type 'struct snd_soc_dai'
     477 |         int id = dai->id;
         |                  ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:660:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     660 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:660:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     660 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:661:14: error: incomplete definition of type 'struct snd_soc_dai'
     661 |         int id = dai->id;
         |                  ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   9 errors generated.
--
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2325:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2325:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    2325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2327:44: error: incomplete definition of type 'struct snd_soc_dai'
    2327 |         return mtk_dai_i2s_config(afe, params, dai->id);
         |                                                ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2333:48: error: incomplete definition of type 'struct snd_soc_dai'
    2333 |         struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
         |                                                    ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2339:9: error: incomplete definition of type 'struct snd_soc_dai'
    2339 |         if (dai->id >= MT8196_DAI_NUM || dai->id < 0 || dir != SND_SOC_CLOCK_OUT)
         |             ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2339:38: error: incomplete definition of type 'struct snd_soc_dai'
    2339 |         if (dai->id >= MT8196_DAI_NUM || dai->id < 0 || dir != SND_SOC_CLOCK_OUT)
         |                                          ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2342:35: error: incomplete definition of type 'struct snd_soc_dai'
    2342 |         i2s_priv = afe_priv->dai_priv[dai->id];
         |                                       ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2373:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2373 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2373:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    2373 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2377:9: error: incomplete definition of type 'struct snd_soc_dai'
    2377 |         if (dai->id >= MT8196_DAI_NUM || dai->id < 0)
         |             ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2377:38: error: incomplete definition of type 'struct snd_soc_dai'
    2377 |         if (dai->id >= MT8196_DAI_NUM || dai->id < 0)
         |                                          ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2380:35: error: incomplete definition of type 'struct snd_soc_dai'
    2380 |         i2s_priv = afe_priv->dai_priv[dai->id];
         |                                       ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2384:51: error: incomplete definition of type 'struct snd_soc_dai'
    2384 |         dev_dbg(afe->dev, "dai->id: %d, fmt: 0x%x\n", dai->id, fmt);
         |                                                       ~~~^
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
   13 errors generated.
--
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:397:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     397 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:397:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     397 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:399:18: error: incomplete definition of type 'struct snd_soc_dai'
     399 |         int tdm_id = dai->id;
         |                      ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:506:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     506 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:506:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     506 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:507:18: error: incomplete definition of type 'struct snd_soc_dai'
     507 |         int tdm_id = dai->id;
         |                      ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:556:48: error: incomplete definition of type 'struct snd_soc_dai'
     556 |         struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
         |                                                    ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:560:9: error: incomplete definition of type 'struct snd_soc_dai'
     560 |         if (dai->id >= MT8196_DAI_NUM || dai->id < 0)
         |             ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:560:38: error: incomplete definition of type 'struct snd_soc_dai'
     560 |         if (dai->id >= MT8196_DAI_NUM || dai->id < 0)
         |                                          ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:563:35: error: incomplete definition of type 'struct snd_soc_dai'
     563 |         tdm_priv = afe_priv->dai_priv[dai->id];
         |                                       ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   10 errors generated.
--
>> sound/soc/mediatek/mt8196/mt8196-nau8825.c:553:68: error: incomplete definition of type 'struct snd_soc_dai'
     553 |         struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-nau8825.c:578:68: error: incomplete definition of type 'struct snd_soc_dai'
     578 |         struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-nau8825.c:605:68: error: incomplete definition of type 'struct snd_soc_dai'
     605 |         struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-nau8825.c:653:68: error: incomplete definition of type 'struct snd_soc_dai'
     653 |         struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-nau8825.c:673:20: error: incomplete definition of type 'struct snd_soc_dai'
     673 |                 dev_err(codec_dai->dev, "can't set BCLK clock %d\n", ret);
         |                         ~~~~~~~~~^
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8196/mt8196-nau8825.c:681:20: error: incomplete definition of type 'struct snd_soc_dai'
     681 |                 dev_err(codec_dai->dev, "can't set BCLK: %d\n", ret);
         |                         ~~~~~~~~~^
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   6 errors generated.


vim +144 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c

57513aabfe5bff Darren Ye 2026-04-30  136  
57513aabfe5bff Darren Ye 2026-04-30  137  static int mt8196_fe_startup(struct snd_pcm_substream *substream,
57513aabfe5bff Darren Ye 2026-04-30  138  			     struct snd_soc_dai *dai)
57513aabfe5bff Darren Ye 2026-04-30  139  {
57513aabfe5bff Darren Ye 2026-04-30  140  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
57513aabfe5bff Darren Ye 2026-04-30  141  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
57513aabfe5bff Darren Ye 2026-04-30  142  	struct snd_pcm_runtime *runtime = substream->runtime;
57513aabfe5bff Darren Ye 2026-04-30  143  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
57513aabfe5bff Darren Ye 2026-04-30 @144  	int memif_num = cpu_dai->id;
57513aabfe5bff Darren Ye 2026-04-30  145  	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
57513aabfe5bff Darren Ye 2026-04-30  146  	const struct snd_pcm_hardware *mtk_afe_hardware = afe->mtk_afe_hardware;
57513aabfe5bff Darren Ye 2026-04-30  147  	int ret;
57513aabfe5bff Darren Ye 2026-04-30  148  
57513aabfe5bff Darren Ye 2026-04-30  149  	dev_dbg(afe->dev, "memif_num: %d.\n", memif_num);
57513aabfe5bff Darren Ye 2026-04-30  150  
57513aabfe5bff Darren Ye 2026-04-30  151  	memif->substream = substream;
57513aabfe5bff Darren Ye 2026-04-30  152  
57513aabfe5bff Darren Ye 2026-04-30  153  	snd_pcm_hw_constraint_step(substream->runtime, 0,
57513aabfe5bff Darren Ye 2026-04-30  154  				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 16);
57513aabfe5bff Darren Ye 2026-04-30  155  
57513aabfe5bff Darren Ye 2026-04-30  156  	if (memif_num == MT8196_MEMIF_VUL_CM0)
57513aabfe5bff Darren Ye 2026-04-30  157  		snd_pcm_hw_constraint_step(substream->runtime, 0,
57513aabfe5bff Darren Ye 2026-04-30  158  					   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 16);
57513aabfe5bff Darren Ye 2026-04-30  159  
57513aabfe5bff Darren Ye 2026-04-30  160  	snd_soc_set_runtime_hwparams(substream, mtk_afe_hardware);
57513aabfe5bff Darren Ye 2026-04-30  161  
57513aabfe5bff Darren Ye 2026-04-30  162  	ret = snd_pcm_hw_constraint_integer(runtime,
57513aabfe5bff Darren Ye 2026-04-30  163  					    SNDRV_PCM_HW_PARAM_PERIODS);
57513aabfe5bff Darren Ye 2026-04-30  164  	if (ret < 0)
57513aabfe5bff Darren Ye 2026-04-30  165  		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
57513aabfe5bff Darren Ye 2026-04-30  166  
57513aabfe5bff Darren Ye 2026-04-30  167  	/* dynamic allocate irq to memif */
57513aabfe5bff Darren Ye 2026-04-30  168  	if (memif->irq_usage < 0) {
57513aabfe5bff Darren Ye 2026-04-30  169  		int irq_id = mtk_dynamic_irq_acquire(afe);
57513aabfe5bff Darren Ye 2026-04-30  170  
57513aabfe5bff Darren Ye 2026-04-30  171  		if (irq_id != afe->irqs_size) {
57513aabfe5bff Darren Ye 2026-04-30  172  			/* link */
57513aabfe5bff Darren Ye 2026-04-30  173  			memif->irq_usage = irq_id;
57513aabfe5bff Darren Ye 2026-04-30  174  		} else {
57513aabfe5bff Darren Ye 2026-04-30  175  			dev_err(afe->dev, "no more asys irq\n");
57513aabfe5bff Darren Ye 2026-04-30  176  			ret = -EBUSY;
57513aabfe5bff Darren Ye 2026-04-30  177  		}
57513aabfe5bff Darren Ye 2026-04-30  178  	}
57513aabfe5bff Darren Ye 2026-04-30  179  	return ret;
57513aabfe5bff Darren Ye 2026-04-30  180  }
57513aabfe5bff Darren Ye 2026-04-30  181  

:::::: The code at line 144 was first introduced by commit
:::::: 57513aabfe5bff89163cff811d9ac1b97651d0d6 ASoC: mediatek: mt8196: add platform driver

:::::: TO: Darren Ye <darren.ye@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
