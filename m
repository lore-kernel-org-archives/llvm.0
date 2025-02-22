Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B41EDA17;
	Sat, 22 Feb 2025 21:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740261059; cv=none; b=L4k4f0OhqIyTxPAa1l72WQKWW7Y1UHKBmjXg77FKEjiW5ZtfL7k9sbHdMQsQ48Ze7OfAjuQ0mXj2a5s1QeqfTwTJaEla2rNc9LKHqKnQI1J3an5zQAiupIYoBc92U4sNHPqsARGQ5ybXURQfZeocyctYSOsOXvOekMGLIXWesDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740261059; c=relaxed/simple;
	bh=kPVdqvrKoJdquhbO4UGzxlz5f+Iik8dV0F9Oz5cJ/Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fv4GuV9DWqqdfIXm3vQ1fosGIjh5VLcWNgF2oREl7JLS7hANvx/M0JvX5trfraqUX9m0Qg8XQXwKr8ffP7PuuRrGYb0hRZU7SP5St68YWNlu6gnLLFhFzMRNtjkHQBVzz7seBrGco1pJYy46kpa94FxgJyW1iPqcUtGOaVodwNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYYcKWE9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYYcKWE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740261057; x=1771797057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPVdqvrKoJdquhbO4UGzxlz5f+Iik8dV0F9Oz5cJ/Ck=;
  b=eYYcKWE994KKqAmEbmmz8ZQ4ANO1QVe7Lm4x714PJqHSa8anIbWzUdty
   NUVMCX5gZ5/lbxFiwmxztdaudzVsRFC8UoDzZFPOcMx/CUns5OzZ6SP37
   xF+wSWg+3+WfFajWf5xgpECUP0tMR115DQxyVb4vAP4PbNZyqgIkl/X5s
   yasl7quUFkTyixcGYPc50JWPUQ58Au6weQsVdQa9EmDca2YuvIdR4LflK
   SGm9raXx/rkVm78jpyycPfKlwk3qhzvn2Mhd1jZE4mXrw90i8pA5/EHmt
   WQc0JSI6tbA5RTv5Au5PeuJngjM6zEVleXEP/QZHHo7qlAM3nQviMHGAf
   g==;
X-CSE-ConnectionGUID: pUzY+C65RDqwVlqvfvW3Gw==
X-CSE-MsgGUID: 8do8ELP/QwKqZ2seSlJo5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51683434"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="51683434"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 13:50:56 -0800
X-CSE-ConnectionGUID: tRcuQ+TnThOpJ62QmkSJLw==
X-CSE-MsgGUID: XeSkEBClRJO4a9jw6kwGSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115646948"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Feb 2025 13:50:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlxOe-0006vp-1V;
	Sat, 22 Feb 2025 21:50:52 +0000
Date: Sun, 23 Feb 2025 05:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 12/19] kernel/time/posix-timers.c:59:3:
 error: use of undeclared identifier 'ret'
Message-ID: <202502230516.tlfb3osu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   9d4caab4067bd0c9023b7e98205b0747dece9f66
commit: 2f36f99979f62c4d147b7443d56aa95e426fcd6f [12/19] posix-timers: Switch to per process storage
config: s390-randconfig-002-20250223 (https://download.01.org/0day-ci/archive/20250223/202502230516.tlfb3osu-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230516.tlfb3osu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230516.tlfb3osu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/posix-timers.c:59:3: error: use of undeclared identifier 'ret'
                   ret = xa_insert(&sig->posix_timer_store, id, timer, GFP_KERNEL);
                   ^
   kernel/time/posix-timers.c:60:8: error: use of undeclared identifier 'ret'
                   if (!ret)
                        ^
   kernel/time/posix-timers.c:62:7: error: use of undeclared identifier 'ret'
                   if (ret != -EBUSY)
                       ^
   kernel/time/posix-timers.c:63:11: error: use of undeclared identifier 'ret'
                           return ret;
                                  ^
   kernel/time/posix-timers.c:351:2: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
           new_timer_id = posix_timer_add(new_timer);
           ^~~~~~~~~~~~
           new_timer
   kernel/time/posix-timers.c:333:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
   kernel/time/posix-timers.c:351:15: error: incompatible integer to pointer conversion assigning to 'struct k_itimer *' from 'int' [-Wint-conversion]
           new_timer_id = posix_timer_add(new_timer);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:352:6: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
           if (new_timer_id < 0) {
               ^~~~~~~~~~~~
               new_timer
   kernel/time/posix-timers.c:333:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
   kernel/time/posix-timers.c:354:10: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
                   return new_timer_id;
                          ^~~~~~~~~~~~
                          new_timer
   kernel/time/posix-timers.c:333:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
   kernel/time/posix-timers.c:354:10: error: incompatible pointer to integer conversion returning 'struct k_itimer *' from a function with result type 'int' [-Wint-conversion]
                   return new_timer_id;
                          ^~~~~~~~~~~~
   kernel/time/posix-timers.c:357:21: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
           new_timer->it_id = new_timer_id;
                              ^~~~~~~~~~~~
                              new_timer
   kernel/time/posix-timers.c:333:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
   kernel/time/posix-timers.c:389:60: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
           if (copy_to_user(created_timer_id, &new_timer_id, sizeof (new_timer_id))) {
                                                                     ^~~~~~~~~~~~
                                                                     new_timer
   kernel/time/posix-timers.c:333:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
   kernel/time/posix-timers.c:389:38: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
           if (copy_to_user(created_timer_id, &new_timer_id, sizeof (new_timer_id))) {
                                               ^~~~~~~~~~~~
                                               new_timer
   kernel/time/posix-timers.c:333:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
   12 errors generated.


vim +/ret +59 kernel/time/posix-timers.c

    49	
    50	static int posix_timer_add(struct k_itimer *timer)
    51	{
    52		struct signal_struct *sig = current->signal;
    53	
    54		for (unsigned int cnt = 0; cnt <= INT_MAX; cnt++) {
    55			/* Get the next timer ID and clamp it to positive space */
    56			unsigned int id = (atomic_inc_return(&sig->next_posix_timer_id) - 1) & INT_MAX;
    57	
    58			/* xa_insert() fails with -EBUSY when @id contains a timer already */
  > 59			ret = xa_insert(&sig->posix_timer_store, id, timer, GFP_KERNEL);
    60			if (!ret)
    61				return id;
    62			if (ret != -EBUSY)
    63				return ret;
    64			cond_resched();
    65		}
    66		/* POSIX return code when no timer ID could be allocated */
    67		return -EAGAIN;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
