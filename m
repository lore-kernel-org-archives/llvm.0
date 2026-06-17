Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10203B841F;
	Wed, 17 Jun 2026 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682609; cv=none; b=JfRq9b8ENa/C09zDKqMGyxpZGEcwt+xLXTpP0P0pW9ebJJei7Fl06D0s7e1s/SVRM2JckiZt5OmIR1r4SMzw3N6M27j/DM+m1Dpx+l8kz5E+pLMrzywD0nc2CGAlA5f2UBSvpKTQv5Sr2/zXfVPQh0i1uA9DbjRgWZ8VwkyzSYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682609; c=relaxed/simple;
	bh=4koWmBeHUBy8R4UMEBlgP1HSUBscTmzk/AEfQO576IU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uAZdMNcmb9cR7TlvJ10/nTc+HOc6/odSDNHiCCqYCvbTu/6ooRZegHuOL9QWZWY9N49Z+4RrQL0GctBVDaZythH1DEhbBIPimDjWC50IMtggxKYCRuAlInE7kRv3a1GFUvCy6DZH1mrJG9nL/xSfwN1a5nc10PxXXfOOfcXsrqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHJVHYu8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHJVHYu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781682608; x=1813218608;
  h=date:from:to:cc:subject:message-id;
  bh=4koWmBeHUBy8R4UMEBlgP1HSUBscTmzk/AEfQO576IU=;
  b=RHJVHYu8PE+DRBnpxZza3ndcjdMSl+mHXaCy6nT8v2K/SjDPQEMDAGcH
   rCn3RmvjPUgb4c/itNdnZUipJOiwrXjabF3AA3D+a79LhgubUKetKqlcj
   xPYZH1et0fHBThRAkKdZzZKcOxd+OFbYnwLfYtgurOxx1cux92Bqbf4rz
   ZMaxQS2cT2PDDz5JuDkh4jNidxpdFBfWDrxx66xNa5i3fMaQ1Qd9iKE4B
   75h0XjBXePCb/X4YxnOy8zway2cL6Ei9sSkW3g6/fKzGAxf1GQAn+v2H1
   plXAIYqS0/GtLEATKQO7Fq6L1q6o5/EqxtuvMd+EDhRkkIoRF/OC8j6Kx
   g==;
X-CSE-ConnectionGUID: 7IYHIq8WQ/CtWjilyRR/Hw==
X-CSE-MsgGUID: 5YN8tcasTJeHr8ntx61L/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="92821301"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="92821301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 00:50:08 -0700
X-CSE-ConnectionGUID: sEUp8CQLRyuwpQpFjkL5/w==
X-CSE-MsgGUID: M9+6DkQCQmK7ssyxfBq7pw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jun 2026 00:50:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZl2B-00000000UFW-2VW6;
	Wed, 17 Jun 2026 07:50:03 +0000
Date: Wed, 17 Jun 2026 15:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/codecs/rt5651.c:2113:2: error: call to undeclared function
 'snd_soc_component_regmap_regcache_sync'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606171508.QhBoQeZg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 4bbdf4f7c937878b634b01d362515e2a79053b52 [326/326] dai
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260617/202606171508.QhBoQeZg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171508.QhBoQeZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171508.QhBoQeZg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/rt5651.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> sound/soc/codecs/rt5651.c:2113:2: error: call to undeclared function 'snd_soc_component_regmap_regcache_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2113 |         snd_soc_component_regmap_regcache_sync(component);
         |         ^
   sound/soc/codecs/rt5651.c:2113:2: note: did you mean 'snd_soc_component_regcache_sync'?
   include/sound/soc-component.h:497:19: note: 'snd_soc_component_regcache_sync' declared here
     497 | static inline int snd_soc_component_regcache_sync(struct snd_soc_component *component)
         |                   ^
   1 warning and 1 error generated.
--
   In file included from sound/soc/codecs/wm8741.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> sound/soc/codecs/wm8741.c:425:2: error: call to undeclared function 'snd_soc_component_regmap_regcache_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     425 |         snd_soc_component_regmap_regcache_sync(component);
         |         ^
   sound/soc/codecs/wm8741.c:425:2: note: did you mean 'snd_soc_component_regcache_sync'?
   include/sound/soc-component.h:497:19: note: 'snd_soc_component_regcache_sync' declared here
     497 | static inline int snd_soc_component_regcache_sync(struct snd_soc_component *component)
         |                   ^
   1 warning and 1 error generated.
--
   In file included from sound/soc/codecs/wm8961.c:18:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> sound/soc/codecs/wm8961.c:897:2: error: call to undeclared function 'snd_soc_component_regmap_regcache_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     897 |         snd_soc_component_regmap_regcache_sync(component);
         |         ^
   sound/soc/codecs/wm8961.c:897:2: note: did you mean 'snd_soc_component_regcache_sync'?
   include/sound/soc-component.h:497:19: note: 'snd_soc_component_regcache_sync' declared here
     497 | static inline int snd_soc_component_regcache_sync(struct snd_soc_component *component)
         |                   ^
   1 warning and 1 error generated.
--
   In file included from sound/soc/codecs/wm9705.c:14:
   In file included from include/linux/regmap.h:18:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> sound/soc/codecs/wm9705.c:290:2: error: call to undeclared function 'snd_soc_component_regmap_regcache_cache_bypass'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     290 |         snd_soc_component_regmap_regcache_cache_bypass(component, true);
         |         ^
   sound/soc/codecs/wm9705.c:290:2: note: did you mean 'snd_soc_component_regcache_cache_bypass'?
   include/sound/soc-component.h:543:20: note: 'snd_soc_component_regcache_cache_bypass' declared here
     543 | static inline void snd_soc_component_regcache_cache_bypass(struct snd_soc_component *component, bool enable)
         |                    ^
>> sound/soc/codecs/wm9705.c:308:2: error: call to undeclared function 'snd_soc_component_regmap_regcache_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     308 |         snd_soc_component_regmap_regcache_sync(component);
         |         ^
   sound/soc/codecs/wm9705.c:308:2: note: did you mean 'snd_soc_component_regcache_sync'?
   include/sound/soc-component.h:497:19: note: 'snd_soc_component_regcache_sync' declared here
     497 | static inline int snd_soc_component_regcache_sync(struct snd_soc_component *component)
         |                   ^
   1 warning and 2 errors generated.


vim +/snd_soc_component_regmap_regcache_sync +2113 sound/soc/codecs/rt5651.c

  2106	
  2107	static int rt5651_resume(struct snd_soc_component *component)
  2108	{
  2109		struct device *dev = snd_soc_component_to_dev(component);
  2110		struct rt5651_priv *rt5651 = dev_get_drvdata(dev);
  2111	
  2112		regcache_cache_only(rt5651->regmap, false);
> 2113		snd_soc_component_regmap_regcache_sync(component);
  2114	
  2115		return 0;
  2116	}
  2117	#else
  2118	#define rt5651_suspend NULL
  2119	#define rt5651_resume NULL
  2120	#endif
  2121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
