Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF389220F36;
	Sat,  5 Jul 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720905; cv=none; b=C2GADZd4Vf7BOu4AngmRh8EKjdFyKtF0sr9S0EJPDvOeW9s2aS6UdlE9XunpTNvbHnAyvCnYxaR/YoOwqWMh/GPELHvmN25FLJH+OrlyTIyaVEtnn+Av7dziMPHCwTeg3X4Fr/Rs0UxX/pReruU2am0o/htC+hMmMWro7QzVlMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720905; c=relaxed/simple;
	bh=+pACBmjuxd0xlMmO+RuQBdhwDjOf8aqSl4s8/3l7Us4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UkUNMRtLKcaVZdohfUTCvjhP1NXFJ14EmsVHiHMrkx2oL5ZBKI3eIJKG1w2EM8eLM53Vg9fjLxo3PrKAy50RCqWdt5r5s//uu5OsGwCwqzk1hACLTe46nhrCnxr1KkaLyOSrjq8j9FFgP+CrYpnyGxVYFDjS1RBuROph0rMhpOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUk5ybjq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUk5ybjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751720904; x=1783256904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+pACBmjuxd0xlMmO+RuQBdhwDjOf8aqSl4s8/3l7Us4=;
  b=AUk5ybjq//vBR+/UwSw15TM75wBv/DTEr+AIX4N5zOJ6ixnZFeUL7lWn
   trpvjTkzCeoECK2hPVtWONy/XwDxZsgpnH0aj2feyFesTNXaiRC8acceA
   a3jsK45udYFhF0IOfEb27R8C2AyG0DCyjouiTCiiwV+nY/Ih/hrkQ+JRC
   iKEljiHSgVuUYVFPWmt03kspLLGlvgypw6kjwjKg4ba+Yp+Fvx66Z8/lm
   b5ZU/GDMPYk9q3mChwl6kdpFnXmF6KZ2pxZnNfjPeeodCdrYOZFAykopK
   me8zEa00/b5wnv08kkRbA3awtnFYimylgpERx9xdA9WILXUpdgoNLM4wm
   w==;
X-CSE-ConnectionGUID: rm2bxp6nRJOw4/HuxrRyPQ==
X-CSE-MsgGUID: 1dYw9dmXRZWvpX2M1Ob1Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54158710"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="54158710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 06:08:23 -0700
X-CSE-ConnectionGUID: jppY0NEeTLmdf7AGvyjDhA==
X-CSE-MsgGUID: 7GJLzw18RhSyHB3l4SjltQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="185778635"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jul 2025 06:08:22 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY2cu-0000px-1J;
	Sat, 05 Jul 2025 13:08:20 +0000
Date: Sat, 5 Jul 2025 15:07:36 +0200
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 10/106] mm/damon/core.c:2023:3: warning: variable
 'sidx' is uninitialized when used here
Message-ID: <202507051517.bs3jd8RW-lkp@intel.com>
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250705/202507051517.bs3jd8RW-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051517.bs3jd8RW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051517.bs3jd8RW-lkp@intel.com/

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
