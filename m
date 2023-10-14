Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAFDEA9;
	Sat, 14 Oct 2023 03:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dd01PM1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697255631; x=1728791631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kSFA3iOgoWksDIVJtFA25ooz821s6wDFX5zgHW8xZ+8=;
  b=dd01PM1uj5x5xqL8y0HAQw9AJz7sTjJto2x0TSoEDEnCuRvvGf35YVRJ
   it/eWen55c3p5RjgRsiggs6HA/LrzjDNLr3nsF1whdRRrGuTrX5xv8mUO
   0XAGlP3lFK/o7SiPDjBzVHyuFr078UQvuXbjYzlUSFHr+y37+g+aU3Jxo
   b2Mq+ZZoNXE2hp7pfDAEFpUgYg/w0JlrXrHWwEAMRbPsIrvOTXDMoqPa0
   6RfNZ4sEi5xS/sPV1YIP0B3oszQwYjJVeJhRFtlJQ3fIVa+6sHnhyE4Ps
   pW/aILMi0G9WN+5AzRT+JtFiNOGLGvQVcWe/LV3QM5t2FP5BrPByD32kL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471531315"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471531315"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 20:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="790082633"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="790082633"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 20:53:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrVij-0005fz-1r;
	Sat, 14 Oct 2023 03:53:45 +0000
Date: Sat, 14 Oct 2023 11:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 33/38]
 kernel/events/core.c:6374:15: warning: variable 'flags' set but not used
Message-ID: <202310141148.ZLbvbBSG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   c2191d1bd425905e3a6439c28449222848e9ecde
commit: 028231d5f2c4db12a43a4c54c45622bb547975be [33/38] WIP: perf: support mmapping event on noMMU
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231014/202310141148.ZLbvbBSG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141148.ZLbvbBSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141148.ZLbvbBSG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:6374:15: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
           int ret = 0, flags = 0;
                        ^
>> kernel/events/core.c:6583:15: warning: no previous prototype for function 'perf_get_unmapped_area' [-Wmissing-prototypes]
   unsigned long perf_get_unmapped_area(struct file *file,
                 ^
   kernel/events/core.c:6583:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long perf_get_unmapped_area(struct file *file,
   ^
   static 
   kernel/events/core.c:6639:17: warning: unused function 'perf_mmap_capabilities' [-Wunused-function]
   static unsigned perf_mmap_capabilities(struct file *file)
                   ^
   3 warnings generated.


vim +/flags +6374 kernel/events/core.c

37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6363  
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6364  static int perf_mmap(struct file *file, struct vm_area_struct *vma)
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6365  {
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6366  	struct perf_event *event = file->private_data;
22a4f650d686ee kernel/perf_counter.c Ingo Molnar             2009-06-01  6367  	unsigned long user_locked, user_lock_limit;
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6368  	struct user_struct *user = current_user();
56de4e8f914668 kernel/events/core.c  Steven Rostedt (VMware  2019-12-13  6369) 	struct perf_buffer *rb = NULL;
22a4f650d686ee kernel/perf_counter.c Ingo Molnar             2009-06-01  6370  	unsigned long locked, lock_limit;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6371  	unsigned long vma_size;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6372  	unsigned long nr_pages;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6373  	long user_extra = 0, extra = 0;
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28 @6374  	int ret = 0, flags = 0;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6375  
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6376  	/*
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6377  	 * Don't allow mmap() of inherited per-task counters. This would
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6378  	 * create a performance issue due to all children writing to the
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6379  	 * same rb.
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6380  	 */
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6381  	if (event->cpu == -1 && event->attr.inherit)
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6382  		return -EINVAL;
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6383  
43a21ea81a2400 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6384  	if (!(vma->vm_flags & VM_SHARED))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6385  		return -EINVAL;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6386  
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6387) 	ret = security_perf_event_read(event);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6388) 	if (ret)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6389) 		return ret;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6390) 
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6391  	vma_size = vma->vm_end - vma->vm_start;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6392  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6393  	if (vma->vm_pgoff == 0) {
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6394  		nr_pages = (vma_size / PAGE_SIZE) - 1;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6395  	} else {
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6396  		/*
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6397  		 * AUX area mapping: if rb->aux_nr_pages != 0, it's already
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6398  		 * mapped, all subsequent mappings should have the same size
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6399  		 * and offset. Must be above the normal perf buffer.
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6400  		 */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6401  		u64 aux_offset, aux_size;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6402  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6403  		if (!event->rb)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6404  			return -EINVAL;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6405  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6406  		nr_pages = vma_size / PAGE_SIZE;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6407  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6408  		mutex_lock(&event->mmap_mutex);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6409  		ret = -EINVAL;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6410  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6411  		rb = event->rb;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6412  		if (!rb)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6413  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6414  
6aa7de059173a9 kernel/events/core.c  Mark Rutland            2017-10-23  6415  		aux_offset = READ_ONCE(rb->user_page->aux_offset);
6aa7de059173a9 kernel/events/core.c  Mark Rutland            2017-10-23  6416  		aux_size = READ_ONCE(rb->user_page->aux_size);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6417  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6418  		if (aux_offset < perf_data_size(rb) + PAGE_SIZE)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6419  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6420  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6421  		if (aux_offset != vma->vm_pgoff << PAGE_SHIFT)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6422  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6423  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6424  		/* already mapped with a different offset */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6425  		if (rb_has_aux(rb) && rb->aux_pgoff != vma->vm_pgoff)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6426  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6427  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6428  		if (aux_size != vma_size || aux_size != nr_pages * PAGE_SIZE)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6429  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6430  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6431  		/* already mapped with a different size */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6432  		if (rb_has_aux(rb) && rb->aux_nr_pages != nr_pages)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6433  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6434  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6435  		if (!is_power_of_2(nr_pages))
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6436  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6437  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6438  		if (!atomic_inc_not_zero(&rb->mmap_count))
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6439  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6440  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6441  		if (rb_has_aux(rb)) {
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6442  			atomic_inc(&rb->aux_mmap_count);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6443  			ret = 0;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6444  			goto unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6445  		}
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6446  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6447  		atomic_set(&rb->aux_mmap_count, 1);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6448  		user_extra = nr_pages;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6449  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6450  		goto accounting;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6451  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6452  
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6453  	/*
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6454  	 * If we have rb pages ensure they're a power-of-two number, so we
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6455  	 * can do bitmasks instead of modulo.
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6456  	 */
2ed11312eb1950 kernel/events/core.c  Kan Liang               2015-03-02  6457  	if (nr_pages != 0 && !is_power_of_2(nr_pages))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6458  		return -EINVAL;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6459  
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6460  	if (vma_size != PAGE_SIZE * (1 + nr_pages))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6461  		return -EINVAL;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6462  
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6463  	WARN_ON_ONCE(event->ctx->parent_ctx);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6464  again:
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6465  	mutex_lock(&event->mmap_mutex);
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6466  	if (event->rb) {
60490e7966659b kernel/events/core.c  Zhipeng Xie             2022-02-09  6467  		if (data_page_nr(event->rb) != nr_pages) {
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6468  			ret = -EINVAL;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6469  			goto unlock;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6470  		}
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6471  
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6472  		if (!atomic_inc_not_zero(&event->rb->mmap_count)) {
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6473  			/*
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6474  			 * Raced against perf_mmap_close(); remove the
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6475  			 * event and try again.
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6476  			 */
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6477  			ring_buffer_attach(event, NULL);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6478  			mutex_unlock(&event->mmap_mutex);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6479  			goto again;
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6480  		}
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6481  
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6482  		goto unlock;
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6483  	}
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6484  
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6485  	user_extra = nr_pages + 1;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6486  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6487  accounting:
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6488  	user_lock_limit = sysctl_perf_event_mlock >> (PAGE_SHIFT - 10);
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6489  
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6490  	/*
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6491  	 * Increase the limit linearly with more CPUs:
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6492  	 */
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6493  	user_lock_limit *= num_online_cpus();
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6494  
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6495  	user_locked = atomic_long_read(&user->locked_vm);
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6496  
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6497  	/*
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6498  	 * sysctl_perf_event_mlock may have changed, so that
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6499  	 *     user->locked_vm > user_lock_limit
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6500  	 */
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6501  	if (user_locked > user_lock_limit)
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6502  		user_locked = user_lock_limit;
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6503  	user_locked += user_extra;
c5078f78b455fb kernel/perf_counter.c Peter Zijlstra          2009-05-05  6504  
c4b75479741c9c kernel/events/core.c  Alexander Shishkin      2019-11-20  6505  	if (user_locked > user_lock_limit) {
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6506  		/*
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6507  		 * charge locked_vm until it hits user_lock_limit;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6508  		 * charge the rest from pinned_vm
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6509  		 */
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6510  		extra = user_locked - user_lock_limit;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6511  		user_extra -= extra;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6512  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6513  
78d7d407b62a02 kernel/perf_event.c   Jiri Slaby              2010-03-05  6514  	lock_limit = rlimit(RLIMIT_MEMLOCK);
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6515  	lock_limit >>= PAGE_SHIFT;
70f8a3ca68d3e1 kernel/events/core.c  Davidlohr Bueso         2019-02-06  6516  	locked = atomic64_read(&vma->vm_mm->pinned_vm) + extra;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6517  
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6518) 	if ((locked > lock_limit) && perf_is_paranoid() &&
459ec28ab404d7 kernel/perf_counter.c Ingo Molnar             2009-09-13  6519  		!capable(CAP_IPC_LOCK)) {
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6520  		ret = -EPERM;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6521  		goto unlock;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6522  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6523  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6524  	WARN_ON(!rb && event->rb);
906010b2134e14 kernel/perf_event.c   Peter Zijlstra          2009-09-21  6525  
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28  6526  	if (vma->vm_flags & VM_WRITE)
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6527  		flags |= RING_BUFFER_WRITABLE;
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28  6528  

:::::: The code at line 6374 was first introduced by commit
:::::: d57e34fdd60be7ffd0b1d86bfa1a553df86b7172 perf: Simplify the ring-buffer logic: make perf_buffer_alloc() do everything needed

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
