Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184C84D2B;
	Thu, 21 Nov 2024 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208609; cv=none; b=SGussKqv3bKy+lHLDbPuaL9xFLhik5U15SQ3+B4rmekYCugzrC4732hERx6Q3HJeldd85ULhGr0WGW3+MnS/3sBKeb5oM3CpeDpusuFTA2/4Mk5X6gYxSK9qnhZ2twDHc0rImff16L/rkh7RG88c3to8xz8Gf8GB6WJ7gLD7F34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208609; c=relaxed/simple;
	bh=+shSRTzFabFaIafWtFpPZ6aUZOBiAppLjUjYiLPxorw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qotWnQR4HFOprETMhX3DQeOjsSthnQGK4QOvFjn496+etlzd8eANXl3AJv1L5mble99oLuOVdhW1FTHFTVUD7Leaey1rHLWkMGekDMAtzEn7CYNzAB0cE503EZ7GhIjuoyMF3Zdim6/dQ1EB/9pzYS1HaSsuRNX5eMo8cS5AqTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBucW4uP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBucW4uP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732208608; x=1763744608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+shSRTzFabFaIafWtFpPZ6aUZOBiAppLjUjYiLPxorw=;
  b=UBucW4uPvnQxuwJRQL2FCw9oeJ9/R6cjIN8mRVxL7vT3uYP8A4n1ityw
   ZlEHkPKLIEyYRbbgpDI2L2pNdDVfkX3axD0t0JmiNW74In+BPgplLfEqh
   5soyf0fRyDZuuhEblT8mpju5u+YyVmmbxKbEqtM7/0moSck5KZPJL/2Kg
   gb2W5erE3kjCGEKR9rTj47AM3itdPkJ3QKk8fuvJNGNlFvcoIo2QGD92q
   OxeMMQA553bBJ+0c/JlTQESfhfnO+Ivm+VZsINfhzFdNpLmzzSgHIQOvJ
   tovNDfpg4Y9lppy/VWqdeAbDwvEH0Nt7mvDX7FNdsUvuATxO9Y58Uh2Lr
   A==;
X-CSE-ConnectionGUID: 8Mk2CCyZSw+KnR7nuRxRMg==
X-CSE-MsgGUID: JwToUzTDTBGo+w4GhH7iLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32267897"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="32267897"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 09:03:27 -0800
X-CSE-ConnectionGUID: 6QRGIroBSMuEEAywAfCoaA==
X-CSE-MsgGUID: QEG5FWVzT4GEYSYFSOKE0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="90732752"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2024 09:03:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEAaR-0003Bn-0X;
	Thu, 21 Nov 2024 17:03:23 +0000
Date: Fri, 22 Nov 2024 01:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bert Karwatzki <spasswolf@web.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of
 apq8016_dai_init()
Message-ID: <202411220058.7q2qlvXO-lkp@intel.com>
References: <20241117232100.23760-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117232100.23760-1-spasswolf@web.de>

Hi Bert,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.12 next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bert-Karwatzki/ASoC-qcom-apq8016_sbc-Fix-second-argument-of-apq8016_dai_init/20241121-111313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20241117232100.23760-1-spasswolf%40web.de
patch subject: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of apq8016_dai_init()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20241122/202411220058.7q2qlvXO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220058.7q2qlvXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220058.7q2qlvXO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/qcom/apq8016_sbc.c:153:31: error: implicit declaration of function 'qdsp6_dai_get_lpass_id' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
                                        ^
   sound/soc/qcom/apq8016_sbc.c:165:12: error: static declaration of 'qdsp6_dai_get_lpass_id' follows non-static declaration
   static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
              ^
   sound/soc/qcom/apq8016_sbc.c:153:31: note: previous implicit declaration is here
           return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
                                        ^
   2 errors generated.


vim +/qdsp6_dai_get_lpass_id +153 sound/soc/qcom/apq8016_sbc.c

   148	
   149	static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
   150	{
   151		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   152	
 > 153		return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
