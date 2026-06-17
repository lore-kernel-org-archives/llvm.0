Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A869036E47E;
	Wed, 17 Jun 2026 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681948; cv=none; b=dF0XsO4Z3ML2N/7qpIpUascTYVVVjybIF5i/4sbtdNRfZn0Y5b7Kzx02f8/bTIZu3fhmxLwwl18jmo6pYnMB3eKw2GoBNLrRKwDqjNfEJA/RAshUyGrQlfOIayMXXmi82c0fnAmm5Wno7y83+IVqFsGx7M2HmIEF2mv/YLvXHg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681948; c=relaxed/simple;
	bh=YlCXJ9q5mj5cC/hYcpHYKxYt2U+vwlwaaaxuV//KWqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R42MwjxT/Mx1NGBp89XgLs7MeQP8cmsGPcDtCJgzPc5YPdZDMp4H8SMWBB2zPg0Auu/85Mcvg8kQYGEpskowuswzLSgCPnKa8zIeD/eZvujf7ffY4CCd2qFADGaD/iF5MMEPIi1dFSMnwamGq16mxwsU+GPPbmeEqVGC9EOkMek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7zj1GUL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7zj1GUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781681947; x=1813217947;
  h=date:from:to:cc:subject:message-id;
  bh=YlCXJ9q5mj5cC/hYcpHYKxYt2U+vwlwaaaxuV//KWqI=;
  b=A7zj1GUL/vlLNm/bnYgKXplcwPOR6z/f2+mmn5BvfU4Kdlnt2/+YVL0V
   K/VTffrA00iizVgbn5o6KupbSnfZhHldpyqqf6b4nHHr4RYDzFxFYqJDr
   Jfr9wwi7xTpI4xYQolcxK3ah02hUG+7MgPeVgeZQzeXZfMmlB4hcOMtFy
   eblv+ExU4iZ0OGF4UPcitGTTqxIe+7lA7GHUKuXdZvV8/jfKKHFhyu+a2
   6Qk1VbU7eV7izRiU97bIgKcPO7NmK54vN/UG1onw9FcJRdULW0xVb4PS3
   7bgxT9ZJCdvJfN1zznB6dgYwamJo6+gFWWrBEmFqpNCjTNbsVtqoykt9s
   A==;
X-CSE-ConnectionGUID: /L1H93w5R92Y7dNI7vKc7Q==
X-CSE-MsgGUID: M0Xn/gBiS9qA6XhUYT3m5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93133261"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="93133261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 00:39:06 -0700
X-CSE-ConnectionGUID: dBZdiXJhRPO6bHjF/INU4Q==
X-CSE-MsgGUID: U6ysO9xfSAehhaBbhl6whQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jun 2026 00:39:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZkrW-00000000UF4-0o7l;
	Wed, 17 Jun 2026 07:39:02 +0000
Date: Wed, 17 Jun 2026 15:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/samsung/smdk_wm8994.c:157:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202606171549.A6Cfls2x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: de8284496f5761489c928f1a24aaf1f545752d28 [326/326] ASoC: samsung: smdk_wm8994: use snd_soc_card_register()
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260617/202606171549.A6Cfls2x-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171549.A6Cfls2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171549.A6Cfls2x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/samsung/smdk_wm8994.c:157:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     157 |         if (!card) {
         |             ^~~~~
   sound/soc/samsung/smdk_wm8994.c:162:9: note: uninitialized use occurs here
     162 |         return ret;
         |                ^~~
   sound/soc/samsung/smdk_wm8994.c:157:2: note: remove the 'if' if its condition is always true
     157 |         if (!card) {
         |         ^~~~~~~~~~
   sound/soc/samsung/smdk_wm8994.c:137:9: note: initialize the variable 'ret' to silence this warning
     137 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +157 sound/soc/samsung/smdk_wm8994.c

   134	
   135	static int smdk_audio_probe(struct platform_device *pdev)
   136	{
   137		int ret;
   138		struct device_node *np = pdev->dev.of_node;
   139		struct snd_soc_card *card;
   140	
   141		if (np) {
   142			smdk_dai[0].cpus->dai_name = NULL;
   143			smdk_dai[0].cpus->of_node = of_parse_phandle(np,
   144					"samsung,i2s-controller", 0);
   145			if (!smdk_dai[0].cpus->of_node) {
   146				dev_err(&pdev->dev,
   147				   "Property 'samsung,i2s-controller' missing or invalid\n");
   148				ret = -EINVAL;
   149				return ret;
   150			}
   151	
   152			smdk_dai[0].platforms->name = NULL;
   153			smdk_dai[0].platforms->of_node = smdk_dai[0].cpus->of_node;
   154		}
   155	
   156		card = devm_snd_soc_card_register(&pdev->dev, &smdk);
 > 157		if (!card) {
   158			ret = -ENOMEM;
   159			dev_err_probe(&pdev->dev, ret, "snd_soc_card_register() failed\n");
   160		}
   161	
   162		return ret;
   163	}
   164	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
