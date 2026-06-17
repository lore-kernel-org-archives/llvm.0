Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F82517BCA;
	Wed, 17 Jun 2026 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685196; cv=none; b=lk2g7iYd8JLM7+z/ZxyZdY/waVK9K0RIeiHLdd+atqZv36Qwj4iv/LqqQBPDC80WTzfpgPIolKfcvA7qGzWBhSGn3W6jGkBSCLnP7HVcVtaaMN8rV+d2SSGm6HRKmAEnzWOwnwR5CNdBJEZOAj776oFn9G+wGcIx3esDK/EW9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685196; c=relaxed/simple;
	bh=hC2HrLqPXWYSwBfxuBxItoI+4MavWMJBpTQqqPf1+rY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mFu6CCLKITX/+xl+8D2xsL32Q+mB03hQUFm6RL5nVLlb04zQFRkTUbiC61cOQd288yqR5LwfKP45LL34+7X61h/PrSMu7esaTCJGl3+DZ/37JOBCc4h6BoND3vkA+LCnjnMnkl1Cz3qwHqxb8jHKxTVotbPMid/ylftBihZ1O2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNV7c83K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNV7c83K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781685193; x=1813221193;
  h=date:from:to:cc:subject:message-id;
  bh=hC2HrLqPXWYSwBfxuBxItoI+4MavWMJBpTQqqPf1+rY=;
  b=nNV7c83K3ZfOdJtzayOg8iVFGC/onxk3/NKQY50Yl2hpnryekKIs4k4U
   8qP/KbW5Old/D83wdbmBy8CTKOz9TLqeWvZOJlx8Jep1gDUHRRfQiCjos
   QHigC2OfjRDigaETP10oTUBHzshPSi2kJnaVbOVPgKrvt2rTVuhvFF23s
   jBAymwIvvxQvOtYaqZVaZd2db3XlIy+ugpH2gJjxWZ6kfTd5yGnsnSffq
   aSNvfLiU0/obK0OnSox5Wx5M6U7EPyQZQLdTWvIteoQ0Wrf3m5RuJ8FYo
   h+RPZZgnMGyXXKNfEQCWYBKTvfvsGoYgMNW5QcZU+K757OqdiwNH2Dmvy
   A==;
X-CSE-ConnectionGUID: 1oAlpT6BS26FICbX4N/N8g==
X-CSE-MsgGUID: 9Df8CMsATWeIY5axyEvSqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="105276910"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="105276910"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 01:33:13 -0700
X-CSE-ConnectionGUID: uGIf2JceRXSiWg3Vfhh3bw==
X-CSE-MsgGUID: wj5wlPSZSaiHAvQRe14cjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="248071477"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2026 01:33:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZlhs-00000000UHq-3AiC;
	Wed, 17 Jun 2026 08:33:08 +0000
Date: Wed, 17 Jun 2026 16:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/samsung/arndale.c:176:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202606171609.mXRZth2s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: c4ef8b77bf42812df873dc078097d5e8f196351e [326/326] ASoC: samsung: arndale: use snd_soc_card_register()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260617/202606171609.mXRZth2s-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171609.mXRZth2s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171609.mXRZth2s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/samsung/arndale.c:176:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     176 |         if (!card)
         |             ^~~~~
   sound/soc/samsung/arndale.c:179:6: note: uninitialized use occurs here
     179 |         if (ret) {
         |             ^~~
   sound/soc/samsung/arndale.c:176:2: note: remove the 'if' if its condition is always true
     176 |         if (!card)
         |         ^~~~~~~~~~
     177 |                 ret = -ENOMEM;
   sound/soc/samsung/arndale.c:152:9: note: initialize the variable 'ret' to silence this warning
     152 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +176 sound/soc/samsung/arndale.c

   145	
   146	static int arndale_audio_probe(struct platform_device *pdev)
   147	{
   148		struct device_node *np = pdev->dev.of_node;
   149		struct snd_soc_card *card;
   150		struct snd_soc_card_driver *card_driver;
   151		struct snd_soc_dai_link *dai_link;
   152		int ret;
   153	
   154		card_driver = (struct snd_soc_card_driver *)of_device_get_match_data(&pdev->dev);
   155		dai_link = card_driver->dai_link;
   156	
   157		dai_link->cpus->of_node = of_parse_phandle(np, "samsung,audio-cpu", 0);
   158		if (!dai_link->cpus->of_node) {
   159			dev_err(&pdev->dev,
   160				"Property 'samsung,audio-cpu' missing or invalid\n");
   161			return -EINVAL;
   162		}
   163	
   164		if (!dai_link->platforms->name)
   165			dai_link->platforms->of_node = dai_link->cpus->of_node;
   166	
   167		dai_link->codecs->of_node = of_parse_phandle(np, "samsung,audio-codec", 0);
   168		if (!dai_link->codecs->of_node) {
   169			dev_err(&pdev->dev,
   170				"Property 'samsung,audio-codec' missing or invalid\n");
   171			ret = -EINVAL;
   172			goto err_put_of_nodes;
   173		}
   174	
   175		card = devm_snd_soc_card_register(&pdev->dev, card_driver);
 > 176		if (!card)
   177			ret = -ENOMEM;
   178	
   179		if (ret) {
   180			dev_err_probe(&pdev->dev, ret,
   181				      "snd_soc_card_register() failed\n");
   182			goto err_put_of_nodes;
   183		}
   184		return 0;
   185	
   186	err_put_of_nodes:
   187		arndale_put_of_nodes(card_driver);
   188		return ret;
   189	}
   190	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
