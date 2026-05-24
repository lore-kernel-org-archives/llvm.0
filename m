Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A1212566;
	Sun, 24 May 2026 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779649340; cv=none; b=lQr8ATKvv8TVrgkoIU45MTSyZ+g9cux8/qFw3XYG+75A41RFVXPFuTmU7IRSqMho9rnmFjZK0pTRh24bmsYHAhNlGUnoQaD0GPecW6bJ5Ce7inj9v7rb9FLYWgqiba0dzoUdedZaPcuxKQMYjXwch/QNlPAmQypjnccDH310u3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779649340; c=relaxed/simple;
	bh=AnFe+X4jefgsJLBLi8wT/ZcBch3lq9zdw5DJN2VeNOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gwMbqwOFJdqLOjxs05dcz/Z9G4jJn2vA1fpbSplK9FRKibmmYkgkBOFM0UF0e6Pn7gsfaFcsFHmTHG4hWwr53MSSrbss5N4puIybodFrm1Ptn/24HsrWTYTng8Zp/+6fRBHjrVbI6ZxP3jGyyJ/3Oq4vBUWafr/SJIUVgT5eofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJfpuqMv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJfpuqMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779649339; x=1811185339;
  h=date:from:to:cc:subject:message-id;
  bh=AnFe+X4jefgsJLBLi8wT/ZcBch3lq9zdw5DJN2VeNOI=;
  b=cJfpuqMvAqT7pl2dX4uVLKRaYOaBjVDwg31fwJTlgls/PHMPFc0TZXRY
   C2WvRQ8QZbcpRQuQPQR8ChcTvTWhUgw+N7/QC1dCz3nc221zo+mp3gRYn
   lVXmyitXhXeKv+NaWHYnm71pTpCJtgCmWoBSU3dppTe0TkbBkaIUVoq4u
   qTOegMXxQ9iaG8ssxBD4TLb3rrdD7ER+vuHJ407nac2hN+8YI8DyZJjh1
   t3DxqAnYY0wqCODdUvXQefgicoaLSohWbCDsCovNLJROQAwasr7W31eJ2
   otRgMgvaMzhv9IhlaUoES+aE/BuZaxlCIYO28iAbbsdtLeQ8+NWoiFslG
   A==;
X-CSE-ConnectionGUID: 4axKBDIBQpC0bZzrvSLgfg==
X-CSE-MsgGUID: YA3r+XKFSRqswyt0mLelRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="79519586"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="79519586"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 12:02:18 -0700
X-CSE-ConnectionGUID: LBCKo5PsTBGwDLRVicFGEw==
X-CSE-MsgGUID: HqMqv6A9S1yA8GyDK2/kwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="279516494"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 May 2026 12:02:18 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRE5W-000000000Wn-1ymz;
	Sun, 24 May 2026 19:02:14 +0000
Date: Mon, 25 May 2026 03:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22-2 254/254]
 sound/soc/qcom/sdm845.c:194:3: warning: label followed by a declaration is a
 C23 extension
Message-ID: <202605250231.DhkQNf1D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22-2
head:   7f5e6579901e0a1f3ff8bb45002dc226961a56ce
commit: d03a6e1ad1aad1d9047cd17992d4557ed9d3eb84 [254/254] dai
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260525/202605250231.DhkQNf1D-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605250231.DhkQNf1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605250231.DhkQNf1D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/sdm845.c:194:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     194 |                 struct snd_soc_component *codec = snd_soc_dai_to_component(codec_dai);
         |                 ^
   1 warning generated.


vim +194 sound/soc/qcom/sdm845.c

   181	
   182	static int sdm845_snd_hw_params(struct snd_pcm_substream *substream,
   183						struct snd_pcm_hw_params *params)
   184	{
   185		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
   186		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   187		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
   188		int cpu_id = snd_soc_dai_id(cpu_dai);
   189		int ret = 0;
   190	
   191		switch (cpu_id) {
   192		case PRIMARY_MI2S_RX:
   193		case PRIMARY_MI2S_TX:
 > 194			struct snd_soc_component *codec = snd_soc_dai_to_component(codec_dai);
   195	
   196			/*
   197			 * Use ASRC for internal clocks, as PLL rate isn't multiple
   198			 * of BCLK.
   199			 */
   200			rt5663_sel_asrc_clk_src(
   201				codec,
   202				RT5663_DA_STEREO_FILTER | RT5663_AD_STEREO_FILTER,
   203				RT5663_CLK_SEL_I2S1_ASRC);
   204			ret = snd_soc_dai_set_sysclk(
   205				codec_dai, RT5663_SCLK_S_MCLK, DEFAULT_MCLK_RATE,
   206				SND_SOC_CLOCK_IN);
   207			if (ret < 0)
   208				dev_err(rtd->dev,
   209					"snd_soc_dai_set_sysclk err = %d\n", ret);
   210			break;
   211		case QUATERNARY_TDM_RX_0:
   212		case QUATERNARY_TDM_TX_0:
   213			ret = sdm845_tdm_snd_hw_params(substream, params);
   214			break;
   215		case SLIMBUS_0_RX...SLIMBUS_6_TX:
   216			ret = sdm845_slim_snd_hw_params(substream, params);
   217			break;
   218		case QUATERNARY_MI2S_RX:
   219		case SECONDARY_MI2S_RX:
   220			break;
   221		default:
   222			pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_id);
   223			break;
   224		}
   225		return ret;
   226	}
   227	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
