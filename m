Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3214EC62;
	Thu, 11 Apr 2024 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712845957; cv=none; b=BPdLdPS1h4T1QHoeUWaONm3SY7JWgGmDE4jcCfw/hT460vS0Ismzpheo7XntXzD162SeI8jiGCXAyZMcqyGDC3bYK1m58TYOEU21aKGh9gJULl6R1cJ8dxzfFbgbDZ7CQ2px73FA76FbLDQONCaGDEjepaldRkNpv50Ifpkx/Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712845957; c=relaxed/simple;
	bh=tEy00Tomn3iXKLh3SOZV07Nd4J3IRq5cYpL6PjA1aUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OjPysoeD5lUPe/TFseE360T+uUGKCMJFVFHFS8S2BbE4dGC/aTSSNyYw5zwHx0TR/dMbh4TL/+hv144T7le8jOuZqFg1lYgpkF2IjgIuDIVD3Pexyz+nQR+ewhe9uX4kHzOfH+uEQlTDkJZhKTX5gwrJtIwI/I5GDKjERW/Wz00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUFgP1hS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUFgP1hS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712845956; x=1744381956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tEy00Tomn3iXKLh3SOZV07Nd4J3IRq5cYpL6PjA1aUg=;
  b=cUFgP1hSvqtqsnKZ+yhhL6XvAA1z6GRENd5MJpw/r2qpECq/LTbBzief
   p1thiKhskv9PO/mQ5IG5hLTtefCA1GxLv9o+iN8Cr60jTf7uHVPitBXW1
   4hMMU9QbO22woYx2FHiUNG0hJSHJ8CQh3J/4E/XJ3nCOzoVtS0e5GwnIC
   LuVoEyjU9wv+N+cD3j0jvcmFYiE/PVunam34uS+Zc7UWoaONU39IpizY4
   H9cJDgxNhmOt3u1bu6EEu2iBiLkKe1zCNpo5h1Jfh42xBjsJn51wtq61L
   uodEzlMhCzVKL/XMnAlmsf6xYIxlGL+jmIlotex+n/7DUGB8ziPpq61p1
   w==;
X-CSE-ConnectionGUID: DQpcB4n+Sqmt57Uya4jPDw==
X-CSE-MsgGUID: Niaa5UTkQpSVcyfYZoD+9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12047469"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="12047469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 07:32:35 -0700
X-CSE-ConnectionGUID: FXiZmvh7Tj+Yxo0gUSFbaQ==
X-CSE-MsgGUID: yTHMWYlXTYK7MOEugdeQxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21503788"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Apr 2024 07:32:33 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruvTa-0008gv-2v;
	Thu, 11 Apr 2024 14:32:30 +0000
Date: Thu, 11 Apr 2024 22:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 320/415]
 arch/powerpc/platforms/powernv/opal-prd.c:171:12: error: no member named
 'ki_os' in 'struct kiocb'; did you mean 'ki_pos'?
Message-ID: <202404112208.RM3UgXSr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2cdbd541e4481cb9cbd08913e0586dc8a2570aec
commit: 52abe881eae0de6596cb23c29af0a6040c34aa76 [320/415] arch/powerpc: convert to read/write iterators
config: powerpc64-randconfig-003-20240411 (https://download.01.org/0day-ci/archive/20240411/202404112208.RM3UgXSr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112208.RM3UgXSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112208.RM3UgXSr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/platforms/powernv/opal-prd.c:17:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/powernv/opal-prd.c:171:12: error: no member named 'ki_os' in 'struct kiocb'; did you mean 'ki_pos'?
     171 |         if (iocb->ki_os)
         |                   ^~~~~
         |                   ki_pos
   include/linux/fs.h:369:11: note: 'ki_pos' declared here
     369 |         loff_t                  ki_pos;
         |                                 ^
   5 warnings and 1 error generated.
--
   In file included from arch/powerpc/platforms/cell/spufs/file.c:12:
   In file included from include/linux/coredump.h:6:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/cell/spufs/file.c:207:21: error: no member named 'ki_ppos' in 'struct kiocb'; did you mean 'ki_pos'?
     207 |         loff_t pos = iocb->ki_ppos;
         |                            ^~~~~~~
         |                            ki_pos
   include/linux/fs.h:369:11: note: 'ki_pos' declared here
     369 |         loff_t                  ki_pos;
         |                                 ^
>> arch/powerpc/platforms/cell/spufs/file.c:218:2: error: use of undeclared identifier 'size'
     218 |         size = simple_copy_to_iter(local_store, &iocb->ki_pos, LS_SIZE, from);
         |         ^
   arch/powerpc/platforms/cell/spufs/file.c:221:9: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     221 |         return size;
         |                ^~~~
         |                ksize
   include/linux/slab.h:283:8: note: 'ksize' declared here
     283 | size_t ksize(const void *objp);
         |        ^
>> arch/powerpc/platforms/cell/spufs/file.c:221:9: error: incompatible pointer to integer conversion returning 'size_t (const void *)' (aka 'unsigned long (const void *)') from a function with result type 'ssize_t' (aka 'long') [-Wint-conversion]
     221 |         return size;
         |                ^~~~
>> arch/powerpc/platforms/cell/spufs/file.c:491:28: error: use of undeclared identifier 'file'
     491 |         struct spu_context *ctx = file->private_data;
         |                                   ^
   arch/powerpc/platforms/cell/spufs/file.c:502:2: error: use of undeclared identifier 'size'
     502 |         size = simple_copy_to_iter(lscsa->gprs, &iocb->ki_pos,
         |         ^
>> arch/powerpc/platforms/cell/spufs/file.c:503:27: error: use of undeclared identifier 'to'
     503 |                                         sizeof(lscsa->gprs), to);
         |                                                              ^
   arch/powerpc/platforms/cell/spufs/file.c:506:9: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     506 |         return size;
         |                ^~~~
         |                ksize
   include/linux/slab.h:283:8: note: 'ksize' declared here
     283 | size_t ksize(const void *objp);
         |        ^
   arch/powerpc/platforms/cell/spufs/file.c:506:9: error: incompatible pointer to integer conversion returning 'size_t (const void *)' (aka 'unsigned long (const void *)') from a function with result type 'ssize_t' (aka 'long') [-Wint-conversion]
     506 |         return size;
         |                ^~~~
   arch/powerpc/platforms/cell/spufs/file.c:550:2: error: use of undeclared identifier 'size'
     550 |         size = simple_copy_to_iter(&lscsa->fpcr, &iocb->ki_pos,
         |         ^
   arch/powerpc/platforms/cell/spufs/file.c:551:27: error: use of undeclared identifier 'to'
     551 |                                         sizeof(lscsa->fpcr), to);
         |                                                              ^
   arch/powerpc/platforms/cell/spufs/file.c:554:9: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     554 |         return size;
         |                ^~~~
         |                ksize
   include/linux/slab.h:283:8: note: 'ksize' declared here
     283 | size_t ksize(const void *objp);
         |        ^
   arch/powerpc/platforms/cell/spufs/file.c:554:9: error: incompatible pointer to integer conversion returning 'size_t (const void *)' (aka 'unsigned long (const void *)') from a function with result type 'ssize_t' (aka 'long') [-Wint-conversion]
     554 |         return size;
         |                ^~~~
>> arch/powerpc/platforms/cell/spufs/file.c:583:34: error: no member named 'ki_file' in 'struct kiocb'; did you mean 'ki_filp'?
     583 |         struct spu_context *ctx = iocb->ki_file->private_data;
         |                                         ^~~~~~~
         |                                         ki_filp
   include/linux/fs.h:368:16: note: 'ki_filp' declared here
     368 |         struct file             *ki_filp;
         |                                  ^
>> arch/powerpc/platforms/cell/spufs/file.c:595:50: error: use of undeclared identifier 'udata'
     595 |         for (count = 0; (count + 4) <= len; count += 4, udata++) {
         |                                                         ^
   arch/powerpc/platforms/cell/spufs/file.c:629:28: error: use of undeclared identifier 'file'
     629 |         struct spu_context *ctx = file->private_data;
         |                                   ^
>> arch/powerpc/platforms/cell/spufs/file.c:645:53: error: too few arguments to function call, expected 3, have 2
     645 |         if (!copy_to_iter_full(&mbox_stat, sizeof mbox_stat), to)
         |              ~~~~~~~~~~~~~~~~~                             ^
   include/linux/uio.h:209:6: note: 'copy_to_iter_full' declared here
     209 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |      ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/cell/spufs/file.c:716:18: error: use of undeclared identifier 'udata'
     716 |         for (count = 4, udata++; (count + 4) <= len; count += 4, udata++) {
         |                         ^
   arch/powerpc/platforms/cell/spufs/file.c:716:59: error: use of undeclared identifier 'udata'
     716 |         for (count = 4, udata++; (count + 4) <= len; count += 4, udata++) {
         |                                                                  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   5 warnings and 20 errors generated.


vim +171 arch/powerpc/platforms/powernv/opal-prd.c

   158	
   159	static ssize_t opal_prd_read(struct kiocb *iocb, struct iov_iter *to)
   160	{
   161		struct opal_prd_msg_queue_item *item;
   162		size_t count = iov_iter_count(to);
   163		unsigned long flags;
   164		ssize_t size, err;
   165		int rc;
   166	
   167		/* we need at least a header's worth of data */
   168		if (count < sizeof(item->msg.header))
   169			return -EINVAL;
   170	
 > 171		if (iocb->ki_os)
   172			return -ESPIPE;
   173	
   174		item = NULL;
   175	
   176		for (;;) {
   177	
   178			spin_lock_irqsave(&opal_prd_msg_queue_lock, flags);
   179			if (!list_empty(&opal_prd_msg_queue)) {
   180				item = list_first_entry(&opal_prd_msg_queue,
   181						struct opal_prd_msg_queue_item, list);
   182				list_del(&item->list);
   183			}
   184			spin_unlock_irqrestore(&opal_prd_msg_queue_lock, flags);
   185	
   186			if (item)
   187				break;
   188	
   189			if (iocb->ki_filp->f_flags & O_NONBLOCK)
   190				return -EAGAIN;
   191	
   192			rc = wait_event_interruptible(opal_prd_msg_wait,
   193					!opal_msg_queue_empty());
   194			if (rc)
   195				return -EINTR;
   196		}
   197	
   198		size = be16_to_cpu(item->msg.header.size);
   199		if (size > count) {
   200			err = -EINVAL;
   201			goto err_requeue;
   202		}
   203	
   204		rc = !copy_to_iter_full(&item->msg, size, to);
   205		if (rc) {
   206			err = -EFAULT;
   207			goto err_requeue;
   208		}
   209	
   210		kfree(item);
   211	
   212		return size;
   213	
   214	err_requeue:
   215		/* eep! re-queue at the head of the list */
   216		spin_lock_irqsave(&opal_prd_msg_queue_lock, flags);
   217		list_add(&item->list, &opal_prd_msg_queue);
   218		spin_unlock_irqrestore(&opal_prd_msg_queue_lock, flags);
   219		return err;
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
