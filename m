Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055DC1F790F;
	Tue, 22 Apr 2025 23:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745364562; cv=none; b=sEL7X6rq3/0kxVqQPPpH2cEF6QkT4f7436fv0LfAGF7RViIdTD3eq9EC65mHbQs/9Bz2/axfEd0XVResHMa0JTBeQkhBEfmkwZG0KN2ByeqO2Ah4k3yJEmliOsPhXd65N1G53freDDmCOXVEORiuQ1mNuQ9Ke155Xe7SOts9Ao4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745364562; c=relaxed/simple;
	bh=TEBJiz2RcXh82+A/KhCFOmlF0UU8T6N7N6QVqnIHXGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AbT4Iu9tNykGc8biFU+a6Xy7TUvLor8VZe5L92mBhps3A0msBnjuEs/YXkWHyW8721Kh8jSMJIYEuEX5xw5aOK1o3B3wqEsFuwGZOlUbpeN+PCuxZxuHnS5oQK8sZftMQlHdIM/XooIwxcBVG9m4qKZdL0uJxFA8mebpZu44OUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0w5xfO6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0w5xfO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745364561; x=1776900561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TEBJiz2RcXh82+A/KhCFOmlF0UU8T6N7N6QVqnIHXGk=;
  b=k0w5xfO6zKAkIOQyJ/8HLY3TXAuDXyFsos2OtpX1HWSdCzF92fxMt3Hf
   Zsjp8DEqknySHxj/sxYyr7dpfaavy7wIkj+4FsNoIXtG1J7UEb4AAFRYl
   kzsCgPl3Jo/agyJfW6BMJENymaBGnhfVVQ/QpjhLDeYrDNGuvb65Aos1f
   aLGC7QBG7JK/i/tYJp2EJ3yHDCJep5VmZg6iX+Jta+rdW4aBEViUaZUof
   OdbQXPGxqJCqJSpPzI0ZD5ZiF9YXyIJ5kyfCvLNXTYofD62PUGyhWeoSC
   bBNNXfiTdjTe1e0cYKK3gMMgFpk7DESXiSCFf798sq0Gd3xbPA02NxfW9
   g==;
X-CSE-ConnectionGUID: zl3N+HyBSWWFHZsvz/Jx1Q==
X-CSE-MsgGUID: cJpUJGnbSRuFEm0Uof1RsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57131511"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="57131511"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 16:29:20 -0700
X-CSE-ConnectionGUID: PrQilMN4QBqaz5zAsqN8UA==
X-CSE-MsgGUID: nXr4UR80QQGgB5RNOBsUZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="131992566"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Apr 2025 16:29:19 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7N3F-0001OP-0U;
	Tue, 22 Apr 2025 23:29:17 +0000
Date: Wed, 23 Apr 2025 07:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-22 101/103]
 sound/soc/soc-dapm.c:2144:11: warning: no case matching constant switch
 condition '0'
Message-ID: <202504230702.UE4GS253-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-22
head:   f743db58ae26ad957c2beb5f627c328ec8473d30
commit: 3b625de97e3c01b90a1b11976d6732c77df85815 [101/103] ASoC: soc-dapm: tidyup idle_bias handling - step2
config: hexagon-randconfig-002-20250423 (https://download.01.org/0day-ci/archive/20250423/202504230702.UE4GS253-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504230702.UE4GS253-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230702.UE4GS253-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-dapm.c:2144:11: warning: no case matching constant switch condition '0'
    2144 |                 switch (snd_power_get_state(dapm->card->snd_card)) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/core.h:210:35: note: expanded from macro 'snd_power_get_state'
     210 | #define snd_power_get_state(card)       ({ (void)(card); SNDRV_CTL_POWER_D0; })
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/0 +2144 sound/soc/soc-dapm.c

05623c4314cba39 Mark Brown         2011-09-28  2138  
977f312aeaeecd0 Kuninori Morimoto  2025-04-22  2139  static bool dapm_get_idle_bias(struct snd_soc_dapm_context *dapm)
86dbf2ac6fcb2d2 Lars-Peter Clausen 2014-09-04  2140  {
3b625de97e3c01b Kuninori Morimoto  2025-04-22  2141  	if (dapm->idle_bias) {
7369d281c9df84b Kuninori Morimoto  2025-04-22  2142  		struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
86dbf2ac6fcb2d2 Lars-Peter Clausen 2014-09-04  2143  
86dbf2ac6fcb2d2 Lars-Peter Clausen 2014-09-04 @2144  		switch (snd_power_get_state(dapm->card->snd_card)) {
86dbf2ac6fcb2d2 Lars-Peter Clausen 2014-09-04  2145  		case SNDRV_CTL_POWER_D3hot:
86dbf2ac6fcb2d2 Lars-Peter Clausen 2014-09-04  2146  		case SNDRV_CTL_POWER_D3cold:
7369d281c9df84b Kuninori Morimoto  2025-04-22  2147  			if (component)
977f312aeaeecd0 Kuninori Morimoto  2025-04-22  2148  				return !component->driver->suspend_bias_off;
3b625de97e3c01b Kuninori Morimoto  2025-04-22  2149  		}
86dbf2ac6fcb2d2 Lars-Peter Clausen 2014-09-04  2150  	}
86dbf2ac6fcb2d2 Lars-Peter Clausen 2014-09-04  2151  
3b625de97e3c01b Kuninori Morimoto  2025-04-22  2152  	return dapm->idle_bias;
86dbf2ac6fcb2d2 Lars-Peter Clausen 2014-09-04  2153  }
86dbf2ac6fcb2d2 Lars-Peter Clausen 2014-09-04  2154  

:::::: The code at line 2144 was first introduced by commit
:::::: 86dbf2ac6fcb2d2932d4610f2dfe0954aa0633f7 ASoC: Add support for automatically going to BIAS_OFF on suspend

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
