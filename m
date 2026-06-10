Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3F1B4F0A;
	Wed, 10 Jun 2026 05:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781069486; cv=none; b=b1HOqmspgTKRzzjPA/CKopVRpbqklGOznFBXrjDzcu+MUCYzpN56i4W6fnMbAYNOSLPHshceKyM72DGPsCxIw/KrQu+zVdyfI3/vQ3DTGMhtPNE+xxjyCU1rwSreVU9om8jsWuOcx12rQAl9M5S0S/3HFUAyeIUIkaeuH6hZQZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781069486; c=relaxed/simple;
	bh=88pESr0P3P2WVRIdZR7FQ6xJgH5PcGA8QD36ljG9Ud4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cGj3b75pa+a/lodPnqof+sOk+uOHRfXb4jqi9fjEzjXJkpPIuv3YSaZs6WBNBWZKUdA8QDQpfdGm+3VMmrFwl/KvYaD//hPefiLiNRSMdaWEmnNF6eaSPmqOO7BNOyVh/tK+GM1+N5ooi+aZtOb/+KwdIRQuoYFO20anodr/1/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2FZibXZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2FZibXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781069484; x=1812605484;
  h=date:from:to:cc:subject:message-id;
  bh=88pESr0P3P2WVRIdZR7FQ6xJgH5PcGA8QD36ljG9Ud4=;
  b=e2FZibXZ5VT4JAB5J8L4budDsAIvG5yV2RAE4fJipGP8CgHztG1EzRxq
   GxWcsCKqCbPZBRUTlnLXJJesluxXOPfpKuVM3w27yLCtzK90ZGWilevQl
   z2HfKddmmePOq+o0PI9SdkzCY7BjZXTU6GMY1LTvayOjsJ1lNko/4+ZOb
   57pDpb/yP/FNHX+YiE/Mj4BBCFBitAofAr2Mcronlb8gu8cA8X+MIjbs6
   VlZQFGF45y5D3F4mlsEwChI85a6naViQ//nhw2mWaUoagAq6gF06HMO3m
   KTQBLlkVwoZml5fv9JEZCJq11gUBL39qOcwBwIn9it+V0BIjljs9b2gBf
   w==;
X-CSE-ConnectionGUID: TnQ15W5MTtGBGg6+JNe1JA==
X-CSE-MsgGUID: UH2lLOqaTEOARsrjHLXw2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93239898"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="93239898"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 22:31:22 -0700
X-CSE-ConnectionGUID: jgYoUPb3QMajaIvKojqJog==
X-CSE-MsgGUID: vSrpD74/TZeilooadxqifQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="247929071"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jun 2026 22:31:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXBX4-00000000Kwg-1VOq;
	Wed, 10 Jun 2026 05:31:18 +0000
Date: Wed, 10 Jun 2026 13:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/wsa2-fix 5/5]
 sound/soc/qcom/sc8280xp.c:237:64: error: use of undeclared identifier
 'cpu_dai'
Message-ID: <202606101325.nm9PJYzJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/wsa2-fix
head:   074a0ec5e0e7c16933371ee131890bacbfee4fdd
commit: 074a0ec5e0e7c16933371ee131890bacbfee4fdd [5/5] WiP
config: x86_64-buildonly-randconfig-003-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101325.nm9PJYzJ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101325.nm9PJYzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101325.nm9PJYzJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/qcom/sc8280xp.c:237:64: error: use of undeclared identifier 'cpu_dai'
     237 |         return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
         |                                                                       ^~~~~~~
   1 error generated.


vim +/cpu_dai +237 sound/soc/qcom/sc8280xp.c

074a0ec5e0e7c16 Neil Armstrong      2026-05-28  223  
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  224  static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  225  {
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  226  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
295aeea6646ad6c Srinivas Kandagatla 2022-09-16  227  	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
295aeea6646ad6c Srinivas Kandagatla 2022-09-16  228  
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  229  	if (data->snd_soc_common_priv->snd_prepare) {
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  230  		int ret;
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  231  
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  232  		ret = data->snd_soc_common_priv->snd_prepare(substream);
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  233  		if (ret)
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  234  			return ret;
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  235  	}
074a0ec5e0e7c16 Neil Armstrong      2026-05-28  236  
d02460317ed9c95 Srinivas Kandagatla 2025-10-22 @237  	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
295aeea6646ad6c Srinivas Kandagatla 2022-09-16  238  }
295aeea6646ad6c Srinivas Kandagatla 2022-09-16  239  

:::::: The code at line 237 was first introduced by commit
:::::: d02460317ed9c95aa2c5f6ff1c70e22e1857d95d ASoC: qcom: sdw: remove redundant code

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
