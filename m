Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1553BE7F;
	Tue,  4 Jun 2024 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717503862; cv=none; b=ZPhSJhUYz6HQ3y0V2/liULBcNaUmOATvtRyW31lFRsSYViySoUIRoo2N4TH/U2UaMTy5E60Wp6wCf20FKRXtLn/6qlP06huvlTdS5LslLLBcrBkxfQTy1211oZclchqGRuAMrVCJUblgSBAEYIsZ9+ELVthfrlfAZOCJZJxX1Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717503862; c=relaxed/simple;
	bh=KYNTKxCkCSdAEIqfCEKebtPK54gznQEOU5xNfgE5S6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ql3BfF8mJ+Wea8ZdKJP+lPYkUaVRCM9u8dj9I3NM11HYzAHOuMLdSx2iyAxAXvjMd4Edkia4W0YEu1Fxle1E0OEz8UIRCkP69rSvWhfRvAam5l8QtcdNLHINjC7+bL0In+IgGRXvd58YDiHcAYCQgceO3bN3rMa0dVV8wUjvw4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVDPiKoP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVDPiKoP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717503860; x=1749039860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KYNTKxCkCSdAEIqfCEKebtPK54gznQEOU5xNfgE5S6k=;
  b=MVDPiKoP0kowbTM02I2dFN7I60d8CR+uiahb9lJF2HS5BUYeYRBDNLw3
   U+IogffujlWqdEV8gtCaDvVarRbmlFS2bJXS6vUptKPa2o64ZHUOAl05k
   52pJbRANALtRBMbmlhtKeeZE51J15L8I2NTfmwWueYp9wyQ2yortidFnk
   LIW2HayXd3zbxcnnyhHWovayqY+PdWBB//DvPUTNbuT6ol22mvvroRYg9
   k3GIU/gWmhJW6lloQfOkMaQIzybWnBIx/0QQnguq1FWas/p0mcXjCTLe6
   nLtS1LuaG/t4L4w0JK0MWqlmGvTUb0pHJvHZ0ERkse0KfK4K9QoOBxTfD
   A==;
X-CSE-ConnectionGUID: lxaddq5WSkyEHYQCZZPJkQ==
X-CSE-MsgGUID: VrEvH6MMRTuASBYJRi/F3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13997044"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="13997044"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 05:24:19 -0700
X-CSE-ConnectionGUID: CBV4qmLYSuSF3vwNIT5iYQ==
X-CSE-MsgGUID: hssAZTJIQqSYkjf+xnJ86Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37822469"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Jun 2024 05:24:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sETD5-000NCl-30;
	Tue, 04 Jun 2024 12:24:15 +0000
Date: Tue, 4 Jun 2024 20:24:10 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/eevdf 9/23] kernel/sched/core.c:2032:2: error:
 statement requires expression of scalar type ('void' invalid)
Message-ID: <202406042054.VgbWMkmS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   642ed673fcd170ce20c64fb0e1970259fbb05cba
commit: b381ee6ec4656ac6679c956cb1ae370554bb835f [9/23] sched: Split DEQUEUE_SLEEP from deactivate_task()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240604/202406042054.VgbWMkmS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406042054.VgbWMkmS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406042054.VgbWMkmS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/sched/core.c:1992:13: error: conflicting types for 'dequeue_task'
    1992 | inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
         |             ^
   kernel/sched/sched.h:3569:13: note: previous declaration is here
    3569 | extern void dequeue_task(struct rq *rq, struct task_struct *p, int flags);
         |             ^
>> kernel/sched/core.c:2032:2: error: statement requires expression of scalar type ('void' invalid)
    2032 |         if (dequeue_task(rq, p, DEQUEUE_SLEEP | flags))
         |         ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +2032 kernel/sched/core.c

  2029	
  2030	static void block_task(struct rq *rq, struct task_struct *p, int flags)
  2031	{
> 2032		if (dequeue_task(rq, p, DEQUEUE_SLEEP | flags))
  2033			__block_task(rq, p);
  2034	}
  2035	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
