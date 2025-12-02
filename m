Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F819E819;
	Tue,  2 Dec 2025 00:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764636291; cv=none; b=N+0rxs9K0G0giXjGxpfZVOBE7Fmobw9nD/xgFdpunaxyPt2c0IK+snMzxFLjbPO1HjaBDxMGSQG5jnLFs6Ng54WFMV628fOmFH1sR7eAV7JN1wDjBSfo3u+hEHaetRwlu7h0rNEx+kdwXpK1Ec6DpYFl1mN2VeA03S/6Ejc8ipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764636291; c=relaxed/simple;
	bh=JWkRiQHaY0taksXJV9Te5hrv5XxA9RnCc3J+jp9nZKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNXx+Ek+iaUa/PLvjdCg/hnOIKjoBxj8IPGWASsnr3TfviD9IkCNSyfJgdD+LTXVdiXVDGbSnXlf3pnB9UgbOagDLY+tFTmC7gFa2yyIxeY3o5U3wwruUFVIkIpGtpr2FMfWadzV4xngA792LfUA/4fGxNwmUC8xBck2sc3cKsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpK0gN0A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpK0gN0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764636290; x=1796172290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JWkRiQHaY0taksXJV9Te5hrv5XxA9RnCc3J+jp9nZKg=;
  b=SpK0gN0AptwSAK0+4MrpPNZzYf2hiO9nT8ZliPfGMIGpzdlG4OH2J52U
   08TUyUJcLyr0FdcfzoZCL/kZx4deaGhIdYpSIvnjhbmkZgwq6u4UPtmUC
   8vGaVj1FN2dw2iFWz1VCHM3whikkjU3orqvdhcIQ0hSeopY03A6Acsukr
   ndj/fYaZ/3YJeD3OtDGWyLj4XZKjZt6j9Kp6QvXVA7HTIc3D8rPZ1vFRI
   66OJYC/SPssplEa780PcEGHG6yZtCfbR9mHeqG/HrPSWdqTm/g01AqUZX
   FQCdYdKlOR9ugfEqgupcwsBdL2IdNyBWrsIJqhTZC+pnxovHaEMzBi45s
   w==;
X-CSE-ConnectionGUID: idfdiTMcSci6WYxdkTy+dA==
X-CSE-MsgGUID: HHjN4ItnRpiUzM158+xLjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76912571"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="76912571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 16:44:48 -0800
X-CSE-ConnectionGUID: 7Bd5vMjtRUGY+tQDLb15lw==
X-CSE-MsgGUID: mPupN3h8SBigqePJqtcJGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193498845"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2025 16:44:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQEVX-000000009GV-25Uv;
	Tue, 02 Dec 2025 00:44:43 +0000
Date: Tue, 2 Dec 2025 08:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-01 12/13]
 sound/soc/sti/uniperif_reader.c:422:2: error: member reference base type
 'int (struct snd_soc_dai *, unsigned int, unsigned int, int, int)' is not a
 structure or union
Message-ID: <202512020812.JIZvBt74-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-01
head:   a5568a9bacc493dbb1465f3b850acf8595553013
commit: 37f1f58e36152e534fc127762820579e3a28ea85 [12/13] hoge
config: i386-buildonly-randconfig-003-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020812.JIZvBt74-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020812.JIZvBt74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020812.JIZvBt74-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sti/uniperif_reader.c:422:2: error: member reference base type 'int (struct snd_soc_dai *, unsigned int, unsigned int, int, int)' is not a structure or union
     421 |         .set_tdm_slot                   = sti_uniperiph_set_tdm_slot
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~
     422 |         .auto_selectable_formats        = &uni_selectable_formats,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sti/uniperif_reader.c:422:30: error: use of undeclared identifier 'uni_selectable_formats'; did you mean 'ui_selectable_formats'?
     422 |         .auto_selectable_formats        = &uni_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
         |                                            ui_selectable_formats
   sound/soc/sti/uniperif_reader.c:404:18: note: 'ui_selectable_formats' declared here
     404 | static const u64 ui_selectable_formats =
         |                  ^
   2 errors generated.
--
>> sound/soc/sti/uniperif_player.c:1060:2: error: member reference base type 'int (struct snd_soc_dai *, unsigned int, unsigned int, int, int)' is not a structure or union
    1059 |         .set_tdm_slot                   = sti_uniperiph_set_tdm_slot
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~
    1060 |         .auto_selectable_formats        = &uni_selectable_formats,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> sound/soc/uniphier/aio-cpu.c:464:30: error: use of undeclared identifier 'uniphier_dai_selectable_formats'; did you mean 'uniphier_aio_selectable_formats'?
     464 |         .auto_selectable_formats        = &uniphier_dai_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            uniphier_aio_selectable_formats
   sound/soc/uniphier/aio-cpu.c:448:18: note: 'uniphier_aio_selectable_formats' declared here
     448 | static const u64 uniphier_aio_selectable_formats =
         |                  ^
   1 error generated.
--
>> sound/soc/sunxi/sun4i-i2s.c:1113:18: error: array initializer must be an initializer list
    1113 | static const u64 sun4i_i2s_selectable_formats[] =
         |                  ^
>> sound/soc/sunxi/sun4i-i2s.c:1123:2: error: expected identifier or '('
    1123 |         SND_SOC_POSSIBLE_DAIFMT_DSP_A   |
         |         ^
   include/sound/soc-dai.h:50:41: note: expanded from macro 'SND_SOC_POSSIBLE_DAIFMT_DSP_A'
      50 | #define SND_SOC_POSSIBLE_DAIFMT_DSP_A           (1 << SND_SOC_DAI_FORMAT_DSP_A)
         |                                                  ^
>> sound/soc/sunxi/sun4i-i2s.c:1123:2: error: expected ')'
   include/sound/soc-dai.h:50:41: note: expanded from macro 'SND_SOC_POSSIBLE_DAIFMT_DSP_A'
      50 | #define SND_SOC_POSSIBLE_DAIFMT_DSP_A           (1 << SND_SOC_DAI_FORMAT_DSP_A)
         |                                                  ^
   sound/soc/sunxi/sun4i-i2s.c:1123:2: note: to match this '('
   include/sound/soc-dai.h:50:40: note: expanded from macro 'SND_SOC_POSSIBLE_DAIFMT_DSP_A'
      50 | #define SND_SOC_POSSIBLE_DAIFMT_DSP_A           (1 << SND_SOC_DAI_FORMAT_DSP_A)
         |                                                 ^
>> sound/soc/sunxi/sun4i-i2s.c:1123:31: error: expected ';' after top level declarator
    1123 |         SND_SOC_POSSIBLE_DAIFMT_DSP_A   |
         |                                      ^
         |                                      ;
>> sound/soc/sunxi/sun4i-i2s.c:1135:33: error: invalid application of 'sizeof' to an incomplete type 'const u64[]' (aka 'const unsigned long long[]')
    1135 |         .num_auto_selectable_formats    = ARRAY_SIZE(sun4i_i2s_selectable_formats),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   5 errors generated.


vim +422 sound/soc/sti/uniperif_reader.c

   399	
   400	/*
   401	 * Select below from Sound Card, not Auto
   402	 *	SND_SOC_DAIFMT_CBx_CFx
   403	 */
   404	static const u64 ui_selectable_formats =
   405		SND_SOC_POSSIBLE_DAIFMT_I2S	|
   406		SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
   407		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
   408		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
   409		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
   410		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
   411		SND_SOC_POSSIBLE_DAIFMT_IB_IF;
   412	
   413	static const struct snd_soc_dai_ops uni_reader_dai_ops = {
   414		.startup			= uni_reader_startup,
   415		.shutdown			= uni_reader_shutdown,
   416		.prepare			= uni_reader_prepare,
   417		.probe				= sti_uniperiph_dai_probe,
   418		.trigger			= uni_reader_trigger,
   419		.hw_params			= sti_uniperiph_dai_hw_params,
   420		.set_fmt			= sti_uniperiph_dai_set_fmt,
   421		.set_tdm_slot			= sti_uniperiph_set_tdm_slot
 > 422		.auto_selectable_formats	= &uni_selectable_formats,
   423		.num_auto_selectable_formats	= 1,
   424	};
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
