Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D8023908D;
	Thu,  6 Feb 2025 23:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738884512; cv=none; b=XEkg/8J8d+WfgF/es6kO4gF6ZOYegFdD2wufg6Stn9HKe9npI/47tl3THTRJU6mLLuHL7TYiVSz2kZcSd6i11ft2Aac5VS9PtXwqgEPreZxRT48V0IYwm8GJLx4AZJy6t+ZH+/7+FbJrPlX39CPiecWGpRmsitr/0O2y+vSx80A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738884512; c=relaxed/simple;
	bh=5vXSO1Rf8hEB6Wqo3Yif/rkJUbkRdgeEmbSKKx5WlKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJuAIfGjc01aHLSqsLl5mgP7l1YjZpGk16Q01OKpAf9pxah+ZQe05HoXggtPiCDeMk1vhJnQCucSO6MkoN/nNE7gY1CJfbh0dZrdyxabuEvVUXwUY0Fp5alGco9p0ou52Zr2ycdCqjz4iktwINRkcu3/pe8KTe95iFm4sy+wbSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/d1DHt4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/d1DHt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738884510; x=1770420510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5vXSO1Rf8hEB6Wqo3Yif/rkJUbkRdgeEmbSKKx5WlKo=;
  b=J/d1DHt4Ba60mJE8pqy+Ay1ap95IHYd8pOR1mA+r4SAv9xNFVFTIG1GC
   JHzrKov/qFBVoty07tSpQT/E4n8NnYNwRN8dvwXvsjI/ULeJUU0J59GTN
   7HRDIsW8lvHKKjAusztDyJYQJ4u9QiwOixeLge7U/ejqOA7J3E16ZAYHe
   cIVGo5Qu2dUGXAFPRsEOlG7atxVck06BEcX0GnVs/m3uw+rWVB+gTIys3
   z6BSZHNrp9Anos8YX2tQQvrNzSZL1sJCedeTYFrxPL5wzZrH0S6A2tRBs
   PfTWEfZm31JCDeYuBGqIPxwR/LrvM4VB9mT/GH49TVnuIsyIEjWQQCy+m
   w==;
X-CSE-ConnectionGUID: PeKJcOpdQIakc7jmS67X/Q==
X-CSE-MsgGUID: bnKdUzwISVmemi1HG5NEkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39646297"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39646297"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 15:28:30 -0800
X-CSE-ConnectionGUID: AgCTVRQLTxCSM4Mf91xXxg==
X-CSE-MsgGUID: /kCwR69cQdGtSTHVQWuUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="116395561"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2025 15:28:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgBII-000xVp-1U;
	Thu, 06 Feb 2025 23:28:26 +0000
Date: Fri, 7 Feb 2025 07:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:task/work 5/6]
 include/linux/sched/isolation.h:93:52: warning: non-void function does not
 return a value
Message-ID: <202502070708.IhgkGkEH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git task/work
head:   3a5b43d6075ec915d0bf17d38d15f9c75d05dc26
commit: 1526f337fd88fdf6bf5184dd1d8ad334a40baac2 [5/6] sched/isolation: Introduce isolated task work
config: i386-buildonly-randconfig-005-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070708.IhgkGkEH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070708.IhgkGkEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070708.IhgkGkEH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmstat.c:28:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmstat.c:30:
>> include/linux/sched/isolation.h:93:52: warning: non-void function does not return a value [-Wreturn-type]
      93 | static inline int isolated_task_work_queue(void) { }
         |                                                    ^
   3 warnings generated.


vim +93 include/linux/sched/isolation.h

    90	
    91	extern void isolated_task_work_init(struct task_struct *tsk);
    92	#else
  > 93	static inline int isolated_task_work_queue(void) { }
    94	static inline void isolated_task_work_init(struct task_struct *tsk) { }
    95	#endif /* CONFIG_NO_HZ_FULL */
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
