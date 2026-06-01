Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6ED35C1A1;
	Mon,  1 Jun 2026 19:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341665; cv=none; b=cDx2aHVuIrXSaxW5TvUtCGPe7EZosyYbTN+gar4A0pPvhuUs+gL6bXLFiKlcKUvBoQ5u8wTnfT4DsSE9hygN+X3ZYg9pihFXVk+5ZKRXBpSlVq4JWC13Cf8TbYUv5VVoUrll4H60rPiBQm9knrcHL1CHIlk3BxEOlkUOE8SstL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341665; c=relaxed/simple;
	bh=mCp2yLzZgff8G6L7EK7dF8PSRmguJwd3YspP1CyF9Vc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M2+v7TjIPXrbxtBy+YWmtxHjlUxhQYQ+mwi5Zqt/4k+6wrRThaTdcjTeKl6Ui3gXjYy8TC/hzZvbhz1qf4T+c2OAg2V2tOs5WNRFesYv2zpBCqgyk/N65tyQgqvXgh7ycF05qmZd91UklnBfV9xdMw9+N89Aw22Mqgo8wolpkzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtPAT8Np; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtPAT8Np"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780341664; x=1811877664;
  h=date:from:to:cc:subject:message-id;
  bh=mCp2yLzZgff8G6L7EK7dF8PSRmguJwd3YspP1CyF9Vc=;
  b=XtPAT8NpawpVgZXaDggd5VCJsQv8fsvvlU+J1T+txfZDPCa+MGU6FjDL
   N6iArojgC1Kopqgq5UX9k3o/fL/bKfonigMCIVAaXqenpZhjEwkeRal+u
   RgF+RjRj4NZdZrtU+gVUfA7Z5JjmLDSwr/xBi80G8th3lGwKEssVGK40c
   fGPR+CagJ4FQVBN/sxOYAHBfQHlrc/wIbbHWR/Co3cfw0AYpno5yNLzbn
   vn+/F7jnhc2EOiyExkqZAkHDSZWawgBLFsqxBjj7licSD/7hhjkK8CT2J
   ySu7gwEJZxz5yJRE99KBXehaOWwA4VkMAlxmShBAVvMG0sUakx8ScoM1K
   A==;
X-CSE-ConnectionGUID: BEg3et6YQEqFwyJMvGgI5A==
X-CSE-MsgGUID: vFEsHdBQSzCe/dvqnxViRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81083309"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81083309"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:21:01 -0700
X-CSE-ConnectionGUID: Iclkm0XSTNmEbSSDazNh6A==
X-CSE-MsgGUID: dV0bEQdNTDCt9AgAltqVxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="273943775"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2026 12:21:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU8C1-00000000Azg-38Wk;
	Mon, 01 Jun 2026 19:20:57 +0000
Date: Tue, 02 Jun 2026 03:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt2701/mt2701-wm8960.c:93:37: error: variable has
 incomplete type 'struct snd_soc_card_platform'
Message-ID: <202606020324.E8mr7SGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: ba780c31a4e60755ed798ac2484d34e12441f8de [290/290] ASoC: mediatek: mt2701-wm8960: use snd_soc_card_register()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020324.E8mr7SGm-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020324.E8mr7SGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020324.E8mr7SGm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt2701/mt2701-wm8960.c:93:37: error: variable has incomplete type 'struct snd_soc_card_platform'
      93 | static struct snd_soc_card_platform mt2701_wm8960_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt2701/mt2701-wm8960.c:93:15: note: forward declaration of 'struct snd_soc_card_platform'
      93 | static struct snd_soc_card_platform mt2701_wm8960_card_platform = {
         |               ^
   1 error generated.


vim +93 sound/soc/mediatek/mt2701/mt2701-wm8960.c

    92	
  > 93	static struct snd_soc_card_platform mt2701_wm8960_card_platform = {
    94		.name = "mt2701-wm8960",
    95		.owner = THIS_MODULE,
    96		.driver = {
    97			.dai_link = mt2701_wm8960_dai_links,
    98			.num_links = ARRAY_SIZE(mt2701_wm8960_dai_links),
    99			.controls = mt2701_wm8960_controls,
   100			.num_controls = ARRAY_SIZE(mt2701_wm8960_controls),
   101			.dapm_widgets = mt2701_wm8960_widgets,
   102			.num_dapm_widgets = ARRAY_SIZE(mt2701_wm8960_widgets),
   103		},
   104	};
   105	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
