Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71953375C2;
	Fri, 27 Feb 2026 06:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174834; cv=none; b=HPIlWOUhXoTDN70RzLvPbI0NcWKdrmAPC/bo8lr2VzZG9yZZ27x5dKg48zwv0llL0fZIG2knCG8ICT5NNkZNv9ZXXWd4M1YideBiAIK1Vlt+aWgZ4f8QVhP3e6AzL8LP+lBTnsYk0VmD7yabtDkTM5vjoA1T77JcXDzuGy/aYHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174834; c=relaxed/simple;
	bh=FTBoem3N8wjs1l9Nc4rU9G3bNGjYtPHN4mgq35kA64A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XiZLvYELF7aDmIQGMTZ6SB1EvuFztEYngHhKC5+sT0PkSzyTjJi6O6OOFZRftMi+tCBTy8XrgwId8EEmVEafrGiG5lh4Z/LzYobAh45lL0sjQ+7JvBcasdLsPdAop4ykXwcnm2FETP70ppX3Pnaqq6IY3zZQD5+FYQl9hhQPCXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6fsdAiU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6fsdAiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772174833; x=1803710833;
  h=date:from:to:cc:subject:message-id;
  bh=FTBoem3N8wjs1l9Nc4rU9G3bNGjYtPHN4mgq35kA64A=;
  b=W6fsdAiUjgbCA/Q4Yxv3Vb/Q3v1WpxSFIcRS6lFbmGgrS703dy86ZJ9t
   FI1q783B5z2iIUmle6csnwQ68/Eew4PQKtj7Oc8bTN0NfyaC6bhaf7CDI
   h2+7W+4yiq/C5k/TPiLIEF1leEs9quGgEmYk/lMYevpx9hEyNz/EEJI1N
   2BUhkobxT1gm/7A1Dm2jRxqhkt6XrwY77lny7K/OfK2PH73Mc3q2oBQzY
   H0q+L6yiP+IxqZUdKcd83IVtJeugiPrtfJanH21y5fdDBKthcVHQNNx0p
   p8nMGehlgpu/s+HvoH2toTS0pTS+Kk4IH49KxSR8zSM/qg2NTNuynNCae
   w==;
X-CSE-ConnectionGUID: Y87vdocbSf67ZuUu6BFScg==
X-CSE-MsgGUID: KBFPLAmhTQy+uUSlArFT8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83959004"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="83959004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 22:47:12 -0800
X-CSE-ConnectionGUID: 9oTTLiAxTfOfVIaisM3JIQ==
X-CSE-MsgGUID: SaQ8PP1MRqCd9f9he2NRpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="254595621"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2026 22:47:11 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvrcQ-00000000AGh-3VJx;
	Fri, 27 Feb 2026 06:46:42 +0000
Date: Fri, 27 Feb 2026 14:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-02-27 64/71]
 sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:188:12: error: expected ';' at end
 of declaration
Message-ID: <202602271436.slKE97Pg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-02-27
head:   70fac1227b8f4cff541671ddd98131030be53492
commit: 0d2fc26b6b9e1b6dbf496f2e231460cdcae63f24 [64/71] move struct dai
config: arm64-randconfig-003-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271436.slKE97Pg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271436.slKE97Pg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271436.slKE97Pg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:188:12: error: expected ';' at end of declaration
     188 |         int dai_id snd_soc_dai_id(dai);
         |                   ^
         |                   ;
   1 error generated.


vim +188 sound/soc/mediatek/mt6797/mt6797-dai-pcm.c

   179	
   180	/* dai ops */
   181	static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
   182					 struct snd_pcm_hw_params *params,
   183					 struct snd_soc_dai *dai)
   184	{
   185		struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
   186		struct snd_soc_dapm_widget *p = snd_soc_dai_stream_widget_get_playback(dai);
   187		struct snd_soc_dapm_widget *c = snd_soc_dai_stream_widget_get_capture(dai);
 > 188		int dai_id snd_soc_dai_id(dai);
   189		unsigned int rate = params_rate(params);
   190		unsigned int rate_reg = mt6797_rate_transform(afe->dev, rate, dai_id);
   191		unsigned int pcm_con = 0;
   192	
   193		dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d, rate_reg %d, widget active p %d, c %d\n",
   194			__func__,
   195			dai_id,
   196			substream->stream,
   197			rate,
   198			rate_reg,
   199			p->active,
   200			c->active);
   201	
   202		if (p->active || c->active)
   203			return 0;
   204	
   205		switch (dai_id) {
   206		case MT6797_DAI_PCM_1:
   207			pcm_con |= AUD_BCLK_OUT_INV_NO_INVERSE << PCM_BCLK_OUT_INV_SFT;
   208			pcm_con |= AUD_TX_LCH_RPT_NO_REPEAT << PCM_TX_LCH_RPT_SFT;
   209			pcm_con |= AUD_VBT_16K_MODE_DISABLE << PCM_VBT_16K_MODE_SFT;
   210			pcm_con |= AUD_EXT_MODEM_SELECT_INTERNAL << PCM_EXT_MODEM_SFT;
   211			pcm_con |= 0 << PCM_SYNC_LENGTH_SFT;
   212			pcm_con |= AUD_PCM_ONE_BCK_CYCLE_SYNC << PCM_SYNC_TYPE_SFT;
   213			pcm_con |= AUD_BT_MODE_DUAL_MIC_ON_TX << PCM_BT_MODE_SFT;
   214			pcm_con |= AUD_PCM_AFIFO_AFIFO << PCM_BYP_ASRC_SFT;
   215			pcm_con |= AUD_PCM_CLOCK_SLAVE_MODE << PCM_SLAVE_SFT;
   216			pcm_con |= rate_reg << PCM_MODE_SFT;
   217			pcm_con |= AUD_PCM_FMT_PCM_MODE_B << PCM_FMT_SFT;
   218	
   219			regmap_update_bits(afe->regmap, PCM_INTF_CON1,
   220					   0xfffffffe, pcm_con);
   221			break;
   222		case MT6797_DAI_PCM_2:
   223			pcm_con |= AUD_TX_LCH_RPT_NO_REPEAT << PCM2_TX_LCH_RPT_SFT;
   224			pcm_con |= AUD_VBT_16K_MODE_DISABLE << PCM2_VBT_16K_MODE_SFT;
   225			pcm_con |= AUD_BT_MODE_DUAL_MIC_ON_TX << PCM2_BT_MODE_SFT;
   226			pcm_con |= AUD_PCM_AFIFO_AFIFO << PCM2_AFIFO_SFT;
   227			pcm_con |= AUD_PCM_WLEN_PCM_32_BCK_CYCLES << PCM2_WLEN_SFT;
   228			pcm_con |= rate_reg << PCM2_MODE_SFT;
   229			pcm_con |= AUD_PCM_FMT_PCM_MODE_B << PCM2_FMT_SFT;
   230	
   231			regmap_update_bits(afe->regmap, PCM2_INTF_CON,
   232					   0xfffffffe, pcm_con);
   233			break;
   234		default:
   235			dev_warn(afe->dev, "%s(), id %d not support\n",
   236				 __func__, dai_id);
   237			return -EINVAL;
   238		}
   239	
   240		return 0;
   241	}
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
