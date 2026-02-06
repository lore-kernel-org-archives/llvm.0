Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D56E2FFF8D;
	Fri,  6 Feb 2026 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394809; cv=none; b=m1wcFcIJHZ8ZqwkVIrLthAbg/LClz4J9LGa5MQiDb5xGkoHzVSquwnvmSVFpFg3houEvzbx+inxQlL870vz+YtsnQO8yZ6zrj7yJwwdZxbQwZmd4hirif0jAPiKqL1qCXmUegtI4IrUbTsz4DsdZWjIWrJ1F1zMeIqu8WepmVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394809; c=relaxed/simple;
	bh=f0XDwV9tjto381cHBE9tb6ddkN7CanMXtXtA+02cOqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6lihmbzc6E4iVNHtVL7bqGnKmWJcbnnFFSGaMOix8jTaQOtLzL4dtyrlolSDAXvqGOKxk/Zb/IjDz6IxXDVimfC1F4kdUcbNK0L+K60t08mwIZBZxlHMbJm8WtXw9KnSfYo0G7w5Btet2PJzisdiejFoePHWfAUaL6CLJfVjGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAlvcnm5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAlvcnm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770394809; x=1801930809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0XDwV9tjto381cHBE9tb6ddkN7CanMXtXtA+02cOqU=;
  b=QAlvcnm5lV5j1YwFRp0D8IVfTMh549R5zcPfMS/l+rzVAnpKAKtgQsK5
   awGnKU3ndqtyUI0Z+s3JCY0eKHzb1mhUeBlB43Ie0qR1g0O7HFO7cyTpf
   cPfMcyX9pZsEXociwjp8Awon7jW9m0E/27qiBTpmVoRFb0XtsFoGUKs1Q
   SedT4QwYDoh/sN/5As0OAT9N1+Go98N8kRhU45RyFvcxHTva+hMG20mR7
   GKMQ1tX9OT7N/vQPeY5/1f4fxHiX2MK81c6MbtbfTplq8/9FIedYKlWNL
   7HxAR8v8TmjswSZMtcaZxOB+h7MKcDb54VCeiMiO4fi+23yRbzKgZ3pO3
   g==;
X-CSE-ConnectionGUID: wTbzOCuySV2+xynrAFFBiA==
X-CSE-MsgGUID: EoWBXQocSRm37oo7lVDWTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75224960"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75224960"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 08:20:08 -0800
X-CSE-ConnectionGUID: eEkGmmJjQXC8p+o7zp96Fw==
X-CSE-MsgGUID: 8nvw3XAgQKK8jD09amGXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215085419"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2026 08:20:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voOYs-00000000ktM-1Zd1;
	Fri, 06 Feb 2026 16:20:02 +0000
Date: Sat, 7 Feb 2026 00:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ASoC: fsl_xcvr: add bitcount and timestamp controls
Message-ID: <202602070032.CtJMTCOn-lkp@intel.com>
References: <20260206084334.483404-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206084334.483404-3-shengjiu.wang@nxp.com>

Hi Shengjiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.19-rc8 next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_sai-add-bitcount-and-timestamp-controls/20260206-164423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260206084334.483404-3-shengjiu.wang%40nxp.com
patch subject: [PATCH 2/2] ASoC: fsl_xcvr: add bitcount and timestamp controls
config: hexagon-randconfig-002-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070032.CtJMTCOn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070032.CtJMTCOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070032.CtJMTCOn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_xcvr.c:70:46: error: call to undeclared function '__bf_shf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      70 |         SOC_ENUM_SINGLE(FSL_XCVR_TX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC),
         |                                                     ^
>> sound/soc/fsl/fsl_xcvr.c:70:46: error: initializer element is not a compile-time constant
      70 |         SOC_ENUM_SINGLE(FSL_XCVR_TX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC),
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      71 |                         ARRAY_SIZE(inc_mode), inc_mode),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/soc.h:215:24: note: expanded from macro 'SOC_ENUM_SINGLE'
     215 |         SOC_ENUM_DOUBLE(xreg, xshift, xshift, xitems, xtexts)
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/soc.h:211:27: note: expanded from macro 'SOC_ENUM_DOUBLE'
     211 | {       .reg = xreg, .shift_l = xshift_l, .shift_r = xshift_r, \
         |                                 ^~~~~~~~
   sound/soc/fsl/fsl_xcvr.c:78:6: error: initializer element is not a compile-time constant
      78 |                    __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:81:6: error: initializer element is not a compile-time constant
      81 |                    __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:83:6: error: initializer element is not a compile-time constant
      83 |                    __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:93:6: error: initializer element is not a compile-time constant
      93 |                    __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:96:6: error: initializer element is not a compile-time constant
      96 |                    __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:98:6: error: initializer element is not a compile-time constant
      98 |                    __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC), 1, 0),
         |                    ^
>> sound/soc/fsl/fsl_xcvr.c:1133:19: error: invalid application of 'sizeof' to an incomplete type 'const struct snd_kcontrol_new[]'
    1133 |         .num_controls           = ARRAY_SIZE(fsl_xcvr_timestamp_ctrls),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   9 errors generated.


vim +/__bf_shf +70 sound/soc/fsl/fsl_xcvr.c

    68	
    69	static const struct soc_enum tstmp_enum[] = {
  > 70		SOC_ENUM_SINGLE(FSL_XCVR_TX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC),
    71				ARRAY_SIZE(inc_mode), inc_mode),
    72		SOC_ENUM_SINGLE(FSL_XCVR_RX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC),
    73				ARRAY_SIZE(inc_mode), inc_mode),
    74	};
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
