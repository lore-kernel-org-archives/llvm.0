Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626238BE7;
	Fri, 21 Mar 2025 05:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742536207; cv=none; b=W+gxrvHTWqDWc49C+wLu6ZfB5kST0nXuJ+ITj+ylccCqeebtzBhVQw1Sg9xJpRwMR6lbOE7wg8l1VR7G0wFDV5YCTyTG0w19AG8VLGXPBKGwE0D6DwUOWHFAVbYJJq8vIK6XyKLhUIIJ7VY3sBWrnNOyLAJ9NHWjxYomCrz5glI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742536207; c=relaxed/simple;
	bh=iu1hMd3tfBTcPbk3pvFJdG4wR4xFoKyUbsDAeuRl4Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/uUyFigzlgu9suQjx4piaDdJJwEeCL20zry/431zV6rjfw5aAL6KFhUtUJUoP3zbEljmyQjQwQWAo5JHZbc7z3/ZBv5LgHgJKLizaYNjm+pgMMdP+IdIT5ygNxBVI+aHgyrbGhglRCpAY9Dy1gH3cNV1vA/Cls+VmtjvyaXXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldlrY9kz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldlrY9kz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742536205; x=1774072205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iu1hMd3tfBTcPbk3pvFJdG4wR4xFoKyUbsDAeuRl4Mo=;
  b=ldlrY9kzFAjG1sR6QJPa184ZfFgxM6yLj/X7DY7UH87+7WGchTdv538s
   fe6E/a7rnDDuZiskjlq+VjNC/4pi1SAs24WElDA/maOPH/OB0N8BDsCiY
   RpQRwBAkCecsXsFLOG93od4hH/1NGgIAGbYpSHWQGjiUQW7Kdf3uo+taJ
   42V3noQ6iViz6nl2uNc7Bv9nmMPEEGLghUlcZNYIElnQZfuxkMwMOgHLe
   gUkklLnSGiFrcBbOGCW43n5bGMJFjay3jVzrKuFf1/hWZf2sIzgeXRElU
   j/fLzQMArslirhBW0RenSUK7UL9RmoEQvVR+F5s/bP82LtmzXg65thZ+N
   Q==;
X-CSE-ConnectionGUID: wwZ2mwCWR36juFnXGg9XFA==
X-CSE-MsgGUID: vz8vdqkfRXugpVT9kRf1lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="55175341"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="55175341"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 22:50:05 -0700
X-CSE-ConnectionGUID: vdCiP19GTiOmaJMM6FvTyQ==
X-CSE-MsgGUID: +Er3kVdWSGixokLyW70aOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="123326583"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2025 22:50:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvVGW-00014t-2S;
	Fri, 21 Mar 2025 05:49:58 +0000
Date: Fri, 21 Mar 2025 13:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 42/42] include/linux/ratelimit.h:44:24: error:
 passing 'raw_spinlock_t' (aka 'struct raw_spinlock') to parameter of
 incompatible type 'raw_spinlock_t *' (aka 'struct raw_spinlock *'); take the
 address with &
Message-ID: <202503211346.O7rOAnWG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   eb8edf55ec5fb6db81f970bb09e9aefa17fc49f4
commit: eb8edf55ec5fb6db81f970bb09e9aefa17fc49f4 [42/42] squash! drm/amd/pm: Avoid open-coded use of ratelimit_state structure's ->missed field
config: arm-randconfig-001-20250321 (https://download.01.org/0day-ci/archive/20250321/202503211346.O7rOAnWG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211346.O7rOAnWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211346.O7rOAnWG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   In file included from include/linux/cred.h:18:
   In file included from include/linux/sched/user.h:9:
>> include/linux/ratelimit.h:44:24: error: passing 'raw_spinlock_t' (aka 'struct raw_spinlock') to parameter of incompatible type 'raw_spinlock_t *' (aka 'struct raw_spinlock *'); take the address with &
      44 |         raw_spin_lock_irqsave(rs->lock, flags);
         |                               ^~~~~~~~
         |                               &
   include/linux/spinlock.h:244:34: note: expanded from macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   include/linux/spinlock_api_smp.h:32:65: note: passing argument to parameter 'lock' here
      32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
         |                                                                 ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=1602910888
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=1602910888
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1602910888
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1602910888
   make: Target 'prepare' not remade because of errors.


vim +44 include/linux/ratelimit.h

    39	
    40	static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, int interval_init)
    41	{
    42		unsigned long flags;
    43	
  > 44		raw_spin_lock_irqsave(rs->lock, flags);
    45		rs->interval = interval_init;
    46		rs->begin = 0;
    47		rs->printed = 0;
    48		ratelimit_state_reset_miss(rs);
    49		raw_spin_unlock_irqrestore(&rs->lock, flags);
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
