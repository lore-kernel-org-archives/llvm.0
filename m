Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B951F2BE65B;
	Tue,  2 Jun 2026 01:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780363276; cv=none; b=r1DEE2nHHZxvSYEKMSQoKDdsSKnKgHgH2cvXhg4Cd5s/Jf029seKHPJJ9gKpnJuITot4IRx2hiFZh6Lo62vxm1SPde3ygzg+12Fq657JISw02MS0vfav8+s+GcoMYIA+wHGszG6Pg8vZ+I5j8RPUdlumzn4nKSRMrugbUw9ISy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780363276; c=relaxed/simple;
	bh=ZMz3oVIJAtWdb5W2yNhVHB/nar9Pk2YF+2Mf6nzV5qk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mu7sN/yw6JFSDIll3YUQaP9yDkkMS/wdqsU2tpl7h1E2pM5T2vNG+EG74qym/PF899iHuW30VSayqPR7mTx3G+Snuxl5aSz18+m3zXQt6Ctg5loyLm80Jbj8P9VriLdKZr1Z4SsTqLnvX1fabdVEJtJuJXrXIvhRx/Kepya4W6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKb/mq1l; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKb/mq1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780363275; x=1811899275;
  h=date:from:to:cc:subject:message-id;
  bh=ZMz3oVIJAtWdb5W2yNhVHB/nar9Pk2YF+2Mf6nzV5qk=;
  b=ZKb/mq1lSYKassYabSSHETrPvSGMF2/UElrvUaDGY8zd/sh2JAsTT+G3
   Ly8MEgmR3TMLT+drGwBz+oKeFQXWElfpxYisX+2OCM/2BxP389JlmcQwu
   qvehEi1sdEu4/SeWWy3VrNci6HkHMGMQmRF6ubPKz7DlbuCAnIRCoTLfH
   yykPIOZMi/N2FKVTR8lIEZpMb7CB4sqgOhC7wxIxe/GdeOM5bZySO+dKE
   uiZNricJrdD9w9xVYJpu9mJrjxjCMDFsHGJej0wfbx6nYTYPXBE6ogHkT
   2An/ys6pIg/CN4XOGiOyhbhl+bG9gQkCtYyK/zIPE8hL/rqCvSsmJZnQC
   g==;
X-CSE-ConnectionGUID: BG8S/Cb4RSGNEe9vCIi0hw==
X-CSE-MsgGUID: K72MjyYwStiwPe8Ur+VCcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81244080"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81244080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 18:21:14 -0700
X-CSE-ConnectionGUID: njtYcgTsSSi1MSpZhk/R1Q==
X-CSE-MsgGUID: vhzuJ4/kQlmwe6iasXa++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="248663907"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jun 2026 18:21:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUDob-00000000BJg-1XHU;
	Tue, 02 Jun 2026 01:21:09 +0000
Date: Tue, 02 Jun 2026 09:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/intel/avs/boards/da7219.c:258:51: error: too many arguments to
 function call, expected 2, have 6
Message-ID: <202606020916.d04GsrFo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 9842bcbc05c7e22a482b3ecd12ece4c3bd05b934 [290/290] ASoC: intel: avs: da7219: use snd_soc_card_register()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260602/202606020916.d04GsrFo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020916.d04GsrFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020916.d04GsrFo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/avs/boards/da7219.c:258:51: error: too many arguments to function call, expected 2, have 6
     258 |         card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
         |                ~~~~~~~~~~~~~~~~~~~~~~~                   ^~~~~~~~~~~~
     259 |                                        card_name, card_long_name, NULL);
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: 'devm_snd_soc_card_alloc' declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^                       ~~~~~~~~~~~~~~~~~~~
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +258 sound/soc/intel/avs/boards/da7219.c

   210	
   211	static int avs_da7219_probe(struct platform_device *pdev)
   212	{
   213		struct snd_soc_dai_link *dai_link;
   214		struct snd_soc_acpi_mach *mach;
   215		struct avs_mach_pdata *pdata;
   216		struct snd_soc_card *card;
   217		struct snd_soc_card_driver *card_driver;
   218		struct snd_soc_jack *jack;
   219		struct device *dev = &pdev->dev;
   220		const char *card_name = NULL;
   221		const char *card_long_name = NULL;
   222		int ssp_port, tdm_slot, ret;
   223	
   224		mach = dev_get_platdata(dev);
   225		pdata = mach->pdata;
   226	
   227		ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
   228		if (ret)
   229			return ret;
   230	
   231		ret = avs_create_dai_link(dev, ssp_port, tdm_slot, &dai_link);
   232		if (ret) {
   233			dev_err(dev, "Failed to create dai link: %d", ret);
   234			return ret;
   235		}
   236	
   237		jack = devm_kzalloc(dev, sizeof(*jack), GFP_KERNEL);
   238		card_driver = devm_kzalloc(dev, sizeof(*card_driver), GFP_KERNEL);
   239		if (!jack || !card_driver)
   240			return -ENOMEM;
   241	
   242		if (pdata->obsolete_card_names) {
   243			card_name = "avs_da7219";
   244		} else {
   245			card_driver->name = "avs_da7219";
   246			card_long_name = card_name = "AVS I2S DA7219";
   247		}
   248		card_driver->dai_link = dai_link;
   249		card_driver->num_links = 1;
   250		card_driver->controls = card_controls;
   251		card_driver->num_controls = ARRAY_SIZE(card_controls);
   252		card_driver->dapm_widgets = card_widgets;
   253		card_driver->num_dapm_widgets = ARRAY_SIZE(card_widgets);
   254		card_driver->dapm_routes = card_base_routes;
   255		card_driver->num_dapm_routes = ARRAY_SIZE(card_base_routes);
   256		card_driver->fully_routed = true;
   257	
 > 258		card = devm_snd_soc_card_alloc(dev, THIS_MODULE, card_driver,
   259					       card_name, card_long_name, NULL);
   260		if (!card)
   261			return -ENOMEM;
   262	
   263		snd_soc_card_set_drvdata(card, jack);
   264	
   265		return devm_snd_soc_card_register(card);
   266	}
   267	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
