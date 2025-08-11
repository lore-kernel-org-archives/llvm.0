Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6B29BDB5;
	Mon, 11 Aug 2025 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931113; cv=none; b=VvwcdnPMskvZbw5taavn2e8P6FkEZjm+iqrhslnnMuu4xIa7V56ZbBkP99dLD7K2iVPaiEmE3u/V2dgD6olpqYx54Fd/8aC4NhKa4iZts3HXFSxaY0ibs3rAkVXchukq25SpDW6H5/+5bvL+JTzHVqgydkTDa72XwT1naXLNHlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931113; c=relaxed/simple;
	bh=eg8EC2t80Vxh41ZznLIFBbpFrj8TuAVb4hd/s6oFWEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WW4ZWt5AseoZ3NpHse8T3k/OOnXWFHZtN3G1y8fW/j/WHrVgjTs84Pn/eziP6NNP9Ez4j7Vs9Z7DR5Wve+18sa+vD40/2HPw4kVgqYQpI87yGZb9JcMiImfwr/73JDvdP52nA0D+5faIx47Qw0dMr6EsyHVuRoO6udw2Mh/MBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1EcaQf4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1EcaQf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754931111; x=1786467111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eg8EC2t80Vxh41ZznLIFBbpFrj8TuAVb4hd/s6oFWEM=;
  b=e1EcaQf49nZCZRGxClkrvpLOil1VfppRqIPT7gVa2ZyF6AnZbUR1cnC/
   gVgKQFcIOBxJKtDYA4iTmPfnPTwR2j30wW54cCPTcLFNlx7P9pasdlRJJ
   kTkZIDkF0iH+f7MaNeOoNyxoxZQKJpqtE5CwN+mW1j7lUC/xwT+QLHY+8
   nrS4CD58JfxxzhUVR0SDyYSvwXLCLnJfC8IGNAEq3hVQJ4TQM6nrNayli
   cq7/uSELk8EqBoNM5KqPOHjHmyjhpcoJAIYeDVDM+9q9PC6zvs07TV2R6
   kwKuIfpDF23m10OY21Lwxl7XFPGQqa+u9x1ZuwWCyHLLjXkW9ZHPBMtp6
   g==;
X-CSE-ConnectionGUID: 1ekR4gx9RWS/Z5xievJIuA==
X-CSE-MsgGUID: piG/RRV3SCCQ3CzeAPfg5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="44773571"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="44773571"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 09:51:49 -0700
X-CSE-ConnectionGUID: HF8GKpY2TmeakFs8SR7YQg==
X-CSE-MsgGUID: jdIeMNWLR6uQEgdH/cB2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="171209283"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Aug 2025 09:51:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulVjS-00063L-2W;
	Mon, 11 Aug 2025 16:51:02 +0000
Date: Tue, 12 Aug 2025 00:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/core 10/15] kernel/events/core.c:7018:6: warning:
 variable 'user_extra' is used uninitialized whenever 'if' condition is true
Message-ID: <202508120028.0P5MnCYq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   965dafe6500a2b46311c810c9360c29c15e45677
commit: 189c97b1b2ab5bf33bdf635a70631526f1cd1bfd [10/15] perf: Split out the AUX buffer allocation
config: x86_64-buildonly-randconfig-003-20250811 (https://download.01.org/0day-ci/archive/20250812/202508120028.0P5MnCYq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120028.0P5MnCYq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120028.0P5MnCYq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:7018:6: warning: variable 'user_extra' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    7018 |         if (rb_has_aux(rb)) {
         |             ^~~~~~~~~~~~~~
   kernel/events/core.c:7043:25: note: uninitialized use occurs here
    7043 |         perf_mmap_account(vma, user_extra, extra);
         |                                ^~~~~~~~~~
   kernel/events/core.c:7018:2: note: remove the 'if' if its condition is always false
    7018 |         if (rb_has_aux(rb)) {
         |         ^~~~~~~~~~~~~~~~~~~~~
    7019 |                 atomic_inc(&rb->aux_mmap_count);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    7020 | 
    7021 |         } else {
         |         ~~~~~~
   kernel/events/core.c:6978:17: note: initialize the variable 'user_extra' to silence this warning
    6978 |         long user_extra, extra;
         |                        ^
         |                         = 0
>> kernel/events/core.c:7018:6: warning: variable 'extra' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    7018 |         if (rb_has_aux(rb)) {
         |             ^~~~~~~~~~~~~~
   kernel/events/core.c:7043:37: note: uninitialized use occurs here
    7043 |         perf_mmap_account(vma, user_extra, extra);
         |                                            ^~~~~
   kernel/events/core.c:7018:2: note: remove the 'if' if its condition is always false
    7018 |         if (rb_has_aux(rb)) {
         |         ^~~~~~~~~~~~~~~~~~~~~
    7019 |                 atomic_inc(&rb->aux_mmap_count);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    7020 | 
    7021 |         } else {
         |         ~~~~~~
   kernel/events/core.c:6978:24: note: initialize the variable 'extra' to silence this warning
    6978 |         long user_extra, extra;
         |                               ^
         |                                = 0
   kernel/events/core.c:215:20: warning: unused function 'class_perf_ctx_lock_destructor' [-Wunused-function]
     215 | static inline void class_perf_ctx_lock_destructor(class_perf_ctx_lock_t *_T)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:219:1: warning: unused function 'class_perf_ctx_lock_constructor' [-Wunused-function]
     219 | class_perf_ctx_lock_constructor(struct perf_cpu_context *cpuctx,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +7018 kernel/events/core.c

  6972	
  6973	static int perf_mmap_aux(struct vm_area_struct *vma, struct perf_event *event,
  6974				 unsigned long nr_pages)
  6975	{
  6976		u64 aux_offset, aux_size;
  6977		struct perf_buffer *rb;
  6978		long user_extra, extra;
  6979		int ret, rb_flags = 0;
  6980	
  6981		rb = event->rb;
  6982		if (!rb)
  6983			return -EINVAL;
  6984	
  6985		guard(mutex)(&rb->aux_mutex);
  6986	
  6987		/*
  6988		 * AUX area mapping: if rb->aux_nr_pages != 0, it's already
  6989		 * mapped, all subsequent mappings should have the same size
  6990		 * and offset. Must be above the normal perf buffer.
  6991		 */
  6992		aux_offset = READ_ONCE(rb->user_page->aux_offset);
  6993		aux_size = READ_ONCE(rb->user_page->aux_size);
  6994	
  6995		if (aux_offset < perf_data_size(rb) + PAGE_SIZE)
  6996			return -EINVAL;
  6997	
  6998		if (aux_offset != vma->vm_pgoff << PAGE_SHIFT)
  6999			return -EINVAL;
  7000	
  7001		/* already mapped with a different offset */
  7002		if (rb_has_aux(rb) && rb->aux_pgoff != vma->vm_pgoff)
  7003			return -EINVAL;
  7004	
  7005		if (aux_size != nr_pages * PAGE_SIZE)
  7006			return -EINVAL;
  7007	
  7008		/* already mapped with a different size */
  7009		if (rb_has_aux(rb) && rb->aux_nr_pages != nr_pages)
  7010			return -EINVAL;
  7011	
  7012		if (!is_power_of_2(nr_pages))
  7013			return -EINVAL;
  7014	
  7015		if (!atomic_inc_not_zero(&rb->mmap_count))
  7016			return -EINVAL;
  7017	
> 7018		if (rb_has_aux(rb)) {
  7019			atomic_inc(&rb->aux_mmap_count);
  7020	
  7021		} else {
  7022			if (!perf_mmap_calc_limits(vma, &user_extra, &extra)) {
  7023				atomic_dec(&rb->mmap_count);
  7024				return -EPERM;
  7025			}
  7026	
  7027			WARN_ON(!rb && event->rb);
  7028	
  7029			if (vma->vm_flags & VM_WRITE)
  7030				rb_flags |= RING_BUFFER_WRITABLE;
  7031	
  7032			ret = rb_alloc_aux(rb, event, vma->vm_pgoff, nr_pages,
  7033					   event->attr.aux_watermark, rb_flags);
  7034			if (ret) {
  7035				atomic_dec(&rb->mmap_count);
  7036				return ret;
  7037			}
  7038	
  7039			atomic_set(&rb->aux_mmap_count, 1);
  7040			rb->aux_mmap_locked = extra;
  7041		}
  7042	
  7043		perf_mmap_account(vma, user_extra, extra);
  7044		atomic_inc(&event->mmap_count);
  7045	
  7046		return 0;
  7047	}
  7048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
