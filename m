Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAC5274670;
	Sun, 17 May 2026 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779060845; cv=none; b=rtB04rICg/RdZ3HDndJzFdASa1zxa7NBiHku4FHivbpLJiNFeFzWoJ8FOKcHSeixeesA7KgwTNrU3eRZlomx2hAaW05+BEAZUXbgaFL1Y0h1y+MOf3NEqXEBPp2yiF+c1VA/YdRF52VVCqN6Nu2E8L4dm5EeCaP9bAZX/SnRVPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779060845; c=relaxed/simple;
	bh=1PcqiwUilHYtX7qin6U5knoA2Fs5wCdes+k1MpRgpqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5sWZTyhQT/dA59NNmvWOazOz8BmNbWnh0DSxBR2Ah2YDQJKfIHlxAimXCZmZuqiPPqq6qR8iM7trZyuUfTxa3EaW2FsBXY6IOHu9CoXGcie8wySGfACv2aw61f1BZrIH3nlWg6A8+o7pTHMZIOLuxm+StC7Ke0Y1936iIpa1mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqvK8Uo7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqvK8Uo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779060844; x=1810596844;
  h=date:from:to:cc:subject:message-id;
  bh=1PcqiwUilHYtX7qin6U5knoA2Fs5wCdes+k1MpRgpqY=;
  b=iqvK8Uo7ymO2D8/LR+6ReJQj0EVC/JaWeR63iklGL1R5qGboEktQmesH
   zEE7B0ewWYjIf5mS3rrlDiBatiX4NkNP451c3rBDINRxbknbv15TcbaXn
   PjomyH/jm/fmTzAbenQyQ9Y9NSGvdTIL1Hl2jB0N92OlbUe9j/b5N8b7x
   rhuO8pcyzJi56hzFFtu/ZrnKqoIFpsS7Cxcplbnv5j5ufssNuW9H1HDLE
   DvJV8PQkGoAplW8Fzb0DyfzgL15WK+IXVLxgLfEmNH55uoth0LM6zfC5V
   xYk255XqL17YRj/9mVW6pmNmjxyXsLVNVAcd5EfTX8aYcbSKs1FFl/t6Y
   g==;
X-CSE-ConnectionGUID: dUbPL2EfQ2Cw3jhN9jJFSg==
X-CSE-MsgGUID: KBzxlN/+SVCqbtZl2ef7Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83531049"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="83531049"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 16:34:03 -0700
X-CSE-ConnectionGUID: U3BjRilITdSvBPOT3OjX1Q==
X-CSE-MsgGUID: iPBtQ2DoTAyqCUvJGTg5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="232863269"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 May 2026 16:34:01 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOkzf-0000000023o-1kzg;
	Sun, 17 May 2026 23:33:59 +0000
Date: Mon, 18 May 2026 07:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Rob Clark <robin.clark@oss.qualcomm.com>
Subject: [drm-msm:msm-next 9/11]
 drivers/gpu/drm/msm/msm_gem_shrinker.c:105:58: warning: omitting the
 parameter name in a function definition is a C2x extension
Message-ID: <202605180736.rtcSO0ls-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   db339b6bc9f234b4883eb02946ea01d8d9faa11c
commit: 3392291fc509d8ad6e4ad90f15b0a193f721cbc9 [9/11] drm/msm: Fix shrinker deadlock
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260518/202605180736.rtcSO0ls-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180736.rtcSO0ls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180736.rtcSO0ls-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_gem_shrinker.c:105:58: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
                                                            ^
   drivers/gpu/drm/msm/msm_gem_shrinker.c:117:58: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
                                                            ^
   2 warnings generated.


vim +105 drivers/gpu/drm/msm/msm_gem_shrinker.c

   103	
   104	static bool
 > 105	purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
   106	{
   107		if (!is_purgeable(to_msm_bo(obj)))
   108			return false;
   109	
   110		if (msm_gem_active(obj))
   111			return false;
   112	
   113		return with_vm_locks(msm_gem_purge, obj);
   114	}
   115	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
