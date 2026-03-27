Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543E43F54AA;
	Fri, 27 Mar 2026 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622205; cv=none; b=J92/lpTtOaaaNWiiwWQsy5lqdF0yesHqcGSmWISlN7OeMTbIrdVnSK/rElCBI1VdPyUp5inVvCWSIUVk8jQWIouEdbaWJH4jicZaCJIoY6kpvKiEhz0XInGOAkIaXm4jFWT9hcagYtSvjRrFHWqqo7S8l+OdMGH4ifsUu2HXYeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622205; c=relaxed/simple;
	bh=B5exAoQGp5WNxnqYf4AvOne/9Go48BYicoRskxtSHi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XLprK25Oy67Qrez6I47xCUxN2tQbyzDQj/43/7kgNkSOf3LcArZCPbAgjiXNbU9aIvlpIszK1+YnozgmnaSjaG/ejCVa3P028zPDoZNJMfhQtl67V1jOxWeaUuDz3z3IqGtrZ6/E2Om1aSnflGdw0ykPIvRAzPyXiPF7vpdwVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoD5nb4B; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoD5nb4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774622204; x=1806158204;
  h=date:from:to:cc:subject:message-id;
  bh=B5exAoQGp5WNxnqYf4AvOne/9Go48BYicoRskxtSHi8=;
  b=UoD5nb4BtxFjwZUDqh1xhc9FocCtLRkuWKioFbKi9oEyBo/AZZyEMOnu
   rgSdMpaSSx2ys3mlEP+03kYTiuPlL2MIpTpMAmwE6w+BTGHoL44ccA7In
   VL3IFdeoya3+pjnM19HA2JQdwpK2EJKZRfYD6J+YW8787eMQ4+CjY91+n
   Vg7sXQbaVzOGfEJe0iQlofy6xzfs6obQYlfLjLDxQvhCo2wafrnSmuIev
   6nzr8Q/AmGDHA7vaQU+TRD4kQcElplCtbxaI2DLkhBbNR4/4eWLh1Qq/o
   QkIpw93DCR9M6dIJP3JG2IcNgORJOxsE0BPO1P84oQwYASifEoPVJ8Eka
   g==;
X-CSE-ConnectionGUID: bAc1pvubSLKrEEEdDV8QIA==
X-CSE-MsgGUID: dqZN3h8jSqeMf/JtTn2OZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="101155324"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="101155324"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 07:36:42 -0700
X-CSE-ConnectionGUID: ApSmsPF+RPOka1wM5b3m0A==
X-CSE-MsgGUID: 3/wTvwXYQWe/SA35Gbyo9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="230258222"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Mar 2026 07:36:41 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w68Ig-00000000AMl-1xnz;
	Fri, 27 Mar 2026 14:36:38 +0000
Date: Fri, 27 Mar 2026 22:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 102/106]
 sound/soc/pxa/pxa2xx-ac97.c:103:2: error: call to undeclared function
 'snd_soc_dai_set_dma_data'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202603272243.4zzxmUWG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 0d274db4952b307b03194e254479adefe2a1ba25 [102/106] ASoC: soc-dai: remove compatible definition
config: x86_64-buildonly-randconfig-002-20260327 (https://download.01.org/0day-ci/archive/20260327/202603272243.4zzxmUWG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272243.4zzxmUWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603272243.4zzxmUWG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/pxa/pxa2xx-ac97.c:103:2: error: call to undeclared function 'snd_soc_dai_set_dma_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     103 |         snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
         |         ^
   sound/soc/pxa/pxa2xx-ac97.c:118:2: error: call to undeclared function 'snd_soc_dai_set_dma_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     118 |         snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
         |         ^
   sound/soc/pxa/pxa2xx-ac97.c:128:2: error: call to undeclared function 'snd_soc_dai_set_dma_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     128 |         snd_soc_dai_set_dma_data(cpu_dai, substream,
         |         ^
   3 errors generated.


vim +/snd_soc_dai_set_dma_data +103 sound/soc/pxa/pxa2xx-ac97.c

75b41027662e298 Liam Girdwood 2006-10-12   92  
58ceb57ec1be928 Daniel Mack   2015-09-30   93  static int pxa2xx_ac97_hifi_startup(struct snd_pcm_substream *substream,
f0fba2ad1b6b53d Liam Girdwood 2010-03-17   94  				    struct snd_soc_dai *cpu_dai)
75b41027662e298 Liam Girdwood 2006-10-12   95  {
d65a14587a9be85 Daniel Mack   2013-08-12   96  	struct snd_dmaengine_dai_dma_data *dma_data;
75b41027662e298 Liam Girdwood 2006-10-12   97  
75b41027662e298 Liam Girdwood 2006-10-12   98  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
5f712b2b73a9fc8 Daniel Mack   2010-03-22   99  		dma_data = &pxa2xx_ac97_pcm_stereo_out;
75b41027662e298 Liam Girdwood 2006-10-12  100  	else
5f712b2b73a9fc8 Daniel Mack   2010-03-22  101  		dma_data = &pxa2xx_ac97_pcm_stereo_in;
5f712b2b73a9fc8 Daniel Mack   2010-03-22  102  
5f712b2b73a9fc8 Daniel Mack   2010-03-22 @103  	snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
75b41027662e298 Liam Girdwood 2006-10-12  104  
75b41027662e298 Liam Girdwood 2006-10-12  105  	return 0;
75b41027662e298 Liam Girdwood 2006-10-12  106  }
75b41027662e298 Liam Girdwood 2006-10-12  107  

:::::: The code at line 103 was first introduced by commit
:::::: 5f712b2b73a9fc87fcc52124cfe8adefaa0c92f5 ALSA: ASoC: move dma_data from snd_soc_dai to snd_soc_pcm_stream

:::::: TO: Daniel Mack <daniel@caiaq.de>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
