Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA098460;
	Tue,  2 Dec 2025 05:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764652861; cv=none; b=DTyTjGojJBRoLuErjYO9lgiCzrgtKUZBAVR6T0TmCZZK87V3claUnn1+6XoNVBUdQs7iFtrk/NmcHFScOh6NJaUIiS/7r+s3fxVqk+3KAa33tqaKEvmHhhHL9BK14FsJ+vR904JIPmMRZEJo6s+3tVYQ2uVNTQ/CEoy57U8V3eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764652861; c=relaxed/simple;
	bh=TrsiHmkhIUFBoupzjEJ72BEcfrXZ5o8pDPL1Jg0VIQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XRe8823rbPnamdhi8HIbbQCR8sUE+GN6/YjjXPDPrFslq3wqb9yPTyY6CsNhrfLxevXsJn7HvnT13lDFJ01AFJdIJvXn6T0Hm8ExQ27rp1Msx5sldJghFD9KT/1XjKJbLhez10DM9y1oBm3JMaNzA4rpEMs4pzTZVmoMhWgwR9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5JEQdVI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5JEQdVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764652860; x=1796188860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TrsiHmkhIUFBoupzjEJ72BEcfrXZ5o8pDPL1Jg0VIQg=;
  b=H5JEQdVIssgKz3P0ma2q60Vm2TIeSQf4BUDofRA8QJ4y/uSk1gKNAjk0
   7FVmLa0C6X4JN5Q4YG//0cnv/g3HfCxrj/IWQMtLpSjp83i04OZyNkdNz
   81ekO9FazpkjoVMCOEKrO4Ov56Dyom384TuT9n8eyTv5ZCtMBIMQUftY1
   BqU0PaI82u4Z3gBF3sUozTl/r0Gu+DyG89lBzeJ09BcfvbrW3QSO9K1yV
   ueKxMcTzp9Hl4JTwxbD7lanUyM53bomoweHyAv1CFPWRfRYfzccwDVZ95
   6dfhtvt5X+r96y+gJs5JZWj6x1y7iTKOUAR1pbtNkjFMNE7SrTSR9xTLM
   A==;
X-CSE-ConnectionGUID: DC9sdiMrRv62720zG6C+QQ==
X-CSE-MsgGUID: PpaPKoNwTw+KUCullphgSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76929608"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="76929608"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 21:20:58 -0800
X-CSE-ConnectionGUID: lSaAhxqHTuiRq40zAWgVWw==
X-CSE-MsgGUID: wS49jXBxQo2+mNtOfRz9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="199397331"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Dec 2025 21:20:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQIoo-000000009Qr-3qkc;
	Tue, 02 Dec 2025 05:20:54 +0000
Date: Tue, 2 Dec 2025 13:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-01 5/13]
 sound/soc/mediatek/mt8189/mt8189-nau8825.c:347:34: error: incompatible
 pointer types passing 'struct snd_soc_dapm_context **' to parameter of type
 'struct snd_soc_dapm_context *'; remove &
Message-ID: <202512021328.U7z2nhVN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-01
head:   a5568a9bacc493dbb1465f3b850acf8595553013
commit: 80cf25a8c974d41d5dec39864570b0e1a3b3b997 [5/13] ASoC: soc-dapm: add snd_soc_dapm_alloc()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512021328.U7z2nhVN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021328.U7z2nhVN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021328.U7z2nhVN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8189/mt8189-nau8825.c:347:34: error: incompatible pointer types passing 'struct snd_soc_dapm_context **' to parameter of type 'struct snd_soc_dapm_context *'; remove & [-Werror,-Wincompatible-pointer-types]
     347 |         ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_dumb_spk_widgets,
         |                                         ^~~~~~~~~~~
   include/sound/soc-dapm.h:648:60: note: passing argument to parameter 'dapm' here
     648 | int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
         |                                                            ^
   sound/soc/mediatek/mt8189/mt8189-nau8825.c:424:34: error: incompatible pointer types passing 'struct snd_soc_dapm_context **' to parameter of type 'struct snd_soc_dapm_context *'; remove & [-Werror,-Wincompatible-pointer-types]
     424 |         ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_headset_widgets,
         |                                         ^~~~~~~~~~~
   include/sound/soc-dapm.h:648:60: note: passing argument to parameter 'dapm' here
     648 | int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
         |                                                            ^
   2 errors generated.


vim +347 sound/soc/mediatek/mt8189/mt8189-nau8825.c

d218ea171430e4 Cyril Chao 2025-10-31  341  
d218ea171430e4 Cyril Chao 2025-10-31  342  static int mt8189_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
d218ea171430e4 Cyril Chao 2025-10-31  343  {
d218ea171430e4 Cyril Chao 2025-10-31  344  	struct snd_soc_card *card = rtd->card;
d218ea171430e4 Cyril Chao 2025-10-31  345  	int ret;
d218ea171430e4 Cyril Chao 2025-10-31  346  
d218ea171430e4 Cyril Chao 2025-10-31 @347  	ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_dumb_spk_widgets,
d218ea171430e4 Cyril Chao 2025-10-31  348  					ARRAY_SIZE(mt8189_dumb_spk_widgets));
d218ea171430e4 Cyril Chao 2025-10-31  349  	if (ret) {
d218ea171430e4 Cyril Chao 2025-10-31  350  		dev_err(rtd->dev, "unable to add Dumb Speaker dapm, ret %d\n", ret);
d218ea171430e4 Cyril Chao 2025-10-31  351  		return ret;
d218ea171430e4 Cyril Chao 2025-10-31  352  	}
d218ea171430e4 Cyril Chao 2025-10-31  353  
d218ea171430e4 Cyril Chao 2025-10-31  354  	ret = snd_soc_add_card_controls(card, mt8189_dumb_spk_controls,
d218ea171430e4 Cyril Chao 2025-10-31  355  					ARRAY_SIZE(mt8189_dumb_spk_controls));
d218ea171430e4 Cyril Chao 2025-10-31  356  	if (ret) {
d218ea171430e4 Cyril Chao 2025-10-31  357  		dev_err(rtd->dev, "unable to add Dumb card controls, ret %d\n", ret);
d218ea171430e4 Cyril Chao 2025-10-31  358  		return ret;
d218ea171430e4 Cyril Chao 2025-10-31  359  	}
d218ea171430e4 Cyril Chao 2025-10-31  360  
d218ea171430e4 Cyril Chao 2025-10-31  361  	return 0;
d218ea171430e4 Cyril Chao 2025-10-31  362  }
d218ea171430e4 Cyril Chao 2025-10-31  363  

:::::: The code at line 347 was first introduced by commit
:::::: d218ea171430e49412804efb794942dd121a8032 ASoC: mediatek: mt8189: add machine driver with nau8825

:::::: TO: Cyril Chao <Cyril.Chao@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
