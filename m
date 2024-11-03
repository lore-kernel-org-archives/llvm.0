Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FF6AD2C;
	Sun,  3 Nov 2024 00:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730593507; cv=none; b=lZNQs2XK7FF4/PcOcNWROE3NwSI6ujXmJIerDfelsllSE4UuNHVjAaApbT4UA9W3W652o4cAuIxyN+6F/KjE6xyIKH7oCAuVuaSv6QS0TOQwhp3nvtLY7Sflz55OncKBkFI+yNYNgmt88JRhmeR6m9mNcNRXTbML/coKVOjiJzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730593507; c=relaxed/simple;
	bh=tSbsH5LYyg1jfX5AJ6am4mxThB6pMyDr/XwDAPC4oWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+Ywh+QyKTP9PklHTpjt7JwaHW7gHV+TxQHT0s7c5AlIUIwolRUYpXBFxXxKDF9qdMd1TYi+bZ5+YftsOhrBqa8xvNrGPx3gFrQbssb0kuHZs7aMTRRLMhbb/758f8YDxV7MSdAz+171zUXaqx46B91SfaAre5iDv6m2ysxH3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGKaOq0e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGKaOq0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730593506; x=1762129506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tSbsH5LYyg1jfX5AJ6am4mxThB6pMyDr/XwDAPC4oWM=;
  b=kGKaOq0eujMsb0wJxkn3Ihys6ueDQGMUGk44D/xftfX8M521CX6SudE+
   UITi1yWQq9cw5GH8KwT2IiO2fVgyhdxdNnsd+upj/zkB6CbHTieGVzHwm
   HsxRE7pBaQxhbev7A3xVhOXw1h0B7fMsXKux3rEy6F0izSOHIuwgXhFog
   ovICJuEwi1mtZOQ5m0S00VlfHEkTdRYQn4sjBVAj2fmLYT1zj6CXYo4ir
   9TqAlt4/5/nwNtMvnSB417Ws4lt2F2OWOY95AT/BNEeljRA3fewkqFaR6
   Dw8mvcFK+UB/9bIPFOyrfqP8aW5N9r6e6U21qQE1uDDzCkJ3VBM/nIwQo
   Q==;
X-CSE-ConnectionGUID: uvnJI72LS2aGHA3BjknSSA==
X-CSE-MsgGUID: yaOTjGvpRfC8IuYhxN7d0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="29745740"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="29745740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 17:25:04 -0700
X-CSE-ConnectionGUID: XxIcKVGMRgetUP/yrIckyg==
X-CSE-MsgGUID: fyE8mLqdS3GT5W2vYxhvfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83209912"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Nov 2024 17:25:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7OQO-000jUv-2n;
	Sun, 03 Nov 2024 00:25:00 +0000
Date: Sun, 3 Nov 2024 08:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 104/107] kernel/signal.c:2002:25: error:
 use of undeclared identifier 'POSIX_TIMER_REQUEUE_PENDING'
Message-ID: <202411030853.CoxrLb6x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   7dff83f0eba841872222db257facf9efac85dd2e
commit: a4329b49227494eab8b0dc4220b65c9c341ef3f9 [104/107] signal: Queue ignored posixtimers on ignore list
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241103/202411030853.CoxrLb6x-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030853.CoxrLb6x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030853.CoxrLb6x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/signal.c:25:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/signal.c:2002:25: error: use of undeclared identifier 'POSIX_TIMER_REQUEUE_PENDING'
    2002 |                 if (tmr->it_status == POSIX_TIMER_REQUEUE_PENDING) {
         |                                       ^
>> kernel/signal.c:2014:30: error: incompatible pointer types passing 'struct k_itimer *' to parameter of type 'struct sigqueue *' [-Werror,-Wincompatible-pointer-types]
    2014 |                                 posixtimer_sig_ignore(t, tmr);
         |                                                          ^~~
   kernel/signal.c:734:84: note: passing argument to parameter 'q' here
     734 | static inline void posixtimer_sig_ignore(struct task_struct *tsk, struct sigqueue *q);
         |                                                                                    ^
   kernel/signal.c:2059:24: error: use of undeclared identifier 'POSIX_TIMER_REQUEUE_PENDING'
    2059 |         if (tmr->it_status == POSIX_TIMER_REQUEUE_PENDING)
         |                               ^
   4 warnings and 3 errors generated.


vim +/POSIX_TIMER_REQUEUE_PENDING +2002 kernel/signal.c

  1970	
  1971	int posixtimer_send_sigqueue(struct k_itimer *tmr)
  1972	{
  1973		struct sigqueue *q = &tmr->sigq;
  1974		int sig = q->info.si_signo;
  1975		struct task_struct *t;
  1976		unsigned long flags;
  1977		int result;
  1978	
  1979		guard(rcu)();
  1980	
  1981		t = posixtimer_get_target(tmr);
  1982		if (!t)
  1983			return -1;
  1984	
  1985		if (!likely(lock_task_sighand(t, &flags)))
  1986			return -1;
  1987	
  1988		/*
  1989		 * Update @tmr::sigqueue_seq for posix timer signals with sighand
  1990		 * locked to prevent a race against dequeue_signal().
  1991		 */
  1992		tmr->it_sigqueue_seq = tmr->it_signal_seq;
  1993	
  1994		if (!prepare_signal(sig, t, false)) {
  1995			result = TRACE_SIGNAL_IGNORED;
  1996	
  1997			/* Paranoia check. Try to survive. */
  1998			if (WARN_ON_ONCE(!list_empty(&q->list)))
  1999				goto out;
  2000	
  2001			/* Periodic timers with SIG_IGN are queued on the ignored list */
> 2002			if (tmr->it_status == POSIX_TIMER_REQUEUE_PENDING) {
  2003				/*
  2004				 * Already queued means the timer was rearmed after
  2005				 * the previous expiry got it on the ignore list.
  2006				 * Nothing to do for that case.
  2007				 */
  2008				if (hlist_unhashed(&tmr->ignored_list)) {
  2009					/*
  2010					 * Take a signal reference and queue it on
  2011					 * the ignored list.
  2012					 */
  2013					posixtimer_sigqueue_getref(q);
> 2014					posixtimer_sig_ignore(t, tmr);
  2015				}
  2016			} else if (!hlist_unhashed(&tmr->ignored_list)) {
  2017				/*
  2018				 * Covers the case where a timer was periodic and
  2019				 * then signal was ignored. Then it was rearmed as
  2020				 * oneshot timer. The previous signal is invalid
  2021				 * now, and the oneshot signal has to be dropped.
  2022				 * Remove it from the ignored list and drop the
  2023				 * reference count as the signal is not longer
  2024				 * queued.
  2025				 */
  2026				hlist_del_init(&tmr->ignored_list);
  2027				posixtimer_putref(tmr);
  2028			}
  2029			goto out;
  2030		}
  2031	
  2032		/* This should never happen and leaks a reference count */
  2033		if (WARN_ON_ONCE(!hlist_unhashed(&tmr->ignored_list)))
  2034			hlist_del_init(&tmr->ignored_list);
  2035	
  2036		if (unlikely(!list_empty(&q->list))) {
  2037			/* This holds a reference count already */
  2038			result = TRACE_SIGNAL_ALREADY_PENDING;
  2039			goto out;
  2040		}
  2041	
  2042		posixtimer_sigqueue_getref(q);
  2043		posixtimer_queue_sigqueue(q, t, tmr->it_pid_type);
  2044		result = TRACE_SIGNAL_DELIVERED;
  2045	out:
  2046		trace_signal_generate(sig, &q->info, t, tmr->it_pid_type != PIDTYPE_PID, result);
  2047		unlock_task_sighand(t, &flags);
  2048		return 0;
  2049	}
  2050	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
