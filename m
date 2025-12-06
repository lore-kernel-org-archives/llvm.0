Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD902611E;
	Sat,  6 Dec 2025 04:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764996405; cv=none; b=ES+CI/oZp9iD8BAiWosOr77goG9T1RD76yqj9LpJkoHHJLEUpdP9vKCo5zTeDhNulOmysBH9uOlhuy2if1+UW454VuOndmgCFygL4QAFClbFH7oAAjCKzT5jLrkcJIO8yjFvY+sYfHPCR0f4RFnIe8qKRY+GIK10PSbWKD25e5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764996405; c=relaxed/simple;
	bh=0/OFQQ1evWTB8rK2UtfDgnk9iVMhRHz6Lo1vbaODj7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHPUgb5EU69PXaUeH5aWwBz8uqZ6sHOy5ixf72fVuKmzdYXM7qWJgI/IKhMkxeovQ6jfbHJVjS01I4OyNyfeF5xdGOoLaolQURXcZh6sk3YoSvJP+2JdPBjE6fvy3r7fl9g6AzoEO1nUmiiBa2vzroPWGgWrs+TqfUhsj1xDgag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUSumxIU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUSumxIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764996403; x=1796532403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/OFQQ1evWTB8rK2UtfDgnk9iVMhRHz6Lo1vbaODj7M=;
  b=PUSumxIUbQTjpkiBB0WQrDCNdqZhCujoDVYsvznSavEVs2AI0glzdCUo
   gXLgXFOq3qhe1XQLAyMbk2UWpjfBjfitzsTRje2/giYhf28KZIlPpCDJk
   yvjEkdxlJswYRD01UOdG80BApH2QUSqns3b4oc7E1bFTsvDqXU3fiYpbn
   b16WaiDFS3Bj9Agl2s5t51LxyT1zjg9hU6rb4p4zJJEqlTvU68r79qDfH
   XnR5CcqN0dw/EQ2ja7Q+o86kCRPwCSGhKyx/JGUb4CgL2WePS/9zcLGV7
   LgVfRFGOyFimZ9FOUX5BGemQi7Y+U7pOdCkF20WPY5g4cpm5SYqvnZThz
   g==;
X-CSE-ConnectionGUID: 56ZFf3//SvyECxeJaBCqRQ==
X-CSE-MsgGUID: BHhANHMXRyWrFQnSepXKQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70647715"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="70647715"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 20:46:42 -0800
X-CSE-ConnectionGUID: bLCFu+86SBSWq0DTMpHGIQ==
X-CSE-MsgGUID: xb3xY/zMRWCGLVwNVeCjNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="218817889"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Dec 2025 20:46:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRkBo-00000000FrN-1VtG;
	Sat, 06 Dec 2025 04:46:36 +0000
Date: Sat, 6 Dec 2025 12:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kent.overstreet@linux.dev, vbabka@suse.cz, harry.yoo@oracle.com,
	da.gomez@kernel.org, jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/1] alloc_tag: skip rcu barrier on module unload if
 profiling was not enabled
Message-ID: <202512061204.aGmmZds2-lkp@intel.com>
References: <20251204220957.360838-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204220957.360838-1-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3f43be96f919cc611dcb2a4e38dd464831f4513e]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/alloc_tag-skip-rcu-barrier-on-module-unload-if-profiling-was-not-enabled/20251205-061310
base:   3f43be96f919cc611dcb2a4e38dd464831f4513e
patch link:    https://lore.kernel.org/r/20251204220957.360838-1-surenb%40google.com
patch subject: [PATCH 1/1] alloc_tag: skip rcu barrier on module unload if profiling was not enabled
config: riscv-randconfig-001-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061204.aGmmZds2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061204.aGmmZds2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061204.aGmmZds2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/codetag.c:37:13: warning: unused variable 'flush_rcu_on_module_unload' [-Wunused-variable]
      37 | static bool flush_rcu_on_module_unload;
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/flush_rcu_on_module_unload +37 lib/codetag.c

    34	
    35	static DEFINE_MUTEX(codetag_lock);
    36	static LIST_HEAD(codetag_types);
  > 37	static bool flush_rcu_on_module_unload;
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
