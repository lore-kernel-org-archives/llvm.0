Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779963783A1;
	Tue,  7 Apr 2026 04:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534622; cv=none; b=NVEIZsqxlspWM//yO2nT8lEiGuuRfwZdXBzDveEQL7n8sZHI6rfUyH/Yy7QP0+GpRSlsYnDdqrwsSygeOleHuKOg44/Rm9VG5FtwPWLaEp8MQwn7rtVyiBiI5IaatuSf6w08ozXDo+YJOlrDnd3Lh6aEPY7mWxolPaumsfGwGmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534622; c=relaxed/simple;
	bh=AA/o2DAqCkrzXDB7hQ8EPa65n5maVcPeSZCpmeF4+Fc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rA911Wi170BPQ6peSKVAEu1f6q39otjZTNHzwo0orXtdwfCkxZYlUBmEpaZr0wCuS4QN2xjHgXQUbY1LtotoQvYC9depcwCBFsN7UavWaAh9S2RJa/hai6dEOB7zxS6UB0Io45M4dKSlJXAqyfSfvmLUADJajYaY2TevbGrxrl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+szz9pD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+szz9pD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534621; x=1807070621;
  h=date:from:to:cc:subject:message-id;
  bh=AA/o2DAqCkrzXDB7hQ8EPa65n5maVcPeSZCpmeF4+Fc=;
  b=h+szz9pDT30afKLICQr5+eAQY6uKqo+8995mH8N0rNXPMwnDjxg9Ehta
   ECa8ubhnzfiAEFTqNiFreONzbLBWu8WWKuUyrnoEKP7WhdC0VEdtYAQLF
   5+HGVDKGAHtZO0tRponlynYwuDKNmKap4tpK0PEeZ6AfqJAa29HRUqGe7
   uhn1DO9rCu5jd54yfyuO9YpoF2JVPw4DOc4d+4gyC5NTSmFSJORspR9F8
   S++O6HjUCRfMZ6zT1JF0LGNsMweif+F0xg3yXDDGlyWRksNi/shzN2zl4
   W3mrxIUsM7ZWN4gpxoKtP6vUJN+6bp0FrLp4xaQbl1ywdGC8i3qYOAjEe
   w==;
X-CSE-ConnectionGUID: WUjcNvLnTVy2GIQ89Ltrow==
X-CSE-MsgGUID: X3T43RJORJ2ygWnWlpttQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87114718"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87114718"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:38 -0700
X-CSE-ConnectionGUID: 7dQECb79QWOTwtriK1KJJA==
X-CSE-MsgGUID: FDfXJrz0S4i34ffT8xW7lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223261242"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 21:03:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-0000000008r-0Rk6;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-06 119/119] Warning:
 sound/soc/soc-component.c:471 expecting prototype for
 snd_soc_component_regmap_cache_sync(). Prototype was for
 snd_soc_component_regmap_regcache_sync() instead
Message-ID: <202604071039.eCEs16hJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-06
head:   557e71769b656376e9a03618f6e770bb6a3defd5
commit: 89bf1d2520ff02f48039d27411baf6b923f0b16d [119/119] ASoC: soc-component: rename snd_soc_component_regmap_cache_sync()
config: powerpc-randconfig-001-20260406 (https://download.01.org/0day-ci/archive/20260407/202604071039.eCEs16hJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071039.eCEs16hJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071039.eCEs16hJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/soc-component.c:471 expecting prototype for snd_soc_component_regmap_cache_sync(). Prototype was for snd_soc_component_regmap_regcache_sync() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
