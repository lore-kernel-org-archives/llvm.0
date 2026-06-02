Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1398D3BED75;
	Tue,  2 Jun 2026 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412419; cv=none; b=kH09qOXjhIt8p+BGsl6aIOBUUlQBvxHgmSLgiNKqWypvgDpdlSQQTq9/qvnVHY5fP5TuMEf5xKmsy6AlD8+Fm0KspBanHloL+SJcIZzz6ZKop9y3ZHEp0sRdlUMSIH/0vPmUb2XJn6RwTO0TIF9nOyZMwAxpaSsS2uM4RFKnABs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412419; c=relaxed/simple;
	bh=oXfr3zgzt0uAj3tYxULk7UusHbiY022C+aZxE1qmhSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dueGuUgiKfRt/si4fauL2lLgGB3WQvAcj1fkJ6Jc9CR0NuuEwhV6zOSNjoYdCx0Ku5UBgORh3JVYERVovqMf1VHf5/xOBakihkDnitGSfoRFDoKkgzQGOnJK/0f+Yva18HQxdghWHcYLRzWdgpXqbOxNPYIokCHzO0XQdUft8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvMVwe4U; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvMVwe4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780412418; x=1811948418;
  h=date:from:to:cc:subject:message-id;
  bh=oXfr3zgzt0uAj3tYxULk7UusHbiY022C+aZxE1qmhSA=;
  b=WvMVwe4UlSVP/5R8WMLG3W9KOMvp386ZAwUEKm3ZencYAKdvW+iS9KlZ
   oJt/7bs0R6QqRO1UEzOWbnKq1aeOn0JYkXa6PdVLD87k4wSmp5jA9LJLI
   zK9pD1A1YQPVCK0yynDnAKxShhPdcaQTirbUbWMHRCAxerofSpAi7XUgP
   Ya0td4UscbHn7Aqned855VzNIqYLd5CrObRI/gq5zWeuJX19cXFS2Dv6m
   fcY9TDavEKLYzUctk16Wk20aaXeSQCVPZhowCiW2AYrNfl7JavtyJMzty
   4Ez9mLDjxUtVR7548/H1PWEpMNPpjXRDY/2PAdBzYnaT17QcQLGzngBFY
   w==;
X-CSE-ConnectionGUID: EXkYfaFOQ8CM68gHLdL6Lg==
X-CSE-MsgGUID: m61fvwDXTIio7IEQ5muFJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81195171"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81195171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 08:00:15 -0700
X-CSE-ConnectionGUID: NdS+k7MBRguvIaZ1QeDnyg==
X-CSE-MsgGUID: jYGoq0EuRYGHeBULegPVJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239756897"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 08:00:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUQbC-00000000C9M-2LQh;
	Tue, 02 Jun 2026 15:00:10 +0000
Date: Tue, 02 Jun 2026 22:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:593:29: error: call to undeclared
 function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202606022247.t8JRtx1U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 8be84f679bd497ac2dabc87df9f9a4737f841c0d [290/290] ASoC: soc-dai: remove snd_soc_dai_{set/get}_drvdata()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606022247.t8JRtx1U-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022247.t8JRtx1U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606022247.t8JRtx1U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:593:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     593 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:593:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     593 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:644:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     644 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:644:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     644 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:660:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     660 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:660:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     660 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:748:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     748 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:748:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     748 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:773:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     773 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:773:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     773 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.
--
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:141:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     141 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:141:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     141 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:186:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:186:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     186 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:208:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     208 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:208:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     208 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:253:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     253 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:253:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     253 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   8 errors generated.
--
>> sound/soc/mediatek/mt8196/mt8196-dai-adda.c:412:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     412 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt8196/mt8196-dai-adda.c:412:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     412 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:470:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     470 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:470:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     470 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:660:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     660 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-adda.c:660:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     660 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.
--
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2325:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2325:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    2325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2373:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2373 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:2373:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
    2373 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:397:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     397 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:397:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     397 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:506:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     506 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8196/mt8196-dai-tdm.c:506:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     506 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/snd_soc_dai_get_drvdata +593 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c

0e2f1d39c2bf68 Daniel Golle 2026-04-24  589  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  590  static int mt2701_afe_hdmi_startup(struct snd_pcm_substream *substream,
0e2f1d39c2bf68 Daniel Golle 2026-04-24  591  				   struct snd_soc_dai *dai)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  592  {
0e2f1d39c2bf68 Daniel Golle 2026-04-24 @593  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  594  	struct mt2701_afe_private *afe_priv = afe->platform_priv;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  595  	int ret;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  596  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  597  	if (!afe_priv->hadds2pll_ck || !afe_priv->audio_hdmi_ck) {
0e2f1d39c2bf68 Daniel Golle 2026-04-24  598  		dev_err(afe->dev, "HDMI audio clocks not available\n");
0e2f1d39c2bf68 Daniel Golle 2026-04-24  599  		return -ENODEV;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  600  	}
0e2f1d39c2bf68 Daniel Golle 2026-04-24  601  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  602  	ret = clk_prepare_enable(afe_priv->hadds2pll_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  603  	if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  604  		return ret;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  605  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  606  	ret = clk_prepare_enable(afe_priv->audio_hdmi_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  607  	if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  608  		goto err_hdmi;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  609  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  610  	if (afe_priv->audio_spdf_ck) {
0e2f1d39c2bf68 Daniel Golle 2026-04-24  611  		ret = clk_prepare_enable(afe_priv->audio_spdf_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  612  		if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  613  			goto err_spdf;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  614  	}
0e2f1d39c2bf68 Daniel Golle 2026-04-24  615  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  616  	if (afe_priv->audio_apll_ck) {
0e2f1d39c2bf68 Daniel Golle 2026-04-24  617  		ret = clk_prepare_enable(afe_priv->audio_apll_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  618  		if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  619  			goto err_apll;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  620  	}
0e2f1d39c2bf68 Daniel Golle 2026-04-24  621  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  622  	ret = mt2701_afe_enable_mclk(afe, MT2701_HDMI_I2S_PATH);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  623  	if (ret)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  624  		goto err_mclk;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  625  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  626  	return 0;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  627  
0e2f1d39c2bf68 Daniel Golle 2026-04-24  628  err_mclk:
0e2f1d39c2bf68 Daniel Golle 2026-04-24  629  	if (afe_priv->audio_apll_ck)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  630  		clk_disable_unprepare(afe_priv->audio_apll_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  631  err_apll:
0e2f1d39c2bf68 Daniel Golle 2026-04-24  632  	if (afe_priv->audio_spdf_ck)
0e2f1d39c2bf68 Daniel Golle 2026-04-24  633  		clk_disable_unprepare(afe_priv->audio_spdf_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  634  err_spdf:
0e2f1d39c2bf68 Daniel Golle 2026-04-24  635  	clk_disable_unprepare(afe_priv->audio_hdmi_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  636  err_hdmi:
0e2f1d39c2bf68 Daniel Golle 2026-04-24  637  	clk_disable_unprepare(afe_priv->hadds2pll_ck);
0e2f1d39c2bf68 Daniel Golle 2026-04-24  638  	return ret;
0e2f1d39c2bf68 Daniel Golle 2026-04-24  639  }
0e2f1d39c2bf68 Daniel Golle 2026-04-24  640  

:::::: The code at line 593 was first introduced by commit
:::::: 0e2f1d39c2bf68d181b72ea51ef1e778c04140e4 ASoC: mediatek: mt2701: add HDMI audio memif, FE and BE DAIs

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
