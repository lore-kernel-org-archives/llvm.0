Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C434179A3;
	Sun, 14 Jun 2026 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472221; cv=none; b=rQ1fuw46+qivMi24GHtQnUpScR8HQufmRBfmv5qDeLvVBzZinbu7bHS9kCkw3MA8gbKnXWxp8YQw2rujldWC2xFDIo96p+4mqh31Xi5ciBt4czdYXWAGGxVupNXKMQ2SGEEfrFiwvi6cjmAcRzHhfwheE6Jxry/ZgZ5Ld2Khlho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472221; c=relaxed/simple;
	bh=QFkPJi3x1ejn22MR9q07N0k+ywQ5OJsT+m4G0sebC+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F1Ms9M002+QHIThb6NHL41k+z/oMXTqQzVxeACYzSylEnuIoriOKW6AINWZn02Alz+qbACRRx34JulJpXRkrrfi3kkskCmKmgHs+O6wPgRetd58dRFTk0tdAvr7P+pRkoO2TOHe+FaadUgbGKU4b1svH5d3Ne+/OU0SHzV9+q08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqYRgrPp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqYRgrPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781472218; x=1813008218;
  h=date:from:to:cc:subject:message-id;
  bh=QFkPJi3x1ejn22MR9q07N0k+ywQ5OJsT+m4G0sebC+Q=;
  b=WqYRgrPpuoD51f02U+XzPa2IBHtqKNBb7wtEuaWfJUDbU+pbJ2UOQtsJ
   i80PCaQAyBaWrr0NpeKtX1t0wW3g4GTxnFXB52vMw6k9NP+wDu0X+MRh2
   KYoCnXZbTqtau6rtZWUnmoNDHrY230vO1fPVKUPeD03P53Gc7PP77DhJE
   5nvVlKaGQsnPffoQitg0WaN5MTZhwz8tyuDNwYvNiGXtOxsouPQ4GPxDs
   GNUoF03lbNO47MNufTfoe54j2YVle9997WiGCYqo4vuBBy40VJVnUTn+k
   68E2731YQAXUQGoh6Hne+ko5LVvXSUcl13AmSi9ugN3GSPbO7LwHdKBTJ
   Q==;
X-CSE-ConnectionGUID: Ho+ZvYBzQUy3AnVxd91CSg==
X-CSE-MsgGUID: i+/9k9iCSJOkhvMhfZIblg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82199952"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82199952"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 14:23:38 -0700
X-CSE-ConnectionGUID: OGwVcphoQgehUxzaaSE5ww==
X-CSE-MsgGUID: VjMJnVZaQae/M7s/4TD2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="247180681"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Jun 2026 14:23:37 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYsIo-000000004kv-13oD;
	Sun, 14 Jun 2026 21:23:34 +0000
Date: Sun, 14 Jun 2026 23:23:14 +0200
From: kernel test robot <lkp@intel.com>
To: Ronan Marchal <ronanmarchal29@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/power/snapshot.c:2042:1: error: unknown type name 'c'
Message-ID: <202606142358.yLiBjEy1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ronan-Marchal/kernel-power-snapshot-Add-missing-kernel-doc-parameter-descriptions/20260614-224612
head:   3640842137db0e04106ba490ff1d1d6715de9a2b
commit: 3640842137db0e04106ba490ff1d1d6715de9a2b kernel/power/snapshot: Add missing kernel-doc parameter descriptions
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260614/202606142358.yLiBjEy1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606142358.yLiBjEy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606142358.yLiBjEy1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/power/snapshot.c:2042:1: error: unknown type name 'c'
    2042 | c/**
         | ^
   1 error generated.


vim +/c +2042 kernel/power/snapshot.c

  2041	
> 2042	c/**
  2043	 * enough_free_mem - Check if there is enough free memory for the image.
  2044	 * @nr_pages: Number of non-highmem pages to copy.
  2045	 * @nr_highmem: Number of highmem pages to copy.
  2046	 *
  2047	 * Check if there are enough free non-highmem pages available to save
  2048	 * the hibernation image.
  2049	 */
  2050	static int enough_free_mem(unsigned int nr_pages, unsigned int nr_highmem)
  2051	{
  2052		struct zone *zone;
  2053		unsigned int free = alloc_normal;
  2054	
  2055		for_each_populated_zone(zone)
  2056			if (!is_highmem(zone))
  2057				free += zone_page_state(zone, NR_FREE_PAGES);
  2058	
  2059		nr_pages += count_pages_for_highmem(nr_highmem);
  2060		pr_debug("Normal pages needed: %u + %u, available pages: %u\n",
  2061			 nr_pages, PAGES_FOR_IO, free);
  2062	
  2063		return free > nr_pages + PAGES_FOR_IO;
  2064	}
  2065	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
