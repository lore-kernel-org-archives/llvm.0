Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7D42EC0A2;
	Mon, 27 Apr 2026 21:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777325874; cv=none; b=nHeGIZbvjDGTabqxIi87kmBvaMgaHxS2i+hmvVGsr5/G58U8/PaDQ1BG1ibtfOm5Dlgehldqp8LAMHMMrLZV8I0ou5nvgneBdJ1NBTFgBm3XWq62OtiVXy4U1lhpX7LhvWOOEaBT9E9+KmCqF1lMju7Yjcfpuzg4UQuZdgaiTlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777325874; c=relaxed/simple;
	bh=e4Jqh6ACUxcpuIOssPf6Ty3uP4ze4ndNp30jwQ9JHns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N7pm+OLd4ZNmu8oT3gW27CFaqZ9Lh4FsZEeL3OXXu8vB4EoFFFaFHepg8BKoXlzNs4n2CVaGewew+9fOEg6q7FIMp8IpOviULXGwEpGntjXgSuRfjM1jMG9zPcVwLM+l2ha/kP+H4Rw1PG82IgvSGqHYiATMioUb/TVAJuGgA30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsJnXCPe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsJnXCPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777325872; x=1808861872;
  h=date:from:to:cc:subject:message-id;
  bh=e4Jqh6ACUxcpuIOssPf6Ty3uP4ze4ndNp30jwQ9JHns=;
  b=QsJnXCPemvKfW4IB7shg+Ed9Sr5zuTbav59opW0LQperQHQckw4yoE9P
   TLlKOMdRWnp+GIYWjdX5p/oATTC2BM9fJEDb3xniD/b73JQzg54Z4rRL5
   qZSICPjCtDyc920n9ygr4VeZ9LHa5xsqt6gzPkdOEaLsPv5zYd4TewfC+
   YzVacRCv1dCNnAbOF+LTPmmFqfiwMuJH+Z+NRhyrRLuuySUWw6VFtGT4Q
   bjO4edqCjJhjnFeETWdN/5Kqrzc3QocFrXgLzPPLEcrwNVS75R8CdkJRm
   mZssUbeh0ZjO9BsLt82DWrl/w/GgSsB+PkKbme2Tk9Wl5D0VDSwLQxk/Q
   Q==;
X-CSE-ConnectionGUID: 4IZACoAeTpyMwTXdHW0VUQ==
X-CSE-MsgGUID: a5nvxxSxRaGuItsi7CqAIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78336410"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="78336410"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 14:37:52 -0700
X-CSE-ConnectionGUID: g373Yl8vTySqQAT0ORm8JQ==
X-CSE-MsgGUID: +cJLdd6FT/i+lz7YCKMn5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="233618829"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Apr 2026 14:37:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHTeD-0000000045Z-1Lnr;
	Mon, 27 Apr 2026 21:37:45 +0000
Date: Mon, 27 Apr 2026 23:37:09 +0200
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: kernel/dma/swiotlb.c:587 function parameter
 'unencrypted' not described in 'alloc_dma_pages'
Message-ID: <202604272339.b6G33nyi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/dma-direct-swiotlb-handle-swiotlb-alloc-free-outside-__dma_direct_alloc_pages/20260427-195304
head:   78ac9b234496c2ca4e0f7f1187cdf9f8eb3b5e23
commit: d3865b4072c3244c9f89214798b6577f9e8f4ba9 dma: swiotlb: track pool encryption state and honor DMA_ATTR_CC_SHARED
date:   10 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260427/202604272339.b6G33nyi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604272339.b6G33nyi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604272339.b6G33nyi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/dma/swiotlb.c:587 function parameter 'unencrypted' not described in 'alloc_dma_pages'
>> Warning: kernel/dma/swiotlb.c:587 function parameter 'unencrypted' not described in 'alloc_dma_pages'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
