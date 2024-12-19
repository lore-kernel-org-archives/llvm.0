Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A954A78F4A;
	Thu, 19 Dec 2024 04:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734583953; cv=none; b=rYiJFyI/j4UhVjqX3QUCmS4PidrD/EdzrSrFZo510CUtIc3G9KiPaWDJ10+vpaa+QFNTJ0TNXSa6MvmWpZKTh7yso4xGG6q7XJUaRUNOMUbWxL0v5ugOuFURK8BUllLq11bRDMdNmnQecvq6dAUDCtAncfI3aO8JODc51zYmy98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734583953; c=relaxed/simple;
	bh=D9NDKzSqRkZ3wm9SEkwgjWnHhlIt+tQ39h55cIrZBM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aaoMGsUaYqTrYlKiNe0Jn4rhIBJWFSBvRQCtkBM6nDJuuq6OlwguuHo1HsYn6Z500aBTbjjHCsl9r8hwsYi4F4cq3MqL+JA5HFMZA/EUr1IDH1D/YXCyK86YrrWx3ZUtbzNpWX3dPFH1IZwHg3j6DuGODlLF+ZtC5KYawq+AGsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6XwX07s; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6XwX07s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734583951; x=1766119951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D9NDKzSqRkZ3wm9SEkwgjWnHhlIt+tQ39h55cIrZBM8=;
  b=F6XwX07s1AUHyTKsy4E6Z2lPNmHlyCGNKONyVBc4+mxvJKAY7WcWxs7d
   9bXsK4bhjLoTNEMnj99x1OvXjQXcugrrO7qOQYThI0+aazx9/zJHbyJaR
   5jg56yFQFA6Wv89wnaM5bDh1cEOHt5ZEK2d9f1uQ+09SIihYD2J2CAGzl
   OoJ7y3Yf0UHrIBk1Q9td/gjee1QQUcsL1+LbX/hYjzCUmrf3N9/hM9VLt
   6+p41hrTqb7TKJga1tVvtuWK5zra7zCfhc6zQBCW6fRYup9d+MvqvOntL
   WcbgOZbI6xPQfxnkZjTpH1KDb3rcBkwbstxIH+a1/jQrfAO7BKsUji8ux
   Q==;
X-CSE-ConnectionGUID: EppA7je0QgiXeqYNQHjqlw==
X-CSE-MsgGUID: PyxkiGjsS+C2A0cVWV/new==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="57558132"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="57558132"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 20:52:30 -0800
X-CSE-ConnectionGUID: ZJSFssVoQVCIoQmhA/ZL3w==
X-CSE-MsgGUID: jhNVMjajSO+QoKD8nU3wdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="98137320"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Dec 2024 20:52:29 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO8WQ-00003D-2j;
	Thu, 19 Dec 2024 04:52:26 +0000
Date: Thu, 19 Dec 2024 12:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 52/79] mm/damon/sysfs-schemes.c:2129: warning:
 Function parameter or struct member 'sz_filter_passed' not described in
 'damos_sysfs_populate_region_dir'
Message-ID: <202412191225.f6bEMRT2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   acaaeb549248b361cb0586af34b317d05a61512b
commit: d92ceeda1fde0fd17da7d3dfe5d51e6684e20c6c [52/79] mm/damon/sysfs-schemes: expose per-region filter-passed bytes
config: arm-randconfig-001-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191225.f6bEMRT2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412191225.f6bEMRT2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412191225.f6bEMRT2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/sysfs-schemes.c:2129: warning: Function parameter or struct member 'sz_filter_passed' not described in 'damos_sysfs_populate_region_dir'


vim +2129 mm/damon/sysfs-schemes.c

f1d13cacabe140 SeongJae Park 2022-11-01  2113  
aa2ebc50289e65 SeongJae Park 2024-12-01  2114  /**
aa2ebc50289e65 SeongJae Park 2024-12-01  2115   * damos_sysfs_populate_region_dir() - Populate a schemes tried region dir.
aa2ebc50289e65 SeongJae Park 2024-12-01  2116   * @sysfs_schemes:	Schemes directory to populate regions directory.
aa2ebc50289e65 SeongJae Park 2024-12-01  2117   * @ctx:		Corresponding DAMON context.
aa2ebc50289e65 SeongJae Park 2024-12-01  2118   * @t:			DAMON target of @r.
aa2ebc50289e65 SeongJae Park 2024-12-01  2119   * @r:			DAMON region to populate the directory for.
aa2ebc50289e65 SeongJae Park 2024-12-01  2120   * @s:			Corresponding scheme.
aa2ebc50289e65 SeongJae Park 2024-12-01  2121   * @total_bytes_only:	Whether the request is for bytes update only.
aa2ebc50289e65 SeongJae Park 2024-12-01  2122   *
aa2ebc50289e65 SeongJae Park 2024-12-01  2123   * Called from DAMOS walk callback while holding damon_sysfs_lock.
aa2ebc50289e65 SeongJae Park 2024-12-01  2124   */
aa2ebc50289e65 SeongJae Park 2024-12-01  2125  void damos_sysfs_populate_region_dir(struct damon_sysfs_schemes *sysfs_schemes,
aa2ebc50289e65 SeongJae Park 2024-12-01  2126  		struct damon_ctx *ctx, struct damon_target *t,
d92ceeda1fde0f SeongJae Park 2024-12-16  2127  		struct damon_region *r, struct damos *s, bool total_bytes_only,
d92ceeda1fde0f SeongJae Park 2024-12-16  2128  		unsigned long sz_filter_passed)
aa2ebc50289e65 SeongJae Park 2024-12-01 @2129  {
aa2ebc50289e65 SeongJae Park 2024-12-01  2130  	struct damos *scheme;
aa2ebc50289e65 SeongJae Park 2024-12-01  2131  	struct damon_sysfs_scheme_regions *sysfs_regions;
aa2ebc50289e65 SeongJae Park 2024-12-01  2132  	struct damon_sysfs_scheme_region *region;
aa2ebc50289e65 SeongJae Park 2024-12-01  2133  	int schemes_idx = 0;
aa2ebc50289e65 SeongJae Park 2024-12-01  2134  
aa2ebc50289e65 SeongJae Park 2024-12-01  2135  	damon_for_each_scheme(scheme, ctx) {
aa2ebc50289e65 SeongJae Park 2024-12-01  2136  		if (scheme == s)
aa2ebc50289e65 SeongJae Park 2024-12-01  2137  			break;
aa2ebc50289e65 SeongJae Park 2024-12-01  2138  		schemes_idx++;
aa2ebc50289e65 SeongJae Park 2024-12-01  2139  	}
aa2ebc50289e65 SeongJae Park 2024-12-01  2140  
aa2ebc50289e65 SeongJae Park 2024-12-01  2141  	/* user could have removed the scheme sysfs dir */
aa2ebc50289e65 SeongJae Park 2024-12-01  2142  	if (schemes_idx >= sysfs_schemes->nr)
aa2ebc50289e65 SeongJae Park 2024-12-01  2143  		return;
aa2ebc50289e65 SeongJae Park 2024-12-01  2144  
aa2ebc50289e65 SeongJae Park 2024-12-01  2145  	sysfs_regions = sysfs_schemes->schemes_arr[schemes_idx]->tried_regions;
aa2ebc50289e65 SeongJae Park 2024-12-01  2146  	sysfs_regions->total_bytes += r->ar.end - r->ar.start;
aa2ebc50289e65 SeongJae Park 2024-12-01  2147  	if (total_bytes_only)
aa2ebc50289e65 SeongJae Park 2024-12-01  2148  		return;
aa2ebc50289e65 SeongJae Park 2024-12-01  2149  
aa2ebc50289e65 SeongJae Park 2024-12-01  2150  	region = damon_sysfs_scheme_region_alloc(r);
aa2ebc50289e65 SeongJae Park 2024-12-01  2151  	if (!region)
aa2ebc50289e65 SeongJae Park 2024-12-01  2152  		return;
d92ceeda1fde0f SeongJae Park 2024-12-16  2153  	region->sz_filter_passed = sz_filter_passed;
aa2ebc50289e65 SeongJae Park 2024-12-01  2154  	list_add_tail(&region->list, &sysfs_regions->regions_list);
aa2ebc50289e65 SeongJae Park 2024-12-01  2155  	sysfs_regions->nr_regions++;
aa2ebc50289e65 SeongJae Park 2024-12-01  2156  	if (kobject_init_and_add(&region->kobj,
aa2ebc50289e65 SeongJae Park 2024-12-01  2157  				&damon_sysfs_scheme_region_ktype,
aa2ebc50289e65 SeongJae Park 2024-12-01  2158  				&sysfs_regions->kobj, "%d",
aa2ebc50289e65 SeongJae Park 2024-12-01  2159  				sysfs_regions->nr_regions++)) {
aa2ebc50289e65 SeongJae Park 2024-12-01  2160  		kobject_put(&region->kobj);
aa2ebc50289e65 SeongJae Park 2024-12-01  2161  	}
aa2ebc50289e65 SeongJae Park 2024-12-01  2162  }
aa2ebc50289e65 SeongJae Park 2024-12-01  2163  

:::::: The code at line 2129 was first introduced by commit
:::::: aa2ebc50289e6594cd72ec76b13f108d2cc33bed mm/damon/sysfs: use damos_walk() for update_schemes_tried_{bytes,regions}

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: SeongJae Park <sj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
