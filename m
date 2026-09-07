Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF52282F15;
	Mon,  7 Sep 2026 21:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817064; cv=none; b=VQqLkGf4ZiuiiyX50C2DZJ5AcPK5xHU07hHIJa4Oy701TnMUlQ+pSDdxP8LY/pacs82lRHT03GlNLI57gjZenZjbwJ5F/QR/iaBrqAvU+fEb+OAoN+QNum533IFshHoVsYjTrZAbkaU64w+1o+03NqwRGyu4i0cnm7WRU3c4ZlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817064; c=relaxed/simple;
	bh=NzfdWemez+N6A+/fohc8Gu5ViOBIcVvfo0ttR/7uPX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YxYbOE7LTKt7W2jx+VFDzLn1P9Vxv/sAgj5VR3LAIadg63wB7GndCXLfjQPKuBcaMBU3m+dRtZsonGWHbrWVXR8uf5dEzfAEBTQMDBwyElgVm/glw2/JQ9gaQp2c6fPED97BJN74DbNicPUu/LHW1+myuxyKKtHc2RM6DqDCer8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzrT8MEn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzrT8MEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788817062; x=1820353062;
  h=date:from:to:cc:subject:message-id;
  bh=NzfdWemez+N6A+/fohc8Gu5ViOBIcVvfo0ttR/7uPX4=;
  b=QzrT8MEntRZbXp/vxdm+5bU8kjAWyRFb05q2KdZW4DNw4K0H6wBpY6JH
   O524vlw7PbWB5s7+9x5+GaSXdPoe3kPwuRH/KJc79vIDkN7s7XrTiVau/
   WdSwRsLdBbcs52K96Tz/bhaINdftOLu5aUmU7gtItsPBp2SdOMODFRN18
   EWQ0iG4YLDE0uwHNGjvTirKbtXY/3QP2/RGuD7bgki7Kz07zavjBMqxI4
   JypyO2APigHcLlu9LFShX3mYr1pGcZOssEOUHL6zPcGlKxtWzjIkCllr9
   5pawrKygBc9NnUMUmi1wMVzAPcnFn4KwW3n6U8jVh8XyOodg3tI2LEoJa
   g==;
X-CSE-ConnectionGUID: QhZatV8zQ0+vXh4TvGdu3g==
X-CSE-MsgGUID: OgORPv5cT2GhcA4XClPF0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89342024"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89342024"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 14:37:42 -0700
X-CSE-ConnectionGUID: 1xLdSV2XRdCFKB+AQgfljw==
X-CSE-MsgGUID: LTkqG/n6ReKMleBebIbVrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267122463"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Sep 2026 14:37:40 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3h21-000000001L5-3hyV;
	Mon, 07 Sep 2026 21:37:37 +0000
Date: Tue, 08 Sep 2026 05:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 261/343]
 sound/soc/codecs/nau8360.c:362:28: error: call to undeclared function
 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609080533.rGIMS07j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: 2ec5bcc4a0d57a7db5c121ab6e10d602373d1f0e [261/343] ASoC: soc-component: remove snd_soc_component_{set/get}_drvdata()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609080533.rGIMS07j-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 419c22c908c97dac45d161ce56fa01b99ec7debf)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080533.rGIMS07j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080533.rGIMS07j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/nau8360.c:362:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     362 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
>> sound/soc/codecs/nau8360.c:362:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     362 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c:409:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     409 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360.c:409:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     409 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c:452:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     452 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360.c:452:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     452 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c:688:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     688 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^
   sound/soc/codecs/nau8360.c:688:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     688 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c:712:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     712 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^
   sound/soc/codecs/nau8360.c:712:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     712 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c:826:43: error: incomplete definition of type 'struct snd_soc_dai'
     826 |         struct snd_soc_component *component = dai->component;
         |                                               ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/codecs/nau8360.c:827:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     827 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^
   sound/soc/codecs/nau8360.c:827:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     827 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c:855:43: error: incomplete definition of type 'struct snd_soc_dai'
     855 |         struct snd_soc_component *component = dai->component;
         |                                               ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/codecs/nau8360.c:856:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     856 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^
   sound/soc/codecs/nau8360.c:856:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     856 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360.c:871:43: error: incomplete definition of type 'struct snd_soc_dai'
     871 |         struct snd_soc_component *component = dai->component;
         |                                               ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/codecs/nau8360.c:872:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     872 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                                   ^
   sound/soc/codecs/nau8360.c:872:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     872 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> sound/soc/codecs/nau8360-dsp.c:117:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
>> sound/soc/codecs/nau8360-dsp.c:117:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     117 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:266:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:266:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     266 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:296:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     296 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:296:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     296 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:336:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     336 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:336:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     336 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:534:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     534 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:534:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     534 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:562:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     562 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:562:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     562 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:601:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     601 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:601:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     601 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/nau8360-dsp.c:615:28: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     615 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                                   ^
   sound/soc/codecs/nau8360-dsp.c:615:18: error: incompatible integer to pointer conversion initializing 'struct nau8360 *' with an expression of type 'int' [-Wint-conversion]
     615 |         struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   16 errors generated.


vim +/snd_soc_component_get_drvdata +362 sound/soc/codecs/nau8360.c

be88847a8bb1a1 Neo Chang 2026-08-25  357  
be88847a8bb1a1 Neo Chang 2026-08-25  358  static int nau8360_anc_put(struct snd_kcontrol *kcontrol,
be88847a8bb1a1 Neo Chang 2026-08-25  359  	struct snd_ctl_elem_value *ucontrol)
be88847a8bb1a1 Neo Chang 2026-08-25  360  {
be88847a8bb1a1 Neo Chang 2026-08-25  361  	struct snd_soc_component *cp = snd_kcontrol_chip(kcontrol);
be88847a8bb1a1 Neo Chang 2026-08-25 @362  	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
be88847a8bb1a1 Neo Chang 2026-08-25  363  	int ret, value = NAU8360_PEQ_BAND_8;
be88847a8bb1a1 Neo Chang 2026-08-25  364  
be88847a8bb1a1 Neo Chang 2026-08-25  365  	mutex_lock(&nau8360->lock);
be88847a8bb1a1 Neo Chang 2026-08-25  366  
be88847a8bb1a1 Neo Chang 2026-08-25  367  	ret = snd_soc_put_volsw(kcontrol, ucontrol);
be88847a8bb1a1 Neo Chang 2026-08-25  368  	/* update anc flag if return value 1 and register value changed */
be88847a8bb1a1 Neo Chang 2026-08-25  369  	if (ret != 1)
be88847a8bb1a1 Neo Chang 2026-08-25  370  		goto unlock;
be88847a8bb1a1 Neo Chang 2026-08-25  371  
be88847a8bb1a1 Neo Chang 2026-08-25  372  	nau8360->anc_enable = ucontrol->value.integer.value[0];
be88847a8bb1a1 Neo Chang 2026-08-25  373  	if (nau8360_dsp_active(cp))
be88847a8bb1a1 Neo Chang 2026-08-25  374  		value = nau8360->anc_enable ? NAU8360_PEQ_BAND_15 : NAU8360_PEQ_BAND_12;
be88847a8bb1a1 Neo Chang 2026-08-25  375  	regmap_update_bits(nau8360->regmap, NAU8360_R9D_PEQ_CTL, NAU8360_PEQ_BAND_MASK,
be88847a8bb1a1 Neo Chang 2026-08-25  376  		value << NAU8360_PEQ_BAND_SFT);
be88847a8bb1a1 Neo Chang 2026-08-25  377  
be88847a8bb1a1 Neo Chang 2026-08-25  378  unlock:
be88847a8bb1a1 Neo Chang 2026-08-25  379  	mutex_unlock(&nau8360->lock);
be88847a8bb1a1 Neo Chang 2026-08-25  380  
be88847a8bb1a1 Neo Chang 2026-08-25  381  	return ret;
be88847a8bb1a1 Neo Chang 2026-08-25  382  }
be88847a8bb1a1 Neo Chang 2026-08-25  383  

:::::: The code at line 362 was first introduced by commit
:::::: be88847a8bb1a14194cf50116f8909d127861318 ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

:::::: TO: Neo Chang <YLCHANG2@nuvoton.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
