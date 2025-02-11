Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E810B206F02;
	Tue, 11 Feb 2025 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277491; cv=none; b=nidsh1FyhyuQ8Uml8P2VlZaNm39MzA4prd/h6tfCwG3f+3vacqDpjUv80hfSK56hJudzDS9+o3+nj3C3mQndhGEgWBhwJThow/9m5ubaY3eY5AFtgYHFBUJ09IdwFdGBDOFkCTl3msucHNFV3pbxxCpd0OmVYDjjgD4poyPgm4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277491; c=relaxed/simple;
	bh=8NdnynLd33CZNdIuot8ZpuaeUweBf7eFpiFwLSJ0xqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RH4+ivmcuPSh34O1yXRo1USvrs8UJbA4CR3+nVcAqq44JtehT3IjavXvG6bQV/XMMd/gFRphnsATonIu+LZF4Zhw23U8VjHMf0oBcw5YrLobqLYPXSertLFIyeDd8CeNtY9ArFNmda6jGkMi3eu55gXK2op161Xc57/8F/voOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOCYbtT0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOCYbtT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739277490; x=1770813490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NdnynLd33CZNdIuot8ZpuaeUweBf7eFpiFwLSJ0xqw=;
  b=YOCYbtT0sSPgbxNJUbJ48CZ7aDGhTbD1e02U7out/wQBu7Q0KD2WxVx+
   oFcWWoivBaPKYoS5+ykVFUhGKzCswMzdYOSsL3+sji6W2eSjEilfCCmuJ
   VL9+fuJO3HJhK+rL0PRCYGqsdpX/qBQ49aaPYqyniJGAABCRqPUW1zVIH
   Dd9LDtqh+5hW477nlSOYsLYJ0uHTOThtO1jFadQTr21hI2z4ccF1VEq0e
   tYecKsafJ2IpeaIvnfY1ZOguj3l8ARXKv1kOki6olwIieSjCzccwGRwzZ
   1tc8sW8NmoS1E1UPvo0LNEaLLPLBoL61XysgJUjLxgBD3NZOmeppd2/cO
   Q==;
X-CSE-ConnectionGUID: spIXACIuQ6iHPIDgjrWg6Q==
X-CSE-MsgGUID: iVV2/OoDTf+PgJAI3Hot9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40161964"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="40161964"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:38:07 -0800
X-CSE-ConnectionGUID: GOBFLG/sS+2egKWfYy7yPQ==
X-CSE-MsgGUID: RWwvjZ7uSPGLvbK8dsUi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117524702"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Feb 2025 04:38:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thpWd-00149z-2N;
	Tue, 11 Feb 2025 12:38:03 +0000
Date: Tue, 11 Feb 2025 20:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 82/82] kernel/rcu/rcutorture.c:2453:110: warning:
 format specifies type 'unsigned long' but the argument has type 'int'
Message-ID: <202502112058.rTKa7Z3A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   31c00ec5301cf02af354d57007bf0d79d5aef1c5
commit: 31c00ec5301cf02af354d57007bf0d79d5aef1c5 [82/82] rcutorture: Check for ->up_read() without matching ->down_read()
config: i386-buildonly-randconfig-006-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112058.rTKa7Z3A-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112058.rTKa7Z3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112058.rTKa7Z3A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/rcutorture.c:47:
   In file included from include/linux/oom.h:10:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/rcu/rcutorture.c:2453:110: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
    2453 |         WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
         |                                                                                                  ~~~                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                                                                  %d
   include/asm-generic/bug.h:185:57: note: expanded from macro 'WARN_ONCE'
     185 | #define WARN_ONCE(condition, format...) WARN(condition, format)
         |                                                         ^~~~~~
   include/asm-generic/bug.h:179:12: note: expanded from macro 'WARN'
     179 |         no_printk(format);                                              \
         |                   ^~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
   kernel/rcu/rcutorture.c:2524:111: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
    2524 |                 WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
         |                                                                                                          ~~~                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                                                                          %d
   include/asm-generic/bug.h:185:57: note: expanded from macro 'WARN_ONCE'
     185 | #define WARN_ONCE(condition, format...) WARN(condition, format)
         |                                                         ^~~~~~
   include/asm-generic/bug.h:179:12: note: expanded from macro 'WARN'
     179 |         no_printk(format);                                              \
         |                   ^~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
   3 warnings generated.


vim +2453 kernel/rcu/rcutorture.c

  2446	
  2447	static enum hrtimer_restart rcu_torture_updown_hrt(struct hrtimer *hrtp)
  2448	{
  2449		struct rcu_torture_one_read_state_updown *rtorsup;
  2450	
  2451		rtorsup = container_of(hrtp, struct rcu_torture_one_read_state_updown, rtorsu_hrt);
  2452		rcu_torture_one_read_end(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1);
> 2453		WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
  2454		rtorsup->rtorsu_nups++;
  2455		smp_store_release(&rtorsup->rtorsu_inuse, false);
  2456		return HRTIMER_NORESTART;
  2457	}
  2458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
