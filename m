Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E2366;
	Tue, 29 Aug 2023 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693269635; x=1724805635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/Wg5ruRLRRxsdqqSlDecDcufdVNMEZpzXBlIW2kQIE=;
  b=UIk+1ndTN6XyJ0X1JUgatq07BEPRF6V5nrUx5N8Yxb7CrJ4tpMUKMIo/
   KH3Zen7DoCykzAShWmkHNsIqeVbWMcds/KPq5MqOQWc/fIZHiZEpvRftS
   BIbZsML3S+0kKpRLm3xGA7H7BO9IMVeOfeii7O/8P5IoX6qnwjaDcNZKo
   UVeVje52MbSszOJTnX+ma3tpE87GHxp4/Yh8bRJM70+qMCtV4GD2UWLNd
   8hmuvfWDQRyEcyl+WnxlEfYrH5SPQRveDrOj7H4ONn3MWf+rebdHewG+O
   MvbQ/Fb6Ejsz2WQ2k1QVybbEdudeQZtBIfXVTP+J6A6XQXFb/ZvfAtCvO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365449538"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="365449538"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 17:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738475849"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="738475849"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2023 17:40:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qammW-0008Er-0R;
	Tue, 29 Aug 2023 00:40:32 +0000
Date: Tue, 29 Aug 2023 08:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 33/34]
 kernel/events/core.c:6374:15: warning: variable 'flags' set but not used
Message-ID: <202308290814.H4gSvIDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   edbe560c2ce9974f4b2e47ca13050e6a62d604b3
commit: aced503663eb363cb3da0475b133143e486e239f [33/34] WIP: perf: support mmapping event on noMMU
config: hexagon-randconfig-r016-20230829 (https://download.01.org/0day-ci/archive/20230829/202308290814.H4gSvIDX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290814.H4gSvIDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290814.H4gSvIDX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/events/core.c:20:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/events/core.c:20:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/events/core.c:20:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/events/core.c:6374:15: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    6374 |         int ret = 0, flags = 0;
         |                      ^
>> kernel/events/core.c:6583:15: warning: no previous prototype for function 'perf_get_unmapped_area' [-Wmissing-prototypes]
    6583 | unsigned long perf_get_unmapped_area(struct file *file,
         |               ^
   kernel/events/core.c:6583:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6583 | unsigned long perf_get_unmapped_area(struct file *file,
         | ^
         | static 
   kernel/events/core.c:6639:17: warning: unused function 'perf_mmap_capabilities' [-Wunused-function]
    6639 | static unsigned perf_mmap_capabilities(struct file *file)
         |                 ^
   9 warnings generated.


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
