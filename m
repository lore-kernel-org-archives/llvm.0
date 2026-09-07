Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0B64A1E0E;
	Mon,  7 Sep 2026 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789888; cv=none; b=IwphyulOi9SfN/hBYYgoNZeryYRADOiKpczPjEnrx3nM50+Yp5mgCkZ26Bu3ObiTcaorsgmrD0gCkiDq85+kfUswVNwXBIDoIBISW4ix1UZRQlwbDpE8Un6U+6Q7qlDjhPRW7Tjt7UyTKgt4WDN6FQYhQBVXCp4PHKC8SD6EDCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789888; c=relaxed/simple;
	bh=sF6Klnck9ck8iHbWSQpj3wHG65uRxKIeq0BVgVX38WY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kCczQY8AIbExHVGqTL2jUb2110psJwQVH1/rCZ9DFpeLZ87DbsJw+RYwxnDxtHhLe6m5zmJV7IJEshhkg3SoEzKH3VonnSLGRFb9REOy1N078birwamZI0rbd9cmwPCGvRB2tE/EjJbrAtK4xEAABJLsr9H1j+dso9A+FyzRzVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jt6x8jyN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jt6x8jyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788789886; x=1820325886;
  h=date:from:to:cc:subject:message-id;
  bh=sF6Klnck9ck8iHbWSQpj3wHG65uRxKIeq0BVgVX38WY=;
  b=Jt6x8jyNe4qO9OYP+lc0GEcdFASnAorlMlyX6PrRHbJJt4YsoLa4sTip
   9b8YfaOcIUz8roiH0A2U3cRf2mJ7GtAe13a+MeSodSmL4xqJRhUjLUlEL
   qPpW6UTH2myrH1DI1bVs1u3e5I+D2eos0MyqRiQ9tNN+0UztQUWZut5jF
   f2eo2jiRe3nB5KwGdShbeLypfyp1k+1odzNpgg0PLHKzK3WYhilunoDIJ
   7+GJR7st0TyIyqOeGfjZZoOfA+mBhjztjJWdy9anA1k1/BJ/UyAbUF5BN
   g2xcd05H8W1gcaA48r24dzRG7HfaFYp4bSuU/t/JVNKrww1m63n7BqZtT
   g==;
X-CSE-ConnectionGUID: P8eqdsXCTL2UwnnBLuYkVg==
X-CSE-MsgGUID: U6cQsarzQzC/m91B4TWelw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89212677"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89212677"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 07:04:46 -0700
X-CSE-ConnectionGUID: pHGps/2oT0WeEA2byOh+FQ==
X-CSE-MsgGUID: IX1MMMDlTIKEhV66tGemGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="272650981"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2026 07:04:44 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3Zxh-000000000xB-26T4;
	Mon, 07 Sep 2026 14:04:41 +0000
Date: Mon, 07 Sep 2026 22:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 260/343]
 sound/soc/codecs/nau8360.c:826:43: error: incomplete definition of type
 'struct snd_soc_dai'
Message-ID: <202609072135.ZT5K3UDq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: 4f2f1933fcf300aec135d095ab4fc78c3ed70962 [260/343] ASoC: soc-dai: move struct snd_soc_dai to soc-dai.c
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260907/202609072135.ZT5K3UDq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 419c22c908c97dac45d161ce56fa01b99ec7debf)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609072135.ZT5K3UDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609072135.ZT5K3UDq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/nau8360.c:826:43: error: incomplete definition of type 'struct snd_soc_dai'
     826 |         struct snd_soc_component *component = dai->component;
         |                                               ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/codecs/nau8360.c:855:43: error: incomplete definition of type 'struct snd_soc_dai'
     855 |         struct snd_soc_component *component = dai->component;
         |                                               ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/codecs/nau8360.c:871:43: error: incomplete definition of type 'struct snd_soc_dai'
     871 |         struct snd_soc_component *component = dai->component;
         |                                               ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/codecs/nau8360.c:931:43: error: incomplete definition of type 'struct snd_soc_dai'
     931 |         struct snd_soc_component *component = dai->component;
         |                                               ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/codecs/nau8360.c:1172:36: error: incomplete definition of type 'struct snd_soc_dai'
    1172 |         struct snd_soc_component *cp = dai->component;
         |                                        ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   5 errors generated.


vim +826 sound/soc/codecs/nau8360.c

be88847a8bb1a1 Neo Chang 2026-08-25  823  
be88847a8bb1a1 Neo Chang 2026-08-25  824  static int nau8360_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
be88847a8bb1a1 Neo Chang 2026-08-25  825  {
be88847a8bb1a1 Neo Chang 2026-08-25 @826  	struct snd_soc_component *component = dai->component;
be88847a8bb1a1 Neo Chang 2026-08-25  827  	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
be88847a8bb1a1 Neo Chang 2026-08-25  828  	unsigned int i2s_mask = NAU8360_FRAME_START_MASK | NAU8360_RX_OFFSET_MASK;
be88847a8bb1a1 Neo Chang 2026-08-25  829  	unsigned int i2s_fmt = NAU8360_FRAME_START_H2L | NAU8360_RX_OFFSET_I2S;
be88847a8bb1a1 Neo Chang 2026-08-25  830  	int val = 0;
be88847a8bb1a1 Neo Chang 2026-08-25  831  
be88847a8bb1a1 Neo Chang 2026-08-25  832  	flush_work(&nau8360->load_fw_work);
be88847a8bb1a1 Neo Chang 2026-08-25  833  
be88847a8bb1a1 Neo Chang 2026-08-25  834  	if (nau8360_dsp_active(component) && !nau8360->load_fw_done) {
be88847a8bb1a1 Neo Chang 2026-08-25  835  		dev_warn(nau8360->dev, "DSP firmware is not ready yet!");
be88847a8bb1a1 Neo Chang 2026-08-25  836  		return -EBUSY;
be88847a8bb1a1 Neo Chang 2026-08-25  837  	}
be88847a8bb1a1 Neo Chang 2026-08-25  838  
be88847a8bb1a1 Neo Chang 2026-08-25  839  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
be88847a8bb1a1 Neo Chang 2026-08-25  840  		regmap_read(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1, &val);
be88847a8bb1a1 Neo Chang 2026-08-25  841  		if ((val & i2s_mask) == i2s_fmt)
be88847a8bb1a1 Neo Chang 2026-08-25  842  			regmap_update_bits(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1,
be88847a8bb1a1 Neo Chang 2026-08-25  843  				NAU8360_EN_TDM_RX, NAU8360_EN_TDM_RX);
be88847a8bb1a1 Neo Chang 2026-08-25  844  
be88847a8bb1a1 Neo Chang 2026-08-25  845  		if (nau8360_dsp_active(component))
be88847a8bb1a1 Neo Chang 2026-08-25  846  			snd_soc_dapm_enable_pin(nau8360->dapm, "Sense");
be88847a8bb1a1 Neo Chang 2026-08-25  847  	}
be88847a8bb1a1 Neo Chang 2026-08-25  848  
be88847a8bb1a1 Neo Chang 2026-08-25  849  	return 0;
be88847a8bb1a1 Neo Chang 2026-08-25  850  }
be88847a8bb1a1 Neo Chang 2026-08-25  851  

:::::: The code at line 826 was first introduced by commit
:::::: be88847a8bb1a14194cf50116f8909d127861318 ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

:::::: TO: Neo Chang <YLCHANG2@nuvoton.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
