Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B42D7DF3;
	Tue, 17 Mar 2026 23:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789297; cv=none; b=N307scAmVirZRLtbXT7/BMQVQ7NXrSkZ96mCOYsv2lnKg7c4BeScWJJ+6/p0FzmMdmwWZ+oSpP+u8RHHsAoAG7/B4rr9W6ywE9jtiwtfzdE2Pfe9Azy28JoQDC8Xa80ARii43EpjoVcz5Paljlgl7EgwbMWXtHR7ftdlpKqvmpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789297; c=relaxed/simple;
	bh=v9b0lVxagdfBNG3cjyaaHJRAr1KsZRo+WTWLZN5n2TU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QitMWmkOXJGF3tOcvmo/pqGl/FKqpc7QL438pOncnXvKZ21C1B6wXw7mj7eJGf02c2t2WP62Xn8BndRavMkMgHAGb13VZouSeLYgB0onC7iKu+9ipdWZq4kLOLE4mZCLEYwJqoMmgdqi9Ryqmek4hz0qrMqJahxSW+JUcelb2cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWtZuZzu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWtZuZzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773789295; x=1805325295;
  h=date:from:to:cc:subject:message-id;
  bh=v9b0lVxagdfBNG3cjyaaHJRAr1KsZRo+WTWLZN5n2TU=;
  b=ZWtZuZzuCIcE9N9vLD89pU/9NBT7kUpf95V6uAq5xMAdofRteDWctnX5
   2nbe1ZpcgD+ZftjsNGQvyelZg+I6kfP+7JHsgiES19wK0G2Bmr9piYKkL
   qPeo2OJaA7j7IcQ/ajw0y+ZCBT8/HmxrZm3QiUVq1hsTc0rMVxDUt1zCg
   wnSNh7ek6shzMRfxAVbLvP7X9ly4Ch/1oXSmtqvOUjfuNArAFYQ74Ei7D
   nkIKwkB4FMC4jppAU6a62WZddjxVYl6jbl4i6xEwxf8e0W+p6b3Ghh/Pr
   DBYDX3c1eRHrAwNvKOGiY290ZZPi4OUCVx3Wj6rPB/ykpBQfOYIOYUPfS
   w==;
X-CSE-ConnectionGUID: 0phJ6OSySbiPxmj9cqOFUw==
X-CSE-MsgGUID: IN/n7hU4Rgm5nTcTx362SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92221150"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92221150"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 16:14:55 -0700
X-CSE-ConnectionGUID: hd1YebRkQm+ZfR6btRJWRQ==
X-CSE-MsgGUID: 7Dd/QOLURMmbyeWk6getkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="227098958"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 16:14:52 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2dcf-0000000029p-3F6X;
	Tue, 17 Mar 2026 23:14:49 +0000
Date: Wed, 18 Mar 2026 07:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Clapinski <mclapinski@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 424/425] mm/page_alloc.c:557:17: error: use
 of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'?
Message-ID: <202603180711.mqOPviIG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   c31e58126afa2665dc5b7f78c60e5fb25218d7e5
commit: 1e1dab36a7f3e06700a97696f62e7691ce4ea85a [424/425] kho: fix deferred init of kho scratch
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260318/202603180711.mqOPviIG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180711.mqOPviIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180711.mqOPviIG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:557:17: error: use of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'?
     557 |                 migratetype = MIGRATE_CMA;
         |                               ^~~~~~~~~~~
         |                               MIGRATE_SYNC
   include/linux/migrate_mode.h:14:2: note: 'MIGRATE_SYNC' declared here
      14 |         MIGRATE_SYNC,
         |         ^
   mm/page_alloc.c:557:17: warning: implicit conversion from enumeration type 'enum migrate_mode' to different enumeration type 'enum migratetype' [-Wenum-conversion]
     557 |                 migratetype = MIGRATE_CMA;
         |                             ~ ^~~~~~~~~~~
   1 warning and 1 error generated.


vim +557 mm/page_alloc.c

   542	
   543	void __meminit init_pageblock_migratetype(struct page *page,
   544						  enum migratetype migratetype,
   545						  bool isolate)
   546	{
   547		unsigned long flags;
   548	
   549		if (unlikely(page_group_by_mobility_disabled &&
   550			     migratetype < MIGRATE_PCPTYPES))
   551			migratetype = MIGRATE_UNMOVABLE;
   552	
   553		/*
   554		 * Mark KHO scratch as CMA so no unmovable allocations are made there.
   555		 */
   556		if (unlikely(kho_scratch_overlap(page_to_phys(page), PAGE_SIZE)))
 > 557			migratetype = MIGRATE_CMA;
   558	
   559		flags = migratetype;
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
