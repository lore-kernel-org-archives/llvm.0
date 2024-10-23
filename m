Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244931A0AF1;
	Wed, 23 Oct 2024 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677348; cv=none; b=Je20Z33NxBrh9/ZE7i59TMYUWqR+qV7WSTE1+w5NmqOtS23Tni5Owq+hTfMaDfPXtZ7DzsB0OBkipEF995PcXjml5ekwNtEz8SZsOTHhjVnC6cSgurbWHFf5Z4CM4ltmNRrR8hhTIqLpZSs1x+c+hjIXOqoF+uCMtbQ8Lugj2wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677348; c=relaxed/simple;
	bh=8nJT2Vi2aPwTYWaqeGP38ZyTQ1UGqTBIrxSnAW3FT/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrh2hPBZoW32zDFI6vWgSgEBB99gUVNh4UhIBXEgfgr5wsqaS1jwRkZzTq4Lp5fbLRqjMW+CzWJ+s+Ns0Vbu+i4Q6aDqH6vYtdWqZHl1+cmiqdmUDQFTqB8F3pl0IOBU9g8+fKIQ+TZHFW0iO29fLGHswc/hV7I27rG+ZlJCBtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyh/lsO+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyh/lsO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729677346; x=1761213346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8nJT2Vi2aPwTYWaqeGP38ZyTQ1UGqTBIrxSnAW3FT/w=;
  b=kyh/lsO+braE1NGdgLJFie3mOzwOh4yzKvGmXLNSzMJ0GJNMLAly9bSf
   RocN3/drV8OnWG0UvLiSwkQ3EYDmOW94vY4YoS8THRkn79mHDrSAQlaEY
   PB3Yf1IjOLtQuOs680TAoxCdH2nwZg24nPJ4NKHyDCfyQOCBy0T0TIC5d
   Z5iWCvYLOJABaXASqnLRt9eqz66+IJXVlSJkAAOEOZq7RpqhiIv7nbMGy
   yx7XlMlV9LgC1tinOrvuJOtzwDIXOgIAGf3o3m2F3Fwqc7//C05TqW9mH
   QARYLhWQpfrRurSXMqltZ8m5KLUUuAinI0Q90FNCd/6quqUVvepYioo92
   w==;
X-CSE-ConnectionGUID: FvnETj+gTgaqYG5ssQiR+w==
X-CSE-MsgGUID: f2KcBAkGRXSiE65oLosnmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29036137"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29036137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 02:55:46 -0700
X-CSE-ConnectionGUID: peiPcwBCQ2CGYzDPh13eXg==
X-CSE-MsgGUID: 1H6X1Oq9T9KAlRXGupze/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="79819787"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Oct 2024 02:55:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Y5d-000UlO-23;
	Wed, 23 Oct 2024 09:55:41 +0000
Date: Wed, 23 Oct 2024 17:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-esp32 50/53]
 kernel/events/core.c:6492:15: warning: variable 'flags' set but not used
Message-ID: <202410231726.jdjpxZSU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-esp32
head:   3b01ad2a1f71b72b27fefa08e4bf6acbe1de874f
commit: 45c61e979c95928370efa03921af750bcc394f18 [50/53] WIP: perf: support mmapping event on noMMU
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410231726.jdjpxZSU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231726.jdjpxZSU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231726.jdjpxZSU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:6492:15: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    6492 |         int ret = 0, flags = 0;
         |                      ^
>> kernel/events/core.c:6708:15: warning: no previous prototype for function 'perf_get_unmapped_area' [-Wmissing-prototypes]
    6708 | unsigned long perf_get_unmapped_area(struct file *file,
         |               ^
   kernel/events/core.c:6708:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6708 | unsigned long perf_get_unmapped_area(struct file *file,
         | ^
         | static 
   kernel/events/core.c:6764:17: warning: unused function 'perf_mmap_capabilities' [-Wunused-function]
    6764 | static unsigned perf_mmap_capabilities(struct file *file)
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +/flags +6492 kernel/events/core.c

37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6480  
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6481  static int perf_mmap(struct file *file, struct vm_area_struct *vma)
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6482  {
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6483  	struct perf_event *event = file->private_data;
22a4f650d686ee kernel/perf_counter.c Ingo Molnar             2009-06-01  6484  	unsigned long user_locked, user_lock_limit;
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6485  	struct user_struct *user = current_user();
2ab9d830262c13 kernel/events/core.c  Peter Zijlstra          2024-09-02  6486  	struct mutex *aux_mutex = NULL;
56de4e8f914668 kernel/events/core.c  Steven Rostedt (VMware  2019-12-13  6487) 	struct perf_buffer *rb = NULL;
22a4f650d686ee kernel/perf_counter.c Ingo Molnar             2009-06-01  6488  	unsigned long locked, lock_limit;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6489  	unsigned long vma_size;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6490  	unsigned long nr_pages;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6491  	long user_extra = 0, extra = 0;
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28 @6492  	int ret = 0, flags = 0;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6493  
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6494  	/*
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6495  	 * Don't allow mmap() of inherited per-task counters. This would
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6496  	 * create a performance issue due to all children writing to the
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6497  	 * same rb.
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6498  	 */
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6499  	if (event->cpu == -1 && event->attr.inherit)
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6500  		return -EINVAL;
c7920614cebbf2 kernel/perf_event.c   Peter Zijlstra          2010-05-18  6501  
43a21ea81a2400 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6502  	if (!(vma->vm_flags & VM_SHARED))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6503  		return -EINVAL;
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6504  
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6505) 	ret = security_perf_event_read(event);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6506) 	if (ret)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6507) 		return ret;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6508) 
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6509  	vma_size = vma->vm_end - vma->vm_start;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6510  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6511  	if (vma->vm_pgoff == 0) {
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6512  		nr_pages = (vma_size / PAGE_SIZE) - 1;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6513  	} else {
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6514  		/*
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6515  		 * AUX area mapping: if rb->aux_nr_pages != 0, it's already
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6516  		 * mapped, all subsequent mappings should have the same size
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6517  		 * and offset. Must be above the normal perf buffer.
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6518  		 */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6519  		u64 aux_offset, aux_size;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6520  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6521  		if (!event->rb)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6522  			return -EINVAL;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6523  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6524  		nr_pages = vma_size / PAGE_SIZE;
dbc48c8f41c208 kernel/events/core.c  Adrian Hunter           2024-06-24  6525  		if (nr_pages > INT_MAX)
dbc48c8f41c208 kernel/events/core.c  Adrian Hunter           2024-06-24  6526  			return -ENOMEM;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6527  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6528  		mutex_lock(&event->mmap_mutex);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6529  		ret = -EINVAL;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6530  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6531  		rb = event->rb;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6532  		if (!rb)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6533  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6534  
2ab9d830262c13 kernel/events/core.c  Peter Zijlstra          2024-09-02  6535  		aux_mutex = &rb->aux_mutex;
2ab9d830262c13 kernel/events/core.c  Peter Zijlstra          2024-09-02  6536  		mutex_lock(aux_mutex);
2ab9d830262c13 kernel/events/core.c  Peter Zijlstra          2024-09-02  6537  
6aa7de059173a9 kernel/events/core.c  Mark Rutland            2017-10-23  6538  		aux_offset = READ_ONCE(rb->user_page->aux_offset);
6aa7de059173a9 kernel/events/core.c  Mark Rutland            2017-10-23  6539  		aux_size = READ_ONCE(rb->user_page->aux_size);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6540  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6541  		if (aux_offset < perf_data_size(rb) + PAGE_SIZE)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6542  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6543  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6544  		if (aux_offset != vma->vm_pgoff << PAGE_SHIFT)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6545  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6546  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6547  		/* already mapped with a different offset */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6548  		if (rb_has_aux(rb) && rb->aux_pgoff != vma->vm_pgoff)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6549  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6550  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6551  		if (aux_size != vma_size || aux_size != nr_pages * PAGE_SIZE)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6552  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6553  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6554  		/* already mapped with a different size */
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6555  		if (rb_has_aux(rb) && rb->aux_nr_pages != nr_pages)
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6556  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6557  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6558  		if (!is_power_of_2(nr_pages))
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6559  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6560  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6561  		if (!atomic_inc_not_zero(&rb->mmap_count))
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6562  			goto aux_unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6563  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6564  		if (rb_has_aux(rb)) {
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6565  			atomic_inc(&rb->aux_mmap_count);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6566  			ret = 0;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6567  			goto unlock;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6568  		}
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6569  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6570  		atomic_set(&rb->aux_mmap_count, 1);
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6571  		user_extra = nr_pages;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6572  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6573  		goto accounting;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6574  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6575  
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6576  	/*
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6577  	 * If we have rb pages ensure they're a power-of-two number, so we
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6578  	 * can do bitmasks instead of modulo.
7730d8655880f4 kernel/perf_counter.c Peter Zijlstra          2009-03-25  6579  	 */
2ed11312eb1950 kernel/events/core.c  Kan Liang               2015-03-02  6580  	if (nr_pages != 0 && !is_power_of_2(nr_pages))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6581  		return -EINVAL;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6582  
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6583  	if (vma_size != PAGE_SIZE * (1 + nr_pages))
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6584  		return -EINVAL;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6585  
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6586  	WARN_ON_ONCE(event->ctx->parent_ctx);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6587  again:
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6588  	mutex_lock(&event->mmap_mutex);
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6589  	if (event->rb) {
60490e7966659b kernel/events/core.c  Zhipeng Xie             2022-02-09  6590  		if (data_page_nr(event->rb) != nr_pages) {
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6591  			ret = -EINVAL;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6592  			goto unlock;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6593  		}
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6594  
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6595  		if (!atomic_inc_not_zero(&event->rb->mmap_count)) {
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6596  			/*
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6597  			 * Raced against perf_mmap_close(); remove the
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6598  			 * event and try again.
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6599  			 */
68e3c69803dada kernel/events/core.c  Peter Zijlstra          2022-07-05  6600  			ring_buffer_attach(event, NULL);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6601  			mutex_unlock(&event->mmap_mutex);
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6602  			goto again;
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6603  		}
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6604  
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6605  		goto unlock;
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6606  	}
9bb5d40cd93c9d kernel/events/core.c  Peter Zijlstra          2013-06-04  6607  
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6608  	user_extra = nr_pages + 1;
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6609  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6610  accounting:
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  6611  	user_lock_limit = sysctl_perf_event_mlock >> (PAGE_SHIFT - 10);
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6612  
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6613  	/*
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6614  	 * Increase the limit linearly with more CPUs:
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6615  	 */
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6616  	user_lock_limit *= num_online_cpus();
a3862d3f814ce7 kernel/perf_counter.c Ingo Molnar             2009-05-24  6617  
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6618  	user_locked = atomic_long_read(&user->locked_vm);
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6619  
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6620  	/*
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6621  	 * sysctl_perf_event_mlock may have changed, so that
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6622  	 *     user->locked_vm > user_lock_limit
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6623  	 */
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6624  	if (user_locked > user_lock_limit)
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6625  		user_locked = user_lock_limit;
003461559ef7a9 kernel/events/core.c  Song Liu                2020-01-23  6626  	user_locked += user_extra;
c5078f78b455fb kernel/perf_counter.c Peter Zijlstra          2009-05-05  6627  
c4b75479741c9c kernel/events/core.c  Alexander Shishkin      2019-11-20  6628  	if (user_locked > user_lock_limit) {
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6629  		/*
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6630  		 * charge locked_vm until it hits user_lock_limit;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6631  		 * charge the rest from pinned_vm
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6632  		 */
789f90fcf6b0b5 kernel/perf_counter.c Peter Zijlstra          2009-05-15  6633  		extra = user_locked - user_lock_limit;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6634  		user_extra -= extra;
d44248a4133773 kernel/events/core.c  Song Liu                2019-09-04  6635  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6636  
78d7d407b62a02 kernel/perf_event.c   Jiri Slaby              2010-03-05  6637  	lock_limit = rlimit(RLIMIT_MEMLOCK);
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6638  	lock_limit >>= PAGE_SHIFT;
70f8a3ca68d3e1 kernel/events/core.c  Davidlohr Bueso         2019-02-06  6639  	locked = atomic64_read(&vma->vm_mm->pinned_vm) + extra;
37d81828385f8f kernel/perf_counter.c Paul Mackerras          2009-03-23  6640  
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  6641) 	if ((locked > lock_limit) && perf_is_paranoid() &&
459ec28ab404d7 kernel/perf_counter.c Ingo Molnar             2009-09-13  6642  		!capable(CAP_IPC_LOCK)) {
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6643  		ret = -EPERM;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6644  		goto unlock;
ebb3c4c4cb81d6 kernel/perf_counter.c Peter Zijlstra          2009-04-06  6645  	}
7b732a75047738 kernel/perf_counter.c Peter Zijlstra          2009-03-23  6646  
45bfb2e50471ab kernel/events/core.c  Peter Zijlstra          2015-01-14  6647  	WARN_ON(!rb && event->rb);
906010b2134e14 kernel/perf_event.c   Peter Zijlstra          2009-09-21  6648  
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28  6649  	if (vma->vm_flags & VM_WRITE)
76369139ceb955 kernel/events/core.c  Frederic Weisbecker     2011-05-19  6650  		flags |= RING_BUFFER_WRITABLE;
d57e34fdd60be7 kernel/perf_event.c   Peter Zijlstra          2010-05-28  6651  

:::::: The code at line 6492 was first introduced by commit
:::::: d57e34fdd60be7ffd0b1d86bfa1a553df86b7172 perf: Simplify the ring-buffer logic: make perf_buffer_alloc() do everything needed

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
