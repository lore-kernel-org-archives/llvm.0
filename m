Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F07F126F2A;
	Fri, 13 Sep 2024 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726257623; cv=none; b=ta8Ff8tvES7YUQanunMisTyvhUeTfo+Ok6AXVnicmed4+tf9hbWG0haApoDKDSprQR/PhmG8ybwSy9cjMu64G/YdfTd7uSP9Qk0SnnN9MiyLQ2wuY10YNCfqblJN1OpG+0N4CVyhetyGMfPVsJHYXz+HjpLn0Et1TAwmxKQDDw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726257623; c=relaxed/simple;
	bh=w5rhTihOs85JxKVGBqgYhUi5aLfmUxk7Jc17sGH98Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEiwe2qVIa5qfvWU6a9RwD59M/zn07SX+boDEkRNWCRU9pxHi8IGtTGNfaHVyPnfSm79mKW6SIEV1QoKoj3fNaoviUxLvb7fMRZEtrzQWj9/upPlJq5VFFBOyUjahWhX4VXBgoZ9MocIWnS7++x08hPx1wjHGWDNzBGOxN2/VjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBRucEfv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBRucEfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726257621; x=1757793621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w5rhTihOs85JxKVGBqgYhUi5aLfmUxk7Jc17sGH98Ac=;
  b=XBRucEfvseN66T1djK/045IN6DuG8TbXjAapapFA4g9AFkVMwbxOlfAV
   u2XjdCZ1TZCEQPGupMc/CtxY2yrTP8MwUdSpQrtcSRUXcsl02Y7cGjq7K
   E59V+lmoCahlCvnNWm6O8x2/0YVMy7EgHrbGiDqbhQfKxtJpcvEY7d/Z7
   TTGhSRI/QeFI0Df08zoeKYkhPJgW09rlgarC/zTACX4+PF2NE4hacom9O
   fVSj1X4Os11mRw3/e8ARB6olFSyo2Kz2S2d+JgpWdxrKTw4LM++XRwmpC
   rzOd1KypjJ/KfmK9RYw2eLw0Q2lG+rN8sCqh5K95n0DyrcfHqVLZFjsCY
   g==;
X-CSE-ConnectionGUID: U10hNbnjSQ+jFvLkebvgQw==
X-CSE-MsgGUID: Jic1hOVHRZGgDXTy/zkEmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25326667"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25326667"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 13:00:20 -0700
X-CSE-ConnectionGUID: NF8ZmkmYTAmXTU34ybKMcg==
X-CSE-MsgGUID: V+jDrzyFReCQOwPazMVQoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="105626478"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2024 13:00:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spCSn-0006vm-0v;
	Fri, 13 Sep 2024 20:00:17 +0000
Date: Sat, 14 Sep 2024 03:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 05/11] fs: tracepoints around multigrain timestamp
 events
Message-ID: <202409140329.Xi9OLY1D-lkp@intel.com>
References: <20240913-mgtime-v7-5-92d4020e3b00@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913-mgtime-v7-5-92d4020e3b00@kernel.org>

Hi Jeff,

kernel test robot noticed the following build warnings:

[auto build test WARNING on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/timekeeping-move-multigrain-timestamp-floor-handling-into-timekeeper/20240913-215718
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240913-mgtime-v7-5-92d4020e3b00%40kernel.org
patch subject: [PATCH v7 05/11] fs: tracepoints around multigrain timestamp events
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240914/202409140329.Xi9OLY1D-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140329.Xi9OLY1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140329.Xi9OLY1D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/inode.c:2691:3: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
    2691 |                 goto out;
         |                 ^
   fs/inode.c:2689:2: note: previous statement is here
    2689 |         if (cns == now.tv_nsec && inode->i_ctime_sec == now.tv_sec)
         |         ^
   fs/inode.c:2771:3: error: call to undeclared function 'mgtime_counter_inc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2771 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                 ^
   fs/inode.c:2771:3: note: did you mean 'percpu_counter_inc'?
   include/linux/percpu_counter.h:265:20: note: 'percpu_counter_inc' declared here
     265 | static inline void percpu_counter_inc(struct percpu_counter *fbc)
         |                    ^
   fs/inode.c:2771:22: error: use of undeclared identifier 'mg_ctime_swaps'
    2771 |                 mgtime_counter_inc(mg_ctime_swaps);
         |                                    ^
   1 warning and 2 errors generated.


vim +/if +2691 fs/inode.c

50e17c000c467f Deepa Dinamani 2018-01-21  2642  
3cd886666ff19e Deepa Dinamani 2016-09-14  2643  /**
6190d23e434516 Jeff Layton    2024-09-13  2644   * inode_set_ctime_current - set the ctime to current_time
6190d23e434516 Jeff Layton    2024-09-13  2645   * @inode: inode
3cd886666ff19e Deepa Dinamani 2016-09-14  2646   *
6190d23e434516 Jeff Layton    2024-09-13  2647   * Set the inode's ctime to the current value for the inode. Returns the
6190d23e434516 Jeff Layton    2024-09-13  2648   * current value that was assigned. If this is not a multigrain inode, then we
6190d23e434516 Jeff Layton    2024-09-13  2649   * set it to the later of the coarse time and floor value.
3cd886666ff19e Deepa Dinamani 2016-09-14  2650   *
6190d23e434516 Jeff Layton    2024-09-13  2651   * If it is multigrain, then we first see if the coarse-grained timestamp is
6190d23e434516 Jeff Layton    2024-09-13  2652   * distinct from what we have. If so, then we'll just use that. If we have to
6190d23e434516 Jeff Layton    2024-09-13  2653   * get a fine-grained timestamp, then do so, and try to swap it into the floor.
6190d23e434516 Jeff Layton    2024-09-13  2654   * We accept the new floor value regardless of the outcome of the cmpxchg.
6190d23e434516 Jeff Layton    2024-09-13  2655   * After that, we try to swap the new value into i_ctime_nsec. Again, we take
6190d23e434516 Jeff Layton    2024-09-13  2656   * the resulting ctime, regardless of the outcome of the swap.
3cd886666ff19e Deepa Dinamani 2016-09-14  2657   */
6190d23e434516 Jeff Layton    2024-09-13  2658  struct timespec64 inode_set_ctime_current(struct inode *inode)
3cd886666ff19e Deepa Dinamani 2016-09-14  2659  {
d651d1607f22fd Arnd Bergmann  2018-12-05  2660  	struct timespec64 now;
6190d23e434516 Jeff Layton    2024-09-13  2661  	u32 cns, cur;
6190d23e434516 Jeff Layton    2024-09-13  2662  	u64 cookie;
d651d1607f22fd Arnd Bergmann  2018-12-05  2663  
6190d23e434516 Jeff Layton    2024-09-13  2664  	cookie = ktime_get_coarse_real_ts64_mg(&now);
6190d23e434516 Jeff Layton    2024-09-13  2665  
6190d23e434516 Jeff Layton    2024-09-13  2666  	/* Just return that if this is not a multigrain fs */
6190d23e434516 Jeff Layton    2024-09-13  2667  	if (!is_mgtime(inode)) {
6190d23e434516 Jeff Layton    2024-09-13  2668  		now = timestamp_truncate(now, inode);
6190d23e434516 Jeff Layton    2024-09-13  2669  		inode_set_ctime_to_ts(inode, now);
6190d23e434516 Jeff Layton    2024-09-13  2670  		goto out;
3cd886666ff19e Deepa Dinamani 2016-09-14  2671  	}
3cd886666ff19e Deepa Dinamani 2016-09-14  2672  
6190d23e434516 Jeff Layton    2024-09-13  2673  	/*
6190d23e434516 Jeff Layton    2024-09-13  2674  	 * We only need a fine-grained time if someone has queried it,
6190d23e434516 Jeff Layton    2024-09-13  2675  	 * and the current coarse grained time isn't later than what's
6190d23e434516 Jeff Layton    2024-09-13  2676  	 * already there.
9b6304c1d53745 Jeff Layton    2023-07-05  2677  	 */
6190d23e434516 Jeff Layton    2024-09-13  2678  	cns = smp_load_acquire(&inode->i_ctime_nsec);
6190d23e434516 Jeff Layton    2024-09-13  2679  	if (cns & I_CTIME_QUERIED) {
6190d23e434516 Jeff Layton    2024-09-13  2680  		struct timespec64 ctime = { .tv_sec = inode->i_ctime_sec,
6190d23e434516 Jeff Layton    2024-09-13  2681  					    .tv_nsec = cns & ~I_CTIME_QUERIED };
9b6304c1d53745 Jeff Layton    2023-07-05  2682  
6190d23e434516 Jeff Layton    2024-09-13  2683  		if (timespec64_compare(&now, &ctime) <= 0)
6190d23e434516 Jeff Layton    2024-09-13  2684  			ktime_get_real_ts64_mg(&now, cookie);
6190d23e434516 Jeff Layton    2024-09-13  2685  	}
6190d23e434516 Jeff Layton    2024-09-13  2686  	now = timestamp_truncate(now, inode);
6190d23e434516 Jeff Layton    2024-09-13  2687  
6190d23e434516 Jeff Layton    2024-09-13  2688  	/* No need to cmpxchg if it's exactly the same */
6190d23e434516 Jeff Layton    2024-09-13  2689  	if (cns == now.tv_nsec && inode->i_ctime_sec == now.tv_sec)
b5f00a1efab06a Jeff Layton    2024-09-13  2690  		trace_ctime_xchg_skip(inode, &now);
6190d23e434516 Jeff Layton    2024-09-13 @2691  		goto out;
6190d23e434516 Jeff Layton    2024-09-13  2692  	cur = cns;
6190d23e434516 Jeff Layton    2024-09-13  2693  retry:
6190d23e434516 Jeff Layton    2024-09-13  2694  	/* Try to swap the nsec value into place. */
6190d23e434516 Jeff Layton    2024-09-13  2695  	if (try_cmpxchg(&inode->i_ctime_nsec, &cur, now.tv_nsec)) {
6190d23e434516 Jeff Layton    2024-09-13  2696  		/* If swap occurred, then we're (mostly) done */
6190d23e434516 Jeff Layton    2024-09-13  2697  		inode->i_ctime_sec = now.tv_sec;
b5f00a1efab06a Jeff Layton    2024-09-13  2698  		trace_ctime_ns_xchg(inode, cns, now.tv_nsec, cur);
6190d23e434516 Jeff Layton    2024-09-13  2699  	} else {
6190d23e434516 Jeff Layton    2024-09-13  2700  		/*
6190d23e434516 Jeff Layton    2024-09-13  2701  		 * Was the change due to someone marking the old ctime QUERIED?
6190d23e434516 Jeff Layton    2024-09-13  2702  		 * If so then retry the swap. This can only happen once since
6190d23e434516 Jeff Layton    2024-09-13  2703  		 * the only way to clear I_CTIME_QUERIED is to stamp the inode
6190d23e434516 Jeff Layton    2024-09-13  2704  		 * with a new ctime.
6190d23e434516 Jeff Layton    2024-09-13  2705  		 */
6190d23e434516 Jeff Layton    2024-09-13  2706  		if (!(cns & I_CTIME_QUERIED) && (cns | I_CTIME_QUERIED) == cur) {
6190d23e434516 Jeff Layton    2024-09-13  2707  			cns = cur;
6190d23e434516 Jeff Layton    2024-09-13  2708  			goto retry;
6190d23e434516 Jeff Layton    2024-09-13  2709  		}
6190d23e434516 Jeff Layton    2024-09-13  2710  		/* Otherwise, keep the existing ctime */
6190d23e434516 Jeff Layton    2024-09-13  2711  		now.tv_sec = inode->i_ctime_sec;
6190d23e434516 Jeff Layton    2024-09-13  2712  		now.tv_nsec = cur & ~I_CTIME_QUERIED;
6190d23e434516 Jeff Layton    2024-09-13  2713  	}
6190d23e434516 Jeff Layton    2024-09-13  2714  out:
9b6304c1d53745 Jeff Layton    2023-07-05  2715  	return now;
9b6304c1d53745 Jeff Layton    2023-07-05  2716  }
9b6304c1d53745 Jeff Layton    2023-07-05  2717  EXPORT_SYMBOL(inode_set_ctime_current);
2b3416ceff5e6b Yang Xu        2022-07-14  2718  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
