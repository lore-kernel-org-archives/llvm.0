Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4872215573F;
	Fri, 14 Mar 2025 10:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949967; cv=none; b=Am0b5jg0KBjl8ArVXz3bET0kZygKavHkI0/yVaM+yTdzCKuyLmNrm2QKMhXmLZQU4RRfhiBK0hx3Seme5W1pigMdz4eoirY1vcfEVzuFoh0sDcimEFgg2v1g8mNm9axTLIaVo65mTR80fIR2woQq8V0UMciQgQzSl9hxvm7/ekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949967; c=relaxed/simple;
	bh=zk+oR2u9cowOY2qRK9U4S1zVwZKK1RoIy8IjAJYdjVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CypRtDUM9joO7W1KttfaeJgkKMEHT0EnhpR+h1O0B+1BkT29r1InqLuso3GG8PteS4FOLzHy/VgY36H85862vNh9TEfxPYMINYZgiYxIqZorPtaIOys9QuhpRSiZwNhytdBIfMgoFIryGk63KALrv/hkhUhmjCJJZ4cbby16tpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtTLKW/e; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtTLKW/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741949965; x=1773485965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zk+oR2u9cowOY2qRK9U4S1zVwZKK1RoIy8IjAJYdjVo=;
  b=QtTLKW/eJo8nkDw7AMY0J1elbZyOlfekTaLaCWcNpvPLKA0+ubKqtzaf
   1qzzM8grRKHilwDucwFUd5yrRWdoUQAQ14H3uXGxP27kzfUE+HPaEk5um
   fXogMbM7VgXXNwXBtmeCshOy4FFAlltQDhztH5lludrPxnRUBmbhajoDC
   M0yayGmIkoPWeitwMGB3QeU8g5iaDzs7B0qkPSfmuhim5IVCOl241pZ3k
   /WJy0vOA1mZtbTVsruUefWouJ2RrXu1PKQJhE1M+OgOJzpCLK5rqLukUS
   rn+vVjrXyktA/PK8vV7wqkyoYPkvEEGVKn6AAEi5lxUiK3+xxbRY+NbFz
   g==;
X-CSE-ConnectionGUID: /RGnAFeFQm2dhDTuADt7ZQ==
X-CSE-MsgGUID: w0kk0NZQSH2jfvmeOGbW6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53752177"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="53752177"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 03:59:25 -0700
X-CSE-ConnectionGUID: AovZK8MNQ6e6oqpLYS1AqQ==
X-CSE-MsgGUID: QVYoHbOmTsSmZi0jKGHYxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="125427081"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 14 Mar 2025 03:59:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt2l7-000AMk-10;
	Fri, 14 Mar 2025 10:59:21 +0000
Date: Fri, 14 Mar 2025 18:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/scx-dlserver-boost 13/14] kernel/sched/core.c:6092:26:
 error: too few arguments to function call, expected 2, have 1
Message-ID: <202503141839.yUhNCNhO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/scx-dlserver-boost
head:   b9fb6bd57dd59c996babc65c5120897a66dde4aa
commit: 93829b151cbe44e283851f678b1e671c7650b964 [13/14] BUGGY: Add support to pick functions to take rf
config: i386-buildonly-randconfig-002-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141839.yUhNCNhO-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141839.yUhNCNhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141839.yUhNCNhO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:6092:26: error: too few arguments to function call, expected 2, have 1
    6092 |                 p = class->pick_task(rq);
         |                     ~~~~~~~~~~~~~~~~   ^
   kernel/sched/core.c:6245:40: error: too few arguments to function call, expected 2, have 1
    6245 |                                 p = idle_sched_class.pick_task(rq_i);
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~     ^
   2 errors generated.


vim +6092 kernel/sched/core.c

539f65125d20aac Peter Zijlstra 2020-11-17  6083  
bc9ffef31bf5981 Peter Zijlstra 2021-08-24  6084  static inline struct task_struct *pick_task(struct rq *rq)
539f65125d20aac Peter Zijlstra 2020-11-17  6085  {
bc9ffef31bf5981 Peter Zijlstra 2021-08-24  6086  	const struct sched_class *class;
bc9ffef31bf5981 Peter Zijlstra 2021-08-24  6087  	struct task_struct *p;
539f65125d20aac Peter Zijlstra 2020-11-17  6088  
bd9bbc96e835688 Peter Zijlstra 2024-08-14  6089  	rq->dl_server = NULL;
bd9bbc96e835688 Peter Zijlstra 2024-08-14  6090  
a7a9fc549293168 Tejun Heo      2024-06-18  6091  	for_each_active_class(class) {
bc9ffef31bf5981 Peter Zijlstra 2021-08-24 @6092  		p = class->pick_task(rq);
bc9ffef31bf5981 Peter Zijlstra 2021-08-24  6093  		if (p)
bc9ffef31bf5981 Peter Zijlstra 2021-08-24  6094  			return p;
539f65125d20aac Peter Zijlstra 2020-11-17  6095  	}
539f65125d20aac Peter Zijlstra 2020-11-17  6096  
bc9ffef31bf5981 Peter Zijlstra 2021-08-24  6097  	BUG(); /* The idle class should always have a runnable task. */
539f65125d20aac Peter Zijlstra 2020-11-17  6098  }
539f65125d20aac Peter Zijlstra 2020-11-17  6099  

:::::: The code at line 6092 was first introduced by commit
:::::: bc9ffef31bf59819c9fc032178534ff9ed7c4981 sched/core: Simplify core-wide task selection

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
