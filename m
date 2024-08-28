Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42A8C0B;
	Wed, 28 Aug 2024 02:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724813375; cv=none; b=NwCTIsOP+luifyrSYrqrOQj8Y3g40dLIgbJh1lxVOZgbbtuhQbf3TBmLBDCowqafX5BxuTI/EW2keR12Uho7aVpgplfGSF19Yq1WFKSF9HyJVvncXjqzMDIrUaO2GowpBaLrbkI0HSCyTXAHFnGRP4vOlRQQFbHs+xWeeMAhRvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724813375; c=relaxed/simple;
	bh=8/W+KioT4AFHueStvmElFZfuB7V06I9uH5eoUQmG/zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGJjpy+993by4dfWtyNRPnPF2rW8VkB9LxPvyefQbvACZ5vbKF442KQUwiCj7YqJtwrXdKTllC0flgVUnmJ2nwoI0v9KpAcUcTyhbtB//+o2rivQXAdGNjS5PPhm/Fxedg1Eq0YNBhk6GtxtaXeafnY6Wy6N7edLOynO9q48leY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/dQF30a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/dQF30a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724813373; x=1756349373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8/W+KioT4AFHueStvmElFZfuB7V06I9uH5eoUQmG/zc=;
  b=d/dQF30ax9i6mGOp0beUnGdIbQl1jhya2q+/Y49vgZ0jxHn/NGQoi8vx
   MsB8dHJdt+pVq4RcG7jia7rP2SywFs49LkgWwHZzFHijllSL1adJS91Q1
   2x+/xal8xfqVOnBDQAYPsdVPumD/4A5SpRQcI6BYlBizoSCVd8z7ln5b2
   sdEMWF1CCNsDkIwj45JCmQl/ZLRwWWYQ9FRfK/p/anVLoAnKYTa7pF/2z
   iyGmEU6RtSZ6xjHemAW/S7y5b/obstv23PaocfVZOxYcq4K+EVqKjKwBz
   4y6Zy7CLs49wl2jotxe+hV47iUs4NTXxOoilt+E+FgZMwv3R4IJ//2P3/
   w==;
X-CSE-ConnectionGUID: xuhFqF11SqGg96XUkIYEjg==
X-CSE-MsgGUID: bYvl9RPrQByndFU+vVWjHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34696915"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="34696915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 19:49:31 -0700
X-CSE-ConnectionGUID: gsjTfO3fRrWA/oJYcQPrhQ==
X-CSE-MsgGUID: gFu8fmOWRsaLS5K0QaIq8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67434798"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 19:49:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj8kS-000KNA-1w;
	Wed, 28 Aug 2024 02:49:28 +0000
Date: Wed, 28 Aug 2024 10:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [nbdd0121:thin-lto 1/1] llvm-link: rust/kernel.bc: error: Unknown
 attribute kind (86) (Producer: 'LLVM18.1.2-rust-1.78.0-stable' Reader: 'LLVM
 15.0.7')
Message-ID: <202408281054.1GaGKz17-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux thin-lto
head:   b6d669b604439c6604e1f05db7ecc99b97d24ce3
commit: b6d669b604439c6604e1f05db7ecc99b97d24ce3 [1/1] kbuild: rust: provide an option to inline C helpers into Rust
config: um-randconfig-001-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281054.1GaGKz17-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281054.1GaGKz17-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281054.1GaGKz17-lkp@intel.com/

All errors (new ones prefixed by >>):

>> llvm-link: rust/kernel.bc: error: Unknown attribute kind (86) (Producer: 'LLVM18.1.2-rust-1.78.0-stable' Reader: 'LLVM 15.0.7')
>> llvm-link: error:  loading file 'rust/kernel.bc'
   make[3]: *** [rust/Makefile:444: rust/kernel.o] Error 1 shuffle=1905957165
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1201: prepare] Error 2 shuffle=1905957165
   make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=1905957165
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=1905957165
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
