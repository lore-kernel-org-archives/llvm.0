Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2BE2E5B19;
	Wed,  4 Feb 2026 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770190214; cv=none; b=ICkof6JMwvDCVuN00m0GHbaodx7KwZdCBZ4SyjGnCV3APLw/IxPGq0isaPulDZrqtHfHslPoQETveI8o2gT5JftaVzD0pdB16wTeJJGfseDqQLz9BxmBke1TQ4ACOD41rudV/MhQXnfX+p6+0+aX52lvK2HVJmMeHA+QExxnrhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770190214; c=relaxed/simple;
	bh=/8/o+axWeUXgOr5NQSbTR7ER8LyGYvR8cW6SfCAxWW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rNAm2Rl5B1rlPhJWdWWCcgjC70N8Sll6TtkBro8CXIBrJdtcV13NDoz2HDxa0Vt7yJmwXLP+fkgiIqYkkoMkn4SoCc22jQOBhRLF9a0MM8Gl8iBCOW7XZ2snEakwD5hCq4JpbuXsK2YPuN+zo75k6enF9jy0D0Ko5QCS3RTSC0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njnUrdLt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njnUrdLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770190213; x=1801726213;
  h=date:from:to:cc:subject:message-id;
  bh=/8/o+axWeUXgOr5NQSbTR7ER8LyGYvR8cW6SfCAxWW8=;
  b=njnUrdLtFeuJluFxiAjW2PYICBBHZayUR3IdIXynaMg7KAs+kTyebR3T
   hEZTdGwSIgx7bCL+Wglhq//ComBpdlSiWktClF8nu6b2ejtyyuc8LKsuh
   Ut5Z4WP1LcQe6RRTFlAJ/pXukAn/XEb0yjygsHT70NQKPZb/ppOFdbldb
   i/YVXMgIXc48PF5WRGp+SrAczW9anNPR9PO10KRSyihCfDSbo3FCWIXiM
   rLBUZle852uHbIIuWSyXrUjEZErnul6DHjFGd8vKC+GD+BhwwMnMLKtiT
   HimohXdnDz1Q3sBgtNeys2Fgg9eWE4A9n84g0eF2u1QRn2tt7pB8/OVcE
   g==;
X-CSE-ConnectionGUID: GrlFwfnpQvOP0IqFuUV5BA==
X-CSE-MsgGUID: 5AgvCUxjSwKr/t7YG2388A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71430683"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71430683"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 23:30:12 -0800
X-CSE-ConnectionGUID: Lr1iUpsmSfqqMFQDV8Dd0Q==
X-CSE-MsgGUID: DEKEPLOQQh6GaXfhI8ZhDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="247682707"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2026 23:30:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnXKy-00000000hYO-2qMp;
	Wed, 04 Feb 2026 07:30:08 +0000
Date: Wed, 04 Feb 2026 15:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 58/59] depmod: ERROR: Cycle
 detected: ib_core -> ib_uverbs -> ib_core
Message-ID: <202602041508.PVvlEVbB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   2405abede441479826a1e575c2bdf1307ae6940e
commit: 79289a7d75bab644aff15b4d83db6a5ad4e0c911 [58/59] RDMA/core: Manage CQ umem in core code
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260204/202602041508.PVvlEVbB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041508.PVvlEVbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041508.PVvlEVbB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: ib_core -> ib_uverbs -> ib_core
>> depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1960: modules_install] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
