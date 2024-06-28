Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E55D59147;
	Fri, 28 Jun 2024 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719603091; cv=none; b=iS4T6m4vfN3CX1kd3ptEMGXOn1taYjoPnhjnvWauo26bwWGkEoaHBkbaITYOXHgmHGtuNWTKeYmT/UoVfAIqjtRiE4a1sp5TNx/Tg6dF7sHrgnMbL0WHjuzaJyNgDDb8bFHeD+A9YjXwkRFaOj9cVAcMvRvDHA7QMC9WyVdy+fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719603091; c=relaxed/simple;
	bh=NIOMP8Bpo2PGZ2zvUqCsfC1Ik0pjVA0lf/yUpHVMMAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcC8tp5kOIFFpheXjzzM7I4mNVIl3VTZhy5stOmy7dfXGRJZ2b3XGw0UjOzdq8kXgmKWJqbUSDp6RC578ovAwGVSbl/tqcAE4wDiGY2NdeTFSqsr3OXkZWDrF61bnYHGdOMc36mM6ZgtBOlawrJxoJSZE90IaEaOON2zpaNnjc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMiX832D; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMiX832D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719603089; x=1751139089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIOMP8Bpo2PGZ2zvUqCsfC1Ik0pjVA0lf/yUpHVMMAw=;
  b=SMiX832D9SqVPOnOBxnItNf2RvCic8CpR/xRGWxaSQeDRr9mDixEPAZA
   RHb45zBToiCwT+hSyF5nnTSWkORy6Hu992B83EA04IChL+qzhMDpK4bsL
   zBZamHk/dnj/iuhzAT84Sj1bCP3w9MdlFN7CT2Q91cWTShiwv1L395H13
   /Z4SvUUWfWzsdzI21a1pGPVJFN3U2qT/7BDl45k4FiiYjnVL2Syrc0jCk
   9gzTgg5/Nhz3zjNenPEbKCAGVWLlSRacTMVUFkdyuJCDk6J1yZp/HCP+E
   kzGLtZE5VBkZk6uEU5Ce5Y9QMzbq7+2cjSLOp612KvtJRRIts8JrM9sfN
   g==;
X-CSE-ConnectionGUID: fLy9ppI8T7q48tNxPQ8DIg==
X-CSE-MsgGUID: Mxiv5Jc/RkuOn2vFTK7r1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27931377"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="27931377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 12:31:17 -0700
X-CSE-ConnectionGUID: RgevMRU5TJ6u7gWjrBW5MA==
X-CSE-MsgGUID: ZzIN3gglTXauwLIa44mRjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44913025"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2024 12:31:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNHJS-000I4n-1f;
	Fri, 28 Jun 2024 19:31:14 +0000
Date: Sat, 29 Jun 2024 03:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Patch v5 11/12] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
Message-ID: <202406290331.ClWuGmiC-lkp@intel.com>
References: <20240627150046.258795-12-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627150046.258795-12-piotr.wojtaszczyk@timesys.com>

Hi Piotr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next broonie-sound/for-next linus/master v6.10-rc5 next-20240627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Piotr-Wojtaszczyk/dt-bindings-dma-pl08x-Add-dma-cells-description/20240628-152522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20240627150046.258795-12-piotr.wojtaszczyk%40timesys.com
patch subject: [Patch v5 11/12] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240629/202406290331.ClWuGmiC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290331.ClWuGmiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290331.ClWuGmiC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/lpc3xxx-i2s.c:42:6: warning: variable 'savedbitclkrate' set but not used [-Wunused-but-set-variable]
      42 |         u32 savedbitclkrate, diff, trate, baseclk;
         |             ^
>> sound/soc/fsl/lpc3xxx-i2s.c:326:47: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     326 |                                      "failed to init register map: %d\n", ret);
         |                                                                           ^~~
   sound/soc/fsl/lpc3xxx-i2s.c:310:9: note: initialize the variable 'ret' to silence this warning
     310 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +/savedbitclkrate +42 sound/soc/fsl/lpc3xxx-i2s.c

    27	
    28	#define LPC3XXX_I2S_RATES ( \
    29		SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 | \
    30		SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
    31		SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
    32	
    33	#define LPC3XXX_I2S_FORMATS ( \
    34		SNDRV_PCM_FMTBIT_S8 | \
    35		SNDRV_PCM_FMTBIT_S16_LE | \
    36		SNDRV_PCM_FMTBIT_S32_LE)
    37	
    38	static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clky, int freq, int xbytes, u32 clkrate)
    39	{
    40		u32 i2srate;
    41		u32 idxx, idyy;
  > 42		u32 savedbitclkrate, diff, trate, baseclk;
    43	
    44		/* Adjust rate for sample size (bits) and 2 channels and offset for
    45		 * divider in clock output
    46		 */
    47		i2srate = (freq / 100) * 2 * (8 * xbytes);
    48		i2srate = i2srate << 1;
    49		clkrate = clkrate / 100;
    50		baseclk = clkrate;
    51		*clkx = 1;
    52		*clky = 1;
    53	
    54		/* Find the best divider */
    55		*clkx = *clky = 0;
    56		savedbitclkrate = 0;
    57		diff = ~0;
    58		for (idxx = 1; idxx < 0xFF; idxx++) {
    59			for (idyy = 1; idyy < 0xFF; idyy++) {
    60				trate = (baseclk * idxx) / idyy;
    61				if (abs(trate - i2srate) < diff) {
    62					diff = abs(trate - i2srate);
    63					savedbitclkrate = trate;
    64					*clkx = idxx;
    65					*clky = idyy;
    66				}
    67			}
    68		}
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
