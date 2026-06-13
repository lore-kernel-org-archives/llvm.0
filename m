Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3456B33120E;
	Sat, 13 Jun 2026 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338399; cv=none; b=jLq2n/IXZk+7qdCfDQdW8L8DaFscCLSIi+U8EFpzQZZ+vQ8fBlUBg+lPWJkrxS0H1VA8t5L436nKDIXHAqvKhe0OVM8PEyX9HA1Sqim0gv0dH63c0Bn6AuEgFu+wn6i3eGFKNbwo8Qb+YBqPbU93tU2lEsO7S6X1oUhybe0gayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338399; c=relaxed/simple;
	bh=2tTvA3CYC/vzlIJgP7jm9R+5foABqZJ6qf8RjgwOoPw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fea0k4acOt2U6rhjqwyMD18Ui+B5/Cxb64MGH0XmBo2xIkwt1APuA6m/H1+mVRGBBLx0B6eAiGsdjlZ2TczFLNWBKpRd/tAtYXdGslpxP/VSdT3/2mlR03U88oRUoDohRFr4H5wD2/SGcVcf33FbDyPwkXfxKtpWU3d1x8x9Axg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIR8zfqT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIR8zfqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781338398; x=1812874398;
  h=date:from:to:cc:subject:message-id;
  bh=2tTvA3CYC/vzlIJgP7jm9R+5foABqZJ6qf8RjgwOoPw=;
  b=lIR8zfqTUiLabjyv82OXBnJrSmljcPWtev67OE6k2bIWaloavVHIZrln
   h93SdH3/dXD9R0bNeDtTZdFLVHsqnrLyAZzfUKBXZRqsbukdHwbOEP8fR
   YK/mX8OUGia94zaSu8dYtrJg/UI6K5JFoBOVXCCEzbzaW4b9v1WSfmKiI
   kjxx6RhRJd8NFEzG/f+yvM/oMWimY68vR2DnNHx4JInvu/lwyi8ni4rKq
   00I+wRFlcliHbDRy5E/wsGYEJAeNBHTTNMhUSilvbXLH5lx8L4s+YJKKy
   avaaxcTjBnxMnyHzSIjYvUF1afwMsK8ZwM3F9q+fpLbj4E/TUPZzR+epy
   g==;
X-CSE-ConnectionGUID: iufiMf53Q3SCVl4oLT/OYg==
X-CSE-MsgGUID: ENzaAYBgRoiyhjP2b2LTNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92723078"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="92723078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 01:13:17 -0700
X-CSE-ConnectionGUID: j5xoaRTPRYuNbWgmWaHlcg==
X-CSE-MsgGUID: 9njYqfBwRgewRr7HbZRSjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="271072282"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2026 01:13:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYJUP-00000000PnM-2bds;
	Sat, 13 Jun 2026 08:13:13 +0000
Date: Sat, 13 Jun 2026 16:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/pmos-v4 24/31]
 sound/soc/qcom/sc8280xp.c:176:13: error: use of undeclared identifier
 'LPAIF_MI2S_MCLK'
Message-ID: <202606131609.RqRpHPLB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/pmos-v4
head:   2990bb85e68d401720ce49038f3e512d7eb1a389
commit: 82a9dc5108c057c67137a9d9bcab231d4989eccf [24/31] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606131609.RqRpHPLB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131609.RqRpHPLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131609.RqRpHPLB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/qcom/sc8280xp.c:176:13: error: use of undeclared identifier 'LPAIF_MI2S_MCLK'
     176 |                                                LPAIF_MI2S_MCLK, mclk_freq,
         |                                                ^~~~~~~~~~~~~~~
>> sound/soc/qcom/sc8280xp.c:181:13: error: use of undeclared identifier 'LPAIF_MI2S_BCLK'
     181 |                                                LPAIF_MI2S_BCLK, bclk_freq,
         |                                                ^~~~~~~~~~~~~~~
   2 errors generated.


vim +/LPAIF_MI2S_MCLK +176 sound/soc/qcom/sc8280xp.c

   154	
   155	static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
   156					  struct snd_pcm_hw_params *params)
   157	{
   158		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
   159		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
   160		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   161		struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
   162		int mclk_freq = sc8280xp_get_mclk_freq(params);
   163		int bclk_freq = sc8280xp_get_bclk_freq(params);
   164	
   165		switch (cpu_dai->id) {
   166		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
   167		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
   168			snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
   169	
   170			if (data->snd_soc_common_priv->codec_dai_fmt)
   171				snd_soc_dai_set_fmt(codec_dai,
   172						    data->snd_soc_common_priv->codec_dai_fmt);
   173	
   174			if (data->snd_soc_common_priv->mi2s_mclk_enable)
   175				snd_soc_dai_set_sysclk(cpu_dai,
 > 176						       LPAIF_MI2S_MCLK, mclk_freq,
   177						       SND_SOC_CLOCK_IN);
   178	
   179			if (data->snd_soc_common_priv->mi2s_bclk_enable)
   180				snd_soc_dai_set_sysclk(cpu_dai,
 > 181						       LPAIF_MI2S_BCLK, bclk_freq,
   182						       SND_SOC_CLOCK_IN);
   183	
   184			if (data->snd_soc_common_priv->codec_sysclk_set)
   185				snd_soc_dai_set_sysclk(cpu_dai,
   186						       0, mclk_freq,
   187						       SND_SOC_CLOCK_IN);
   188			break;
   189		default:
   190			break;
   191		}
   192	
   193		return 0;
   194	}
   195	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
