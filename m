Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4042264DC;
	Mon,  9 Feb 2026 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645334; cv=none; b=ekfIYOv8Z5OoEMJnb9gjz8tnh/jURqYZVk5OcEWvrBN7n50xm8Re3TKf9+Btco0FiD+EKNrKa7Jdei8lBgOR52sHpUjvxHMdl5yAe9rJotAJt8Tl16sMQlsc3hRpkGiLZpfzeI/54RAIIGtphmNvYYFD3oRze9VnAzQqtUcaUp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645334; c=relaxed/simple;
	bh=uWxyjccSnUbamkFwFukoekUd4igQ8ifECcBbsxYge/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=doZYw14ohHKkqbCL1FRtaATu2MV6qP1ryIDvcV9llzMlQDyjykrVRGdSvu/pIfwajOp8cia/zL/P5jAY3cBri6IQjsDmoHu6XNfbgaxlZbclWMuqIuOZCZqnx7SlzBF1epZuf6DGqZDy6C+AHuA84vwnU0Pf3DzYATly5+njrAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQCXVwIr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQCXVwIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770645334; x=1802181334;
  h=date:from:to:cc:subject:message-id;
  bh=uWxyjccSnUbamkFwFukoekUd4igQ8ifECcBbsxYge/I=;
  b=mQCXVwIrI4QtcARG+4cV1uaNXRP0Yg26aSO6IfVWsWt60SxFqy9sWKs+
   ee9usCU7MJhj9jhxtpD9rhUzg89R/Ou9NMQ0SlwaZ+ebesZcyuDm+sgwI
   aeb6BjrzOxHGHIBCdXrhOC8WekBM76LMoXngoI6JzwfoqaQVewpCurfb7
   Tr9wwgo4KYxKa3ADF6ZB7KMxNhL5JEVrKnX32ryOXKp44soMY7SNduC7y
   7GtbDx4Mm5zNKFLsdiwHlcbSxsjorpLBRjM1eGX6pwhBpoek79d2/wBds
   ldQ9hLD40l9tPS6dqrNHUu6skuLW9lZGIJ6C+y4W8aLg3uC6QAd+Tss9p
   Q==;
X-CSE-ConnectionGUID: 2JtRNSMFTmqIzDo1cXpiaA==
X-CSE-MsgGUID: I4PTFItNSy2ktDqLznb8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70770200"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="70770200"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 05:53:15 -0800
X-CSE-ConnectionGUID: 9CSNzQTwREiTVAl9nRYqMQ==
X-CSE-MsgGUID: 3Et46yZ6SCybjpA9xPlm7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216094724"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 05:53:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpRhO-00000000nQY-2eE4;
	Mon, 09 Feb 2026 13:53:10 +0000
Date: Mon, 09 Feb 2026 21:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 112/124] mm/damon/core.c:1862:4: error: use
 of undeclared identifier 'c'
Message-ID: <202602092126.d6pfqcbG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   74672caf715ec5f49e15d405b8030ce9cb686d4f
commit: 7fdffc23ed84ea44a9f15f71d15b00a94f326acd [112/124] mm/damon/core: unify damon_warn_fix_nr_accesses_corruption() with damon_verify_reset_aggregated()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260209/202602092126.d6pfqcbG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092126.d6pfqcbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092126.d6pfqcbG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/damon/core.c:1862:4: error: use of undeclared identifier 'c'
    1862 |                         c->passed_sample_intervals,
         |                         ^
   mm/damon/core.c:1863:4: error: use of undeclared identifier 'c'
    1863 |                         c->next_aggregation_sis);
         |                         ^
   2 errors generated.


vim +/c +1862 mm/damon/core.c

89796f03081328 SeongJae Park 2025-12-02  1844  
591c4c78be0636 SeongJae Park 2025-05-12  1845  /*
591c4c78be0636 SeongJae Park 2025-05-12  1846   * Warn and fix corrupted ->nr_accesses[_bp] for investigations and preventing
591c4c78be0636 SeongJae Park 2025-05-12  1847   * the problem being propagated.
591c4c78be0636 SeongJae Park 2025-05-12  1848   */
591c4c78be0636 SeongJae Park 2025-05-12  1849  static void damon_warn_fix_nr_accesses_corruption(struct damon_region *r)
591c4c78be0636 SeongJae Park 2025-05-12  1850  {
591c4c78be0636 SeongJae Park 2025-05-12  1851  	if (r->nr_accesses_bp == r->nr_accesses * 10000)
591c4c78be0636 SeongJae Park 2025-05-12  1852  		return;
7fdffc23ed84ea SeongJae Park 2026-02-04  1853  #ifndef CONFIG_DAMON_HARDENED
591c4c78be0636 SeongJae Park 2025-05-12  1854  	WARN_ONCE(true, "invalid nr_accesses_bp at reset: %u %u\n",
591c4c78be0636 SeongJae Park 2025-05-12  1855  			r->nr_accesses_bp, r->nr_accesses);
591c4c78be0636 SeongJae Park 2025-05-12  1856  	r->nr_accesses_bp = r->nr_accesses * 10000;
7fdffc23ed84ea SeongJae Park 2026-02-04  1857  #else
5b9f4fef2cb618 SeongJae Park 2026-01-03  1858  	pr_err("reset time invalid region found!\n");
5b9f4fef2cb618 SeongJae Park 2026-01-03  1859  	pr_err("nr_accesses_bp %u last_nr_acceses %u\n",
5b9f4fef2cb618 SeongJae Park 2026-01-03  1860  			r->nr_accesses_bp, r->last_nr_accesses);
5b9f4fef2cb618 SeongJae Park 2026-01-03  1861  	pr_err("passed_sis %lu next_aggregation_sis %lu\n",
5b9f4fef2cb618 SeongJae Park 2026-01-03 @1862  			c->passed_sample_intervals,
5b9f4fef2cb618 SeongJae Park 2026-01-03  1863  			c->next_aggregation_sis);
5b9f4fef2cb618 SeongJae Park 2026-01-03  1864  	BUG();
5b9f4fef2cb618 SeongJae Park 2026-01-03  1865  #endif
7fdffc23ed84ea SeongJae Park 2026-02-04  1866  }
5b9f4fef2cb618 SeongJae Park 2026-01-03  1867  

:::::: The code at line 1862 was first introduced by commit
:::::: 5b9f4fef2cb618ee597b3345dee579340e8d5d43 mm/damon/core: add damon_reset_aggregated() hardening

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: SeongJae Park <sj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
