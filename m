Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1B4175A7C;
	Tue,  2 Jun 2026 19:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429768; cv=none; b=XIKsKuP3Yl1GFikPf4ymuCTf6LiDXhcOrtr6ry4JUozq7Egx5YWjmxM9baG3oChJEFbhI1aObfuxH3qAs6yHDYptz7u9q0OdgZfvZnRObb5KWErYYCr7i5oURRyb671PvnowoS8uy97xtaGKRIMsnhgtrt7BUQ7vAhUbpgtRLfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429768; c=relaxed/simple;
	bh=Uk+gQLCZOAoMbLxlxFPQERotHQwv4m/RsFFY4XUsDoY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NIqlor0LwRV/eTO7okWcLpYtWPCmIioAbGbusnPZesprjiun847RqpKVnAHqgC+r4oGX3/n5+7iqjp4dyaZ9wnq9d7br4Xb/x6EpYiIETm+lFMES/YeCOkpGX82coJmT5ZQrjJ6OaZ0OAimdLUHVrYAIA408DYVTX9ElAuWryn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJS6D+nB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJS6D+nB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780429765; x=1811965765;
  h=date:from:to:cc:subject:message-id;
  bh=Uk+gQLCZOAoMbLxlxFPQERotHQwv4m/RsFFY4XUsDoY=;
  b=kJS6D+nByGU+2bT44qce4EmOsOd0fS7p2JxWvURWPFilwEh8U3mtH3ok
   b4YjRdXDkVsal5zR7UOy6aDgWzPiZtqJgd97sz/CTphhxGp78TwOidUSk
   WnpXE6tHloVCv7OKA6ParGzyPLElpGcSU0GYpkNn0JZ6OslQXoie8rV56
   uXlmM/Rf/2xhHii+D/CkseH1GL+60GUTLmKKb/m1etP8+jRrPr1SdIbO1
   mC+1737WkcYcGR2hoXPZXlZKR6JN/pPxhvOrWiWnGQtqpKNXdfo2w38C+
   6SY545bPAsR2/koskUH/sJbYTJyTEe1JiBnsd7Eb33DgzLGIshrqz02GC
   A==;
X-CSE-ConnectionGUID: qgAjRAULRFybCBf7TqtA5g==
X-CSE-MsgGUID: Dxv0EyKWQ+asqsR/LvRiBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80367759"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="80367759"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 12:49:25 -0700
X-CSE-ConnectionGUID: nOo4vrR4QeCvUsSM4vm17g==
X-CSE-MsgGUID: USxUU14rQg6oIzODfSldHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="242958411"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jun 2026 12:49:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUV71-00000000CSQ-3P45;
	Tue, 02 Jun 2026 19:49:19 +0000
Date: Wed, 03 Jun 2026 03:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:350:8: error: call to undeclared
 function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606030302.lLHgdADT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: be2dfcdd460ff025011f95257876a89883815cda [290/290] ASoC: soc-component: remove snd_soc_component_{set/get}_drvdata()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606030302.lLHgdADT-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030302.lLHgdADT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030302.lLHgdADT-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:141:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     141 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:141:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     141 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:144:25: error: incomplete definition of type 'struct snd_soc_dai'
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
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:350:8: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     350 |         afe = snd_soc_component_get_drvdata(component);
         |               ^
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:350:6: error: incompatible integer to pointer conversion assigning to 'struct mtk_base_afe *' from 'int' [-Wint-conversion]
     350 |         afe = snd_soc_component_get_drvdata(component);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:374:8: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     374 |         afe = snd_soc_component_get_drvdata(component);
         |               ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:374:6: error: incompatible integer to pointer conversion assigning to 'struct mtk_base_afe *' from 'int' [-Wint-conversion]
     374 |         afe = snd_soc_component_get_drvdata(component);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:477:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     477 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:477:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     477 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:508:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     508 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> sound/soc/mediatek/mt8196/mt8196-dai-adda.c:286:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     286 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:286:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     286 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:412:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     412 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:412:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     412 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:417:14: error: incomplete definition of type 'struct snd_soc_dai'
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
   11 errors generated.
--
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:987:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     987 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:987:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     987 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1016:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1016 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1016:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    1016 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1256:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1256 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1256:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    1256 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1273:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1273 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1273:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    1273 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1295:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1295 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1295:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    1295 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1321:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1321 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:1321:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    1321 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2325:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2325:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    2325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2327:44: error: incomplete definition of type 'struct snd_soc_dai'
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
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:255:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:255:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     255 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:282:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     282 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:282:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     282 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:339:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     339 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:339:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     339 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:397:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     397 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:397:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     397 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:399:18: error: incomplete definition of type 'struct snd_soc_dai'
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
   16 errors generated.


vim +/snd_soc_component_get_drvdata +350 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c

57513aabfe5bff Darren Ye 2026-04-30  337  
57513aabfe5bff Darren Ye 2026-04-30  338  static int mt8196_memif_fs(struct snd_pcm_substream *substream,
57513aabfe5bff Darren Ye 2026-04-30  339  			   unsigned int rate)
57513aabfe5bff Darren Ye 2026-04-30  340  {
57513aabfe5bff Darren Ye 2026-04-30  341  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
57513aabfe5bff Darren Ye 2026-04-30  342  	struct snd_soc_component *component =
57513aabfe5bff Darren Ye 2026-04-30  343  		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
57513aabfe5bff Darren Ye 2026-04-30  344  	struct mtk_base_afe *afe = NULL;
57513aabfe5bff Darren Ye 2026-04-30  345  	unsigned int rate_reg;
57513aabfe5bff Darren Ye 2026-04-30  346  
57513aabfe5bff Darren Ye 2026-04-30  347  	if (!component)
57513aabfe5bff Darren Ye 2026-04-30  348  		return -EINVAL;
57513aabfe5bff Darren Ye 2026-04-30  349  
57513aabfe5bff Darren Ye 2026-04-30 @350  	afe = snd_soc_component_get_drvdata(component);
57513aabfe5bff Darren Ye 2026-04-30  351  	if (!afe)
57513aabfe5bff Darren Ye 2026-04-30  352  		return -EINVAL;
57513aabfe5bff Darren Ye 2026-04-30  353  
57513aabfe5bff Darren Ye 2026-04-30  354  	rate_reg = mt8196_rate_transform(afe->dev, rate);
57513aabfe5bff Darren Ye 2026-04-30  355  
57513aabfe5bff Darren Ye 2026-04-30  356  	return rate_reg;
57513aabfe5bff Darren Ye 2026-04-30  357  }
57513aabfe5bff Darren Ye 2026-04-30  358  

:::::: The code at line 350 was first introduced by commit
:::::: 57513aabfe5bff89163cff811d9ac1b97651d0d6 ASoC: mediatek: mt8196: add platform driver

:::::: TO: Darren Ye <darren.ye@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
