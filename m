Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EAE37EFEB;
	Fri, 26 Jun 2026 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486839; cv=none; b=Qm+AyaL2/JaRiPJt6roeuBUgFNRoUprFQAX4NQr08xPxthofwTQnE9BXD958MykU9jYrB/RffXegqBKibwQLEooPNN0kxs5xmZrYQKdfIz4q2zA8eYdJx3KvuZARUOVfqTLnBpJlsvxHmPxitQRg6M8OspRLdaGNA3Fm7qcfkLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486839; c=relaxed/simple;
	bh=z4o/HCjNcEplIXMubCeVq4CvjWXSQ1MeitIDVefnBM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B0xW7/3eol4b3kUaUDshsE26mwM9CgZX+Pn2V4DFA+hGC4qpawDHzOwVgbGs1AoPUMNNN+h/21cFO7/FsG9lqRzu++HOJPXzz9kXGgkXEZlFOV38JOClnk5hzxa9TMLIf5PxxepcoKTEYveM3ZVgkPth0L34FeyYsH/DeIEY3DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOHKg2Ld; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOHKg2Ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782486829; x=1814022829;
  h=date:from:to:cc:subject:message-id;
  bh=z4o/HCjNcEplIXMubCeVq4CvjWXSQ1MeitIDVefnBM0=;
  b=QOHKg2Ldb/1m7/CDBBo8/fSExw2a+TfAXFLTrqN2fvr7nw0SGPKfv1Q9
   70cTEj7nmFvqYsH4itR4A+XJFc45RRo7RXauJ0iqL8ZY5yohCKb5ARP2x
   qPZFBYoD83s54CersXm1TSFuDF/XC2Tmgtmp4KigRAcJDT4d0s8DwwHHb
   Gr+gAHZJ4oEHhKUR56mmJQ0/WsyVe/5EPUpYicgyoM8XjOEMF+hb3h75a
   3mc0HEgmpSRGOvTgg4/iru6tWEGvURTqJUdb9ufmbz1MB2mVOsh6Alq2l
   mUQsmVW50gIoyfUHXRd/UrDwUKp/OVenZkCp1cS4/bR1uNhYOUMSozaEY
   A==;
X-CSE-ConnectionGUID: j0pbpptMTZ+5zViGqMcvNg==
X-CSE-MsgGUID: Bitxe8dSQCGdRfmTO2na4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="87126326"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="87126326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 08:13:48 -0700
X-CSE-ConnectionGUID: tsgQCIb9SaqQ8eSuq4v+/w==
X-CSE-MsgGUID: /IzD56TASRyDo2yShEJ77g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jun 2026 08:13:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd8FU-000000005B9-14H6;
	Fri, 26 Jun 2026 15:13:44 +0000
Date: Fri, 26 Jun 2026 23:13:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-26 328/328]
 sound/soc/fsl/mpc5200_dma.c:299:35: error: incomplete definition of type
 'struct snd_soc_card'
Message-ID: <202606262303.4pgfRmts-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-26
head:   3b1a6af55c000fdba23910aeb597cb608b44bed6
commit: 3b1a6af55c000fdba23910aeb597cb608b44bed6 [328/328] SoC: move struct snd_soc_card/snd_soc_card_driver to soc-card.[hc]
config: powerpc-randconfig-001-20260626 (https://download.01.org/0day-ci/archive/20260626/202606262303.4pgfRmts-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606262303.4pgfRmts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606262303.4pgfRmts-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/mpc5200_dma.c:299:35: error: incomplete definition of type 'struct snd_soc_card'
     299 |         struct snd_card *card = rtd->card->snd_card;
         |                                 ~~~~~~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/fsl/mpc5200_dma.c:305:19: error: incomplete definition of type 'struct snd_soc_component'
     305 |         dev_dbg(component->dev, "psc_dma_new(card=%p, dai=%p, pcm=%p)\n",
         |                 ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/fsl/mpc5200_dma.c:317:3: error: field designator 'name' does not refer to any field in type 'const struct snd_soc_component_driver'
     317 |         .name           = DRV_NAME,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +299 sound/soc/fsl/mpc5200_dma.c

89dd08425273773 Jon Smirl         2009-05-23  295  
6d1048bc115259b Kuninori Morimoto 2019-10-02  296  static int psc_dma_new(struct snd_soc_component *component,
6d1048bc115259b Kuninori Morimoto 2019-10-02  297  		       struct snd_soc_pcm_runtime *rtd)
89dd08425273773 Jon Smirl         2009-05-23  298  {
552d1ef6b5a98d7 Liam Girdwood     2011-06-07 @299  	struct snd_card *card = rtd->card->snd_card;
14ec63f678e8bea Kuninori Morimoto 2023-09-11  300  	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
552d1ef6b5a98d7 Liam Girdwood     2011-06-07  301  	struct snd_pcm *pcm = rtd->pcm;
dbcc34756234596 Jon Smirl         2009-05-26  302  	size_t size = psc_dma_hardware.buffer_bytes_max;
c9bd5e690a439df Russell King      2013-06-27  303  	int rc;
89dd08425273773 Jon Smirl         2009-05-23  304  
60bceb8029e26c4 Kuninori Morimoto 2018-01-29  305  	dev_dbg(component->dev, "psc_dma_new(card=%p, dai=%p, pcm=%p)\n",
89dd08425273773 Jon Smirl         2009-05-23  306  		card, dai, pcm);
89dd08425273773 Jon Smirl         2009-05-23  307  
c9bd5e690a439df Russell King      2013-06-27  308  	rc = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
c9bd5e690a439df Russell King      2013-06-27  309  	if (rc)
c9bd5e690a439df Russell King      2013-06-27  310  		return rc;
89dd08425273773 Jon Smirl         2009-05-23  311  
3610a6d1dbd19b3 Takashi Iwai      2021-08-02  312  	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, card->dev,
3610a6d1dbd19b3 Takashi Iwai      2021-08-02  313  					    size);
89dd08425273773 Jon Smirl         2009-05-23  314  }
89dd08425273773 Jon Smirl         2009-05-23  315  

:::::: The code at line 299 was first introduced by commit
:::::: 552d1ef6b5a98d7b95959d5b139071e3c90cebf1 ASoC: core - Optimise and refactor pcm_new() to pass only rtd

:::::: TO: Liam Girdwood <lrg@ti.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
