Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063EF238171;
	Wed, 26 Feb 2025 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566386; cv=none; b=oCATS75Iyk7JHv+A5TefxXyB35vGbfKOfzI9H6Nv2xyZT5zXjJNb3G3DWbkFZ6fcuqTRjD+cNcvD5buBQRJWVe5UGBEYxtb3Erwx/D7aHm2UgGu6JFfq0Y8ro6XteyeadigNMNcsQxPlgZIfUBX6l3FF14lcQQUw17aPj88gBrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566386; c=relaxed/simple;
	bh=RAX1lf/k7K2QzqoTBqzkqGn/wJltUPtaz/+WENvkBv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ammhX/ekWrhG8ND4DyuoJqOBWtQ+CKk5zJlgvBOwtgR5F539A9ONrmNxAjXg7x4/7EIZfY/QfwnqfwvoCjM3Aomoo3DDRqRUqbkm44x044UWh60RwdDkiZlyH9OUfX/g6d0GwFXxhxZ8MT/w5IPgL4vOMJdrWvKfhKzpE3xHorg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lY1ufnRi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lY1ufnRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740566385; x=1772102385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RAX1lf/k7K2QzqoTBqzkqGn/wJltUPtaz/+WENvkBv0=;
  b=lY1ufnRix3rNiuI2RFH4l6x93Kqpw5NmkzC5RRPNHfS80hdsuGPJqvN2
   lqyk9OFql1X9kaiwDLXMvIQ32DXimFX7plqNmcXRnUM01YBS59iPg0Z3N
   tiX3CMQ9s6VMCeXddRaAEYafqqVa7xcQzMFqiiG7qMVrngvu1HN/ADkGn
   1AMgGS378bhh2xysiBS7QNhXW712udUEEqX5whNyazzNV9rKuRnQL+irk
   iF0qodX2+KuqMRiA/B1Mhy2QB2s783mkhHFyjg26AC9/KD4ME5f5ZCj+z
   8wHS6UMSuoshFU/H16um0F7LcsULMD3mDtUmXLue8OoMuRQFGtveo1HXn
   g==;
X-CSE-ConnectionGUID: V4PoCAypRNiXRai3xAN8hg==
X-CSE-MsgGUID: ev6n65DDT9yZIfsGDl9wag==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58825408"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="58825408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 02:39:44 -0800
X-CSE-ConnectionGUID: cL9qR6PVSYOp+pxh+N9XUQ==
X-CSE-MsgGUID: bxcVVPFuQQmLtxH/rN2nYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153837936"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2025 02:39:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnEpH-000BYn-2k;
	Wed, 26 Feb 2025 10:39:39 +0000
Date: Wed, 26 Feb 2025 18:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: parkeryang <Parker.Yang@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 6161/6583]
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c:311:4: warning: variable 'msk'
 is uninitialized when used here
Message-ID: <202502261854.7caMptGv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: c1e42ec04197ac013d049dde40d9c72cf543b5f6 [6161/6583] ASoC: mediatek: mt8188: Add support for DMIC
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250226/202502261854.7caMptGv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261854.7caMptGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261854.7caMptGv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/mt8188/mt8188-dai-dmic.c:311:4: warning: variable 'msk' is uninitialized when used here [-Wuninitialized]
     311 |                         msk |= PWR2_TOP_CON1_DMIC_FIFO_SOFT_RST_EN(i);
         |                         ^~~
   sound/soc/mediatek/mt8188/mt8188-dai-dmic.c:295:18: note: initialize the variable 'msk' to silence this warning
     295 |         unsigned int msk;
         |                         ^
         |                          = 0
   1 warning generated.


vim +/msk +311 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c

   284	
   285	static int mtk_dmic_event(struct snd_soc_dapm_widget *w,
   286				  struct snd_kcontrol *kcontrol,
   287				  int event)
   288	{
   289		struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
   290		struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
   291		struct mt8188_afe_private *afe_priv = afe->platform_priv;
   292		struct mtk_dai_dmic_priv *dmic_priv = afe_priv->dai_priv[MT8188_AFE_IO_DMIC_IN];
   293		const struct mtk_dai_dmic_ctrl_reg *reg = NULL;
   294		unsigned int channels = dmic_priv->channels;
   295		unsigned int msk;
   296		u8 dmic_num;
   297		int i;
   298	
   299		dev_dbg(afe->dev, "%s(), name %s, event 0x%x\n",
   300			__func__, w->name, event);
   301	
   302		if (!channels)
   303			return -EINVAL;
   304	
   305		dmic_num = mtk_dmic_channels_to_dmic_number(channels);
   306	
   307		switch (event) {
   308		case SND_SOC_DAPM_PRE_PMU:
   309			/* request fifo soft rst */
   310			for (i = dmic_num; i >= DMIC0; i--)
 > 311				msk |= PWR2_TOP_CON1_DMIC_FIFO_SOFT_RST_EN(i);
   312	
   313			regmap_set_bits(afe->regmap, PWR2_TOP_CON1, msk);
   314	
   315			msk = AFE_DMIC_UL_SRC_CON0_UL_MODE_3P25M_CH1_CTL |
   316			      AFE_DMIC_UL_SRC_CON0_UL_MODE_3P25M_CH2_CTL |
   317			      AFE_DMIC_UL_SRC_CON0_UL_SDM_3_LEVEL_CTL |
   318			      AFE_DMIC_UL_SRC_CON0_UL_IIR_ON_TMP_CTL;
   319	
   320			for (i = dmic_num; i >= DMIC0; i--) {
   321				reg = get_dmic_ctrl_reg(i);
   322				if (reg)
   323					regmap_set_bits(afe->regmap, reg->con0, msk);
   324			}
   325			break;
   326		case SND_SOC_DAPM_POST_PMU:
   327			msk = AFE_DMIC_UL_SRC_CON0_UL_SRC_ON_TMP_CTL;
   328	
   329			for (i = dmic_num; i >= DMIC0; i--) {
   330				reg = get_dmic_ctrl_reg(i);
   331				if (reg)
   332					regmap_set_bits(afe->regmap, reg->con0, msk);
   333			}
   334	
   335			if (dmic_priv->hires_required) {
   336				mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_DMIC_HIRES1]);
   337				mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_DMIC_HIRES2]);
   338				mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_DMIC_HIRES3]);
   339				mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_DMIC_HIRES4]);
   340			}
   341	
   342			mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE_DMIC1]);
   343			mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE_DMIC2]);
   344			mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE_DMIC3]);
   345			mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE_DMIC4]);
   346	
   347			/* release fifo soft rst */
   348			msk = 0;
   349			for (i = dmic_num; i >= DMIC0; i--)
   350				msk |= PWR2_TOP_CON1_DMIC_FIFO_SOFT_RST_EN(i);
   351	
   352			regmap_clear_bits(afe->regmap, PWR2_TOP_CON1, msk);
   353			break;
   354		case SND_SOC_DAPM_PRE_PMD:
   355			msk = AFE_DMIC_UL_SRC_CON0_UL_MODE_3P25M_CH1_CTL |
   356			      AFE_DMIC_UL_SRC_CON0_UL_MODE_3P25M_CH2_CTL |
   357			      AFE_DMIC_UL_SRC_CON0_UL_SRC_ON_TMP_CTL |
   358			      AFE_DMIC_UL_SRC_CON0_UL_IIR_ON_TMP_CTL |
   359			      AFE_DMIC_UL_SRC_CON0_UL_SDM_3_LEVEL_CTL;
   360	
   361			for (i = dmic_num; i >= DMIC0; i--) {
   362				reg = get_dmic_ctrl_reg(i);
   363				if (reg)
   364					regmap_set_bits(afe->regmap, reg->con0, msk);
   365			}
   366			break;
   367		case SND_SOC_DAPM_POST_PMD:
   368			/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
   369			usleep_range(125, 126);
   370	
   371			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE_DMIC1]);
   372			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE_DMIC2]);
   373			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE_DMIC3]);
   374			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE_DMIC4]);
   375	
   376			if (dmic_priv->hires_required) {
   377				mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_DMIC_HIRES1]);
   378				mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_DMIC_HIRES2]);
   379				mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_DMIC_HIRES3]);
   380				mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_DMIC_HIRES4]);
   381			}
   382			break;
   383		default:
   384			break;
   385		}
   386	
   387		return 0;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
