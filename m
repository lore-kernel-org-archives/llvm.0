Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9AC2FB987;
	Thu,  4 Dec 2025 23:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764889843; cv=none; b=DkME7M4WCuwA7ujRJiIDtAa4PyICd1YwG3KHGG2jnisKcEIPU65uZkWPaL1opMTCYKmylqnig7JxpnE4KoZUxLOYYfgKVYydJojW+LHUrD/2XV4VWCyry/fe0PKUIYenJiF4W+PqFOBeoCP+w51JtNGSMVgdi+Y25QM0atrI0Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764889843; c=relaxed/simple;
	bh=l6BJNjL0b3LJV5mLRw76/rQzyPwGMkQVTUX2LbpAOR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bTBCTV4VQgYiNab3MJTfWtB4sDAG7M+axk6GWtmjJQhSPGoFwSZ/IMaqghMeQnI0x53mHWk+m7UHta2YjGLqidPe2hk6bEufNZv52aB1y0QUTE34CQ1zGAI9Z9eswzMtkdSjG2xYrPooR7nwZY7drWwjbsRnWTUIjRjl4e78fMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wz3cM1IW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wz3cM1IW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764889842; x=1796425842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l6BJNjL0b3LJV5mLRw76/rQzyPwGMkQVTUX2LbpAOR8=;
  b=Wz3cM1IWZcJe2nJHf3SYPjJsBMuCD7tyI/MLI33YjC3f0c/LXQmp7vFA
   dRsBmYfIm09OOL5AlpuksJ3Cc97tVebJkJfX4p3rDnHBtoXAJiQvbJCaE
   75e+ScBFhz6zbQsokVOMeBoAhk0o7mq6EFgNqCt3Xi7ChZbQj9vWnJER2
   GmGlmcmkMEpKW1VuippV2NuifDDeYeYjt4PMXYsndM/1xoQ+zuaOm3LEC
   fOEsUm/nr4gIePla/zswd3hwUS+xGhOsoMDQW3kvBpQEoKzLk8vlvB7GP
   41vAcf5EX1qOy2z21c89E0Kd0kCmZfrDY4AETL9/bS+eEhLz6UTjY2TG1
   w==;
X-CSE-ConnectionGUID: A7Fsq5bcSKur6D1gHjrIxQ==
X-CSE-MsgGUID: 8SFPfcdGSUqdBbK5VMbC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66965807"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="66965807"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:10:41 -0800
X-CSE-ConnectionGUID: Cx9i6rjITBalqoJltoRBxA==
X-CSE-MsgGUID: m7du5gSPSUeKf35m9lmhaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="200075960"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Dec 2025 15:10:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRIT8-00000000EL3-1eDv;
	Thu, 04 Dec 2025 23:10:38 +0000
Date: Fri, 5 Dec 2025 07:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-04 17/18]
 sound/soc/codecs/wm8804.c:522:2: error: member reference base type 'int
 (struct snd_soc_dai *, int, int, unsigned int, unsigned int)' is not a
 structure or union
Message-ID: <202512050753.jzKkAX1U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-04
head:   fb4e3e737845904b992450d498c56ca30359bb87
commit: 262df0b88156ac882137cf936a09df668c275f0a [17/18] hoge
config: x86_64-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512050753.jzKkAX1U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050753.jzKkAX1U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050753.jzKkAX1U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/wm8804.c:522:2: error: member reference base type 'int (struct snd_soc_dai *, int, int, unsigned int, unsigned int)' is not a structure or union
     521 |         .set_pll = wm8804_set_pll
         |                    ~~~~~~~~~~~~~~
     522 |         .auto_selectable_formats = &wm8804_selectable_formats,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +522 sound/soc/codecs/wm8804.c

   504	
   505	static const u64 wm8804_selectable_formats =
   506		SND_SOC_POSSIBLE_DAIFMT_I2S	|
   507		SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
   508		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
   509		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
   510		SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
   511		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
   512		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
   513		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
   514		SND_SOC_POSSIBLE_DAIFMT_IB_IF;
   515	
   516	static const struct snd_soc_dai_ops wm8804_dai_ops = {
   517		.hw_params = wm8804_hw_params,
   518		.set_fmt = wm8804_set_fmt,
   519		.set_sysclk = wm8804_set_sysclk,
   520		.set_clkdiv = wm8804_set_clkdiv,
   521		.set_pll = wm8804_set_pll
 > 522		.auto_selectable_formats = &wm8804_selectable_formats,
   523		.num_auto_selectable_formats = 1,
   524	};
   525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
