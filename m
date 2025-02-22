Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9501FF5F7;
	Sat, 22 Feb 2025 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740256686; cv=none; b=Dc5pXg7VAKNIV79eR7gF4+oYD+R0mY4//2FcEQj+n/23Pn+IsV10rmN5fEPFK5+0aBr8F+MWpWBfo0b8iWwp7A3tYLRs6bi9MSnWdLGTPVPy04kK/gRR2vJU2ZRsUIhVs4a8GTw1lJojxl3YDLKQ3DigogizC89RyMIbSJ+Lz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740256686; c=relaxed/simple;
	bh=i85/8McLD0RJCzZEMxPrHkTP6cvHCCCkAYpEgk8lX/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RGUUblQ6BEqw7XeLFHaxCZQCGwrxUKgBMjX4fcQcaQJRIr6SLJ8jWNEwsWyaUQE7yxuxEnRFLLRy8i+BTw4MeGJgUvz1rTjxUyTcpViPyl0x3c24ooEvWf7BRHFPoWOIkmwOXqkVQC0pT6vW8W2PTJ7DZnxu1rqfUE38YeCA2uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R++Vtnw2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R++Vtnw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740256683; x=1771792683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i85/8McLD0RJCzZEMxPrHkTP6cvHCCCkAYpEgk8lX/s=;
  b=R++Vtnw2sLKhbTNBE+YCC0IbSgLeXYvcqCvi3U2NXXzjb1A7DxM5ff4K
   5NuSVXKi6zcy4+R+nEK+bVQf6Yims6FM4jtyy0fe2i8miKzw0wg0umOn8
   w5Mvycfq+GV2ZcYRqOd3MVR65Jp4R2KLaJdiQM3TNT6bg+TQjOhBlELfw
   fIPcXnct5E1HjNStUGrNpU3s/AjvmrVSQIvZcoT82bC0DFHLgrNMkWmtW
   LVsM+UKTO4vEeZvQoCuhkzRNCy3OpfvF/UnvC0PYY1XX+PlZaN0KE2S0d
   lyimJFuo3BxuWuqSEbdAsIlcWiNTMF7BUWAAAg79XooJD5BVNg73L7rx0
   Q==;
X-CSE-ConnectionGUID: 8P0/S7kPQpK0Kp7J3gHIiQ==
X-CSE-MsgGUID: eDFaWJdpRciGswHaCj+d8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40969938"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40969938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 12:38:02 -0800
X-CSE-ConnectionGUID: 1oekai+8TeqFEAv8PwZUYQ==
X-CSE-MsgGUID: ymD4n10OQ3+B9KmT1VgBGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116169240"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Feb 2025 12:38:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlwG6-0006tX-2q;
	Sat, 22 Feb 2025 20:37:58 +0000
Date: Sun, 23 Feb 2025 04:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 10/19] kernel/time/posix-timers.c:423:2:
 error: use of undeclared identifier 'new_timer_id'; did you mean
 'new_timer'?
Message-ID: <202502230451.My1HuTvU-lkp@intel.com>
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
commit: ee35cb454088487035734ec7320ec5974a69651e [10/19] posix-timers: Rework the timer valid mechanism
config: s390-randconfig-002-20250223 (https://download.01.org/0day-ci/archive/20250223/202502230451.My1HuTvU-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230451.My1HuTvU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230451.My1HuTvU-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/posix-timers.c:105:21: error: incompatible pointer types initializing 'struct list_head *' with an expression of type 'struct hlist_head *' [-Werror,-Wincompatible-pointer-types]
                   struct list_head *head = &posix_timers_hashtable[hash(sig, id)];
                                     ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:110:32: error: incompatible pointer types passing 'struct list_head *' to parameter of type 'struct hlist_head *' [-Werror,-Wincompatible-pointer-types]
                           hashed = posix_timer_hashed(head, sig, id);
                                                       ^~~~
   kernel/time/posix-timers.c:69:51: note: passing argument to parameter 'head' here
   static bool posix_timer_hashed(struct hlist_head *head, struct signal_struct *sig, timer_t id)
                                                     ^
   kernel/time/posix-timers.c:123:27: error: incompatible pointer types passing 'struct list_head *' to parameter of type 'struct hlist_head *' [-Werror,-Wincompatible-pointer-types]
                   if (!posix_timer_hashed(head, sig, id)) {
                                           ^~~~
   kernel/time/posix-timers.c:69:51: note: passing argument to parameter 'head' here
   static bool posix_timer_hashed(struct hlist_head *head, struct signal_struct *sig, timer_t id)
                                                     ^
   kernel/time/posix-timers.c:132:39: error: incompatible pointer types passing 'struct list_head *' to parameter of type 'struct hlist_head *' [-Werror,-Wincompatible-pointer-types]
                           hlist_add_head_rcu(&timer->t_hash, head);
                                                              ^~~~
   include/linux/rculist.h:634:25: note: passing argument to parameter 'h' here
                                           struct hlist_head *h)
                                                              ^
>> kernel/time/posix-timers.c:423:2: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
           new_timer_id = posix_timer_add(new_timer);
           ^~~~~~~~~~~~
           new_timer
   kernel/time/posix-timers.c:405:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
>> kernel/time/posix-timers.c:423:15: error: incompatible integer to pointer conversion assigning to 'struct k_itimer *' from 'int' [-Wint-conversion]
           new_timer_id = posix_timer_add(new_timer);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:424:6: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
           if (new_timer_id < 0) {
               ^~~~~~~~~~~~
               new_timer
   kernel/time/posix-timers.c:405:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
   kernel/time/posix-timers.c:426:10: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
                   return new_timer_id;
                          ^~~~~~~~~~~~
                          new_timer
   kernel/time/posix-timers.c:405:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
>> kernel/time/posix-timers.c:426:10: error: incompatible pointer to integer conversion returning 'struct k_itimer *' from a function with result type 'int' [-Wint-conversion]
                   return new_timer_id;
                          ^~~~~~~~~~~~
   kernel/time/posix-timers.c:460:60: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
           if (copy_to_user(created_timer_id, &new_timer_id, sizeof (new_timer_id))) {
                                                                     ^~~~~~~~~~~~
                                                                     new_timer
   kernel/time/posix-timers.c:405:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
   kernel/time/posix-timers.c:460:38: error: use of undeclared identifier 'new_timer_id'; did you mean 'new_timer'?
           if (copy_to_user(created_timer_id, &new_timer_id, sizeof (new_timer_id))) {
                                               ^~~~~~~~~~~~
                                               new_timer
   kernel/time/posix-timers.c:405:19: note: 'new_timer' declared here
           struct k_itimer *new_timer;
                            ^
   11 errors generated.


vim +423 kernel/time/posix-timers.c

838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  399  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  400  /* Create a POSIX.1b interval timer. */
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  401  static int do_timer_create(clockid_t which_clock, struct sigevent *event,
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  402  			   timer_t __user *created_timer_id)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  403  {
d3ba5a9a345b12 kernel/time/posix-timers.c Christoph Hellwig 2017-05-26  404  	const struct k_clock *kc = clockid_to_kclock(which_clock);
2cd499e38ec241 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  405  	struct k_itimer *new_timer;
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  406  	int error;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  407  
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  408  	if (!kc)
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  409  		return -EINVAL;
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  410  	if (!kc->timer_create)
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  411  		return -EOPNOTSUPP;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  412  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  413  	new_timer = alloc_posix_timer();
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  414  	if (unlikely(!new_timer))
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  415  		return -EAGAIN;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  416  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  417  	spin_lock_init(&new_timer->it_lock);
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  418  
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  419  	/*
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  420  	 * Add the timer to the hash table. The timer is not yet valid
e577c6d8698192 kernel/time/posix-timers.c Eric Dumazet      2025-02-19  421  	 * after insertion, but has a unique ID allocated.
ae88967d71f1b4 kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  422  	 */
5ed67f05f66c41 kernel/posix-timers.c      Pavel Emelyanov   2013-03-11 @423  	new_timer_id = posix_timer_add(new_timer);
5ed67f05f66c41 kernel/posix-timers.c      Pavel Emelyanov   2013-03-11  424  	if (new_timer_id < 0) {
5d916a0988eed5 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  425  		posixtimer_free_timer(new_timer);
8cc96ca2c75f6d kernel/time/posix-timers.c Thomas Gleixner   2023-04-25 @426  		return new_timer_id;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  427  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  428  
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  429  	new_timer->it_clock = which_clock;
d97bb75ddd2f38 kernel/time/posix-timers.c Thomas Gleixner   2017-05-30  430  	new_timer->kclock = kc;
78c9c4dfbf8c04 kernel/time/posix-timers.c Thomas Gleixner   2018-06-26  431  	new_timer->it_overrun = -1LL;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  432  
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  433  	if (event) {
36b2f046000b35 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  434  		rcu_read_lock();
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  435  		new_timer->it_pid = get_pid(good_sigevent(event));
36b2f046000b35 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  436  		rcu_read_unlock();
899921025b406a kernel/posix-timers.c      Oleg Nesterov     2008-12-01  437  		if (!new_timer->it_pid) {
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  438  			error = -EINVAL;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  439  			goto out;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  440  		}
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  441  		new_timer->it_sigev_notify     = event->sigev_notify;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  442  		new_timer->sigq.info.si_signo = event->sigev_signo;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  443  		new_timer->sigq.info.si_value = event->sigev_value;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  444  	} else {
2482097c6c0f01 kernel/time/posix-timers.c Al Viro           2017-06-07  445  		new_timer->it_sigev_notify     = SIGEV_SIGNAL;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  446  		new_timer->sigq.info.si_signo = SIGALRM;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  447  		memset(&new_timer->sigq.info.si_value, 0, sizeof(sigval_t));
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  448  		new_timer->sigq.info.si_value.sival_int = new_timer->it_id;
899921025b406a kernel/posix-timers.c      Oleg Nesterov     2008-12-01  449  		new_timer->it_pid = get_pid(task_tgid(current));
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  450  	}
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  451  
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  452  	if (new_timer->it_sigev_notify & SIGEV_THREAD_ID)
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  453  		new_timer->it_pid_type = PIDTYPE_PID;
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  454  	else
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  455  		new_timer->it_pid_type = PIDTYPE_TGID;
ef1c5bcd6daa67 kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  456  
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  457  	new_timer->sigq.info.si_tid = new_timer->it_id;
6017a158beb13b kernel/time/posix-timers.c Thomas Gleixner   2024-11-05  458  	new_timer->sigq.info.si_code = SI_TIMER;
717835d94d3e3d kernel/posix-timers.c      Oleg Nesterov     2008-09-22  459  
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  460  	if (copy_to_user(created_timer_id, &new_timer_id, sizeof (new_timer_id))) {
2b08de0073a569 kernel/posix-timers.c      Andrey Vagin      2010-07-20  461  		error = -EFAULT;
2b08de0073a569 kernel/posix-timers.c      Andrey Vagin      2010-07-20  462  		goto out;
2b08de0073a569 kernel/posix-timers.c      Andrey Vagin      2010-07-20  463  	}
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  464  	/*
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  465  	 * After successful copy out, the timer ID is visible to user space
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  466  	 * now but not yet valid because new_timer::it_valid is still false.
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  467  	 *
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  468  	 * Complete the initialization with the clock specific create
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  469  	 * callback.
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  470  	 */
838394fbf98997 kernel/posix-timers.c      Thomas Gleixner   2011-02-01  471  	error = kc->timer_create(new_timer);
45e0fffc8a7778 kernel/posix-timers.c      Andrey Vagin      2010-05-24  472  	if (error)
45e0fffc8a7778 kernel/posix-timers.c      Andrey Vagin      2010-05-24  473  		goto out;
45e0fffc8a7778 kernel/posix-timers.c      Andrey Vagin      2010-05-24  474  
36b2f046000b35 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  475  	spin_lock_irq(&current->sighand->siglock);
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  476  	/* Set the valid marker so it's visible for syscall operations. */
ee35cb45408848 kernel/time/posix-timers.c Thomas Gleixner   2025-02-18  477  	WRITE_ONCE(new_timer->it_valid, true);
52dea0a15cc888 kernel/time/posix-timers.c Thomas Gleixner   2024-06-10  478  	hlist_add_head(&new_timer->list, &current->signal->posix_timers);
36b2f046000b35 kernel/posix-timers.c      Oleg Nesterov     2008-09-22  479  	spin_unlock_irq(&current->sighand->siglock);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  480  	/*
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  481  	 * After unlocking sighand::siglock @new_timer is subject to
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  482  	 * concurrent removal and cannot be touched anymore
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  483  	 */
52f090b164b59c kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  484  	return 0;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  485  out:
8cc96ca2c75f6d kernel/time/posix-timers.c Thomas Gleixner   2023-04-25  486  	posix_timer_unhash_and_free(new_timer);
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  487  	return error;
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  488  }
^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  489  

:::::: The code at line 423 was first introduced by commit
:::::: 5ed67f05f66c41e39880a6d61358438a25f9fee5 posix timers: Allocate timer id per process (v2)

:::::: TO: Pavel Emelyanov <xemul@parallels.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
