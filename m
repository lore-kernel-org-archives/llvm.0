Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C4E6AB6;
	Wed, 19 Jun 2024 01:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760038; cv=none; b=CeMk7tviHBgsauEY3vSY2w31zUM//9gdl/oYhMTE026+7Z3FA9LEcKoWBWSpvGlvQkD2bYG4oIDCUyQlS6iAeLphL1wdrSKrPNbLs0QSEKct90ge3/3/8ekXJ6eVkJAOeC90MeeZyfIbuvNYCHb7qphK125abuNAEGVwHEAn2vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760038; c=relaxed/simple;
	bh=YAOHYSF2kfOC5GvJiRI6/Eu1rzyWRuWM8z0fAkNkmgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqos2DC1NYOAxuJavGXj1hFe+y8MTGCV8VoG85asJGWtcAOsvVtU/sQvIpXpNZW/833lh7HiQxIH3bF7ZAMMa6fGJk+9wpqrDLiDyVWevrcwh4+En+QZYcu39FOLIWw9Hch9MRXgQJbOHu0ac4m1wSPpWLQIS/C+WiRyMrsZRFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ib1r2/ge; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ib1r2/ge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718760036; x=1750296036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YAOHYSF2kfOC5GvJiRI6/Eu1rzyWRuWM8z0fAkNkmgU=;
  b=Ib1r2/geNVCGDATEEq2Yn6dwIiE3C3ucBwAydbntblPkcp/BHGJo7QRW
   7fNy6J4JSI9BfPLHIpJNSO1MmmBog6bnNyprk4UQETokG4R6uZbbvBg8f
   EnW95NyeSmK+VT7LryYkij9k9BUAoMvT0oIdoBziuaroIA0kwP4o6eY4g
   S/Tmg+RiQNu82jlvrOUff1ZizLU0NAuLiOJksjTAZRFQmGu3csYhCrzgW
   SKFiudDVx+EEPpTy6Bkw2YL2TcNdF9ds2ZQOdf5tXNt5LKiTJRrazSsNm
   1nxEUi469namx0O5b+QWiiBTR2IvoQKTMhhglFtMD5xFQdrz5I3W/jcYb
   w==;
X-CSE-ConnectionGUID: oWZkYIzXTXi/Vf52pak+7g==
X-CSE-MsgGUID: eMgzDTLkSe+qk6jOG/IyKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15805304"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15805304"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 18:20:35 -0700
X-CSE-ConnectionGUID: 6V5X6AoMTPKvwSDudaZOxw==
X-CSE-MsgGUID: sMe9BSUcRACrxbiuh7slWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42430221"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jun 2024 18:20:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJjzx-00067k-2w;
	Wed, 19 Jun 2024 01:20:29 +0000
Date: Wed, 19 Jun 2024 09:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Message-ID: <202406190857.mozJxHDO-lkp@intel.com>
References: <20240618-lpass-wsa-vi-v1-1-416a6f162c81@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-lpass-wsa-vi-v1-1-416a6f162c81@linaro.org>

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-lpass-wsa-macro-Fix-vi-feedback-rate/20240618-221030
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240618-lpass-wsa-vi-v1-1-416a6f162c81%40linaro.org
patch subject: [PATCH 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
config: i386-buildonly-randconfig-002-20240619 (https://download.01.org/0day-ci/archive/20240619/202406190857.mozJxHDO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190857.mozJxHDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190857.mozJxHDO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/lpass-wsa-macro.c:999:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     999 |         default:
         |         ^
   sound/soc/codecs/lpass-wsa-macro.c:999:2: note: insert 'break;' to avoid fall-through
     999 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +999 sound/soc/codecs/lpass-wsa-macro.c

809bcbcecebff8 Srinivas Kandagatla 2020-11-05   976  
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   977  static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   978  			       struct snd_pcm_hw_params *params,
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   979  			       struct snd_soc_dai *dai)
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   980  {
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   981  	struct snd_soc_component *component = dai->component;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   982  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   983  	int ret;
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   984  
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   985  	switch (substream->stream) {
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   986  	case SNDRV_PCM_STREAM_PLAYBACK:
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   987  		ret = wsa_macro_set_interpolator_rate(dai, params_rate(params));
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   988  		if (ret) {
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   989  			dev_err(component->dev,
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   990  				"%s: cannot set sample rate: %u\n",
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   991  				__func__, params_rate(params));
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   992  			return ret;
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   993  		}
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   994  		break;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   995  	case SNDRV_PCM_STREAM_CAPTURE:
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   996  		if (dai->id == WSA_MACRO_AIF_VI)
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   997  			wsa->pcm_rate_vi = params_rate(params);
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   998  
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  @999  	default:
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1000  		break;
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1001  	}
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1002  	return 0;
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1003  }
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1004  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
