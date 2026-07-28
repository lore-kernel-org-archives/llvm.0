Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDD123EA8B;
	Tue, 28 Jul 2026 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251362; cv=none; b=iyvYl/GTGh9fbw+cdVsnN4JY+yrDZbYDzXQVbtOGHcQ8s8DFfHSS8OBrFaJ4RU5DabyurkJODzSFnT8yQZsKlLUwVt1NuqQXhrYWenSTzPJJEmiAv3Wqom4GE+EDjg9HXmimDda3TnQsUzhNu6HeBm931B30EgqbU8dAK17z1bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251362; c=relaxed/simple;
	bh=5bjDHXcxm34/Trw/+9xkDLarYa2rHUh/oEed3u+7bVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IJgKqCA3ySqWBuRhV+yWUFmBQolTLHQr2nyKLfaZ5AeU/rTTBewnICxCxnDVarBZPI2lpAqoHiSU9UKdiRZs+jGnYz80zuZAlBm6LfV4n1bPB2o3x7+907k4HxbrEG69QGo1xLfjO+6VxFlDFxuXHdZO/7MSx17poTNSLt+lbUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWhzPete; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWhzPete"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785251361; x=1816787361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5bjDHXcxm34/Trw/+9xkDLarYa2rHUh/oEed3u+7bVY=;
  b=OWhzPeteRsrXP/kbbfagXg7C/RE1ApnhOpzdpMj6DX1OQVKbtVmhIRoZ
   mjVLOhuAEWq+WK8JYWeM+LTyLCtd8xNzFLnbNOIdUmBbaG7LCtHiYU9o8
   9jZxhgVWP43BYSA1P9UU8QpW0/aYUEynxHUMR5aNG7tkUktZQCtCvGkaZ
   aMXZngGqtRND2ZN9UD+zFRAL9o+CSw2k4RjEMS2lusEzERN+Vm9ECNFED
   oSjvDt3e6e+M6GacC09zeCps3W0EOISzal4EeARlfS+fMZ/5YroHr6cwX
   bexoFWJFj1qHWic/7/xxoxlApagYw37cpfPMCJkEQSsBG34daFgJ7S/DI
   w==;
X-CSE-ConnectionGUID: cwWV+XrmQn6Q9BAEgV+4Cg==
X-CSE-MsgGUID: dY6NkJ9ITTiaLQUiCljkkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85960137"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85960137"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:09:01 -0700
X-CSE-ConnectionGUID: 9ZUqpicJR4SxT904pfNL/w==
X-CSE-MsgGUID: GAjeA0BtTtWVOc3DZ68ElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="289685852"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2026 08:08:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wojQO-00000000eTI-3UpJ;
	Tue, 28 Jul 2026 15:08:56 +0000
Date: Tue, 28 Jul 2026 23:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-lock 2/4]
 kernel/time/hrtimer.c:320:24: error: passing 'raw_spinlock_t' (aka 'struct
 raw_spinlock') to parameter of incompatible type 'raw_spinlock_t *' (aka
 'struct raw_spinlock *'); take the address with &
Message-ID: <202607282229.xRzytVw0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-lock
head:   830403610079844461b6f172c28d34c16082bfd6
commit: c63eaa23a081dc19e1880b3b26bd521b6d083bd4 [2/4] ret
config: hexagon-randconfig-001-20260728 (https://download.01.org/0day-ci/archive/20260728/202607282229.xRzytVw0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282229.xRzytVw0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282229.xRzytVw0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/hrtimer.c:320:24: error: passing 'raw_spinlock_t' (aka 'struct raw_spinlock') to parameter of incompatible type 'raw_spinlock_t *' (aka 'struct raw_spinlock *'); take the address with &
     320 |         raw_spin_lock_irqsave(timer->base->cpu_base->lock, *flags);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               &
   include/linux/spinlock.h:245:34: note: expanded from macro 'raw_spin_lock_irqsave'
     245 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   include/linux/spinlock_api_smp.h:32:65: note: passing argument to parameter 'lock' here
      32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
         |                                                                 ^
   1 error generated.


vim +320 kernel/time/hrtimer.c

   316	
   317	static inline void lock_hrtimer_base(const struct hrtimer *timer, unsigned long *flags)
   318		__acquires(&timer->base->cpu_base->lock)
   319	{
 > 320		raw_spin_lock_irqsave(timer->base->cpu_base->lock, *flags);
   321	}
   322	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
