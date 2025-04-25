Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E023D2BA;
	Fri, 25 Apr 2025 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579469; cv=none; b=MtHWi7ltbKPx01YgqekTpOqxoQOm/dyztXPqrEUTLCwxfCdI8tkJA+tE7jk75ZJsnrT0FgDXDftd9gbNuCI0lwnvHGbxe4lm758tyEpRqrJHyPe9Riy2TVUHEuzEJqIzlmqtOE+9hkbJ7YwCa/wvwLp+AAIFR6R6jDAb2iFbQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579469; c=relaxed/simple;
	bh=D9/GzfOmn7mkCRhmavt1xsGnv/oZkUBhxuKpRx7+XNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFILX83+LjnSR+tZCHlxXyMbdZJ8Jk176+bzEr5GiI/TYvMsPi/GRFICnKPc7ol3rJ/7qw/jERxS78HJvfn0AfM88m4CcB/JDgSTEWkoJe7MynxMORiiYkrj+eskE9oyrextekonjouHG4AL4dcy0EcoGJYOb76hYico/p+ctjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vvgffcn1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vvgffcn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745579467; x=1777115467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D9/GzfOmn7mkCRhmavt1xsGnv/oZkUBhxuKpRx7+XNI=;
  b=Vvgffcn1DOyZXIfd4xLO/s9wxH95eearSshMJjDdL1f+h/F0NhjUWdDl
   tZLBy90UnmURS5hAq9W3OChPRXCrhwgpkaB1UJVrTuMQclYCvjMBFI4A4
   wJJRa6h8ylh/6Lxhd6gbmgs3Gr/JdnHMus9XmZRAmZeJ6wrG/uEgtD/Di
   k2zwnpcDrfiNLBZ1sghqNBP4T6chMdv7E4OQ3T0fwBFXAT4nEz8gZPkt7
   9SYSB2R/mYbHV4D88wWikdDYNf++1oujDsrMv4vPFVtr0tigrIi3NekH/
   SVrJ2vPugnebJSto3pla/9KrM2YpUaJ2eBZNpPjxbBa9O/xJ09H4YNe/g
   w==;
X-CSE-ConnectionGUID: 5kfpcnx+QwSKFtLG/YyKbQ==
X-CSE-MsgGUID: tGXR1EK3ToyUv8X+75SabQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="51060255"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51060255"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:11:07 -0700
X-CSE-ConnectionGUID: 6EgHANCpTXW9eFonmvQEwQ==
X-CSE-MsgGUID: uE5w+wTaQGei6fNF62cwnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="136943671"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Apr 2025 04:11:06 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8GxT-00056m-2B;
	Fri, 25 Apr 2025 11:11:03 +0000
Date: Fri, 25 Apr 2025 19:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 111/116]
 sound/soc/samsung/littlemill.c:32:3: warning: label followed by a
 declaration is a C23 extension
Message-ID: <202504251921.cHUerZLM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-23
head:   66104ef95f2f8e651b29bf32aaa483868492887e
commit: a3f4e8cf9db06f4768bb6a874cfe3c3378b4836c [111/116] hoge
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250425/202504251921.cHUerZLM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251921.cHUerZLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251921.cHUerZLM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/samsung/littlemill.c:32:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      32 |                 struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
         |                 ^
   1 warning generated.
--
>> sound/soc/samsung/bells.c:68:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      68 |                 struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
         |                 ^
   1 warning generated.


vim +32 sound/soc/samsung/littlemill.c

    15	
    16	static int littlemill_set_bias_level(struct snd_soc_card *card,
    17						  struct snd_soc_component *component,
    18						  enum snd_soc_bias_level level)
    19	{
    20		struct snd_soc_pcm_runtime *rtd;
    21		struct snd_soc_dai *aif1_dai;
    22		int ret;
    23	
    24		rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
    25		aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
    26	
    27		if (component != aif1_dai->component)
    28			return 0;
    29	
    30		switch (level) {
    31		case SND_SOC_BIAS_PREPARE:
  > 32			struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
    33	
    34			/*
    35			 * If we've not already clocked things via hw_params()
    36			 * then do so now, otherwise these are noops.
    37			 */
    38			if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
    39				ret = snd_soc_dai_set_pll(aif1_dai, WM8994_FLL1,
    40							  WM8994_FLL_SRC_MCLK2, 32768,
    41							  sample_rate * 512);
    42				if (ret < 0) {
    43					pr_err("Failed to start FLL: %d\n", ret);
    44					return ret;
    45				}
    46	
    47				ret = snd_soc_dai_set_sysclk(aif1_dai,
    48							     WM8994_SYSCLK_FLL1,
    49							     sample_rate * 512,
    50							     SND_SOC_CLOCK_IN);
    51				if (ret < 0) {
    52					pr_err("Failed to set SYSCLK: %d\n", ret);
    53					return ret;
    54				}
    55			}
    56			break;
    57	
    58		default:
    59			break;
    60		}
    61	
    62		return 0;
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
