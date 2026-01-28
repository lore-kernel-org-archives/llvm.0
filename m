Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570CF2C11E9;
	Wed, 28 Jan 2026 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594555; cv=none; b=B5YkJkHlZHUzN2cK4Ao1Xvrpcpwc0qB4wnMX0EzhbqP9ptHtN5y8DoVbOHtzchGVCH9ii4FJsOJhcnf4neC1mqaTpENckvERBnHAQfiatZlV9Qm1Gmjf88KhVutq6hPkMw8nNa+DJt22PPEiI432XiRFpdHg707kV3hy9lVpM7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594555; c=relaxed/simple;
	bh=M/1XAAe2fXUTjteJOxDYo6ou5Wc8lghhfgq/fQ9TNFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnaiG6e43x5+VFTjDjQX39Sae08scnUiVtVeODFM4dX97L8kqenZxCWRDB2LAtPgFmIQDvYPGF/WgICI2+u7wzXqJbnapAjphqR0BEtOg7VZShV4CvNHtfZl4GMWzRpbMAWuYuy12o3aizXAiCWUkgT0PZMgWtj2XhA0SypOSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcuK0+Gm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcuK0+Gm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769594554; x=1801130554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M/1XAAe2fXUTjteJOxDYo6ou5Wc8lghhfgq/fQ9TNFk=;
  b=AcuK0+Gm/oB83L2Jnvyu6XN1/eBLmQJNq+wAMcofy0LnmVwmGwdDWe7l
   FZcvfR4pBPBaP8Pk3RNxpwtcLCnDSvDxCRMmgbkAWCe3cy9rV3cGSCsRM
   jstbGcqQm2lJ56IjapSe3MJ/22pZLJfgFoa4gKXO8H4UvgJbXbQwepq0o
   P0WByboRONrQj0hBSnuyAPHBYDMrZNQ9tkiuvesdImJeUN3UIIGL/u3jp
   69qjqxDoO84JrnNWzFU6KT2qHxI9AhBwuzNvy5eHGiVGnXHB4Iaf89D7e
   945m7IXfU6FtqdSKQV3KnWmEBEP3PpOQK4XXuUu/Fh8ml7Pg3Dk2vsSrL
   w==;
X-CSE-ConnectionGUID: SzlYV4/6TU+6zQmwC48SVg==
X-CSE-MsgGUID: P5nV5O/LRvWuUXEhUaUmFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70891963"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70891963"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 02:02:33 -0800
X-CSE-ConnectionGUID: 8I8p/2p0TrGpQgtzGYcMgw==
X-CSE-MsgGUID: q85tbTJXQiWSPpZl4S4FGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208015458"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jan 2026 02:02:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl2NW-00000000ZWa-0RDG;
	Wed, 28 Jan 2026 10:02:26 +0000
Date: Wed, 28 Jan 2026 18:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexey Charkov <alchark@gmail.com>,
	Sjoerd Simons <sjoerd.simons@collabora.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
Message-ID: <202601281701.vJDagmwh-lkp@intel.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/ASoC-rockchip-spdif-Use-device_get_match_data/20260128-001701
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb%40collabora.com
patch subject: [PATCH 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
config: hexagon-randconfig-002-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281701.vJDagmwh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281701.vJDagmwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281701.vJDagmwh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/rockchip/rockchip_spdif.c:109:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     109 |         unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
         |                            ^
   sound/soc/rockchip/rockchip_spdif.h:33:36: note: expanded from macro 'SPDIF_CFGR_HALFWORD_ENABLE'
      33 | #define SPDIF_CFGR_HALFWORD_ENABLE      FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 1)
         |                                         ^
   sound/soc/rockchip/rockchip_spdif.c:182:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     182 |                                          SPDIF_DMACR_TDE_ENABLE |
         |                                          ^
   sound/soc/rockchip/rockchip_spdif.h:48:33: note: expanded from macro 'SPDIF_DMACR_TDE_ENABLE'
      48 | #define SPDIF_DMACR_TDE_ENABLE          FIELD_PREP(SPDIF_DMACR_TDE_MASK, 1)
         |                                         ^
   2 errors generated.


vim +/FIELD_PREP +109 sound/soc/rockchip/rockchip_spdif.c

f874b80e157111 Sjoerd Simons     2015-10-08  102  
f874b80e157111 Sjoerd Simons     2015-10-08  103  static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
f874b80e157111 Sjoerd Simons     2015-10-08  104  			      struct snd_pcm_hw_params *params,
f874b80e157111 Sjoerd Simons     2015-10-08  105  			      struct snd_soc_dai *dai)
f874b80e157111 Sjoerd Simons     2015-10-08  106  {
f874b80e157111 Sjoerd Simons     2015-10-08  107  	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
b8e112b77e45b4 Sugar Zhang       2026-01-27  108  	unsigned int mclk_rate = clk_get_rate(spdif->mclk);
f874b80e157111 Sjoerd Simons     2015-10-08 @109  	unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  110  	int bmc, div, ret, i;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  111  	u16 *fc;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  112  	u8 cs[CS_BYTE];
9cd33c09d22fd1 Sugar Zhang       2026-01-27  113  
9cd33c09d22fd1 Sugar Zhang       2026-01-27  114  	ret = snd_pcm_create_iec958_consumer_hw_params(params, cs, sizeof(cs));
9cd33c09d22fd1 Sugar Zhang       2026-01-27  115  	if (ret < 0)
9cd33c09d22fd1 Sugar Zhang       2026-01-27  116  		return ret;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  117  
9cd33c09d22fd1 Sugar Zhang       2026-01-27  118  	fc = (u16 *)cs;
9cd33c09d22fd1 Sugar Zhang       2026-01-27  119  	for (i = 0; i < CS_BYTE / 2; i++)
9cd33c09d22fd1 Sugar Zhang       2026-01-27  120  		regmap_write(spdif->regmap, SPDIF_CHNSRn(i), CS_FRAME(fc[i]));
9cd33c09d22fd1 Sugar Zhang       2026-01-27  121  
9cd33c09d22fd1 Sugar Zhang       2026-01-27  122  	regmap_update_bits(spdif->regmap, SPDIF_CFGR, SPDIF_CFGR_CSE_MASK,
9cd33c09d22fd1 Sugar Zhang       2026-01-27  123  			   SPDIF_CFGR_CSE_EN);
f874b80e157111 Sjoerd Simons     2015-10-08  124  
b8e112b77e45b4 Sugar Zhang       2026-01-27  125  	/* bmc = 128fs */
b8e112b77e45b4 Sugar Zhang       2026-01-27  126  	bmc = 128 * params_rate(params);
b8e112b77e45b4 Sugar Zhang       2026-01-27  127  	div = DIV_ROUND_CLOSEST(mclk_rate, bmc);
b8e112b77e45b4 Sugar Zhang       2026-01-27  128  	val |= SPDIF_CFGR_CLK_DIV(div);
f874b80e157111 Sjoerd Simons     2015-10-08  129  
f874b80e157111 Sjoerd Simons     2015-10-08  130  	switch (params_format(params)) {
f874b80e157111 Sjoerd Simons     2015-10-08  131  	case SNDRV_PCM_FORMAT_S16_LE:
f874b80e157111 Sjoerd Simons     2015-10-08  132  		val |= SPDIF_CFGR_VDW_16;
908589f3825713 Sugar Zhang       2026-01-27  133  		val |= SPDIF_CFGR_ADJ_RIGHT_J;
f874b80e157111 Sjoerd Simons     2015-10-08  134  		break;
f874b80e157111 Sjoerd Simons     2015-10-08  135  	case SNDRV_PCM_FORMAT_S20_3LE:
f874b80e157111 Sjoerd Simons     2015-10-08  136  		val |= SPDIF_CFGR_VDW_20;
908589f3825713 Sugar Zhang       2026-01-27  137  		val |= SPDIF_CFGR_ADJ_RIGHT_J;
f874b80e157111 Sjoerd Simons     2015-10-08  138  		break;
f874b80e157111 Sjoerd Simons     2015-10-08  139  	case SNDRV_PCM_FORMAT_S24_LE:
f874b80e157111 Sjoerd Simons     2015-10-08  140  		val |= SPDIF_CFGR_VDW_24;
908589f3825713 Sugar Zhang       2026-01-27  141  		val |= SPDIF_CFGR_ADJ_RIGHT_J;
908589f3825713 Sugar Zhang       2026-01-27  142  		break;
908589f3825713 Sugar Zhang       2026-01-27  143  	case SNDRV_PCM_FORMAT_S32_LE:
908589f3825713 Sugar Zhang       2026-01-27  144  		val |= SPDIF_CFGR_VDW_24;
908589f3825713 Sugar Zhang       2026-01-27  145  		val |= SPDIF_CFGR_ADJ_LEFT_J;
f874b80e157111 Sjoerd Simons     2015-10-08  146  		break;
f874b80e157111 Sjoerd Simons     2015-10-08  147  	default:
f874b80e157111 Sjoerd Simons     2015-10-08  148  		return -EINVAL;
f874b80e157111 Sjoerd Simons     2015-10-08  149  	}
f874b80e157111 Sjoerd Simons     2015-10-08  150  
908589f3825713 Sugar Zhang       2026-01-27  151  	/*
908589f3825713 Sugar Zhang       2026-01-27  152  	 * clear MCLK domain logic before setting Fmclk and Fsdo to ensure
908589f3825713 Sugar Zhang       2026-01-27  153  	 * that switching between S16_LE and S32_LE audio does not result
908589f3825713 Sugar Zhang       2026-01-27  154  	 * in accidential channels swap.
908589f3825713 Sugar Zhang       2026-01-27  155  	 */
908589f3825713 Sugar Zhang       2026-01-27  156  	regmap_update_bits(spdif->regmap, SPDIF_CFGR, SPDIF_CFGR_CLR_MASK,
908589f3825713 Sugar Zhang       2026-01-27  157  			   SPDIF_CFGR_CLR_EN);
908589f3825713 Sugar Zhang       2026-01-27  158  	udelay(1);
908589f3825713 Sugar Zhang       2026-01-27  159  
f874b80e157111 Sjoerd Simons     2015-10-08  160  	ret = regmap_update_bits(spdif->regmap, SPDIF_CFGR,
acc8b9d117912c Sugar Zhang       2021-08-24  161  				 SPDIF_CFGR_CLK_DIV_MASK |
85c46be12ede08 Sebastian Reichel 2026-01-27  162  				 SPDIF_CFGR_HALFWORD_MASK |
908589f3825713 Sugar Zhang       2026-01-27  163  				 SDPIF_CFGR_VDW_MASK |
908589f3825713 Sugar Zhang       2026-01-27  164  				 SPDIF_CFGR_ADJ_MASK, val);
f874b80e157111 Sjoerd Simons     2015-10-08  165  
f874b80e157111 Sjoerd Simons     2015-10-08  166  	return ret;
f874b80e157111 Sjoerd Simons     2015-10-08  167  }
f874b80e157111 Sjoerd Simons     2015-10-08  168  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
