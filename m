Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A91C2A1CF;
	Mon,  3 Feb 2025 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738582313; cv=none; b=lXDy21oV89a7joFE/Gw/PGRqSsj6XJuy1pEnAR1O0FRe9jRIUeumBut9QFbRWFzxBg4g0cJc/6xAsJMEWe3BFMECIrDBArvXFJqQxea8o1/FjhkqZE7AEhxNb7E/x+Yfe+kxYpoSZlKAH0Rsrvv6I7y7x3oR81Utq2UhOgz3BwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738582313; c=relaxed/simple;
	bh=mQSyYAE5CDgx6x9Uk1QBq6kGIqHddm96FcS+wwOmmJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QwkZKpYvgwuN4XM6OnFjLkQ5LaPM2z7yFFd5oXJrqxUFGKkH8JIWY8XTaW4t94Ji2bSdOpHIaxdwPxROZXd2krPmxcr4xxmCbEVVG34cg3Z45xcQeFL56ceq2+nP6ZNDWPskirErE78eGqy0Ka8T4g4QdLWb8NkxyDMcA/SR9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjMqhQeM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjMqhQeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738582310; x=1770118310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mQSyYAE5CDgx6x9Uk1QBq6kGIqHddm96FcS+wwOmmJ4=;
  b=kjMqhQeMDVf9Dn5TK61nuYLQbCiFOlCgv8zlUJcFEJbL0kmER5hvMQo/
   cr5GzqbZOzlHpKbNBX8NbycmI8bVy8sWgm36u4gBk3tv4hBgzTNxwhGHU
   4kJCAfk1WmBE9dPdYct6LXhjxY5asBBLAUPBdIoVLTCj1TyFz5aLmwiO4
   XzS5Q6BAb0Ai2xhs0h9RGNj5ri4YDjL/1Xa6axoiWxOQm7ErKN3jeigwZ
   tgEhATqGaxtZkiAquyZjh/JXi2yde3M6CztL6hplONB5bIUBDpsrPtVaZ
   GVxhWAz/RtZziqCbWeGU0xsyf150oPiZ7mSta9ITBsmTXBUmnmhEQo7qb
   g==;
X-CSE-ConnectionGUID: COhM8l8+RUagnxdru3TFlQ==
X-CSE-MsgGUID: 6Wde8n4vSF2g4V5iupc5lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42992559"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42992559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 03:31:13 -0800
X-CSE-ConnectionGUID: R2O5UoklRQyDoLISLuinUg==
X-CSE-MsgGUID: af+uuzdvRYy2kuKr8xATnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110092845"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2025 03:31:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teufV-000qqU-2y;
	Mon, 03 Feb 2025 11:31:09 +0000
Date: Mon, 3 Feb 2025 19:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 50/53]
 kernel/events/core.c:6572:15: warning: variable 'flags' set but not used
Message-ID: <202502031928.lunYwouc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 88bd9eae01160b8518176ec8020990780152c0d6 [50/53] WIP: perf: support mmapping event on noMMU
config: i386-buildonly-randconfig-003-20250203 (https://download.01.org/0day-ci/archive/20250203/202502031928.lunYwouc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031928.lunYwouc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031928.lunYwouc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:6572:15: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    6572 |         int ret = 0, flags = 0;
         |                      ^
>> kernel/events/core.c:6788:15: warning: no previous prototype for function 'perf_get_unmapped_area' [-Wmissing-prototypes]
    6788 | unsigned long perf_get_unmapped_area(struct file *file,
         |               ^
   kernel/events/core.c:6788:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6788 | unsigned long perf_get_unmapped_area(struct file *file,
         | ^
         | static 
   kernel/events/core.c:6844:17: warning: unused function 'perf_mmap_capabilities' [-Wunused-function]
    6844 | static unsigned perf_mmap_capabilities(struct file *file)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/flags +6572 kernel/events/core.c

37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6560  
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6561  static int perf_mmap(struct file *file, struct vm_area_struct *vma)
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6562  {
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6563  	struct perf_event *event = file->private_data;
22a4f650d686ee kernel/perf_counter.c Ingo Molnar             2009-06-01  6564  	unsigned long user_locked, user_lock_limit;
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6565  	struct user_struct *user = current_user();
2ab9d830262c13 kernel/events/core.c  Peter Zijlstra          2024-09-02  6566  	struct mutex *aux_mutex = NULL;
56de4e8f914668 kernel/events/core.c  Steven Rostedt (VMware  2019-12-13  6567) 	struct perf_buffer *rb = NULL;
22a4f650d686ee kernel/perf_counter.c Ingo Molnar             2009-06-01  6568  	unsigned long locked, lock_limit;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6569  	unsigned long vma_size;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6570  	unsigned long nr_pages;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6571  	long user_extra = 0, extra = 0;
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28 @6572  	int ret = 0, flags = 0;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6573  
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6574  	/*
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6575  	 * Don't allow mmap() of inherited per-task counters. This would
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6576  	 * create a performance issue due to all children writing to the
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6577  	 * same rb.
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6578  	 */
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6579  	if (event->cpu == -1 && event->attr.inherit)
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6580  		return -EINVAL;
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6581  
43a21ea81a2400 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6582  	if (!(vma->vm_flags & VM_SHARED))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6583  		return -EINVAL;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6584  
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6585) 	ret = security_perf_event_read(event);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6586) 	if (ret)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6587) 		return ret;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6588) 
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6589  	vma_size = vma->vm_end - vma->vm_start;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6590  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6591  	if (vma->vm_pgoff == 0) {
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6592  		nr_pages = (vma_size / PAGE_SIZE) - 1;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6593  	} else {
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6594  		/*
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6595  		 * AUX area mapping: if rb->aux_nr_pages != 0, it's already
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6596  		 * mapped, all subsequent mappings should have the same size
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6597  		 * and offset. Must be above the normal perf buffer.
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6598  		 */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6599  		u64 aux_offset, aux_size;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6600  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6601  		if (!event->rb)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6602  			return -EINVAL;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6603  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6604  		nr_pages = vma_size / PAGE_SIZE;
dbc48c8f41c208 kernel/events/core.c  Adrian Hunter           2024-06-24  6605  		if (nr_pages > INT_MAX)
dbc48c8f41c208 kernel/events/core.c  Adrian Hunter           2024-06-24  6606  			return -ENOMEM;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6607  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6608  		mutex_lock(&event->mmap_mutex);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6609  		ret = -EINVAL;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6610  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6611  		rb = event->rb;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6612  		if (!rb)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6613  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6614  
2ab9d830262c13 kernel/events/core.c  Peter Zijlstra          2024-09-02  6615  		aux_mutex = &rb->aux_mutex;
2ab9d830262c13 kernel/events/core.c  Peter Zijlstra          2024-09-02  6616  		mutex_lock(aux_mutex);
2ab9d830262c13 kernel/events/core.c  Peter Zijlstra          2024-09-02  6617  
6aa7de059173a9 kernel/events/core.c  Mark Rutland            2017-10-23  6618  		aux_offset = READ_ONCE(rb->user_page->aux_offset);
6aa7de059173a9 kernel/events/core.c  Mark Rutland            2017-10-23  6619  		aux_size = READ_ONCE(rb->user_page->aux_size);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6620  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6621  		if (aux_offset < perf_data_size(rb) + PAGE_SIZE)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6622  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6623  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6624  		if (aux_offset != vma->vm_pgoff << PAGE_SHIFT)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6625  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6626  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6627  		/* already mapped with a different offset */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6628  		if (rb_has_aux(rb) && rb->aux_pgoff != vma->vm_pgoff)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6629  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6630  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6631  		if (aux_size != vma_size || aux_size != nr_pages * PAGE_SIZE)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6632  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6633  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6634  		/* already mapped with a different size */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6635  		if (rb_has_aux(rb) && rb->aux_nr_pages != nr_pages)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6636  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6637  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6638  		if (!is_power_of_2(nr_pages))
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6639  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6640  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6641  		if (!atomic_inc_not_zero(&rb->mmap_count))
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6642  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6643  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6644  		if (rb_has_aux(rb)) {
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6645  			atomic_inc(&rb->aux_mmap_count);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6646  			ret = 0;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6647  			goto unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6648  		}
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6649  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6650  		atomic_set(&rb->aux_mmap_count, 1);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6651  		user_extra = nr_pages;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6652  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6653  		goto accounting;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6654  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6655  
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6656  	/*
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6657  	 * If we have rb pages ensure they're a power-of-two number, so we
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6658  	 * can do bitmasks instead of modulo.
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6659  	 */
2ed11312eb1950 kernel/events/core.c  Kan Liang               2015-03-02  6660  	if (nr_pages != 0 && !is_power_of_2(nr_pages))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6661  		return -EINVAL;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6662  
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6663  	if (vma_size != PAGE_SIZE * (1 + nr_pages))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6664  		return -EINVAL;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6665  
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6666  	WARN_ON_ONCE(event->ctx->parent_ctx);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6667  again:
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6668  	mutex_lock(&event->mmap_mutex);
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6669  	if (event->rb) {
60490e7966659b kernel/events/core.c  Zhipeng Xie             2022-02-09  6670  		if (data_page_nr(event->rb) != nr_pages) {
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6671  			ret = -EINVAL;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6672  			goto unlock;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6673  		}
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6674  
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6675  		if (!atomic_inc_not_zero(&event->rb->mmap_count)) {
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6676  			/*
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6677  			 * Raced against perf_mmap_close(); remove the
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6678  			 * event and try again.
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6679  			 */
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6680  			ring_buffer_attach(event, NULL);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6681  			mutex_unlock(&event->mmap_mutex);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6682  			goto again;
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6683  		}
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6684  
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6685  		goto unlock;
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6686  	}
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6687  
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6688  	user_extra = nr_pages + 1;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6689  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6690  accounting:
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6691  	user_lock_limit = sysctl_perf_event_mlock >> (PAGE_SHIFT - 10);
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6692  
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6693  	/*
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6694  	 * Increase the limit linearly with more CPUs:
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6695  	 */
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6696  	user_lock_limit *= num_online_cpus();
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6697  
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6698  	user_locked = atomic_long_read(&user->locked_vm);
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6699  
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6700  	/*
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6701  	 * sysctl_perf_event_mlock may have changed, so that
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6702  	 *     user->locked_vm > user_lock_limit
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6703  	 */
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6704  	if (user_locked > user_lock_limit)
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6705  		user_locked = user_lock_limit;
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6706  	user_locked += user_extra;
c5078f78b455fb kernel/perf_counter.c Peter Zijlstra          2009-05-05  6707  
c4b75479741c9c kernel/events/core.c  Alexander Shishkin      2019-11-20  6708  	if (user_locked > user_lock_limit) {
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6709  		/*
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6710  		 * charge locked_vm until it hits user_lock_limit;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6711  		 * charge the rest from pinned_vm
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6712  		 */
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6713  		extra = user_locked - user_lock_limit;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6714  		user_extra -= extra;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6715  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6716  
78d7d407b62a02 kernel/perf_event.c   Jiri Slaby              2010-03-05  6717  	lock_limit = rlimit(RLIMIT_MEMLOCK);
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6718  	lock_limit >>= PAGE_SHIFT;
70f8a3ca68d3e1 kernel/events/core.c  Davidlohr Bueso         2019-02-06  6719  	locked = atomic64_read(&vma->vm_mm->pinned_vm) + extra;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6720  
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6721) 	if ((locked > lock_limit) && perf_is_paranoid() &&
459ec28ab404d7 kernel/perf_counter.c Ingo Molnar             2009-09-13  6722  		!capable(CAP_IPC_LOCK)) {
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6723  		ret = -EPERM;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6724  		goto unlock;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6725  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6726  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6727  	WARN_ON(!rb && event->rb);
906010b2134e14 kernel/perf_event.c   Peter Zijlstra          2009-09-21  6728  
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28  6729  	if (vma->vm_flags & VM_WRITE)
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6730  		flags |= RING_BUFFER_WRITABLE;
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28  6731  

:::::: The code at line 6572 was first introduced by commit
:::::: d57e34fdd60be7ffd0b1d86bfa1a553df86b7172 perf: Simplify the ring-buffer logic: make perf_buffer_alloc() do everything needed

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
