Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D8F1714AA;
	Tue,  6 Oct 2026 01:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791249815; cv=none; b=NenBYIErq/6IzJT6kzrW1sOwt+4O1jKQWwFFsM3gi4q/sUpU9g0X5lvQdaGcWsJhCz3175rJ8s4hm7OOTCUw9PqeKOTLKrsN+Ukm4vi/xcyqD+yDQ7C0kXk+EVzdUr2o+ijIpntPgrpL3JfMcJzFWVTZhUChkpJnlWXCW9cqTs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791249815; c=relaxed/simple;
	bh=gI+Qz8BqllFQYalqSQuLR+JS1V8KAI1uI3OitRUlta8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yhk2WzSkoGG8V8+qP/eOJlGdUa8z8ZKcE9Stci0cW7Ui/C8HTmqpJOYJCJ9X76mJc7jkAZvz/NZ12GCYtvxePLJU45DQu7Kid58KMVA1kd5O9TSwSZW/ILZPRmNihA5tZqFYXYoUtUNuARJK/O8jgLmdAizkjYhvPynMYZPgUJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuFy8fUA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuFy8fUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791249813; x=1822785813;
  h=date:from:to:cc:subject:message-id;
  bh=gI+Qz8BqllFQYalqSQuLR+JS1V8KAI1uI3OitRUlta8=;
  b=PuFy8fUAG6UozTdNGHUUsN7nRI+q4ty3F4sVaXPPW7p0+eG8VcNqa32E
   M8vBalYPjZvJL7EauB6JsycurXi3mCLBI0LQO3kKb6RXexWyKoU62nitu
   U8ct3+y+aTgkEp/ttNl5a5uEcN6gLJap2PqO0q3aq8+8+3nentppmoV41
   u/qUrDJhVEfuLOAVveTl6Aa498IALfThEZBTkUcESUzhCJmIxydoi544l
   i5IZbzFk/XL+ekl/FnqoWg7WitRQ1H7Vh7zsH8whldnxOKQvJsaHE3gDK
   eIUOMeH1ZbrDr6Mbb/KR3PhyWzb/EG1Y9wCtgKaLUlHGcAm4fkal7TlXV
   A==;
X-CSE-ConnectionGUID: Dg2cx6mDRpa7nosYVWVBoA==
X-CSE-MsgGUID: DgNF7vruSyypETJKv3RfHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102508955"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102508955"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 18:23:32 -0700
X-CSE-ConnectionGUID: VieI5PfXTg6+fusmiqb2xg==
X-CSE-MsgGUID: fHCtuRYSSrGWqshfeivMXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276514327"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Oct 2026 18:23:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDttw-0000000012a-3I3r;
	Tue, 06 Oct 2026 01:23:28 +0000
Date: Tue, 06 Oct 2026 09:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-30-3 322/322]
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c:462:29: error: call to undeclared
 function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202610060918.8PUwFcDg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-30-3
head:   8ef89ccab720b2e433fdb62596f1c54d5e4ed184
commit: 5f85279ecbf1dd06cb7458eb4e9da621e969302f [322/322] ASoC: soc-component: remove snd_soc_component_{set/get}_drvdata()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261006/202610060918.8PUwFcDg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 80cd965b6323b208519f8ab1d5ee86e4ea9862f4)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610060918.8PUwFcDg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610060918.8PUwFcDg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8192/mt8192-dai-adda.c:462:29: error: call to undeclared function 'snd_soc_component_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     462 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                                    ^
>> sound/soc/mediatek/mt8192/mt8192-dai-adda.c:462:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     462 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/snd_soc_component_get_drvdata +462 sound/soc/mediatek/mt8192/mt8192-dai-adda.c

607ac48595640d Jiaxin Yu    2020-11-03  456  
607ac48595640d Jiaxin Yu    2020-11-03  457  static int mtk_adda_dl_event(struct snd_soc_dapm_widget *w,
607ac48595640d Jiaxin Yu    2020-11-03  458  			     struct snd_kcontrol *kcontrol,
607ac48595640d Jiaxin Yu    2020-11-03  459  			     int event)
607ac48595640d Jiaxin Yu    2020-11-03  460  {
607ac48595640d Jiaxin Yu    2020-11-03  461  	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
607ac48595640d Jiaxin Yu    2020-11-03 @462  	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
eed9414a1b075e bui duc phuc 2026-09-18  463  	int ret;
607ac48595640d Jiaxin Yu    2020-11-03  464  
607ac48595640d Jiaxin Yu    2020-11-03  465  	switch (event) {
607ac48595640d Jiaxin Yu    2020-11-03  466  	case SND_SOC_DAPM_PRE_PMU:
eed9414a1b075e bui duc phuc 2026-09-18  467  		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
eed9414a1b075e bui duc phuc 2026-09-18  468  		if (ret)
eed9414a1b075e bui duc phuc 2026-09-18  469  			return ret;
607ac48595640d Jiaxin Yu    2020-11-03  470  		break;
607ac48595640d Jiaxin Yu    2020-11-03  471  	case SND_SOC_DAPM_POST_PMD:
607ac48595640d Jiaxin Yu    2020-11-03  472  		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
607ac48595640d Jiaxin Yu    2020-11-03  473  		usleep_range(125, 135);
eed9414a1b075e bui duc phuc 2026-09-18  474  		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
eed9414a1b075e bui duc phuc 2026-09-18  475  		if (ret)
eed9414a1b075e bui duc phuc 2026-09-18  476  			return ret;
607ac48595640d Jiaxin Yu    2020-11-03  477  		break;
607ac48595640d Jiaxin Yu    2020-11-03  478  	default:
607ac48595640d Jiaxin Yu    2020-11-03  479  		break;
607ac48595640d Jiaxin Yu    2020-11-03  480  	}
607ac48595640d Jiaxin Yu    2020-11-03  481  
607ac48595640d Jiaxin Yu    2020-11-03  482  	return 0;
607ac48595640d Jiaxin Yu    2020-11-03  483  }
607ac48595640d Jiaxin Yu    2020-11-03  484  

:::::: The code at line 462 was first introduced by commit
:::::: 607ac48595640d549a769f0dde0732e69c3a6c03 ASoC: mediatek: mt8192: support adda in platform driver

:::::: TO: Jiaxin Yu <jiaxin.yu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
