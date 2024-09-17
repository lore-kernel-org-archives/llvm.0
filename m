Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64956148833;
	Tue, 17 Sep 2024 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726560732; cv=none; b=WeKjDa4LjrIIsBK8nOK1D2GdbKzQTdLr8PV5CS49DAhuZxymbBa2YARt4A059cxG4lg392P4yvAGxjxcL75Gg0pvX/9SHVuD8CMW9NmoiOq0NcG89s5Z7vZhHyzsNJZtkwvXh8ggCC9vb6WfbRy0bZVSUR5h/dpfP1y9wEafI5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726560732; c=relaxed/simple;
	bh=DY7O6jPd/XmTIT6iAPLLhbQxFfl5m3CBNyn8gcyxteY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yg1f+tLo45aOu9YTpFeyVs/FKvpe7LEZzYVzll02crnuHKIKdf8x2QzE/2j6Jy23GL4DQ9VRbtj/VXUT4sI7sBt/BII5C/h/Vvz0qLCKNLngHqBR2GOg2B/HeW51gGOgmHF72jiFEU4y15gL0xXM3LhSu602kWZg3su5SZldOYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6MBHOd5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6MBHOd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726560730; x=1758096730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DY7O6jPd/XmTIT6iAPLLhbQxFfl5m3CBNyn8gcyxteY=;
  b=C6MBHOd5k5+NG9Kkg0kUV55A7pjkkF4/fP8eXi7hxY4J/0uGJOM7Q5UJ
   fOtNaB/KWWgp1Hfk24+dX3aqNbPhvBDfTSBFNC0TcoxWV67HESO0tXiRQ
   50yC+GyQ+rjW5sInYk6VKCgHRCc8CPROJEHTz12N4/7OkQjQOLn071l6e
   yuInpnGz8fOYh/6qXFLLkCnXMLpBMMoCyh7Lg7wmnAzD4RjPFpMmQQH5f
   l6YM4oSkQaSoSYnqgMstJj43tZ/tD9+A8yuTgT+uvxdolhdJaMGNWAcHc
   vPdn50n08xJpGHolCy51opUNleKr0LpGqCMkNJHF8v+65+ceogzdkXVSf
   Q==;
X-CSE-ConnectionGUID: cPUbu6a8TF6HU16uXIm+jg==
X-CSE-MsgGUID: ICfKdTTAQLKADhrs4xd54w==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25563528"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25563528"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 01:11:59 -0700
X-CSE-ConnectionGUID: hy6Y1JmWREy5Ra9HScwPqA==
X-CSE-MsgGUID: KIuJ8CpmQ8aS0bdWpvnSsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="106577931"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Sep 2024 01:11:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqTJT-000AxU-1U;
	Tue, 17 Sep 2024 08:11:55 +0000
Date: Tue, 17 Sep 2024 16:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 06/11] fs: add percpu counters for significant
 multigrain timestamp events
Message-ID: <202409171602.oeaTIYhc-lkp@intel.com>
References: <20240914-mgtime-v8-6-5bd872330bed@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240914-mgtime-v8-6-5bd872330bed@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/timekeeping-move-multigrain-timestamp-floor-handling-into-timekeeper/20240915-010919
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240914-mgtime-v8-6-5bd872330bed%40kernel.org
patch subject: [PATCH v8 06/11] fs: add percpu counters for significant multigrain timestamp events
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240917/202409171602.oeaTIYhc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171602.oeaTIYhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171602.oeaTIYhc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/inode.c:2755:23: error: too many arguments provided to function-like macro invocation
    2755 |                         mgtime_counter_inc(mg_fine_stamps);
         |                                            ^
   fs/inode.c:166:9: note: macro 'mgtime_counter_inc' defined here
     166 | #define mgtime_counter_inc()    do { } while (0)
         |         ^
>> fs/inode.c:2755:4: error: use of undeclared identifier 'mgtime_counter_inc'; did you mean 'percpu_counter_inc'?
    2755 |                         mgtime_counter_inc(mg_fine_stamps);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         percpu_counter_inc
   include/linux/percpu_counter.h:265:20: note: 'percpu_counter_inc' declared here
     265 | static inline void percpu_counter_inc(struct percpu_counter *fbc)
         |                    ^
   fs/inode.c:2758:21: error: too many arguments provided to function-like macro invocation
    2758 |         mgtime_counter_inc(mg_ctime_updates);
         |                            ^
   fs/inode.c:166:9: note: macro 'mgtime_counter_inc' defined here
     166 | #define mgtime_counter_inc()    do { } while (0)
         |         ^
   fs/inode.c:2758:2: error: use of undeclared identifier 'mgtime_counter_inc'; did you mean 'percpu_counter_inc'?
    2758 |         mgtime_counter_inc(mg_ctime_updates);
         |         ^~~~~~~~~~~~~~~~~~
         |         percpu_counter_inc
   include/linux/percpu_counter.h:265:20: note: 'percpu_counter_inc' declared here
     265 | static inline void percpu_counter_inc(struct percpu_counter *fbc)
         |                    ^
   fs/inode.c:2772:22: error: too many arguments provided to function-like macro invocation
    2772 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                                    ^
   fs/inode.c:166:9: note: macro 'mgtime_counter_inc' defined here
     166 | #define mgtime_counter_inc()    do { } while (0)
         |         ^
   fs/inode.c:2772:3: error: use of undeclared identifier 'mgtime_counter_inc'; did you mean 'percpu_counter_inc'?
    2772 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 percpu_counter_inc
   include/linux/percpu_counter.h:265:20: note: 'percpu_counter_inc' declared here
     265 | static inline void percpu_counter_inc(struct percpu_counter *fbc)
         |                    ^
>> fs/inode.c:2755:4: warning: expression result unused [-Wunused-value]
    2755 |                         mgtime_counter_inc(mg_fine_stamps);
         |                         ^~~~~~~~~~~~~~~~~~
   fs/inode.c:2758:2: warning: expression result unused [-Wunused-value]
    2758 |         mgtime_counter_inc(mg_ctime_updates);
         |         ^~~~~~~~~~~~~~~~~~
   fs/inode.c:2772:3: warning: expression result unused [-Wunused-value]
    2772 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/inode.c:2845:22: error: too many arguments provided to function-like macro invocation
    2845 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                                    ^
   fs/inode.c:166:9: note: macro 'mgtime_counter_inc' defined here
     166 | #define mgtime_counter_inc()    do { } while (0)
         |         ^
   fs/inode.c:2845:3: error: use of undeclared identifier 'mgtime_counter_inc'; did you mean 'percpu_counter_inc'?
    2845 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 percpu_counter_inc
   include/linux/percpu_counter.h:265:20: note: 'percpu_counter_inc' declared here
     265 | static inline void percpu_counter_inc(struct percpu_counter *fbc)
         |                    ^
   fs/inode.c:2845:3: warning: expression result unused [-Wunused-value]
    2845 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                 ^~~~~~~~~~~~~~~~~~
   4 warnings and 8 errors generated.
--
>> kernel/time/timekeeping.c:2467:22: error: too many arguments provided to function-like macro invocation
    2467 |                 mgtime_counter_inc(mg_floor_swaps);
         |                                    ^
   kernel/time/timekeeping_internal.h:18:9: note: macro 'mgtime_counter_inc' defined here
      18 | #define mgtime_counter_inc()    do { } while (0)
         |         ^
>> kernel/time/timekeeping.c:2467:3: error: use of undeclared identifier 'mgtime_counter_inc'; did you mean 'percpu_counter_inc'?
    2467 |                 mgtime_counter_inc(mg_floor_swaps);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 percpu_counter_inc
   include/linux/percpu_counter.h:265:20: note: 'percpu_counter_inc' declared here
     265 | static inline void percpu_counter_inc(struct percpu_counter *fbc)
         |                    ^
>> kernel/time/timekeeping.c:2467:3: warning: expression result unused [-Wunused-value]
    2467 |                 mgtime_counter_inc(mg_floor_swaps);
         |                 ^~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +2755 fs/inode.c

  2713	
  2714	/**
  2715	 * inode_set_ctime_current - set the ctime to current_time
  2716	 * @inode: inode
  2717	 *
  2718	 * Set the inode's ctime to the current value for the inode. Returns the
  2719	 * current value that was assigned. If this is not a multigrain inode, then we
  2720	 * set it to the later of the coarse time and floor value.
  2721	 *
  2722	 * If it is multigrain, then we first see if the coarse-grained timestamp is
  2723	 * distinct from what we have. If so, then we'll just use that. If we have to
  2724	 * get a fine-grained timestamp, then do so. After that, we try to swap the new
  2725	 * value into i_ctime_nsec. We take the resulting ctime, regardless of the
  2726	 * outcome of the swap.
  2727	 */
  2728	struct timespec64 inode_set_ctime_current(struct inode *inode)
  2729	{
  2730		struct timespec64 now;
  2731		u32 cns, cur;
  2732	
  2733		ktime_get_coarse_real_ts64_mg(&now);
  2734		now = timestamp_truncate(now, inode);
  2735	
  2736		/* Just return that if this is not a multigrain fs */
  2737		if (!is_mgtime(inode)) {
  2738			inode_set_ctime_to_ts(inode, now);
  2739			goto out;
  2740		}
  2741	
  2742		/*
  2743		 * We only need a fine-grained time if someone has queried it,
  2744		 * and the current coarse grained time isn't later than what's
  2745		 * already there.
  2746		 */
  2747		cns = smp_load_acquire(&inode->i_ctime_nsec);
  2748		if (cns & I_CTIME_QUERIED) {
  2749			struct timespec64 ctime = { .tv_sec = inode->i_ctime_sec,
  2750						    .tv_nsec = cns & ~I_CTIME_QUERIED };
  2751	
  2752			if (timespec64_compare(&now, &ctime) <= 0) {
  2753				ktime_get_real_ts64_mg(&now);
  2754				now = timestamp_truncate(now, inode);
> 2755				mgtime_counter_inc(mg_fine_stamps);
  2756			}
  2757		}
  2758		mgtime_counter_inc(mg_ctime_updates);
  2759	
  2760		/* No need to cmpxchg if it's exactly the same */
  2761		if (cns == now.tv_nsec && inode->i_ctime_sec == now.tv_sec) {
  2762			trace_ctime_xchg_skip(inode, &now);
  2763			goto out;
  2764		}
  2765		cur = cns;
  2766	retry:
  2767		/* Try to swap the nsec value into place. */
  2768		if (try_cmpxchg(&inode->i_ctime_nsec, &cur, now.tv_nsec)) {
  2769			/* If swap occurred, then we're (mostly) done */
  2770			inode->i_ctime_sec = now.tv_sec;
  2771			trace_ctime_ns_xchg(inode, cns, now.tv_nsec, cur);
  2772			mgtime_counter_inc(mg_ctime_swaps);
  2773		} else {
  2774			/*
  2775			 * Was the change due to someone marking the old ctime QUERIED?
  2776			 * If so then retry the swap. This can only happen once since
  2777			 * the only way to clear I_CTIME_QUERIED is to stamp the inode
  2778			 * with a new ctime.
  2779			 */
  2780			if (!(cns & I_CTIME_QUERIED) && (cns | I_CTIME_QUERIED) == cur) {
  2781				cns = cur;
  2782				goto retry;
  2783			}
  2784			/* Otherwise, keep the existing ctime */
  2785			now.tv_sec = inode->i_ctime_sec;
  2786			now.tv_nsec = cur & ~I_CTIME_QUERIED;
  2787		}
  2788	out:
  2789		return now;
  2790	}
  2791	EXPORT_SYMBOL(inode_set_ctime_current);
  2792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
