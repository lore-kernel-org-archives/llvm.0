Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79678C9C;
	Fri, 26 Jun 2026 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478231; cv=none; b=emjih/dk3Ylx5G1YVKgOvytnMds1L3B2HJFZG+8KP4BDrORohYNLMbvT0JLZxho4jIov6ya56RTpqueIxVG4tFrq/ApY2l7yg/BPSO59PhCD73M99ArGUZEbggH37eVO3NDXJ+xn9nqcS7/8DLQZxzDbHZcAWJZNvlmw2uB3AgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478231; c=relaxed/simple;
	bh=9DcwqRyLAMTDfL2Is/VA6OFxPa9MKQ9xfBXg/6Xbj0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LTdnoyQ9nfw7d7mao+vkcPe4s2hVKJEImatk9ZL7BuI6KJ//t0xy6GPGAY/pM+MYguVke0WLS5LVYDh6Nq1R+jop4CurkVdYt1zz/HjJFmbVcLfL3/SrRXEYGXFLoI8xhQhFPSTYf5m8hyVAQTiVg2sE+eR9A+67kSZT9LBLLKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTxmRjx0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTxmRjx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782478229; x=1814014229;
  h=date:from:to:cc:subject:message-id;
  bh=9DcwqRyLAMTDfL2Is/VA6OFxPa9MKQ9xfBXg/6Xbj0g=;
  b=jTxmRjx09t8/pxVf1Vhx1AMY//LXZqACGDEykWqv1prwecRQXccNrOW5
   Gab0VEqrEuWe8ZLPb444uFZ3YW8D2mH+SiIRl3k6p9ksC04TEjK5Zvt3U
   w7cGn9JjG2Sn6OYqgv9TdU9fGUjiYkW4m/W1oSe8uEVTmRdizKd4mjk0V
   nlLThRjHSlbkQ0EsLU9NFtQ5yooO9Sm/isQSNJ1aP8LpThCnDJ2S4tjHK
   rxwOPyBtL31Y9kzEwDtMWtbVB2da6K/xwgz5wiybs1cp6qI23tL1pNegQ
   +lWTWjYRqr3G2EgaXFSsCOQYTjivK9o0ps+2BVgRUybhsGuDvfHaXl9Pw
   g==;
X-CSE-ConnectionGUID: FSFV+M9STUGZ7vNxefZ12w==
X-CSE-MsgGUID: UTYiXMXjRn+dEvM03NsIdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="85820656"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="85820656"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 05:50:29 -0700
X-CSE-ConnectionGUID: Mt/KsbRQTyShK1jqHEIbfw==
X-CSE-MsgGUID: 4wHJWcbURiS/ya+/SgiC4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="256218020"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2026 05:50:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd60m-0000000054P-20Dz;
	Fri, 26 Jun 2026 12:50:24 +0000
Date: Fri, 26 Jun 2026 20:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-26 325/328]
 sound/soc/fsl/mpc5200_dma.c:305:19: error: incomplete definition of type
 'struct snd_soc_component'
Message-ID: <202606262024.B3aEpknN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-26
head:   3b1a6af55c000fdba23910aeb597cb608b44bed6
commit: c085b7e7f9341cb11ce08b5cc0cb7d47ecac602b [325/328] ASoC: soc-component: capsuling Component
config: powerpc-randconfig-001-20260626 (https://download.01.org/0day-ci/archive/20260626/202606262024.B3aEpknN-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606262024.B3aEpknN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606262024.B3aEpknN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/mpc5200_dma.c:305:19: error: incomplete definition of type 'struct snd_soc_component'
     305 |         dev_dbg(component->dev, "psc_dma_new(card=%p, dai=%p, pcm=%p)\n",
         |                 ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/fsl/mpc5200_dma.c:317:3: error: field designator 'name' does not refer to any field in type 'const struct snd_soc_component_driver'
     317 |         .name           = DRV_NAME,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +305 sound/soc/fsl/mpc5200_dma.c

89dd0842527377 Jon Smirl         2009-05-23  295  
6d1048bc115259 Kuninori Morimoto 2019-10-02  296  static int psc_dma_new(struct snd_soc_component *component,
6d1048bc115259 Kuninori Morimoto 2019-10-02  297  		       struct snd_soc_pcm_runtime *rtd)
89dd0842527377 Jon Smirl         2009-05-23  298  {
552d1ef6b5a98d Liam Girdwood     2011-06-07  299  	struct snd_card *card = rtd->card->snd_card;
14ec63f678e8be Kuninori Morimoto 2023-09-11  300  	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
552d1ef6b5a98d Liam Girdwood     2011-06-07  301  	struct snd_pcm *pcm = rtd->pcm;
dbcc3475623459 Jon Smirl         2009-05-26  302  	size_t size = psc_dma_hardware.buffer_bytes_max;
c9bd5e690a439d Russell King      2013-06-27  303  	int rc;
89dd0842527377 Jon Smirl         2009-05-23  304  
60bceb8029e26c Kuninori Morimoto 2018-01-29 @305  	dev_dbg(component->dev, "psc_dma_new(card=%p, dai=%p, pcm=%p)\n",
89dd0842527377 Jon Smirl         2009-05-23  306  		card, dai, pcm);
89dd0842527377 Jon Smirl         2009-05-23  307  
c9bd5e690a439d Russell King      2013-06-27  308  	rc = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
c9bd5e690a439d Russell King      2013-06-27  309  	if (rc)
c9bd5e690a439d Russell King      2013-06-27  310  		return rc;
89dd0842527377 Jon Smirl         2009-05-23  311  
3610a6d1dbd19b Takashi Iwai      2021-08-02  312  	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, card->dev,
3610a6d1dbd19b Takashi Iwai      2021-08-02  313  					    size);
89dd0842527377 Jon Smirl         2009-05-23  314  }
89dd0842527377 Jon Smirl         2009-05-23  315  

:::::: The code at line 305 was first introduced by commit
:::::: 60bceb8029e26c49549a276d5d67198cdfb57b5d ASoC: fsl: mpc5200: replace platform to component

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
