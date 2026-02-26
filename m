Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A4A1B394F;
	Thu, 26 Feb 2026 06:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772085681; cv=none; b=nUgTwVfnqlTvSoChWXS7AROQi4cF3dlbOcI9hTY0+dJQOKBI+x9A3t909rf9ww7B8EloiiVwOPkN+uYVRqvWPL1oMH9XHtk6PoIEMVlhA9wnkOZn39ZcbzarA51pqv6ciBmSZnzNiRK9aSbtQjzx3M6RUiIkUHEpB0A76INUidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772085681; c=relaxed/simple;
	bh=w8D3WM0yEviggk56JFtonJcLD5clVEWk2y1gJ2PrEv4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=saxcxnGg0G7cLavTnoLX4CAagpysQQLva9pQ4DeAeD7WjC+h8LF/INXN6Hiv/jCajFTVxCW2K5NeL2xPYareJkpFOb6oz7YGPul5hcKZ2apGKhRecOSaPitJJVLcUoTvga8x2Y0yBE+isOVLjttV69E7yC5BFtNuk5FO/7k3va4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOva+SsJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOva+SsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772085679; x=1803621679;
  h=date:from:to:cc:subject:message-id;
  bh=w8D3WM0yEviggk56JFtonJcLD5clVEWk2y1gJ2PrEv4=;
  b=aOva+SsJ41rjninLR7CjhhdoqPL1gpbANWRop1NCeNe54daQAR2VgjUq
   i9dAnobSRvoMQ0frobFfpD10krQzUouGQD2bWaBaw5IMG8OGdreD3JppK
   giwHgZxb5GKkSrAwaa7libfeKgRjJEHgtrNsOtV2ahywaB3WG8pyWeprS
   4H3Uk3DGfhc2Ggq2jN3c28oAURYifDyKaLL69Sxuh+8WG5ytfDSI376Lp
   ULA/+Ar1r6pnYBMPJFOts6aSAsu6fS4DbFpEE9c94z7Mqu1qeMWU+xpsD
   3GXhLIUMZG2CXYo/01MyM1Wf5vvDJxleGiIiF7XBYN9X5k51U76HPJdA4
   Q==;
X-CSE-ConnectionGUID: MloPW/WATcu1q71qpYLnlQ==
X-CSE-MsgGUID: jI7XdW3YRXOu+pvZw2JNvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90547182"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="90547182"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 22:01:19 -0800
X-CSE-ConnectionGUID: nJZTSTttT/6BnKhAETXGiQ==
X-CSE-MsgGUID: eVEmg8VVS3OzhK/8Luyp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="220962419"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Feb 2026 22:01:17 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvUR0-000000008HU-3TmB;
	Thu, 26 Feb 2026 06:01:14 +0000
Date: Thu, 26 Feb 2026 13:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mripard:dma-buf/heaps-as-modules 5/11] ld.lld: error:
 undefined symbol: dma_heap_cma_register_heap
Message-ID: <202602261325.zhbPpvLX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git dma-buf/heaps-as-modules
head:   76fb805e4205aeb664b6d25e17e41d2d3ccd2a90
commit: 6c2c98f655198f65147567cbd9cce6f2f07526c4 [5/11] dma: contiguous: Turn heap registration logic around
config: i386-randconfig-006-20260226 (https://download.01.org/0day-ci/archive/20260226/202602261325.zhbPpvLX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261325.zhbPpvLX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261325.zhbPpvLX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dma_heap_cma_register_heap
   >>> referenced by contiguous.c:267 (kernel/dma/contiguous.c:267)
   >>>               kernel/dma/contiguous.o:(dma_contiguous_reserve) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
