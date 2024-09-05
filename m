Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766FD188A1F;
	Thu,  5 Sep 2024 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545288; cv=none; b=Dw6MJ/VvfsxO2PfdUNEKZCN89MoAn7oJBEwbn6UvoxhC/dtP+7KjDh+rt2OpGuzAx/hUnXW3jYRK1Q29nsiHUc2vgLTHoWELg9YWvbr2ztho7OJvd4GHMxvbv4QBDcz1C+6+hZ53p+xyfs6piSwd+vjxC7bDkjqOQREGAruvux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545288; c=relaxed/simple;
	bh=SaP2DLtG6QLANpN8FihdRu/xFHhH8ZHMcHCsizv0D0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FJbsheTSWambP+PuqjivFfDqtMnvGrtpRatmcrIpllidMVfUvpB6H47P1F91nGGfSwqPi3tYqaC8puiIv4rsY24sI2pVd88u6YjtMzEzTpP8HlYeK4xTfkBgYhUIEAUOGU6cn7o64uMLlfF6S0+XcaSdTrNXXZPyDWjXX2HKBZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1e4+giY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1e4+giY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725545287; x=1757081287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SaP2DLtG6QLANpN8FihdRu/xFHhH8ZHMcHCsizv0D0w=;
  b=d1e4+giY7ykZ0HP6JJyhALg3c8yo7fftN2fGyBXl4ZWkVNxRzlM4jse4
   Dc/UdD+7o8bORDEXjDTzMyDFTw7NsU9C99eideNYRi1CwiHZulT1f1WSf
   2SWIepSVpzDxljSLwPwQw23ztRT0mzDkqGu0z6xwvt8uOszfavZpj8dUk
   pWM83OjgQ70j3e6fFltY5OCnEUgZKX08geEcBALp6s33OZLAqg5EoO/a5
   vFCCVu3giWrBPyarTOrasUMgqGSCqnSdeChGzZA6iso1pX6SBebu0lYen
   2dDRk4o6el0WhJR4R2v/4tEHpyUW17cQVOidZdAGyqCfMR1JCTcjI3k6U
   A==;
X-CSE-ConnectionGUID: H4OslG3jSNqk2bZQWr/BDw==
X-CSE-MsgGUID: JgZVRWfyR2qldqEGQIAzww==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23819136"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="23819136"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:08:06 -0700
X-CSE-ConnectionGUID: 283INFcvS76+XaiKrYlnAg==
X-CSE-MsgGUID: 4J+hTV8dQEyIFPKEMu4zbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65476453"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Sep 2024 07:08:05 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smD9V-0009yx-31;
	Thu, 05 Sep 2024 14:08:01 +0000
Date: Thu, 5 Sep 2024 22:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 50/53]
 kernel/events/core.c:6491:15: warning: variable 'flags' set but not used
Message-ID: <202409052131.g8vVGvnj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: 32453b48969a9a1bb7026e6035c13ce6e1245455 [50/53] WIP: perf: support mmapping event on noMMU
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240905/202409052131.g8vVGvnj-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409052131.g8vVGvnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409052131.g8vVGvnj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:6491:15: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    6491 |         int ret = 0, flags = 0;
         |                      ^
>> kernel/events/core.c:6702:15: warning: no previous prototype for function 'perf_get_unmapped_area' [-Wmissing-prototypes]
    6702 | unsigned long perf_get_unmapped_area(struct file *file,
         |               ^
   kernel/events/core.c:6702:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6702 | unsigned long perf_get_unmapped_area(struct file *file,
         | ^
         | static 
   kernel/events/core.c:6758:17: warning: unused function 'perf_mmap_capabilities' [-Wunused-function]
    6758 | static unsigned perf_mmap_capabilities(struct file *file)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:9745:19: warning: unused function 'perf_event_set_bpf_handler' [-Wunused-function]
    9745 | static inline int perf_event_set_bpf_handler(struct perf_event *event,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:9752:20: warning: unused function 'perf_event_free_bpf_handler' [-Wunused-function]
    9752 | static inline void perf_event_free_bpf_handler(struct perf_event *event)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/flags +6491 kernel/events/core.c

37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6480  
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6481  static int perf_mmap(struct file *file, struct vm_area_struct *vma)
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6482  {
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6483  	struct perf_event *event = file->private_data;
22a4f650d686ee kernel/perf_counter.c Ingo Molnar             2009-06-01  6484  	unsigned long user_locked, user_lock_limit;
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6485  	struct user_struct *user = current_user();
56de4e8f914668 kernel/events/core.c  Steven Rostedt (VMware  2019-12-13  6486) 	struct perf_buffer *rb = NULL;
22a4f650d686ee kernel/perf_counter.c Ingo Molnar             2009-06-01  6487  	unsigned long locked, lock_limit;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6488  	unsigned long vma_size;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6489  	unsigned long nr_pages;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6490  	long user_extra = 0, extra = 0;
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28 @6491  	int ret = 0, flags = 0;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6492  
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6493  	/*
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6494  	 * Don't allow mmap() of inherited per-task counters. This would
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6495  	 * create a performance issue due to all children writing to the
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6496  	 * same rb.
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6497  	 */
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6498  	if (event->cpu == -1 && event->attr.inherit)
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6499  		return -EINVAL;
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6500  
43a21ea81a2400 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6501  	if (!(vma->vm_flags & VM_SHARED))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6502  		return -EINVAL;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6503  
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6504) 	ret = security_perf_event_read(event);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6505) 	if (ret)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6506) 		return ret;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6507) 
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6508  	vma_size = vma->vm_end - vma->vm_start;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6509  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6510  	if (vma->vm_pgoff == 0) {
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6511  		nr_pages = (vma_size / PAGE_SIZE) - 1;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6512  	} else {
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6513  		/*
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6514  		 * AUX area mapping: if rb->aux_nr_pages != 0, it's already
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6515  		 * mapped, all subsequent mappings should have the same size
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6516  		 * and offset. Must be above the normal perf buffer.
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6517  		 */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6518  		u64 aux_offset, aux_size;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6519  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6520  		if (!event->rb)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6521  			return -EINVAL;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6522  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6523  		nr_pages = vma_size / PAGE_SIZE;
dbc48c8f41c208 kernel/events/core.c  Adrian Hunter           2024-06-24  6524  		if (nr_pages > INT_MAX)
dbc48c8f41c208 kernel/events/core.c  Adrian Hunter           2024-06-24  6525  			return -ENOMEM;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6526  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6527  		mutex_lock(&event->mmap_mutex);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6528  		ret = -EINVAL;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6529  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6530  		rb = event->rb;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6531  		if (!rb)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6532  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6533  
6aa7de059173a9 kernel/events/core.c  Mark Rutland            2017-10-23  6534  		aux_offset = READ_ONCE(rb->user_page->aux_offset);
6aa7de059173a9 kernel/events/core.c  Mark Rutland            2017-10-23  6535  		aux_size = READ_ONCE(rb->user_page->aux_size);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6536  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6537  		if (aux_offset < perf_data_size(rb) + PAGE_SIZE)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6538  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6539  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6540  		if (aux_offset != vma->vm_pgoff << PAGE_SHIFT)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6541  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6542  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6543  		/* already mapped with a different offset */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6544  		if (rb_has_aux(rb) && rb->aux_pgoff != vma->vm_pgoff)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6545  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6546  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6547  		if (aux_size != vma_size || aux_size != nr_pages * PAGE_SIZE)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6548  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6549  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6550  		/* already mapped with a different size */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6551  		if (rb_has_aux(rb) && rb->aux_nr_pages != nr_pages)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6552  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6553  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6554  		if (!is_power_of_2(nr_pages))
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6555  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6556  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6557  		if (!atomic_inc_not_zero(&rb->mmap_count))
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6558  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6559  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6560  		if (rb_has_aux(rb)) {
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6561  			atomic_inc(&rb->aux_mmap_count);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6562  			ret = 0;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6563  			goto unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6564  		}
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6565  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6566  		atomic_set(&rb->aux_mmap_count, 1);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6567  		user_extra = nr_pages;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6568  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6569  		goto accounting;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6570  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6571  
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6572  	/*
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6573  	 * If we have rb pages ensure they're a power-of-two number, so we
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6574  	 * can do bitmasks instead of modulo.
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6575  	 */
2ed11312eb1950 kernel/events/core.c  Kan Liang               2015-03-02  6576  	if (nr_pages != 0 && !is_power_of_2(nr_pages))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6577  		return -EINVAL;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6578  
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6579  	if (vma_size != PAGE_SIZE * (1 + nr_pages))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6580  		return -EINVAL;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6581  
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6582  	WARN_ON_ONCE(event->ctx->parent_ctx);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6583  again:
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6584  	mutex_lock(&event->mmap_mutex);
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6585  	if (event->rb) {
60490e7966659b kernel/events/core.c  Zhipeng Xie             2022-02-09  6586  		if (data_page_nr(event->rb) != nr_pages) {
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6587  			ret = -EINVAL;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6588  			goto unlock;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6589  		}
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6590  
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6591  		if (!atomic_inc_not_zero(&event->rb->mmap_count)) {
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6592  			/*
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6593  			 * Raced against perf_mmap_close(); remove the
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6594  			 * event and try again.
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6595  			 */
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6596  			ring_buffer_attach(event, NULL);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6597  			mutex_unlock(&event->mmap_mutex);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6598  			goto again;
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6599  		}
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6600  
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6601  		goto unlock;
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6602  	}
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6603  
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6604  	user_extra = nr_pages + 1;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6605  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6606  accounting:
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6607  	user_lock_limit = sysctl_perf_event_mlock >> (PAGE_SHIFT - 10);
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6608  
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6609  	/*
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6610  	 * Increase the limit linearly with more CPUs:
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6611  	 */
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6612  	user_lock_limit *= num_online_cpus();
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6613  
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6614  	user_locked = atomic_long_read(&user->locked_vm);
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6615  
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6616  	/*
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6617  	 * sysctl_perf_event_mlock may have changed, so that
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6618  	 *     user->locked_vm > user_lock_limit
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6619  	 */
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6620  	if (user_locked > user_lock_limit)
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6621  		user_locked = user_lock_limit;
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6622  	user_locked += user_extra;
c5078f78b455fb kernel/perf_counter.c Peter Zijlstra          2009-05-05  6623  
c4b75479741c9c kernel/events/core.c  Alexander Shishkin      2019-11-20  6624  	if (user_locked > user_lock_limit) {
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6625  		/*
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6626  		 * charge locked_vm until it hits user_lock_limit;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6627  		 * charge the rest from pinned_vm
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6628  		 */
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6629  		extra = user_locked - user_lock_limit;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6630  		user_extra -= extra;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6631  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6632  
78d7d407b62a02 kernel/perf_event.c   Jiri Slaby              2010-03-05  6633  	lock_limit = rlimit(RLIMIT_MEMLOCK);
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6634  	lock_limit >>= PAGE_SHIFT;
70f8a3ca68d3e1 kernel/events/core.c  Davidlohr Bueso         2019-02-06  6635  	locked = atomic64_read(&vma->vm_mm->pinned_vm) + extra;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6636  
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6637) 	if ((locked > lock_limit) && perf_is_paranoid() &&
459ec28ab404d7 kernel/perf_counter.c Ingo Molnar             2009-09-13  6638  		!capable(CAP_IPC_LOCK)) {
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6639  		ret = -EPERM;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6640  		goto unlock;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6641  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6642  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6643  	WARN_ON(!rb && event->rb);
906010b2134e14 kernel/perf_event.c   Peter Zijlstra          2009-09-21  6644  
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28  6645  	if (vma->vm_flags & VM_WRITE)
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6646  		flags |= RING_BUFFER_WRITABLE;
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28  6647  

:::::: The code at line 6491 was first introduced by commit
:::::: d57e34fdd60be7ffd0b1d86bfa1a553df86b7172 perf: Simplify the ring-buffer logic: make perf_buffer_alloc() do everything needed

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
