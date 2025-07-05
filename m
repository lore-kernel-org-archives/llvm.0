Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6112E36EC;
	Sat,  5 Jul 2025 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751707062; cv=none; b=XbTGJv/7Jg82HWYaSYiyTyoTn7AN4nATuJ6IvAhNwxFZ66VK7Qq1eqLnNzNRmPzezDOMzQ8+7Py6rbsR4PVIsDVmNgZk0JlMWu0egvGB8mlzU8eNITHoHa/Sg24GuiRyC49/fZce1OWorCCNhhJbE1oIs5EvFMW9LkiGXdnSKDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751707062; c=relaxed/simple;
	bh=49wgZo+U2FaiDQa1oYpOrmQrn9RF8Z4anrjbCq8aoJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sy+M98jYJflMMGb3ZQzKkQde9TAxIu4RkjiXKvp6zsg18KkyBB7I3cts9G0lN2hQeN1FctBsjzreW9QgJHQLmZKGJBNQrnrFoziUgInTI7uMlJI7uRbR2W2DLZl9anq8pGdXhJgk1GaLLNWjjulLLIguCkV1EtMk6HMxUX1MtPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ighr3HiH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ighr3HiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751707061; x=1783243061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=49wgZo+U2FaiDQa1oYpOrmQrn9RF8Z4anrjbCq8aoJA=;
  b=ighr3HiHufso9Qt691OtBwXSMRMM5aUAW8s0K+lNYnRnmZ+Nke2jAmLI
   X0YnRq7NhnPe4Nr1WKtaXdeakW1RS1zirz8wEcnK4L3heVw4TDh1BAFiI
   5YnTTurzILuiix7sEvRVWcnanLUIVBBT71bXh2YT58HFUNBwKQYQs16XL
   dZVkbw3nvsI2RE8TisIeRCQn9JmiiVwLwkT13rEFk12XE1HnGlO1dS/oo
   ZDnSN1dxWGZ6Vd5740ftH/mhzc+2nboowu1ORvlyuaWDc7gv88+DCz183
   5isc91FWysa0HdJ8j1/KLCrVRqURdLQuatwwAyfi0JsvNgpxWo0wO+yaN
   Q==;
X-CSE-ConnectionGUID: ndlK1ma/QAqcxiXBdSIy+Q==
X-CSE-MsgGUID: vT7dK0eDSRuiQ50yISfSPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="56631115"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="56631115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 02:17:40 -0700
X-CSE-ConnectionGUID: WRaJ89HFSwKfPfPbpPSqFg==
X-CSE-MsgGUID: cyNNdUEVSL+VIzg5wmrMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="155368816"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2025 02:17:39 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXz1d-0004QB-0l;
	Sat, 05 Jul 2025 09:17:37 +0000
Date: Sat, 5 Jul 2025 17:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 10/106] mm/damon/core.c:2023:3: warning: variable
 'sidx' is uninitialized when used here
Message-ID: <202507051740.hrB8EaUH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   9af2f87d23cb0b15f32e59e4e9da681454a46eab
commit: 405b04c2042a3448c2986c909608037f05a3bf0c [10/106] mm/damon: add trace event for effective size quota
config: x86_64-buildonly-randconfig-003-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051740.hrB8EaUH-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051740.hrB8EaUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051740.hrB8EaUH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:2023:3: warning: variable 'sidx' is uninitialized when used here [-Wuninitialized]
    2023 |                 sidx++;
         |                 ^~~~
   mm/damon/core.c:2017:29: note: initialize the variable 'sidx' to silence this warning
    2017 |         unsigned int cidx = 0, sidx;
         |                                    ^
         |                                     = 0
   1 warning generated.


vim +/sidx +2023 mm/damon/core.c

  2013	
  2014	static void damos_trace_esz(struct damon_ctx *c, struct damos *s,
  2015			struct damos_quota *quota)
  2016	{
  2017		unsigned int cidx = 0, sidx;
  2018		struct damos *siter;
  2019	
  2020		damon_for_each_scheme(siter, c) {
  2021			if (siter == s)
  2022				break;
> 2023			sidx++;
  2024		}
  2025		trace_damos_esz(cidx, sidx, quota->esz, true);
  2026	}
  2027	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
