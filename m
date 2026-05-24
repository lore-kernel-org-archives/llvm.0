Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FD714B950;
	Sun, 24 May 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779643098; cv=none; b=uDXIcUTPmSx6Ypjgv9TGLlBiwWnh4eFfs9/GO3rFzO2/dKHcip3EfQ38cF8QhTZ7xIJraIF4sMEekbl03orjKVWKsOvRBx3+pbgvP8IMHLT1T3z9d89a9vJHnH2UXk+28b/E0OpBTN5VElGqShD6MiecUoRzeowCiVIhMjrbTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779643098; c=relaxed/simple;
	bh=cKfZyqUb+ooz9yXsn9gRxF//MQ4PL0McNv4pv0CYgW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CkDplJdarzyPuyETfwo+UVfgHm0Y4xccyhpDcq1Ru5n5NXu7gWR5+zO0MR9/vRANqj9W9FlySnIU+z+zL3EYhvLapeoEZLmzRwBAcCJBeReG+KAI+gF/KnvsthTFKjPI8lF4+YdfOGmDBYfiImiS0AP7iCsEx9wri+iwVnO9Lmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0ClDa7c; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0ClDa7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779643096; x=1811179096;
  h=date:from:to:cc:subject:message-id;
  bh=cKfZyqUb+ooz9yXsn9gRxF//MQ4PL0McNv4pv0CYgW4=;
  b=D0ClDa7cLd+VvSOgIhtxsLcvPEdwjUVAt+REuWSFV4z7q/fQrZZyJ0qF
   SIbVVd38eAbKxhjTdjngDR3uZjYwh9sLiAn5TRwDmfoUmMQ8B1pLSgrXh
   kWBCMWckWqzrnHh17L6ETNqAk1fGog4qkDEtubANchO2KeHaVIwuTY/M2
   QI9OosWQapylH9EO2GL5Ok8luMtW1mlx05K2UoPRXGl1/3j8wWGIz9K/E
   bSwko8vMj0VqU5oxMO6F1z+8dNw/9kIXhJ/vfSgnRFJGfw+M7YIFi6tBw
   SilnUC6/KSUVc9+USEhvTqp71hNpiunbktmiqoZOZJ4S93m2vJ2M7277G
   w==;
X-CSE-ConnectionGUID: UFYC8cvrTiesBxyg4nMsXA==
X-CSE-MsgGUID: a5wSe6bpQj2pEGzyNGIy1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80537038"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="80537038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 10:18:15 -0700
X-CSE-ConnectionGUID: qPLBpJbSRq+ASSXmVbcBjg==
X-CSE-MsgGUID: DwrUVdfLR3ucYNklXiRHCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="241254497"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 May 2026 10:18:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRCSp-000000000Tx-3j8O;
	Sun, 24 May 2026 17:18:11 +0000
Date: Mon, 25 May 2026 01:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22-2 254/254]
 sound/soc/intel/boards/skl_hda_dsp_generic.c:139:6: warning: variable
 'components' is used uninitialized whenever 'if' condition is false
Message-ID: <202605250157.VK6ENTBe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22-2
head:   7f5e6579901e0a1f3ff8bb45002dc226961a56ce
commit: 19418beb583f41aace08e7d737aa27fe155915c0 [254/254] ASoC: intel: sof_*: use snd_soc_card_register()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260525/202605250157.VK6ENTBe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605250157.VK6ENTBe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605250157.VK6ENTBe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/intel/boards/skl_hda_dsp_generic.c:139:6: warning: variable 'components' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     139 |         if (mach->mach_params.dmic_num > 0) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/skl_hda_dsp_generic.c:148:29: note: uninitialized use occurs here
     148 |                                        "hda-dsp", NULL, components);
         |                                                         ^~~~~~~~~~
   sound/soc/intel/boards/skl_hda_dsp_generic.c:139:2: note: remove the 'if' if its condition is always true
     139 |         if (mach->mach_params.dmic_num > 0) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/skl_hda_dsp_generic.c:106:18: note: initialize the variable 'components' to silence this warning
     106 |         char *components;
         |                         ^
         |                          = NULL
   sound/soc/intel/boards/skl_hda_dsp_generic.c:140:31: warning: variable 'card' is uninitialized when used here [-Wuninitialized]
     140 |                 components = devm_kasprintf(card->dev, GFP_KERNEL,
         |                                             ^~~~
   sound/soc/intel/boards/skl_hda_dsp_generic.c:105:27: note: initialize the variable 'card' to silence this warning
     105 |         struct snd_soc_card *card;
         |                                  ^
         |                                   = NULL
   2 warnings generated.


vim +139 sound/soc/intel/boards/skl_hda_dsp_generic.c

86591907527eff Peter Ujfalusi    2025-06-19   99  
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  100  static int skl_hda_audio_probe(struct platform_device *pdev)
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  101  {
a2a0312ac9ee3e Brent Lu          2024-08-27  102  	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
b28b23dea31497 Brent Lu          2024-09-12  103  	struct sof_card_private *ctx;
19418beb583f41 Kuninori Morimoto 2026-05-20  104  	struct snd_soc_card_driver *card_driver;
33e59e50ee7610 Peter Ujfalusi    2024-04-26  105  	struct snd_soc_card *card;
19418beb583f41 Kuninori Morimoto 2026-05-20  106  	char *components;
b28b23dea31497 Brent Lu          2024-09-12  107  	unsigned long board_quirk = skl_hda_get_board_quirk(&mach->mach_params);
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  108  	int ret;
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  109  
19418beb583f41 Kuninori Morimoto 2026-05-20  110  	card_driver = devm_kzalloc(&pdev->dev, sizeof(*card_driver), GFP_KERNEL);
19418beb583f41 Kuninori Morimoto 2026-05-20  111  	if (!card_driver)
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  112  		return -ENOMEM;
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  113  
19418beb583f41 Kuninori Morimoto 2026-05-20  114  	card_driver->fully_routed = true;
19418beb583f41 Kuninori Morimoto 2026-05-20  115  	card_driver->late_probe = skl_hda_card_late_probe;
19418beb583f41 Kuninori Morimoto 2026-05-20  116  	card_driver->add_dai_link = skl_hda_add_dai_link;
33e59e50ee7610 Peter Ujfalusi    2024-04-26  117  
b28b23dea31497 Brent Lu          2024-09-12  118  	dev_dbg(&pdev->dev, "board_quirk = %lx\n", board_quirk);
b28b23dea31497 Brent Lu          2024-09-12  119  
b28b23dea31497 Brent Lu          2024-09-12  120  	/* initialize ctx with board quirk */
b28b23dea31497 Brent Lu          2024-09-12  121  	ctx = sof_intel_board_get_ctx(&pdev->dev, board_quirk);
b28b23dea31497 Brent Lu          2024-09-12  122  	if (!ctx)
b28b23dea31497 Brent Lu          2024-09-12  123  		return -ENOMEM;
b28b23dea31497 Brent Lu          2024-09-12  124  
b28b23dea31497 Brent Lu          2024-09-12  125  	if (HDA_EXT_CODEC(mach->mach_params.codec_mask))
b28b23dea31497 Brent Lu          2024-09-12  126  		ctx->hda_codec_present = true;
ffc6d45d96f07a Kai Vehmanen      2020-07-14  127  
690640ef35a42e Brent Lu          2024-08-27  128  	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
690640ef35a42e Brent Lu          2024-08-27  129  		ctx->hdmi.idisp_codec = true;
690640ef35a42e Brent Lu          2024-08-27  130  
b28b23dea31497 Brent Lu          2024-09-12  131  	ctx->link_order_overwrite = HDA_LINK_ORDER;
b28b23dea31497 Brent Lu          2024-09-12  132  	ctx->link_id_overwrite = HDA_LINK_IDS;
0752ba426a8182 Brent Lu          2024-08-27  133  
b28b23dea31497 Brent Lu          2024-09-12  134  	/* update dai_link */
19418beb583f41 Kuninori Morimoto 2026-05-20  135  	ret = sof_intel_board_set_dai_link(&pdev->dev, card_driver, ctx);
b28b23dea31497 Brent Lu          2024-09-12  136  	if (ret)
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  137  		return ret;
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  138  
8cd9956f61c650 Jaroslav Kysela   2019-12-04 @139  	if (mach->mach_params.dmic_num > 0) {
19418beb583f41 Kuninori Morimoto 2026-05-20  140  		components = devm_kasprintf(card->dev, GFP_KERNEL,
69d0f88b9aebb5 Peter Ujfalusi    2024-04-26  141  						  "cfg-dmics:%d",
69d0f88b9aebb5 Peter Ujfalusi    2024-04-26  142  						  mach->mach_params.dmic_num);
19418beb583f41 Kuninori Morimoto 2026-05-20  143  		if (!components)
69d0f88b9aebb5 Peter Ujfalusi    2024-04-26  144  			return -ENOMEM;
8cd9956f61c650 Jaroslav Kysela   2019-12-04  145  	}
8cd9956f61c650 Jaroslav Kysela   2019-12-04  146  
19418beb583f41 Kuninori Morimoto 2026-05-20  147  	card = devm_snd_soc_card_alloc(&pdev->dev, THIS_MODULE, card_driver,
19418beb583f41 Kuninori Morimoto 2026-05-20  148  				       "hda-dsp", NULL, components);
19418beb583f41 Kuninori Morimoto 2026-05-20  149  	if (!card)
19418beb583f41 Kuninori Morimoto 2026-05-20  150  		return -ENOMEM;
19418beb583f41 Kuninori Morimoto 2026-05-20  151  
19418beb583f41 Kuninori Morimoto 2026-05-20  152  	ret = snd_soc_fixup_dai_links_platform_name(card, mach->mach_params.platform);
b28b23dea31497 Brent Lu          2024-09-12  153  	if (ret)
b28b23dea31497 Brent Lu          2024-09-12  154  		return ret;
b28b23dea31497 Brent Lu          2024-09-12  155  
b28b23dea31497 Brent Lu          2024-09-12  156  	snd_soc_card_set_drvdata(card, ctx);
b28b23dea31497 Brent Lu          2024-09-12  157  
19418beb583f41 Kuninori Morimoto 2026-05-20  158  	ret = devm_snd_soc_card_register(card);
3a24f135e6cc58 Hui Wang          2020-04-09  159  	if (!ret)
33e59e50ee7610 Peter Ujfalusi    2024-04-26  160  		skl_set_hda_codec_autosuspend_delay(card);
3a24f135e6cc58 Hui Wang          2020-04-09  161  
3a24f135e6cc58 Hui Wang          2020-04-09  162  	return ret;
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  163  }
7c33b5f16915a7 Rakesh Ughreja    2018-08-22  164  

:::::: The code at line 139 was first introduced by commit
:::::: 8cd9956f61c65022209ce6d1e55ed12aea12357d ASoC: intel/skl/hda - export number of digital microphones via control components

:::::: TO: Jaroslav Kysela <perex@perex.cz>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
