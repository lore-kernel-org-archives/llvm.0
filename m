Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DD1DDC2B;
	Fri, 24 Apr 2026 06:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777011645; cv=none; b=mYJvypcaAucH14Cgg6b77R5mo3Zq2Tha28lBWF+FKQ59uijlJ4PNsWUkU1fzm99FOvaFPb1MJ/6sLrqGLhYfuFU8KE8MnYXBomfu7jEdiatFTbTKX104zaqdd45q44kDZU8XER8nyqzfBkGJCO/z4IsN3QlwWsHsaco6w3IVx+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777011645; c=relaxed/simple;
	bh=rEs+bxnue3b5W5zjkHRcygFVRRpJRsmuT0X/Jx/8Py8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=afO9bPAG93n1l8Ro4HEHRZF8FAilrdTQkKFKK6ntA7crVWwTuqQb9cFhSMBlXH1CIYFkR8Gd1t2QNAHohTnVbdT1WZ7hUG6pxknS/HE5K+9U6nJ55IGUGkF9w1SJ6cV4ozvH5Y6XeY0jkHayDb5XIj3a1hQ/k13o6c27MTLrIkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQAHb6cN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQAHb6cN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777011644; x=1808547644;
  h=date:from:to:cc:subject:message-id;
  bh=rEs+bxnue3b5W5zjkHRcygFVRRpJRsmuT0X/Jx/8Py8=;
  b=GQAHb6cN8zC1OBJLsEe9qz05UI/EgOX5uvUmLKmGNMAS/wX/bu5gyu2r
   KKAnvO0hnI2zpJYgHZQc/dKYUxugtgmZKwInhiiXEt1azzHu5Pm3xSoXs
   vdtB9w5Y8SJzr2++HpYgeCadALxkxtRdM/lJKdafUrk5/xPQA1KVaeZPL
   2v2abCHLNXaMsO+9ldH6aUUIiUIGoqU8R+Eg+5riYLupWf4KYWwrdQMrq
   GpV53fiJhPCM/aAbrm9UFH5Fu9omd7aSYmHzzZyNzHvz/YgQRB6FIBSbX
   OUez0cwKG7iGbg/6xzQCpprScbQuW24AHXKfTOnW1WGMkMkAKk0AT3U8i
   g==;
X-CSE-ConnectionGUID: 3NQOD6lyTC+ejhWGGXJGjw==
X-CSE-MsgGUID: thkhApZFQzaEHq/6ke1Xuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89072296"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89072296"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 23:20:43 -0700
X-CSE-ConnectionGUID: vnoTiBNHRlSnx5E39LkVkw==
X-CSE-MsgGUID: Hg6NJzrORJ+yBJCqln0twA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="230203403"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Apr 2026 23:20:41 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wG9u3-000000005JF-1Km0;
	Fri, 24 Apr 2026 06:20:39 +0000
Date: Fri, 24 Apr 2026 14:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-20-2 147/147]
 sound/soc/codecs/88pm860x-codec.c:1229:52: error: incomplete definition of
 type 'struct snd_soc_component'
Message-ID: <202604241453.bSDCnoJH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-20-2
head:   1604ab9b37c0f7145cc187f24e3aca5b4e318eb1
commit: 1604ab9b37c0f7145cc187f24e3aca5b4e318eb1 [147/147] move soc-component
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260424/202604241453.bSDCnoJH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241453.bSDCnoJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241453.bSDCnoJH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/88pm860x-codec.c:1229:52: error: incomplete definition of type 'struct snd_soc_component'
    1229 |                 trace_snd_soc_jack_irq(dev_name(pm860x->component->dev));
         |                                                 ~~~~~~~~~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   1 error generated.


vim +1229 sound/soc/codecs/88pm860x-codec.c

f213f4b5177740 Haojian Zhuang    2010-08-19  1213  
5783994b9afa8d Kuninori Morimoto 2018-01-29  1214  static irqreturn_t pm860x_component_handler(int irq, void *data)
f213f4b5177740 Haojian Zhuang    2010-08-19  1215  {
f213f4b5177740 Haojian Zhuang    2010-08-19  1216  	struct pm860x_priv *pm860x = data;
abc495582a3f01 Kuninori Morimoto 2026-04-09  1217  	struct device *dev = snd_soc_component_to_dev(pm860x->component);
f213f4b5177740 Haojian Zhuang    2010-08-19  1218  	int status, shrt, report = 0, mic_report = 0;
f213f4b5177740 Haojian Zhuang    2010-08-19  1219  	int mask;
f213f4b5177740 Haojian Zhuang    2010-08-19  1220  
f213f4b5177740 Haojian Zhuang    2010-08-19  1221  	status = pm860x_reg_read(pm860x->i2c, REG_STATUS_1);
f213f4b5177740 Haojian Zhuang    2010-08-19  1222  	shrt = pm860x_reg_read(pm860x->i2c, REG_SHORTS);
f213f4b5177740 Haojian Zhuang    2010-08-19  1223  	mask = pm860x->det.hs_shrt | pm860x->det.hook_det | pm860x->det.lo_shrt
f213f4b5177740 Haojian Zhuang    2010-08-19  1224  		| pm860x->det.hp_det;
f213f4b5177740 Haojian Zhuang    2010-08-19  1225  
7116f452c8e3e3 Mark Brown        2010-12-29  1226  #ifndef CONFIG_SND_SOC_88PM860X_MODULE
1c9e9795b5e234 Mark Brown        2010-12-05  1227  	if (status & (HEADSET_STATUS | MIC_STATUS | SHORT_HS1 | SHORT_HS2 |
1c9e9795b5e234 Mark Brown        2010-12-05  1228  		      SHORT_LO1 | SHORT_LO2))
5783994b9afa8d Kuninori Morimoto 2018-01-29 @1229  		trace_snd_soc_jack_irq(dev_name(pm860x->component->dev));
1435b9402fe0fb Mark Brown        2010-12-23  1230  #endif
1c9e9795b5e234 Mark Brown        2010-12-05  1231  
f213f4b5177740 Haojian Zhuang    2010-08-19  1232  	if ((pm860x->det.hp_det & SND_JACK_HEADPHONE)
f213f4b5177740 Haojian Zhuang    2010-08-19  1233  		&& (status & HEADSET_STATUS))
f213f4b5177740 Haojian Zhuang    2010-08-19  1234  		report |= SND_JACK_HEADPHONE;
f213f4b5177740 Haojian Zhuang    2010-08-19  1235  
f213f4b5177740 Haojian Zhuang    2010-08-19  1236  	if ((pm860x->det.mic_det & SND_JACK_MICROPHONE)
f213f4b5177740 Haojian Zhuang    2010-08-19  1237  		&& (status & MIC_STATUS))
f213f4b5177740 Haojian Zhuang    2010-08-19  1238  		mic_report |= SND_JACK_MICROPHONE;
f213f4b5177740 Haojian Zhuang    2010-08-19  1239  
f213f4b5177740 Haojian Zhuang    2010-08-19  1240  	if (pm860x->det.hs_shrt && (shrt & (SHORT_HS1 | SHORT_HS2)))
f213f4b5177740 Haojian Zhuang    2010-08-19  1241  		report |= pm860x->det.hs_shrt;
f213f4b5177740 Haojian Zhuang    2010-08-19  1242  
f213f4b5177740 Haojian Zhuang    2010-08-19  1243  	if (pm860x->det.hook_det && (status & HOOK_STATUS))
f213f4b5177740 Haojian Zhuang    2010-08-19  1244  		report |= pm860x->det.hook_det;
f213f4b5177740 Haojian Zhuang    2010-08-19  1245  
f213f4b5177740 Haojian Zhuang    2010-08-19  1246  	if (pm860x->det.lo_shrt && (shrt & (SHORT_LO1 | SHORT_LO2)))
f213f4b5177740 Haojian Zhuang    2010-08-19  1247  		report |= pm860x->det.lo_shrt;
f213f4b5177740 Haojian Zhuang    2010-08-19  1248  
f213f4b5177740 Haojian Zhuang    2010-08-19  1249  	if (report)
f213f4b5177740 Haojian Zhuang    2010-08-19  1250  		snd_soc_jack_report(pm860x->det.hp_jack, report, mask);
f213f4b5177740 Haojian Zhuang    2010-08-19  1251  	if (mic_report)
f213f4b5177740 Haojian Zhuang    2010-08-19  1252  		snd_soc_jack_report(pm860x->det.mic_jack, SND_JACK_MICROPHONE,
f213f4b5177740 Haojian Zhuang    2010-08-19  1253  				    SND_JACK_MICROPHONE);
f213f4b5177740 Haojian Zhuang    2010-08-19  1254  
abc495582a3f01 Kuninori Morimoto 2026-04-09  1255  	dev_dbg(dev, "headphone report:0x%x, mask:%x\n", report, mask);
abc495582a3f01 Kuninori Morimoto 2026-04-09  1256  	dev_dbg(dev, "microphone report:0x%x\n", mic_report);
f213f4b5177740 Haojian Zhuang    2010-08-19  1257  	return IRQ_HANDLED;
f213f4b5177740 Haojian Zhuang    2010-08-19  1258  }
f213f4b5177740 Haojian Zhuang    2010-08-19  1259  

:::::: The code at line 1229 was first introduced by commit
:::::: 5783994b9afa8d37e9766b3cfbb594c1ae26087c ASoC: 88pm860x: replace codec to component

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
