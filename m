Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B321F92E;
	Fri, 14 Mar 2025 23:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741993577; cv=none; b=u7knP1UwUWxTb/Q8Z54vavdynePMJFTxNrEJKyBNTPI81NlKGDeu00kXBP25+WGEINx6rRUb+8ufpvqwriBX4DvMfqKaBuHZSFv1s01y/fSrKw23aChJwBFOcap9Di2XqVSnrgjLoZA8H1oUwyibEy0OqvxEgloautBEg81QWmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741993577; c=relaxed/simple;
	bh=ne/7OULrGLcTu9bmdzIXdWIPZ/ivzzFYZvQY21gfkIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t83nKspLxcEJHnfJ+6hIKMZZyyXnj4Ec4uMEEJh73QQwAcxQHSO+HI0N27/P5ImAYEVXqFk1ghPqX5f45v3dVh3NwlW9GNNm5QH3w4Z7z3f+aw/A2BY9DQHKY5SOo+JPFT1dMeHIsa16DScg+ltE36wprc7ha84s1vjkMVjxTbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFM7kQmx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFM7kQmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741993575; x=1773529575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ne/7OULrGLcTu9bmdzIXdWIPZ/ivzzFYZvQY21gfkIw=;
  b=JFM7kQmxcummx5f98RAdkMgJwUJA7H8CSlupWfxyYgw8uBQvCZsJ0yZP
   WG2b4rlqqPOUavImruq48k6SN+0ser+yHyw0yKWoXsVIulntTRlrXYPMw
   PgQmmlTAoq0eLApQ9FehO0QnwUj3NlYeAtuldhZCPDYypNKDO1a5vc0EA
   A7Fvn6l4AvoCb8R54JtU/CX5dQiLePLZOGaHjWlFggT4OTYvtI1vn8kiT
   tAAy913j32cyceRSFbFaK8n6qjgopZbLcAyIt6RQ5/3ab6tRHWcv5caum
   fcxi2DUEly4YqVN4zyJFwOogs4zhgKEFA/DfN1Ara6e+34H6M4TUwm5NA
   g==;
X-CSE-ConnectionGUID: JWXaZuBAS66p55JqxtRWlQ==
X-CSE-MsgGUID: TC94dadATfeF+3fQ8nsEFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43366016"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43366016"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 16:06:15 -0700
X-CSE-ConnectionGUID: +RB7cjP9RgK6kuUM001iBA==
X-CSE-MsgGUID: s5y+0dNvRKK3//Oh+0Jp8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="122135424"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Mar 2025 16:06:13 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttE6V-000AuG-1H;
	Fri, 14 Mar 2025 23:06:11 +0000
Date: Sat, 15 Mar 2025 07:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [arm-perf:for-next/perf 14/15]
 drivers/perf/arm_cspmu/nvidia_cspmu.c:192:2: error: call to undeclared
 function 'writel'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202503150649.Dol8RBSh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
head:   a28f3cbfd11fcb13f826b33a4799c2ac77e70729
commit: 6de0298a3925f1e6e313430c45ae314a93f89ef6 [14/15] perf/arm_cspmu: Generalise event filtering
config: x86_64-buildonly-randconfig-002-20250315 (https://download.01.org/0day-ci/archive/20250315/202503150649.Dol8RBSh-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503150649.Dol8RBSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503150649.Dol8RBSh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/arm_cspmu/nvidia_cspmu.c:192:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     192 |         writel(filter, cspmu->base0 + offset);
         |         ^
   drivers/perf/arm_cspmu/nvidia_cspmu.c:200:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     200 |         writel(filter, cspmu->base0 + PMCCFILTR);
         |         ^
   2 errors generated.


vim +/writel +192 drivers/perf/arm_cspmu/nvidia_cspmu.c

   185	
   186	static void nv_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
   187					   const struct perf_event *event)
   188	{
   189		u32 filter = nv_cspmu_event_filter(event);
   190		u32 offset = PMEVFILTR + (4 * event->hw.idx);
   191	
 > 192		writel(filter, cspmu->base0 + offset);
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
