Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D286347;
	Tue, 27 May 2025 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367849; cv=none; b=rBNGD3XNt/1MfDR9tAcl6gmsdbae/jyA+yXKRam9QeU/zPqpHoCEcptBE4EXvFU4/YJl4k3T7c6dxY6QEXKL5SeKobMM5M466K7PkdZNL9y7XuMPmaTlXgeEWB7j2t6i+zDHuRv04RT7DHCL7YTZ8cLRKQZV976nPA7/L96nOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367849; c=relaxed/simple;
	bh=wXXgPifeKWZK8A2SiB02t7WmrllU2UX6OAQ+CWLyGtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bq3QesQ4qZkhVdKMyHjLSliwAlJNhTRmjNXpjkMScvYfqqItR35zhRioVroMGTDTMmLJrwK8j667HTBRE7tYaF69szvup1hl/B3rFwWIlo6Z07Vv4/xdCIcB3ZrvFochn2QxeCQtdWHanObouFGfEd2JM+jijdx0QEnzZFBkhQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKzlz5Cd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKzlz5Cd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748367848; x=1779903848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wXXgPifeKWZK8A2SiB02t7WmrllU2UX6OAQ+CWLyGtg=;
  b=ZKzlz5Cd2LE9esexZLapWJXDfk9PalBmXdW5W7D32on3CFJqauCEN/oT
   ONUC9ieKa64RkuOycrn7/d+qjIyVrgKFU52WnRzh3NZij080Hy+dekjS5
   Tg/qTioZ5JSgMU93AoLJ7ZsEl6XBIyyL/S74oOuK5CmdDmzpjQAkJfmfg
   m/qnyIKbYBgGoSzzE6m9u0OnBczDdY083OYuUFhN0pNje6SZ71UiLefGB
   CLNqBB2Q7etXD7B+AzzaaDD06XbmtAmZhPqGVcskl6k0Qu56kV8ldy3fN
   R355W+jYZ8Xu4BLPPqur14SPyb9EstWQ82wi4esXpK73vDPz9XIRyxdca
   Q==;
X-CSE-ConnectionGUID: pNjQafS8Q0m3kjYdHNu7Aw==
X-CSE-MsgGUID: 5AycvVmYSsKF30d3Qlqq4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="67790256"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="67790256"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 10:44:07 -0700
X-CSE-ConnectionGUID: veFzijDxSZ6b3OOBg8ASTA==
X-CSE-MsgGUID: mt3q/bu0SYSfZp6S72wGVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="147783935"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 May 2025 10:44:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJyLL-000UVs-1h;
	Tue, 27 May 2025 17:44:03 +0000
Date: Wed, 28 May 2025 01:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core 15/15]
 kernel/sched/isolation.c:49:37: error: call to undeclared function
 'lockdep_is_cpuset_held'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202505280104.0qNWdu1l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core
head:   5f864154521cea5391361b58372298785bc43639
commit: 5f864154521cea5391361b58372298785bc43639 [15/15] sched/isolation: Convert housekeeping cpumasks to rcu pointers
config: s390-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280104.0qNWdu1l-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280104.0qNWdu1l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280104.0qNWdu1l-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:102:
>> kernel/sched/isolation.c:49:37: error: call to undeclared function 'lockdep_is_cpuset_held'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      49 |                 if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
         |                                                   ^
   kernel/sched/isolation.c:49:37: note: did you mean 'lockdep_is_cpus_held'?
   include/linux/cpuhplock.h:15:12: note: 'lockdep_is_cpus_held' declared here
      15 | extern int lockdep_is_cpus_held(void);
         |            ^
   1 error generated.


vim +/lockdep_is_cpuset_held +49 kernel/sched/isolation.c

    39	
    40	static bool housekeeping_dereference_check(enum hk_type type)
    41	{
    42		if (type == HK_TYPE_DOMAIN) {
    43			if (system_state == SYSTEM_BOOTING)
    44				return true;
    45			if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
    46				return true;
    47			if (percpu_rwsem_is_held(&housekeeping_pcpu_lock))
    48				return true;
  > 49			if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
    50				return true;
    51	
    52			return false;
    53		}
    54	
    55		return true;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
