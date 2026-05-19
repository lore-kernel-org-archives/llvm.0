Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830683EA959;
	Tue, 19 May 2026 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218049; cv=none; b=RPFsew6uzsfALISqBv09jNW6JbcTUFcRDcV/xIVMq/xslFTwOMpJRWvdG5Es1yJ7UCT0xg7DGDANFkAtstA4uiUjmG1h7Ln5Avho9SeElysiE53MbEV5DyA7ywxXQ12c7fPm2RhIGrAy0pKtKR4JL+3UFr6MtDt0FafDHlndywQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218049; c=relaxed/simple;
	bh=rVJbqjRlaN0oMDG9aoCqy5AoF7FNYxLI1iTDxuWdhZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=svXcCxYSgy9WRK7LhXHhbvdCD8eKa8bQIbgMx48GcDELcenoirqkgu7sXiDfMq7EX9MZIpKL8mOeUugqkKlPRoBThMOlNxTwDVZZCu0ZljsPTYPtvLzDzuxwLDO9qmO2ENgvLtGrEsgpn09poNAh1XAvc8j0U+OBI+wX3NmIK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoXNwa8q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoXNwa8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779218047; x=1810754047;
  h=date:from:to:cc:subject:message-id;
  bh=rVJbqjRlaN0oMDG9aoCqy5AoF7FNYxLI1iTDxuWdhZI=;
  b=NoXNwa8qFxV3a71tupIP8S/xtN3NGsOjjhwutDSJWTeIUKtWbcLejRU+
   R9OhX4+17O9Fd0bC83e0zLJGVWqLEVdduHJb3b3oyRuLi8tS+/lRuK4w9
   lnSp98GNIYr/Zsq0teuzQ/yeE6QUQS11F1/G8CQ1T26VuWEmp32uqN4Vf
   MC0hZYcSG3UqCz/A/t2Sttvf7K/QL0TLz0ObfdkPaJgq1FnW0kH/Tgc/i
   +Px9YmIxg87mL/z6g6TlR/I6uFJJrcS5JXUQwr9HcR2OdSqhy/+dA/et/
   5YGkILuG/mNdWRKDQHGG4xQ6/4NvhC7IyyQ8nbvpz5dJgMl/sNqXeh8pc
   g==;
X-CSE-ConnectionGUID: Tmd48RkLRBS6pvUPZVFLyg==
X-CSE-MsgGUID: o0dPg0zLQgOGMN8ouLg43A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="97676836"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97676836"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 12:14:07 -0700
X-CSE-ConnectionGUID: rud+tQDvTlaa8qjqk6NvrA==
X-CSE-MsgGUID: MdK2z6S+QZ2ZG0Bz8l3uZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243882438"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2026 12:14:05 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPPsn-000000001kH-0rYU;
	Tue, 19 May 2026 19:13:45 +0000
Date: Wed, 20 May 2026 03:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [linux-next:master 5548/6445]
 kernel/dma/contiguous.c:139:13: warning: variable 'numa_cma_configured' set
 but not used
Message-ID: <202605200341.a1HLq7XC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a50ba100ace43f43c87384367eb2d2605fcc16c
commit: 38ce91195a7c6f76fa88ef5c03bad0bbabbf5556 [5548/6445] dma-contiguous: add kconfig option to setup numa cma area if not configured explicitly
config: s390-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200341.a1HLq7XC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/contiguous.c:139:13: warning: variable 'numa_cma_configured' set but not used [-Wunused-but-set-global]
     139 | static bool numa_cma_configured;
         |             ^
   1 warning generated.


vim +/numa_cma_configured +139 kernel/dma/contiguous.c

   134	
   135	static struct cma *dma_contiguous_numa_area[MAX_NUMNODES];
   136	static phys_addr_t numa_cma_size[MAX_NUMNODES] __initdata;
   137	static struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];
   138	static phys_addr_t pernuma_size_bytes __initdata;
 > 139	static bool numa_cma_configured;
   140	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
