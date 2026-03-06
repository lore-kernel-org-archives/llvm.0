Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6462ECE86;
	Fri,  6 Mar 2026 21:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772832421; cv=none; b=cezb6Gf1LV437xORxuQW3Swng3D/PVHDzBdVKRfLAt3eTk9X1yI7/WqucbDKg1NYfjXl8ucf7EpaeiAg4M4+6MFsdIF1kPUbj0x5KEAboYGAVNUyLJz0wVZvY3iW+Z82iB4RlmU+LGWcAEuG5QzIGCRaPRrKvaX+2Z4bKjXSuFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772832421; c=relaxed/simple;
	bh=Pcqa1aROGPqmbgXnwpvDNC18YG5xbuGd6StuiSiRmJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s8Mh+HJPKV2ILoZS+cbsGTfL1TKglaUW0BYeHDfI9sDeCxXRJjAWDCmQRHPlyfbWPWh+EU/XrbYE9Rbh2zHLMFHukBJhXSZebalO8wXPNIaQCe5AlOtsUa3iB0yUWaKJRuZNfwah1Jhtqg2EmHDzHAH9GSpzLB21abLJM3DjNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzSj5Ei6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzSj5Ei6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772832420; x=1804368420;
  h=date:from:to:cc:subject:message-id;
  bh=Pcqa1aROGPqmbgXnwpvDNC18YG5xbuGd6StuiSiRmJ0=;
  b=UzSj5Ei6TbYj6CnedGik1Zwm4/10aKi+oCtwVRskOeE60ZbjGC5JP2pr
   ej20JOEYx+uz6X1mu7mp1arrExIsXypxvomsgmTDrxGxj46bpRtiyM0tV
   GPSNQ6lIDmtsX2YRmyjiSbpv1VjHtwo7zuCmkLv54bWmBY76ZZKOpomdO
   We0H5b+lNJp0nXOztewsYATbDmBNHm1Cv/T0cWPlRfiTPmrUYVnUjyji8
   +F5Ixx8DQ2R17fhrXSoEpH2qi0b2JhQXPnRw0c8YTKv07GECVHyHtzZ7N
   hRfOnpSEksE8msu0wl0lbPGrgSwap1CBp0uOQznuu0fAF3JKu0tTOJ38c
   Q==;
X-CSE-ConnectionGUID: 1VPMgBGxSi+Y9+hJKxFgPw==
X-CSE-MsgGUID: FhzDm+LLTFC//6+BCmCFHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73143134"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73143134"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 13:26:58 -0800
X-CSE-ConnectionGUID: zURXw9OhT8+fGllyUz25xQ==
X-CSE-MsgGUID: /2ZfMOYcQ02LUOWCDewwFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="242132667"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2026 13:26:56 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vychC-000000001Od-0jzf;
	Fri, 06 Mar 2026 21:26:54 +0000
Date: Sat, 07 Mar 2026 05:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-04-3 79/79]
 sound/soc/soc-component.c:1694:18: warning: variable 'card' is uninitialized
 when used here
Message-ID: <202603070517.lBiktoto-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-04-3
head:   778b9472f0c90f749c084257e0893772fd5ff6ac
commit: 778b9472f0c90f749c084257e0893772fd5ff6ac [79/79] ASoC: soc-component: move soc_component_add/del() to soc-component.c
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260307/202603070517.lBiktoto-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070517.lBiktoto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070517.lBiktoto-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-component.c:1694:18: warning: variable 'card' is uninitialized when used here [-Wuninitialized]
    1694 |         soc_card_rebind(card);
         |                         ^~~~
   sound/soc/soc-component.c:1665:27: note: initialize the variable 'card' to silence this warning
    1665 |         struct snd_soc_card *card;
         |                                  ^
         |                                   = NULL
   1 warning generated.


vim +/card +1694 sound/soc/soc-component.c

  1661	
  1662	int soc_component_add(struct snd_soc_component *component,
  1663			      struct snd_soc_dai_driver *dai_drv, int num_dai)
  1664	{
  1665		struct snd_soc_card *card;
  1666		int ret;
  1667		int i;
  1668	
  1669		if (component->driver->endianness) {
  1670			for (i = 0; i < num_dai; i++) {
  1671				convert_endianness_formats(&dai_drv[i].playback);
  1672				convert_endianness_formats(&dai_drv[i].capture);
  1673			}
  1674		}
  1675	
  1676		ret = soc_component_dais_register(component, dai_drv, num_dai);
  1677		if (ret < 0) {
  1678			dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
  1679				ret);
  1680			goto err_cleanup;
  1681		}
  1682	
  1683		if (!component->driver->write && !component->driver->read) {
  1684			if (!component->regmap)
  1685				component->regmap = dev_get_regmap(component->dev,
  1686								   NULL);
  1687			if (component->regmap)
  1688				snd_soc_component_setup_regmap(component);
  1689		}
  1690	
  1691		/* see for_each_component */
  1692		list_add(&component->list, soc_component_get_list_head());
  1693	
> 1694		soc_card_rebind(card);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
