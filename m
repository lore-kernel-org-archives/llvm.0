Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2744226CFE;
	Fri,  6 Mar 2026 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772824724; cv=none; b=aF8ljr+CkorMHLCOCynL8gBYW1jEJznPHFd3CzrGNBOmNBqHZo6eVzMntRmvfOGKwGAWIacV6YVGyXK6h8XjgWS8isZestMLRqntYHXDOljjBH8ujMjKHTXS6NiUMLDoh1LVarB1oZLkYnEzPnyL3s1A90tY8ZHJBqTQWMQVK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772824724; c=relaxed/simple;
	bh=rKwfwWBPQsq5NxK8jPS1Z+lwmrp6vdF17S3O/pmatQw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CCLAc38XwpN7q9terIAKh4Q+/xvcxkFakvu7yboYQ+Ha+AF7A5BgB77veo1QEdBNnUsNPKuPaqBDembOoy3VdCwxZh29wyWD8+joAJfln9i/Rf8i1+9+/spKhk+/YQMj81X9bluFOSge6U42YDjVT7amG4iugGxzJH/NgkpuX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEziu3f/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEziu3f/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772824722; x=1804360722;
  h=date:from:to:cc:subject:message-id;
  bh=rKwfwWBPQsq5NxK8jPS1Z+lwmrp6vdF17S3O/pmatQw=;
  b=hEziu3f/YEwQH/+nSRWvOM1za2X3V7cCyWqCi5cM+NTtMsVlLOWmjH2I
   eyiP7S3l8YoDe8JR7yG6NnnTIhwZ/GPARbevGODoLNssAMKhvnLU7EvYx
   gNb3a5918NJvZOi8UxxnWiQXwgWwBCZQBTtQoI0JgWxG6pI/8m2T8EW82
   HDBffvJqmcgb8Q3zi4bttNPTV/wX/6UOpP101DD1QK/gIONt+Yh0R4uSS
   R7vuGDLGCznUeH7xRHk5bBnOYh5NF2jPfmCJT/+b6g0sixFpmbp4ZUCLq
   4Pm+KIo1CMp5aYt+aRBMK5JUmjTEyZCFZxQuNE7ktorCp9SkWsA68wRDD
   Q==;
X-CSE-ConnectionGUID: ZCwNR3/LRD2Cztk10JGF/w==
X-CSE-MsgGUID: E9czjKXTQhmLsZtrzFcMZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77541632"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77541632"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 11:18:41 -0800
X-CSE-ConnectionGUID: yc2sXjMBTh6Yp7bmaVr9qw==
X-CSE-MsgGUID: 2c3oCdpVTxKYWJrSHMar/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219219138"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2026 11:18:40 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyah3-000000001In-19La;
	Fri, 06 Mar 2026 19:18:37 +0000
Date: Sat, 07 Mar 2026 03:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:free-late/v0.1 7/7] WARNING: modpost: vmlinux: section
 mismatch in reference: memblock_phys_free+0xab (section:
 .text.memblock_phys_free) -> memblock_free_late (section: .init.text)
Message-ID: <202603070356.Oi3IXmog-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git free-late/v0.1
head:   57b25b03a9652c639d3c8e9004a542ef17db0cd3
commit: 57b25b03a9652c639d3c8e9004a542ef17db0cd3 [7/7] dev: memblock, treewide: don't call memblock_free_late()
config: x86_64-randconfig-013-20260306 (https://download.01.org/0day-ci/archive/20260307/202603070356.Oi3IXmog-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070356.Oi3IXmog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070356.Oi3IXmog-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: memblock_phys_free+0xab (section: .text.memblock_phys_free) -> memblock_free_late (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
