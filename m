Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24B63BBFAF;
	Wed, 19 Aug 2026 02:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787106606; cv=none; b=sNkcaexxq0kcNbmGwgXOheLCE9Qi/PtKohFSJStjLxxj9M7Ek0uxuNrhLVHbFnNk1ouK/Wec0M9wyUbJJNXDR1W2lL75O7KQug93xPvxe9x7mmCMmMvPy5NTNJawLWe/Pm1u21srYmQLv/JFIbHway3X6VULYO4YQdyFAg4bXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787106606; c=relaxed/simple;
	bh=+bzfnTVgeq6qfLZEyBzbB45nX0pA2Nmgu/nlC4f43/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VCBJfyDFxpiyVyI03YJ6+ioO6J9ju8O24D6pXb5av4K11SxZsB0gWbuDVOcJIPA4yZAhfphE0qw2WQ9dKOxN6Bg8eeHqB7hs37Cp1Kat/zhMp+i7Snb8UK2rvJ6dAACPTxrIQcPcy/yqP/rqwtekvHQ6G4THbfq6M7UvA6EN+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcE/qisp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcE/qisp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787106605; x=1818642605;
  h=date:from:to:cc:subject:message-id;
  bh=+bzfnTVgeq6qfLZEyBzbB45nX0pA2Nmgu/nlC4f43/Q=;
  b=GcE/qisp1j0MzaecucBSpi1JeQ/Ldu7gpq4q2b4OcQ9r2bipE08fb5kQ
   n/EKZRDmaa66wB89Bq7i/2bHes9ckNxWdpaMQQUmTUrL3WZ6KLKcBU5Hu
   0oUwhYFg1JAN48VxLqoNpW1llVOnQPneCBJXalH0G3f1n+cUcF9gg4DXT
   yfjrS6Hl4tYA1n1bS47aQXZ6Ao5wb+AL1VD8WXIlyM+Y8oGiZD7uCbPFm
   DrVeC3NtNHTpFb10VetW9tECkX7l6s7dg/gHmz4GKjw6BLBMW8qXuup4E
   rUDntp9KLDhmUnvbtJkjJ+BomBiW4uWVumMV4eAlqnOpFvsyxUtX2bKaC
   g==;
X-CSE-ConnectionGUID: gLvEpwgzTt6KsaiUJFlsAQ==
X-CSE-MsgGUID: vuOnz68iRTi/G9doLe71yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91482537"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91482537"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 19:30:04 -0700
X-CSE-ConnectionGUID: Et3Iw74VTASGj7unmv2I0w==
X-CSE-MsgGUID: YUAEKdzcQUqNaIFYcMeDbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261652465"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2026 19:30:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwW3y-00000000eqL-2WiE;
	Wed, 19 Aug 2026 02:29:58 +0000
Date: Wed, 19 Aug 2026 10:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nuno Sa <nuno.sa@analog.com>
Subject: drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12:
 warning: stack frame size (8344) exceeds limit (8192) in 'ld9040_prepare'
Message-ID: <202608191043.9OK2y1fN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a0dd7ba4f44cdc116d83712f61e7c1a95be3588
commit: 700a281905f2a4ccf6f3b2d3cd6985e034b4b021 spi: add offload TX/RX streaming APIs
date:   1 year, 6 months ago
config: x86_64-randconfig-003-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191043.9OK2y1fN-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191043.9OK2y1fN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 700a281905f2 ("spi: add offload TX/RX streaming APIs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191043.9OK2y1fN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12: warning: stack frame size (8344) exceeds limit (8192) in 'ld9040_prepare' [-Wframe-larger-than]
     240 | static int ld9040_prepare(struct drm_panel *panel)
         |            ^
   2 warnings generated.


vim +/ld9040_prepare +240 drivers/gpu/drm/panel/panel-samsung-ld9040.c

ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  239  
099b3e8699322e drivers/gpu/drm/panel/panel-ld9040.c Ajay Kumar    2014-07-31 @240  static int ld9040_prepare(struct drm_panel *panel)
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  241  {
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  242  	struct ld9040 *ctx = panel_to_ld9040(panel);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  243  	int ret;
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  244  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  245  	ret = ld9040_power_on(ctx);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  246  	if (ret < 0)
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  247  		return ret;
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  248  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  249  	ld9040_init(ctx);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  250  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  251  	ret = ld9040_clear_error(ctx);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  252  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  253  	if (ret < 0)
8141028278c2ea drivers/gpu/drm/panel/panel-ld9040.c Ajay Kumar    2014-07-31  254  		ld9040_unprepare(panel);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  255  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  256  	return ret;
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  257  }
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  258  

:::::: The code at line 240 was first introduced by commit
:::::: 099b3e8699322efb7229913d2c1651588205f182 drm/panel: ld9040: Add dummy prepare and unprepare routines

:::::: TO: Ajay Kumar <ajaykumar.rs@samsung.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
